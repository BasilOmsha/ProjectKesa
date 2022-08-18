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
<title>update Password</title>
<link rel="stylesheet" href="/css/paswd.css" />
<link rel="shortcut icon" href="../images/Logo2.png" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet" />
</head>
<%
session.getAttribute("LoggedUser1");
%>
<body>
	<header>
		<div id="navbar">
			<div class="logo-left-wrapper">
				<a href="/userInfo#ty"> <img class="home-button"
					alt="home button" src="../images/Logo2.png"
					Style="height: 35px; width: 35px"></a>
			</div>
			<div class="center-topnav">
				<div class="wrap">
					<div class="wrap2">
						<img class="home-button" alt="home button"
							src="../images/homeIcon.png" Style="height: 20px; width: 20px"
							onclick="window.location.href='/userInfo#ty'">
						<%
						if (session.getAttribute("LoggedUser1") != null) {
							String email = null;
							String sessionID = null;
							Cookie[] cookies = request.getCookies();
							if (cookies != null) {
								for (int i = 0; i < cookies.length; i++) {

							if (cookies[i].getName().equals("LoggedUser1"))
								email = cookies[i].getValue();
							if (cookies[i].getName().equals("JSESSIONID"))
								sessionID = cookies[i].getValue();
								}
								/* out.println("Welcome, " + email); */
							} else {
								sessionID = session.getId();
							}
						} else if (session.getAttribute("LoggedUser1") == null) {
							response.sendRedirect("/index.html");
						}
						%>
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
						onclick="window.location.href='/userInfo#ty'">
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

		<div class="update-pswd-container">
			<div class="edit-paswd-item">
				<img alt="Profile picture" src="../images/update.png"
					Style="height: 50px; width: 53px; padding-right: 5px" onclick="#">
				<h2>Update Your Password</h2>
			</div>
			<form
				style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
				action='./rest/services/updatingPassword' method='post'>
				<h4 Style="color: black; padding-bottom: 15px;">Enter a new
					password!</h4>

				<input type="number" name="user_id"
					value="${sessionScope.readUsersInfo.user_id }"
					class="input-first_name" id="all1" hidden /> <input type="text"
					name="email" placeholder="Email"
					value="${sessionScope.readUsersInfo.email }"
					class="input-first_name" id="all1" required hidden /> <input
					type="password" name="paswd" placeholder="New password"
					class="input-first_name" id="all1" required /><br>
				<button id="myBtn" class="update-button2" type="submit"
					onclick="JavaScript:AutoRefresh(1000); ">Update</button>
			</form>

		</div>

		<div class="update-pswd-container">
			<div class="edit-paswd-item" style="background: red;">
				<img alt="Profile picture" src="../images/delete.png"
					Style="height: 50px; width: 53px; padding-right: 5px" onclick="#">
				<h2>Delete Your Account</h2>
			</div>
			<form
				style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
				action='./rest/services/deleteAccount' method='post'>
				<h4>To delete your account</h4>
				<h4>press the button below.</h4>
				<h4 Style="margin-bottom: 3px">Action cannot be undone!</h4>
				<input type="number" name="user_id"
					value="${sessionScope.readUsersInfo.user_id }"
					class="input-first_name" id="all1" hidden /><br>
				<button id="myBtn" class="update-button3" type="submit"
					onclick="JavaScript:AutoRefresh(1000); ">Delete</button>
			</form>

		</div>
	</main>
	<script src="../js/scripts.js"></script>
</body>
</html>