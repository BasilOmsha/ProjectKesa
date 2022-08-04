<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile</title>
<link rel="stylesheet" href="../css/profile.css" />
<link rel="shortcut icon" href="../images/Logo2.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet" />	
</head>
<body>
	<header>
		<div id="navbar">
			<div class="logo-left-wrapper">
				<img class="home-button" alt="home button"
					src="../images/Logo2.png" Style="height: 35px; width: 35px"
					type="button" onclick="window.location.href='../jsp/profile.jsp'">
			</div>
			<div class="center-topnav">
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							type="button" onclick="window.location.href='../jsp/profile.jsp'">
					</div>
				</div>
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							type="button" onclick="window.location.href='../jsp/profile.jsp'">
					</div>
				</div>
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							type="button" onclick="window.location.href='../jsp/profile.jsp'">
					</div>
				</div>
			</div>
			<div class="logo-right-wrapper">
				<img class="profile-button" alt="home button"
					src="../images/account.png" Style="height: 35px; width: 35px"
					type="button" onclick="window.location.href='../jsp/profile.jsp'">
			</div>
		</div>
	</header>
	<script src="../js/scripts.js"></script>
</body>
</html>