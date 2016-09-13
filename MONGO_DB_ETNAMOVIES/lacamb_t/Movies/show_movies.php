<?php
function show_movies()
{
 $i = 0;
 $c = new MongoClient();
 $db = $c->db_etna;
 $collection = $db->createCollection('movies');
 $search = $collection->find();
 $search->sort(array('title' => 1));
 foreach($search as $find_movies)
 {
   echo "Titre: " . $find_movies['title'] . "\n";
   echo "imdb_code: " . $find_movies['imdb_code']. "\n\n";
   $i++;
 }
 echo "\t\e[32mIl y a " . $i . " films classés par ordre alphabétique!\e[0m\n";
}

function show_movies_desc()
{
  $i = 0;
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('movies');
  $search = $collection->find();
  $search->sort(array('title' => -1));
  foreach($search as $find_movies)
  {
    echo "Titre: " . $find_movies['title'] . "\n";
    echo "imdb_code: " . $find_movies['imdb_code']. "\n\n";
    $i++;
  }
  echo "\t\e[32mIl y a " . $i . "films par ordre alphabétique inverse!\e[0m\n";
}

?>
