<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>
<%
//requires revalidation after logging out
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Profile</title>
<link rel="stylesheet" href="/css/profile.css" />
<link rel="shortcut icon" href="../images/Logo2.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet" />
</head>
<%
session.getAttribute("LoggedUser");
%>
<body onload="blueBottom(); changeColors()">
	<header>
		<div id="navbar">
			<div class="logo-left-wrapper">
				<a href="#ty"> <img class="home-button" alt="home button"
					src="../images/Logo2.png" Style="height: 35px; width: 35px"></a>
			</div>
			<div class="center-topnav">
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							onclick="window.location.href='../jsp/profile.jsp#ty'">
						<%-- 						<%
						if (session.getAttribute("LoggedUser") != null) {
							String email = null;
							String sessionID = null;
							Cookie[] cookies = request.getCookies();
							if (cookies != null) {
								for (int i = 0; i < cookies.length; i++) {

							if (cookies[i].getName().equals("LoggedUser"))
								email = cookies[i].getValue();
							if (cookies[i].getName().equals("JSESSIONID"))
								sessionID = cookies[i].getValue();
								}
								out.println("Welcome, " + email);
							} else {
								sessionID = session.getId();
							}
						} else if (session.getAttribute("LoggedUser") == null) {
							response.sendRedirect("/index.html");
						}
						%> --%>
					</div>
				</div>
			</div>
			<div class="logo-right-wrapper">
				<img class="profile-button" alt="Profile button"
					src="../images/account.png" Style="height: 35px; width: 35px"
					onclick="expandWindow()">
			</div>
			<div id="profile-info-text-positioning">
				<div id="profile-info-container">
					<div class="prof-container"
						onclick="window.location.href='../jsp/profile.jsp#ty'">
						<div
							class="main-profile-picture1 profile-button-main1 
							profile-button-main-pic1"
							onclick="#">
							<img alt="Profile picture" src="../images/avatar.png"
								Style="height: 25px; width: 36px" onclick="#">
						</div>
						${sessionScope.readUsersInfo.fname }
						${sessionScope.readUsersInfo.lname }
					</div>
					<div class="prof-nav-item" onclick="#'">
						<div
							class="main-profile-picture1 profile-button-main1 
							profile-button-main-pic1"
							onclick="#">
							<img alt="Profile picture" src="../images/dark-mode-icon.png"
								Style="height: 35px; width: 36px" onclick="#">
						</div>
						Dark Mode
					</div>
					<div class="prof-nav-item" onclick="window.location.href='/logout'">
						<div
							class="main-profile-picture1 profile-button-main1 
							profile-button-main-pic1"
							onclick="#">
							<img alt="Profile picture" src="../images/logout.png"
								Style="height: 35px; width: 36px" onclick="#">
						</div>
						Log out
					</div>
				</div>
			</div>
		</div>
	</header>
	<main>
		<div class="profile-upper-block">
			<div class="cover-photo-block"></div>
			<div class="filler" id="ty"></div>
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
				<h1>${sessionScope.readUsersInfo.fname }
					${sessionScope.readUsersInfo.lname }</h1>
			</div>
			<div class="edit-profile" onclick="#">
				<img alt="add cover picture" src="../images/pen.png"
					Style="height: 20px; width: 20px">
				<p style="font-size: 17px">
					&nbsp;<b>Edit profile</b>
				</p>
			</div>
			<br>
			<hr class="solid">
			<div class="profile-nav">
				<div class="profile-nav-container">
					<a href="#about-left-column" id="about" class="profile-nav-buttons"
						onclick="blueBottom(); changeColors()"> About </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="posts" class="profile-nav-buttons"
						onclick="blueBottom2()"> Posts </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="friends"
						class="profile-nav-buttons" onclick="blueBottom3()"> Friends </a>
				</div>
				<div class="profile-nav-container">
					<a href="#about-left-column" id="photos"
						class="profile-nav-buttons" onclick="blueBottom4()"> Photos </a>
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
							<img alt="add cover picture" src="../images/nameIcon.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">${sessionScope.readUsersInfo.fname }</p>
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
							<img alt="add cover picture" src="../images/nameIcon.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">${sessionScope.readUsersInfo.lname }</p>
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
							<p style="color: #000000">${sessionScope.readUsersInfo.email }</p>
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
							<p style="color: #000000">${sessionScope.readUsersInfo.gender }</p>
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
							<p style="color: #000000">${sessionScope.readUsersInfo.month }
								${sessionScope.readUsersInfo.day }</p>
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
							<p style="color: #000000">${sessionScope.readUsersInfo.year }</p>
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