<?php
function del_student($login)
{
 system('clear');
 $c = new MongoClient();
 $db = $c->db_etna;
 $collection = $db->students;
 $search = $collection->findOne(array("login" => $login));
 if (isset($search))
 {
  $y_n = readLine("\tÊtes-vous sûr ?(oui/Non) :  ");
  if ($y_n == "oui" || $y_n == "yes")
  {
    $collection->remove(array("login" => $login));
    echo "\t\e[32mLe compte a été supprimé !\e[0m\n";
  }
  elseif ($y_n == "non" || $y_n == "no")
    echo "\t\e[32mLa commande a été annulée ! \e[0m";
  else
    echo "\t\e[31m\e[5m∆ ERREUR : Entrez oui ou non ∆\e[0m\n> ";
}
else
  echo "\t\e[31m\e[5m∆ ERREUR : Cet étudiant n'existe pas !∆\e[0m\n";
}
?>
