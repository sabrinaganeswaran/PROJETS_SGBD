<?php
function show_Onestudent($login)
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('students');
  $search = $collection->findOne(array('login' => $login));
  if (isset($search))
  {
    $find_student = $collection->findOne(array('login' => $login),
      array('login',
            'name',
            'age',
            'email',
            'phone'
        ));
    echo "Login: " . $find_student['login'] . "\n";
    echo "Nom: " . $find_student['name'] . "\n";
    echo "Age: " . $find_student['age'] . "\n";
    echo "Email: " . $find_student['email'] . "\n";
    echo "Telephone: " . $find_student['phone'] . "\n";
  }
  else
    echo "\t\e[31m\e[5m∆ ERREUR :Ce login n'est pas enregistré! ∆\e[0m\n";
}

function show_students()
{
  $c = new MongoClient();
  $db = $c->db_etna;
  $collection = $db->createCollection('students');
  $search = $collection->find();
  echo "\n\t\e[32mVoici la totalité des étudiants inscrits!\e[0m\n";
  foreach($search as $find_students)
  {
    echo "Login: " . $find_students['login'] . "\n";
    echo "Nom: " . $find_students['name'] . "\n";
    echo "Age: " . $find_students['age'] . "\n";
    echo "Email: " . $find_students['email'] . "\n";
    echo "Telephone: " . $find_students['phone'] . "\n\n";
  }
}

function show_student($argv)
{
  if ($argv[3])
    echo "\e[31mVous pouvez préciser un login si vous le souhaitez.\e[0m";
  elseif ($argv[2])
  {
    show_Onestudent($argv[1]);
  }
  else
    show_students();
}
?>