<?php

function forrr($find)
{
  echo "imdb_code: " . $find['imdb_code'] . "\n";
  echo "Titre: " . $find['title'] . "\n";
  echo "Annee: " . $find['year'] . "\n";
  echo "Genre(s): " . implode(", ", $find['genres']) . "\n";
  echo "Realisateur(s): " . implode(", ", $find['directors']) . "\n";
  echo "Public votes: " . floatval($find['rate']) . "\n";
  echo "URL: " . $find['link'] . "\n";
  echo "Stock: " . $find['stock'] . "\n\n";
}

function show_movies_rate($rate)
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('movies');
  $search = $collection->findOne(array('rate' => floatval($rate)));
  $i = 0;
  if (isset($search))
  {
    $find_rate = $collection->find(array('rate' => array(
      '$gte' => intval($rate), '$lt' => intval($rate)+1)),
    array('imdb_code',
          'title',
          'year',
          'genres',
          'directors',
          'rate',
          'link',
          'stock'
          ));
     foreach($find_rate as $find_rate)
     {
      forrr($find_rate, $i);
      $i++;
    }
  }
  echo "\e[32mIl y a $i films pour la note de $rate \e[0m\n";
}

function show_movies_year($year)
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('movies');
  $search = $collection->findOne(array('year' => intval($year)));
  $i = 0;
  if (isset($search))
  {
    $find_year = $collection->find(array('year' =>intval($year)),
    array('imdb_code',
          'title',
          'year',
          'genres',
          'directors',
          'rate',
          'link',
          'stock'
          ));
    foreach($find_year as $find_year)
    {
      forrr($find_year);
      $i++;
    }
  }
  echo "\e[32mIl y a $i films sortis en $year \e[0m\n";
}

function show_movies_genre($genre)
{
  $genre = strtolower($genre);
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('movies');
  $search = $collection->findOne(array('genres' => $genre));
  $i = 0;
  if (isset($search))
  {
    $find_genre = $collection->find(array('genres' => $genre),
    array('imdb_code',
          'title',
          'year',
          'genres',
          'directors',
          'rate',
          'link',
          'stock'
          ));
     foreach($find_genre as $find_genre)
     {
      forrr($find_genre, $i);
      $i++;
    } 
  }
  echo "\e[32mIl y a $i films pour le genre $genre \e[0m\n";
}
?>