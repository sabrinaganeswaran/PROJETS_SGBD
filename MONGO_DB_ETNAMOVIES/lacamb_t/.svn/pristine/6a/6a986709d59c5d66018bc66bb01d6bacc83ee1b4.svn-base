<?php
function	add_mail()
{
	echo "\tAdresse email ?\n> ";
    $email = rtrim(fgets(STDIN));
    $reg1_email = "/^[_a-z0-9-]+(\.[_a-z0-9-]+)";
    $reg2_email = "*@[a-z0-9-]+(\.[a-z]+)";
    $reg3_email = "*(\.[a-z]{2,})$/";
    while (!(preg_match($reg1_email . $reg2_email . $reg3_email, $email)))
    {
      echo "\t\e[31m\e[5m∆ ERREUR : Adresse email non valide ! ∆\e[0m\n> ";
      $email = rtrim(fgets(STDIN));
    }
    return ($email);
}

function add_phone()
{
	echo "\tTéléphone ?\n> ";
    $tel = rtrim(fgets(STDIN));
    while (!(preg_match("/^0[1-9][0-9]{8}$/", $tel)))
    {
     echo "\t\e[31m\e[5m∆ERREUR :Numéro non valide (Ex:0648018002)!∆\e[0m\n> ";
     $tel = rtrim(fgets(STDIN));
    }
    return ($tel);
}