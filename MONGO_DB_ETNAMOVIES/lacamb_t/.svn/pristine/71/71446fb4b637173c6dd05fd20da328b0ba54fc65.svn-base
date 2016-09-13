#!/usr/bin/env php
<?php
require_once('Students/add_student.php');
require_once('Students/add_decoupe.php');
require_once('Students/del_student.php');
require_once('Students/show_student.php');
require_once('Students/update_student.php');
require_once('Students/decoup_update.php');
require_once('Movies/movies_storing.php');
require_once('Movies/show_movies.php');
require_once('Movies/show_movies_opt.php');
require_once('welcome.php');
require_once('Location/rent_movie.php');

system('clear');
if ($argc == 2)
{
	if ($argv[1] == "show_student")
		show_students();
	elseif ($argv[1] == "movies_storing")
		movies_storing();
	elseif ($argv[1] == "show_movies")
		show_movies();
	elseif ($argv[1] == "show_movies" && $argv[2] == "desc")
		show_movies_desc();
	else
		echo "\e[31m\e[5m∆Veuillez entrer une option à votre commande! ∆\e[0m";
}
elseif ($argc == 3)
{
	if ($argv[1] == "show_student")
		show_Onestudent($argv[2]);
	elseif ($argv[1] == "add_student")
		add_student($argv[2]);
	elseif ($argv[1] == "del_student")
		del_student($argv[2]);
	elseif ($argv[1] == "update_student")
		update_student($argv[2]);
	elseif ($argv[1] == "show_movies" && $argv[2] == "desc")
		show_movies_desc();
	else
		echo "\e[32m∆ USAGE: ./etna_movies.php [fonction] [option...]\e[0m\n";
}
elseif ($argc == 4)
{	
	if ($argv[1] == "show_movies" && $argv[2] == "genre")
		show_movies_genre($argv[3]);
	elseif ($argv[1] == "show_movies" && $argv[2] == "year")
		show_movies_year($argv[3]);
	elseif ($argv[1] == "show_movies" && $argv[2] == "genre")
		show_movies_genre($argv[3]);
	elseif ($argv[1] == "show_movies" && $argv[2] == "rate")
		show_movies_rate($argv[3]);
	elseif ($argv[1] == "rent_movie") 
	{
		echo "Cette fonction n'est pas disponible\n";
	}
	else
		echo "\e[32m∆ USAGE: ./etna_movies.php [fonction] [option...]\e[0m\n";
}
else
{
	welcome();
	echo "\t\e[32m∆ USAGE: ./etna_movies.php [fonction] [option...]\e[0m\n";
}
?>