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
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-MQ3B34C');</script>
<!-- End Google Tag Manager -->
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
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MQ3B34C"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
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
							response.sendRedirect("./index.html");
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
			<div class="edit-paswd-item" style="margin-top: 13px">
				<img alt="Profile picture" src="../images/update.png"
					Style="height: 50px; width: 53px; padding-right: 5px">
				<h2>Update Your Password</h2>
			</div>
			<form
				style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
				action='./rest/services/updatingPassword' method='post'>
				<h4 >Enter a new
					password!</h4>
				<p>You will be logged out!</p>
				<input type="number" name="user_id"
					value="${sessionScope.readUsersInfo.user_id }"
					class="input-first_name" id="all1" hidden /> <input type="text"
					name="email" placeholder="Email"
					value="${sessionScope.readUsersInfo.email }"
					class="input-first_name" id="all1" required hidden /> <input
					type="password" name="paswd" placeholder="New password"
					class="input-first_name" id="all1" required /><br>
				<button id="myBtn" class="update-button2" type="submit"
					onclick="JavaScript:AutoRefresh(1000);">Update</button>
			</form>

		</div>

		<div class="update-pswd-container" onclick="mouseUp6()">
			<div class="edit-paswd-item" style="background: red; margin-top: 3px">
				<img alt="Profile picture" src="../images/delete.png"
					Style="height: 50px; width: 53px; padding-right: 5px">
				<h2>Delete Your Account</h2>
			</div>
			<form
				style="display: flex; justify-content: center; flex-direction: column; align-items: center;">
				<h4>To delete your account</h4>
				<h4>press the button below.</h4>
				<h4>Action cannot be undone!</h4>
				<input type="number" name="user_id"
					value="${sessionScope.readUsersInfo.user_id }"
					class="input-first_name" id="all1" hidden /><br>
				<button id="myBtn" class="update-button3" type="button"
					onclick="deleteWindow()">Delete</button>
			</form>
		</div>
		<div id="delete-account-positioning">
			<div class="delete-account" id="delete-account">
				<div class="delete-account-item">
					<form
						style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
						action='./rest/services/deleteAccount' method='post'>
						<h4>Once you confirm deletion</h4>
						<h4>your account will be removed permanently</h4>
						<h4>and you will be returned to the login page.</h4>
						<input type="number" name="user_id"
							value="${sessionScope.readUsersInfo.user_id }"
							class="input-first_name" id="all1" hidden /><br>
						<button id="myBtn" class="update-button4" type="submit"
							onclick="JavaScript:AutoRefresh(1000);">Confirm</button>
					</form>
				</div>
			</div>
		</div>
	</main>
	<script src="../js/scripts.js"></script>
</body>
</html>