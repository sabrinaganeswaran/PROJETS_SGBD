<?php
function movies_storing()
{
  $c = new MongoClient();
  $i = 0;
  $db = $c->db_etna;
  $collection = $db->createCollection('movies');
  if (($handle = fopen("movies.csv", "r")) !== FALSE)
  {
    $data = fgetcsv($handle, 850, ",");
    while (($data = fgetcsv($handle, 850, ",")) !== FALSE)
    {
      $doc = array("imdb_code" => $data[1],
                  "title" => $data[5],
                  "year" => intval($data[11]),
                  "genres" => explode(", ", $data[12]),
                  "directors" => explode(", ", $data[7]),
                  "rate" => floatval($data[9]),
                  "link" => $data[15],
                  "stock" => rand(0, 5)
                  );
      $collection->insert($doc);
      $i++;
    }
    fclose($handle);
    echo "\t\e[32mVous avez bien chargé " . $i . " films !\e[0m\n";
  }
}
?>