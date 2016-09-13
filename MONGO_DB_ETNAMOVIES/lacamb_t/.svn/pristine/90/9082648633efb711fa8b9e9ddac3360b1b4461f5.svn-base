 <?php
 require_once('show_student.php');
 require_once('add_decoupe.php');
 function add_student($login)
 {
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('students');
  $search = $collection->findOne(array("login" => $login));
  if (isset($search))
  {
    echo "\t\e[31m\e[5m∆ ERREUR : L'étudiant est dans la BDD!∆\e[0m\n";
  }
  else
  {
    $login = add_login($login);
    $nom = add_name();
    $age = add_age();
    $email = add_mail();
    $tel = add_phone();
    $doc = array(
     "login"=> "$login",
     "name" => "$nom",
     "age" => "$age",
     "email" => "$email",
     "phone" => "$tel");
    $collection->insert($doc);
    echo "\n\t\e[32mL'étudiant(e) $login a bien été enregistré dude ! \e[0m\n";
    show_students();
  }
}

function add_login($login)
{
   while(!(preg_match("/^[a-z]{1,6}[_]{1}[a-z-0-9]{1}$/i", $login)))
    {
      echo "\t\e[31m\e[5m∆ERREUR:Login non conforme!∆\n\e[0m\n> ";
      $login = rtrim(fgets(STDIN));
    }
    return ($login);
}

function add_name()
{
   echo "\tNom ?\n> ";
    $nom = rtrim(fgets(STDIN));
    while(!(preg_match("/[a-z]/i", $nom)))
    {
      echo"\t\e[31m\e[5m∆ERREUR:Nom non conforme!∆\n\e[0m\n> ";
      $nom = rtrim(fgets(STDIN));
    }
    return ($nom);
}

function add_age()
{
  echo "\tÂge ?\n> ";
    $age = rtrim(fgets(STDIN));
    while(!(preg_match("/^[1-9][0-9]?$/", $age)))
    {
      echo"\t\e[31m\e[5m∆ERREUR:Âge entré non valide dude (1 à 99)!∆\e[0m\n> ";
      $age = rtrim(fgets(STDIN));
    }
    return ($age);
}
?>