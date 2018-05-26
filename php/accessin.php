<?php

	if ( !isset($_POST['signin-key']) || !isset($_POST['signin-password']) ) exit("Illegal Access!");
	var exp = new Date();
	exp.setTime(exp.getTime() + 1000 * 60 * 60 * 24);
	document.cookie = "music_identify=" + id + ";expires=" + exp.toGMTString();
	echo "loggin successfully";

	header("Location: ../html/sub1.html");
?>
