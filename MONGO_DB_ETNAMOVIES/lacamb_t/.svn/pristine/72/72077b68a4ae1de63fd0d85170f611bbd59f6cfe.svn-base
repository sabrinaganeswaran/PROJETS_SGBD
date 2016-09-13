Bonjour !	

Notre projet ETNA MOVIES se découpe en trois parties : les étudiants, les films et les locations des films par les étudiants.

Pour lancer le programme, on peut faire : ./etna_movies.php qui va alors permettre d'avoir un petit prompt pour montrer les commandes et l'usage.

Nous avons d’abord commencé par les étudiants :

-> Notre projet permet d’ajouter des étudiants à l’aide de la fonction add_student.
-> Notre projet permet de supprimer des étudiants à l’aide de la fonction del_student.
-> Notre projet permet de mettre à jour les informations concernant les étudiants à l’aide de la fonction update_student.
-> Notre projet permet de montrer la carte d’identité d’un ou tous les étudiants à l'aide de la fonction show_student.
Par défaut, si aucun paramètre n’est passé à show_student, on montre tous les étudiants inscrits dans la Base De Données. (BDD)

*-Concernant l’utilisation des différentes fonctions, il doit être de la forme suivante :
	     USAGE : ./etna_movies.php [nom_de_la_fonction] [option …]

*-Exemple  pour la fonction add_student : 
	   USAGE : ./etna_movies.php add_student login_x

Ensuite, nous avons poursuivi par les films:
 - Nous avons parsé un fichier movies.csv qui contenait une table de films.

- La fonction movies_storing permet de récupérer tous les films du fichier CSV et de les ordonner grâce à un tableau et de les mettre dans notre BDD.

-> Notre projet permet de montrer tous les films à l’aide de la fonction show_movies. Par défaut, elle ne prend aucun paramètre en compte et affiche la totalité des films dans l’ordre alphabétique (Titre et Code IMDB).
-> Notre projet permet de montrer tous les films à l’aide de la fonction show_movies desc[parametre]. Elle prend le paramètre desc et affiche la totalité des films dans l’ordre alphabétique inverse (Titre et Code IMDB).
-> Notre projet permet de montrer tous les films à l’aide de la fonction show_movies genre[parametre] [option]. Elle prend le paramètre genre et affiche la totalité des films par le genre choisi (toute la carte d’identité des films apparaît.)
-> Notre projet permet de montrer tous les films à l’aide de la fonction show_movies year[parametre]. Elle prend le paramètre year et affiche la totalité des films par l’année choisie (toute la carte d’identité des films apparaît.)
-> Notre projet permet de montrer tous les films à l’aide de la fonction show_movies rate[parametre]. Elle prend le paramètre rate et affiche la totalité des films par la note (toute la carte d’identité des films apparaît.)
   
   A chaque fois, le nombre de films trouvés est affiché.

*- USAGE : ./etna_movies.php show_movies [paramètre] [option]

*- Exemple avec show_movies year
USAGE: ./etna_movies.php show_movies year 1993