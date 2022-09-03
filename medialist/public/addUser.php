<?php

	include '../src/User.php';
	include '../src/UserRepository.php';
	include '../src/Factory/DbAdaperFactory.php';

	$dbAdapter = (new DbAdaperFactory())->createService();

	$username = $_POST['username'] ?? null;
	$lastname = $_POST['lastname'] ?? null;
	$firstname = $_POST['firstname'] ?? null;
	$password = $_POST['password'] ?? null;
	$email = $_POST['mail'] ?? null;

	if ($username && $lastname && $firstname && $password && $email) {
   		$UserRepository = new \User\UserRepository($dbAdapter);
    	$UserRepository->insert($username,$lastname,$firstname,$password,$email,'true','false');
	}

	header('location: /signIn.php');

?>