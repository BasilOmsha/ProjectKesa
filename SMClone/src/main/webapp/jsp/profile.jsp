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
<body onload="blueBottom(); changeColors()">
	<header>
		<div id="navbar">
			<div class="logo-left-wrapper">
				<img class="home-button" alt="home button" src="../images/Logo2.png"
					Style="height: 35px; width: 35px"
					onclick="window.location.href='../jsp/profile.jsp'">
			</div>
			<div class="center-topnav">
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							onclick="window.location.href='../jsp/profile.jsp'">
					</div>
				</div>
			</div>
			<div class="logo-right-wrapper">
				<img class="profile-button" alt="Profile button"
					src="../images/account.png" Style="height: 35px; width: 35px"
					onclick="window.location.href='../jsp/profile.jsp'">
			</div>
		</div>
	</header>
	<main>
		<div class="profile-upper-block">
			<div class="cover-photo-block"></div>
			<div class="cover-photo-block-bottom">
				<div
					class="main-profile-picture profile-button-main profile-button-main-pic"
					onclick="#">
					<img alt="Profile picture" src="../images/avatar.png"
						Style="height: 145px; width: 186px" onclick="#">
				</div>

				<div class="add-picture-button" onclick="#">
					<img alt="add cover picture" src="../images/camera.png"
						Style="height: 20px; width: 20px">
					<p style="font-size: 17px">
						&nbsp;<b>Add cover photo</b>
					</p>
				</div>
			</div>
			<div class="circleDiv-base circletype1" onclick="#">
				<img alt="add cover picture" src="../images/camera.png"
					Style="height: 20px; width: 20px">
			</div>
			<div class="username">
				<h1>Basil ${requestScope.getFname }
					Omsha${requestScope.getLname }</h1>
			</div>
			<div class="edit-profile" onclick="#">
				<img alt="add cover picture" src="../images/pen.png"
					Style="height: 20px; width: 20px">
				<p style="font-size: 17px">
					&nbsp;<b>Edit profile</b>
				</p>
			</div>
			<hr class="solid">
			<div class="profile-nav">
				<div class="profile-nav-container">
					<a href="#about-left-column" id="about" class="profile-nav-buttons"
						onclick="blueBottom(); changeColors()">
						About </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="posts" class="profile-nav-buttons"
						onclick="blueBottom2()"> Posts </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="friends" class="profile-nav-buttons"
						onclick="blueBottom3()"> Friends </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="photos" class="profile-nav-buttons"
						onclick="blueBottom4()"> Photos </a>
				</div>
			</div>
		</div>
		<div class="content-container">
			<div class="about-container">
				<div class="about-left-column" id="about-left-column"
					style="visibility: hidden">
					<div class="left-columns-header">
						<h3 style="color: #000000">
							<b onclick="changeColors()">About</b>
						</h3>
					</div>
					<div class="left-columns-buttons" href="#" id="overview"
						onclick="changeColors()">
						<p>Overview</p>
					</div>
					<div class="left-columns-buttons" href="#" id="contact"
						onclick="changeColors2()">
						<p>Contact and basic info</p>
					</div>
					<div class="left-columns-buttons" href="#" id="security"
						onclick="changeColors3()">
						<p>Security</p>
					</div>
				</div>
				<div class="about-divider"></div>
				<div class="info" id="overview1" style="visibility: hidden">
					<div class="info-header">
						<h4 style="color: #000000">Overview</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/account.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">Basil${requestScope.getFname }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>First name</p>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/account.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">Omsha${requestScope.getLname }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Last name</p>
					</div>
				</div>
				<div class="info2" id="contact-and-basic-info"
					style="visibility: hidden">
					<div class="info-header">
						<h4 style="color: #000000">Contact info</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/mail.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">basil.omsha@gmail.com${requestScope.getEmail }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Email</p>
					</div>
					<div class="info-header">
						<h4 style="color: #000000">Basic info</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/male.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">Male${requestScope.getGender }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Gender</p>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/cake.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">June${requestScope.getMonth }
								18${requestScope.getDay }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Birth date</p>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<p style="color: #000000">1988${requestScope.getYear }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Birth year</p>
					</div>
				</div>
				<div class="info3" id="security1" style="visibility: hidden">
					<div class="info-header">
						<h4 style="color: #000000">Security</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/security.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">Password${requestScope.getPassword }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="#">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Password</p>
					</div>
				</div>
			</div>
		</div>
	</main id="end">
	<script src="../js/scripts.js"></script>
</body>
</html>