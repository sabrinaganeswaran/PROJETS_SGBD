<?php

function rent_movie($login, $imdb)
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('students');
  $search = $collection->findOne(array("Login" => $login));
  $collec_m = $db->createCollection('movies');
  $search2 = $collec_m->findOne(array("imdb_code" => $imdb));
  if (isset($search) && isset($search2))
  {
    $find_film = find_film($collec_m, $imdb);
    $find_etud = find_etudiant($collection, $login);
    $stock = intval($find_film['Stock']);
    $stock -= 1;
    $id_s = $find_etud['_id'];
    $id_m = $find_film['_id'];
    if ($stock > -1)
    {
    	rent_film($find_etud, $find_film, $login, $collec_m, $collection);
    	echo "bravo";

    }
    else
    	echo "Stock-out !\n";
  }
  else
  	echo "\t\e[31m\e[5m∆ ERREUR : L'étudiant n'est pas dans la BDD!∆\e[0m\n";
}

function rent_film($find_etud, $find_film, $login, $collec_m, $collection)
{
  $id_s = $find_etud['_id'];
  $id_m = $find_film['_id'];
  $stock = intval($find_film['Stock']);
  $stock--;
  $imdb = $find_film['imdb_code'];

  $collec_m->update(array("imdb_code" => $imdb),
    array('$set' => array("Stock" => $stock),
    	"rented_students" => $id_s
    	));
  $collection->update(array("Login" => $login),
    array('$set' => array("rented_students" => $id_m)));
}

function find_film($collec_m, $imdb)
{
	$find_film = $collec_m->findOne(array("imdb_code" => $imdb),
      array('imdb_code',
            'stock',
            '_id',
            'title',
            'rented_students'
    		));
	return ($find_film);
}

function find_etudiant($collec_m, $login)
{
	$find_etud = $collec_m->findOne(array("login" => $login),
      array('login',
            'name',
            '_id',
            'rented_movies'
    		));
	return ($find_etud);
}