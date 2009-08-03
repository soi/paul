<?
include 'class.password.php';

// default is 10 character lentth
$pas = new password();
// generate password include uppercase, lowercase & number
echo $pas->generate() . '<br>';
// generate password not include lowercase
$pas->lowercase = false;
echo $pas->generate() . '<br>';
// generate password include spec char
$pas->specchar = true;
echo $pas->generate() . '<br>';
?>
