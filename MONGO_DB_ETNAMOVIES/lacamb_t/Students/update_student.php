<?php
require_once('decoup_update.php');
function        update_student($login)
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('students');
  $search = $collection->findOne(array("login" => $login));
  while (!(isset($search)))
  {
    echo "\e[31m L'étudiant(e) n'est pas dans notre Base de Données!\n\e[0m ";
    return;
  }  
  modif($login, $collection);
  $old = rtrim(fgets(STDIN));
  if ($old == "name")
    nom($login, $collection);
  elseif ($old == "age")
    age($login, $collection);
  elseif ($old == "email")
    email($login, $collection);
  elseif ($old == "phone")
    telephone($login, $collection);
  elseif ($old == "annuler")
    annuler($login, $collection);
  else
    erreur($login, $collection);
}

function nom($login, $collection)
{
  echo "\tVeuillez renseigner le nouveau nom:\n> ";
  $new = rtrim(fgets(STDIN));
  while(!(preg_match("/[a-z]/i", $new)))
    {
      echo"\t\e[31m\e[5m∆ERREUR:Nom non conforme!∆\n\e[0m\n> ";
      $new = rtrim(fgets(STDIN));
    }
  $collection->update(array("login" => $login),
    array('$set' => array("name" => $new)));
  echo "\t\e[32mLe nom de l'étudiant(e) $login a bien été modifié !\e[0m\n";
}

function age($login, $collection)
{
  echo "\tVeuillez renseigner le nouvel âge:\n> ";
  $new = rtrim(fgets(STDIN));
  while(!(preg_match("/^[1-9][0-9]?$/", $new)))
    {
      echo"\t\e[31m\e[5m∆ERREUR:Âge entré non valide dude (1 à 99)!∆\e[0m\n> ";
      $new = rtrim(fgets(STDIN));
    }
  $collection->update(array("login" => $login),
    array('$set' => array("age" => $new)));
  echo "\e[32mL'âge de l'etudiant(e) $login a bien été modifié ! \e[0m\n";
}

function email($login, $collection)
{
  echo "\tVeuillez renseigner la nouvelle adresse mail:\n> ";
  $new = rtrim(fgets(STDIN));
    $reg1_email = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)";
    $reg2_email = "*@[a-z0-9-]+(\.[a-z]+)";
    $reg3_email = "*(\.[a-z]{2,})$/";
    while (!(preg_match($reg1_email . $reg2_email . $reg3_email, $new)))
    {
      echo "\t\e[31m\e[5m∆ ERREUR : Adresse email non valide ! ∆\e[0m\n> ";
      $new = rtrim(fgets(STDIN));
    }
  $collection->update(array("login" => $login),
    array('$set' => array("email" => $new)));
  echo "\t\e[32mL'adresse mail de l'etudiant(e) $login a été modifié !\e[0m\n";
}

function annuler($login, $collection)
{
  system(clear);
  echo "\t\e[32mVotre requête a été annulée ! \e[0m\n";
  return (0);
}
?>