<?php
function	welcome()
{
system('clear');
echo "\t\t\n\e[0;33m WELCOME DUDE ! Voici un petit prompt pour ";
echo " vous expliquer comment fonctionne notre programme !";
echo "\tElles permettent de vous lier à la base de données Mongo.\e[0m\n";
echo "\t\t\e[31m(Attention certaines ces commandes prennent en paramètre le";
echo " login de l'étudiant)\e[0m\n\n";
echo " \t\t\t●▬▬▬▬▬▬▬▬▬▬▬▬▬๑۩۩๑▬▬▬▬▬▬▬▬▬▬▬▬▬●\n\n";
echo "\t \e[1mPour voir les étudiants\e[0m :\n";
echo "\t> add_student \e[1m[login_de_l'étudiant]\e[0m\n";
echo "\t> del_student \e[1m[login_de_l'étudiant]\e[0m\n";
echo "\t> update_student \e[1m[login_de_l'étudiant]\e[0m\n";
echo "\t> show_student \e[1m[login facultatif]\n";
echo "\n\t Pour voir les \e[1mfilms\e[0m :\n";
echo "\t> movies_storing : met tous les films dans la BDD Mongo\n";
echo "\t> show_movies : films par ordre alphabétique\n";
echo "\t\e[4;35mOptions de show_movies\e[0m : desc, year, rate, genre.\n\n";
}
?>