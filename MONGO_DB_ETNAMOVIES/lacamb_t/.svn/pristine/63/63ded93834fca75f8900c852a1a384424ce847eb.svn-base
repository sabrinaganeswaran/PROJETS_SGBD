<?php
require_once('update_student.php');
function erreur($login, $collection)
{
	echo "\t\e[31m\e[5m∆ ERREUR : Donnée inexistante dude !∆ \e[0m\n";
	update_student($login);
}
function modif($login, $collection)
{
	echo "\t\e[32mQue voulez-vous modifier chez l'étudiant(e) $login ?\e[0m";
  echo "(name, age, email, phone ou annuler.)\n\t> ";
}

function telephone($login, $collection)
{
	echo "\tVeuillez renseigner le nouveau numéro de télephone:\n> ";
  	$new = rtrim(fgets(STDIN));
    while (!(preg_match("/^0[1-9][0-9]{8}$/", $new)))
    {
     echo "\t\e[31m\e[5m∆ERREUR :Numéro non valide (Ex:0648018002)!∆\e[0m\n> ";
     $new = rtrim(fgets(STDIN));
    }
  	$collection->update(array("login" => $login),
  		array('$set' => array("phone" => $new)));
  	echo "\t\e[32mLe nom de l'etudiant(e) $login a bien été modifié ! \e[0m\n";
}
?>