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
<title>${sessionScope.readUsersInfo.fname }
	${sessionScope.readUsersInfo.lname } | ChatNook</title>
<link rel="stylesheet" href="/css/profile.css" />
<link rel="shortcut icon" href="../images/Logo2.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet" />
</head>
<%
session.getAttribute("LoggedUser");
%>
<body onload="blueBottom(); changeColors();">
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MQ3B34C"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
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
							onclick="window.location.href='#ty'">
						<%
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
								/* out.println("Welcome, " + email); */
							} else {
								sessionID = session.getId();
							}
						} else if (session.getAttribute("LoggedUser") == null) {
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
					<div class="prof-container" onclick="window.location.href='#ty'">
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
		<div class="profile-upper-block" onclick="mouseUp7()">
			<div class="cover-photo-block" onclick="expandWindow2()"></div>
			<div class="filler" id="ty"></div>
			<div class="cover-photo-block-bottom">
				<div
					class="main-profile-picture profile-button-main profile-button-main-pic"
					onclick="#">
					<img alt="Profile picture" src="../images/avatar.png"
						Style="height: 145px; width: 186px" onclick="#">
				</div>

				<div class="add-picture-button" onclick="expandWindow2()">
					<img alt="add cover picture" src="../images/camera.png"
						Style="height: 20px; width: 20px">
					<p style="font-size: 17px">
						&nbsp;<b>Add cover photo</b>
					</p>
				</div>
				<div id="cover-photo-upload-positioning">
					<div id="cover-photo-upload">
						<!-- 						<div class="prof-nav-item" onclick="#'">
							<img alt="Profile picture" src="../images/upload.png"
								Style="height: 35px; width: 36px" onclick="#"> Select
							Photo
						</div> -->
						<div class="uplaod-photo-item2 ">
							<img alt="Profile picture" src="../images/upload.png"
								Style="height: 20px; width: 23px; padding-right: 5px"
								onclick="#">
							<form action="./rest/services/fileupload" method="post"
								enctype="multipart/form-data">
								<input type="file" id="file" name="file" accept=".png" /> <input
									type="submit" id="uploadBtn" value="Upload Photo" />
							</form>
						</div>
					</div>
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
			<div class="edit-profile" onclick="editAll()">
				<img alt="add cover picture" src="../images/pen.png"
					Style="height: 20px; width: 20px">
				<p style="font-size: 17px">
					&nbsp;<b>Edit profile</b>
				</p>
			</div>
			<div id="edit-all-positioning">
				<div class="edit-all" id="edit-all">
					<div
						style="margin: 10px; display: flex; justify-content: center; flex-direction: column; align-items: center">
						<h1>
							<b>Edit profile</b>
						</h1>
					</div>
					<br>
					<hr>
					<div class="edit-all-item">
						<form
							style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
							action='./rest/services/updateall' method='post'>
							
							<input type="number" name="user_id"
								value="${sessionScope.readUsersInfo.user_id }"
								class="input-first_name" id="all1" hidden /> 
							<p Style="margin: 10px 450px 10px 0px; font-size: 15px; ">First name:</p>
							<input type="text"
								name="fname"
								placeholder="First name: ${sessionScope.readUsersInfo.fname }"
								class="input-first_name" id="all1" required /> 
							<p Style="margin: 10px 450px 10px 0px; font-size: 15px; ">Last name:</p>
							<input
								type="text" name="lname"
								placeholder="Last name: ${sessionScope.readUsersInfo.lname }"
								class="input-first_name" id="all1" required /> 
							<p Style="margin: 10px 450px 10px 0px; font-size: 15px; ">Email:</p>	
							<input
								type="text" name="email"
								placeholder="Your Email: ${sessionScope.readUsersInfo.email }"
								class="input-first_name" id="all1" required />
							<p Style="margin: 10px 450px 10px 0px; font-size: 15px; ">Birth date:</p>	
							<div class="birthday-container">
								<select required name="month">
									<option value="" style="display: none">${sessionScope.readUsersInfo.month }</option>
									<option value="January">Jan</option>
									<option value="February">Feb</option>
									<option value="March">Mar</option>
									<option value="April">Apr</option>
									<option value="May">May</option>
									<option value="June">Jun</option>
									<option value="July">Jul</option>
									<option value="August">Aug</option>
									<option value="September">Sep</option>
									<option value="October">Oct</option>
									<option value="November">Nov</option>
									<option value="December">Dec</option>
								</select> <select required name="day">
									<option value="" style="display: none">${sessionScope.readUsersInfo.day }</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
								</select> <select required name="year">
									<option value="" style="display: none">${sessionScope.readUsersInfo.year }</option>
									<option value="2022">2022</option>
									<option value="2021">2021</option>
									<option value="2020">2020</option>
									<option value="2019">2019</option>
									<option value="2018">2018</option>
									<option value="2017">2017</option>
									<option value="2016">2016</option>
									<option value="2015">2015</option>
									<option value="2014">2014</option>
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option>
									<option value="1959">1959</option>
									<option value="1958">1958</option>
									<option value="1957">1957</option>
									<option value="1956">1956</option>
									<option value="1955">1955</option>
									<option value="1954">1954</option>
									<option value="1953">1953</option>
									<option value="1952">1952</option>
									<option value="1951">1951</option>
									<option value="1950">1950</option>
									<option value="1949">1949</option>
									<option value="1948">1948</option>
									<option value="1947">1947</option>
									<option value="1946">1946</option>
									<option value="1945">1945</option>
									<option value="1944">1944</option>
									<option value="1943">1943</option>
									<option value="1942">1942</option>
									<option value="1941">1941</option>
									<option value="1940">1940</option>
									<option value="1939">1939</option>
									<option value="1938">1938</option>
									<option value="1937">1937</option>
									<option value="1936">1936</option>
									<option value="1935">1935</option>
									<option value="1934">1934</option>
									<option value="1933">1933</option>
									<option value="1932">1932</option>
									<option value="1931">1931</option>
									<option value="1930">1930</option>
									<option value="1929">1929</option>
									<option value="1928">1928</option>
									<option value="1927">1927</option>
									<option value="1926">1926</option>
									<option value="1925">1925</option>
									<option value="1924">1924</option>
									<option value="1923">1923</option>
									<option value="1922">1922</option>
									<option value="1921">1921</option>
									<option value="1920">1920</option>
									<option value="1919">1919</option>
									<option value="1918">1918</option>
									<option value="1917">1917</option>
									<option value="1916">1916</option>
									<option value="1915">1915</option>
									<option value="1914">1914</option>
									<option value="1913">1913</option>
									<option value="1912">1912</option>
									<option value="1911">1911</option>
									<option value="1910">1910</option>
									<option value="1909">1909</option>
									<option value="1908">1908</option>
									<option value="1907">1907</option>
									<option value="1906">1906</option>
									<option value="1905">1905</option>
									<option value="1904">1904</option>
									<option value="1903">1903</option>
									<option value="1902">1902</option>
									<option value="1901">1901</option>
									<option value="1900">1900</option>
								</select>
							</div>
							<br>
							<p Style="margin: 10px 450px 10px 0px; font-size: 15px; ">Gender:</p>
							<div class="gender-container">
								<div class="all_gender">
									<label class="gender-lable" for="female">Female</label> <input
										class="gender-radio" type="radio" name="gender" id="female"
										value="Female" required onclick="expand2()" />
								</div>
								<div class="all_gender">
									<label class="gender-lable" for="female">Male<b
										style="color: #ffffff;">ss</b></label> <input class="gender-radio"
										type="radio" name="gender" id="male" value="Male" required
										onclick="expand2()" />
								</div>
								<div class="all_gender">
									<label class="gender-lable" for="other">Custom</label> <input
										class="gender-radio" type="radio" name="gender" id="other"
										value="Other" required onclick="expand2()" />
								</div>
							</div>
							<div id="toExpand" style="visibility: hidden; display: none">
								<select class="pronoun" name="pronoun"
									value="Select your pronounS">
									<option style="display: none"></option>
									<option disabled>Select your pronoun</option>
									<option value="she">She: "Wish her a happy birthday!"</option>
									<option value="he">He: "Wish him a happy birthday!"</option>
									<option value="they">They: "Wish them a happy
										birthday!"</option>
								</select>
								<p
									Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">Your
									pronoun is visible to everyone.</p>
								<input Style="margin-top: -5px" type="text"
									placeholder="Gender (optional)" name="genOpt" class="gender"
									id="all1" />
							</div>
							<br>
							<button id="myBtn" class="update-button4" type="submit"
								onclick="JavaScript:AutoRefresh(3000);">Update</button>
						</form>
					</div>
				</div>
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
						<div class="circleDiv-base2 circletype2" onclick="editName()">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>First name</p>
					</div>
					<div>
						<div id="edit-fname-positioning">
							<div class="edit-fname" id="edit-fname">
								<div class="edit-fname-item" onclick="expandEditFname()">
									<img alt="Profile picture" src="../images/update.png"
										Style="height: 20px; width: 23px; padding-right: 5px"
										onclick="#"><b>Update Your Name</b>
								</div>
								<br> <br>
								<div id="edit-fname-expanded"
									style="visibility: hidden; display: none">
									<div class="editing-Fname">
										<form
											style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
											action='./rest/services/editName' method='post'>
											<p
												Style="color: black; padding-bottom: 15px; font-size: 15px">Your
												registered name is: ${sessionScope.readUsersInfo.fname }
												${sessionScope.readUsersInfo.lname }</p>
											<p
												Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">To
												change your name, enter a new one in the fields below and
												then click update</p>
											<input type="number" name="user_id"
												value="${sessionScope.readUsersInfo.user_id }"
												class="input-first_name" id="all1" hidden /> <input
												type="text" name="fname" placeholder="First name"
												class="input-first_name" id="all1" required /> <input
												type="text" name="lname" placeholder="Last name"
												class="input-first_name" id="all1" required /> <input
												type="email" name="email"
												value="${sessionScope.readUsersInfo.email }"
												class="input-first_name" id="all1" hidden />
											<button id="myBtn" class="update-button" type="submit"
												onclick="JavaScript:AutoRefresh(800);">Update</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/nameIcon.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">${sessionScope.readUsersInfo.lname }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="editName()">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Last name</p>
					</div>
					<div></div>
				</div>
				<div class="info2" id="contact-and-basic-info"
					style="visibility: hidden"
					onclick="mouseUp(), mouseUp2(), mouseUp4(), mouseUp5()">
					<div class="info-header"
						onclick="mouseUp(), mouseUp2(), mouseUp4(), mouseUp5()">
						<h4 style="color: #000000">Contact info</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/mail.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">${sessionScope.readUsersInfo.email }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="editEmail()">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Email</p>
					</div>
					<div id="edit-email-positioning">
						<div class="edit-email1" id="edit-email1">
							<div class="edit-email-item" onclick="expandEditEmail()">
								<img alt="Profile picture" src="../images/update.png"
									Style="height: 20px; width: 23px; padding-right: 5px"
									onclick="#"><b>Update Your Email</b>
							</div>
							<br> <br>
							<div id="edit-email-expanded"
								style="visibility: hidden; display: none">
								<div class="editing-email">
									<form
										style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
										action='./rest/services/updateEmail' method='post'>
										<p Style="color: black; padding-bottom: 15px; font-size: 15px">Your
											registered email is: ${sessionScope.readUsersInfo.email }</p>
										<p
											Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">To
											update your email, enter a different one in the fields below
											and then click update</p>
										<input type="number" name="user_id"
											value="${sessionScope.readUsersInfo.user_id }"
											class="input-first_name" id="all1" hidden /> <input
											type="text" name="email" placeholder="Email"
											value="${sessionScope.readUsersInfo.email }"
											class="input-first_name" id="all1" required />
										<button id="myBtn" class="update-button" type="submit"
											onclick="JavaScript:AutoRefresh(800);">Update</button>
									</form>
								</div>
							</div>
						</div>
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
						<div class="contact-info">
							<p style="color: #000000">${sessionScope.readUsersInfo.pronoun }</p>
						</div>
						<div class="contact-info">
							<p style="color: #000000">${sessionScope.readUsersInfo.genOpt }</p>
						</div>
						<div class="circleDiv-base3 circletype3" onclick="editBasic()">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Gender</p>
					</div>
					<div id="edit-basic-positioning">
						<div class="edit-basic" id="edit-basic">
							<div class="edit-basic-item" onclick="expandEditBasic()">
								<img alt="Profile picture" src="../images/update.png"
									Style="height: 20px; width: 23px; padding-right: 5px"
									onclick="#"><b>Update Your Gender</b>
							</div>
							<br> <br>
							<div id="edit-basic-expanded"
								style="visibility: hidden; display: none">
								<br>
								<div class="editing-basic">
									<form id="basic-info-form"
										action='./rest/services/updateGender' method='post'>
										<p
											Style="color: black; padding-bottom: 15px; font-size: 15px;">Your
											registered gender: ${sessionScope.readUsersInfo.gender }</p>
										</p>
										<p
											Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">To
											update your gender select from the different options below
											and then click update</p>
										<input type="number" name="user_id"
											value="${sessionScope.readUsersInfo.user_id }"
											class="input-first_name" id="all1" hidden /> <input
											type="text" name="email" placeholder="Email"
											value="${sessionScope.readUsersInfo.email }"
											class="input-first_name" id="all1" hidden /> <br />

										<div class="gender-container">
											<div class="all_gender">
												<label class="gender-lable" for="female">Female</label> <input
													class="gender-radio" type="radio" name="gender" id="female"
													value="Female" required onclick="expand2()" />
											</div>
											<div class="all_gender">
												<label class="gender-lable" for="female">Male<b
													style="color: #ffffff;">ss</b></label> <input class="gender-radio"
													type="radio" name="gender" id="male" value="Male" required
													onclick="expand2()" />
											</div>
											<div class="all_gender">
												<label class="gender-lable" for="other">Custom</label> <input
													class="gender-radio" type="radio" name="gender" id="other"
													value="Other" required onclick="expand2()" />
											</div>
										</div>
										<div id="toExpand" style="visibility: hidden; display: none">
											<select class="pronoun" name="pronoun"
												value="Select your pronounS">
												<option style="display: none"></option>
												<option disabled>Select your pronoun</option>
												<option value="she">She: "Wish her a happy
													birthday!"</option>
												<option value="he">He: "Wish him a happy birthday!"</option>
												<option value="they">They: "Wish them a happy
													birthday!"</option>
											</select>
											<p
												Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">Your
												pronoun is visible to everyone.</p>
											<input Style="margin-top: -5px" type="text"
												placeholder="Gender (optional)" name="genOpt" class="gender"
												id="all1" />
										</div>
										<br>
										<button id="myBtn" class="update-button2" type="submit"
											onclick="JavaScript:AutoRefresh(2000);">Update</button>
									</form>
								</div>
							</div>
						</div>
					</div>

					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/cake.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">${sessionScope.readUsersInfo.month }
								${sessionScope.readUsersInfo.day }</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="editBirthday()">
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
					</div>
					<div class="info-tag">
						<p>Birth year</p>
					</div>
				</div>
				<div id="edit-Birthday-positioning">
					<div class="edit-Birthday" id="edit-Birthday">
						<div class="edit-Birthday-item" onclick="expandEditBirthday()">
							<img alt="Profile picture" src="../images/update.png"
								Style="height: 20px; width: 23px; padding-right: 5px"
								onclick="#"><b>Update Your Birthday</b>
						</div>
						<br> <br>
						<div id="edit-Birthday-expanded"
							style="visibility: hidden; display: none">
							<div class="editing-Birthday">
								<form
									style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
									action='./rest/services/updateBirthday' method='post'>
									<p Style="color: black; padding-bottom: 15px; font-size: 15px">Your
										registered birthday: ${sessionScope.readUsersInfo.month }
										${sessionScope.readUsersInfo.day }
										${sessionScope.readUsersInfo.year }</p>
									<p
										Style="color: black; padding-bottom: 15px; padding-top: 10px; font-size: 15px">To
										update your birthday select from the different options below
										and then click update</p>
									<input type="number" name="user_id"
										value="${sessionScope.readUsersInfo.user_id }"
										class="input-first_name" id="all1" hidden /> <input
										type="text" name="email" placeholder="Email"
										value="${sessionScope.readUsersInfo.email }"
										class="input-first_name" id="all1" hidden />

									<div class="birthday-container">
										<select required name="month">
											<option value="" style="display: none">Month</option>
											<option value="January">Jan</option>
											<option value="February">Feb</option>
											<option value="March">Mar</option>
											<option value="April">Apr</option>
											<option value="May">May</option>
											<option value="June">Jun</option>
											<option value="July">Jul</option>
											<option value="August">Aug</option>
											<option value="September">Sep</option>
											<option value="October">Oct</option>
											<option value="November">Nov</option>
											<option value="December">Dec</option>
										</select> <select required name="day">
											<option value="" style="display: none">Day</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select> <select required name="year">
											<option value="" style="display: none">Year</option>
											<option value="2022">2022</option>
											<option value="2021">2021</option>
											<option value="2020">2020</option>
											<option value="2019">2019</option>
											<option value="2018">2018</option>
											<option value="2017">2017</option>
											<option value="2016">2016</option>
											<option value="2015">2015</option>
											<option value="2014">2014</option>
											<option value="2013">2013</option>
											<option value="2012">2012</option>
											<option value="2011">2011</option>
											<option value="2010">2010</option>
											<option value="2009">2009</option>
											<option value="2008">2008</option>
											<option value="2007">2007</option>
											<option value="2006">2006</option>
											<option value="2005">2005</option>
											<option value="2004">2004</option>
											<option value="2003">2003</option>
											<option value="2002">2002</option>
											<option value="2001">2001</option>
											<option value="2000">2000</option>
											<option value="1999">1999</option>
											<option value="1998">1998</option>
											<option value="1997">1997</option>
											<option value="1996">1996</option>
											<option value="1995">1995</option>
											<option value="1994">1994</option>
											<option value="1993">1993</option>
											<option value="1992">1992</option>
											<option value="1991">1991</option>
											<option value="1990">1990</option>
											<option value="1989">1989</option>
											<option value="1988">1988</option>
											<option value="1987">1987</option>
											<option value="1986">1986</option>
											<option value="1985">1985</option>
											<option value="1984">1984</option>
											<option value="1983">1983</option>
											<option value="1982">1982</option>
											<option value="1981">1981</option>
											<option value="1980">1980</option>
											<option value="1979">1979</option>
											<option value="1978">1978</option>
											<option value="1977">1977</option>
											<option value="1976">1976</option>
											<option value="1975">1975</option>
											<option value="1974">1974</option>
											<option value="1973">1973</option>
											<option value="1972">1972</option>
											<option value="1971">1971</option>
											<option value="1970">1970</option>
											<option value="1969">1969</option>
											<option value="1968">1968</option>
											<option value="1967">1967</option>
											<option value="1966">1966</option>
											<option value="1965">1965</option>
											<option value="1964">1964</option>
											<option value="1963">1963</option>
											<option value="1962">1962</option>
											<option value="1961">1961</option>
											<option value="1960">1960</option>
											<option value="1959">1959</option>
											<option value="1958">1958</option>
											<option value="1957">1957</option>
											<option value="1956">1956</option>
											<option value="1955">1955</option>
											<option value="1954">1954</option>
											<option value="1953">1953</option>
											<option value="1952">1952</option>
											<option value="1951">1951</option>
											<option value="1950">1950</option>
											<option value="1949">1949</option>
											<option value="1948">1948</option>
											<option value="1947">1947</option>
											<option value="1946">1946</option>
											<option value="1945">1945</option>
											<option value="1944">1944</option>
											<option value="1943">1943</option>
											<option value="1942">1942</option>
											<option value="1941">1941</option>
											<option value="1940">1940</option>
											<option value="1939">1939</option>
											<option value="1938">1938</option>
											<option value="1937">1937</option>
											<option value="1936">1936</option>
											<option value="1935">1935</option>
											<option value="1934">1934</option>
											<option value="1933">1933</option>
											<option value="1932">1932</option>
											<option value="1931">1931</option>
											<option value="1930">1930</option>
											<option value="1929">1929</option>
											<option value="1928">1928</option>
											<option value="1927">1927</option>
											<option value="1926">1926</option>
											<option value="1925">1925</option>
											<option value="1924">1924</option>
											<option value="1923">1923</option>
											<option value="1922">1922</option>
											<option value="1921">1921</option>
											<option value="1920">1920</option>
											<option value="1919">1919</option>
											<option value="1918">1918</option>
											<option value="1917">1917</option>
											<option value="1916">1916</option>
											<option value="1915">1915</option>
											<option value="1914">1914</option>
											<option value="1913">1913</option>
											<option value="1912">1912</option>
											<option value="1911">1911</option>
											<option value="1910">1910</option>
											<option value="1909">1909</option>
											<option value="1908">1908</option>
											<option value="1907">1907</option>
											<option value="1906">1906</option>
											<option value="1905">1905</option>
											<option value="1904">1904</option>
											<option value="1903">1903</option>
											<option value="1902">1902</option>
											<option value="1901">1901</option>
											<option value="1900">1900</option>
										</select>
									</div>
									<br>
									<button id="myBtn" class="update-button3" type="submit"
										onclick="JavaScript:AutoRefresh(800);">Update</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="info3" id="security1" style="visibility: hidden"
					onclick="mouseUp(), mouseUp2(), mouseUp4(), mouseUp5()">
					<div class="info-header" style="margin-buttom: 132px"
						onclick="mouseUp(), mouseUp2(), mouseUp4(), mouseUp5()">
						<h4 style="color: #000000">Security</h4>
					</div>
					<div class="contact-info-container">
						<div class="contact-info">
							<img alt="add cover picture" src="../images/security.png"
								Style="height: 25px; width: 25px"> &nbsp;&nbsp;&nbsp;
							<p style="color: #000000">Security Settings</p>
						</div>
						<div class="circleDiv-base2 circletype2" onclick="editPaswd()">
							<img alt="add cover picture" src="../images/pen.png"
								Style="height: 20px; width: 20px">
						</div>
					</div>
					<div class="info-tag">
						<p>Security</p>
					</div>
					<div id="edit-paswd-positioning">
						<div class="edit-paswd" id="edit-paswd">
							<div class="edit-paswd-item" onclick="expandEditPaswd()">
								<img alt="Profile picture" src="../images/update.png"
									Style="height: 20px; width: 23px; padding-right: 5px"
									onclick="#"><b>Update Your Security</b>
							</div>
							<br> <br>
							<div id="edit-paswd-expanded"
								style="visibility: hidden; display: none">
								<div class="editing-paswd">
									<form
										style="display: flex; justify-content: center; flex-direction: column; align-items: center;"
										action='./UpdatePaswd' method='post'>
										<p Style="color: black; padding-bottom: 15px; font-size: 15px">
											Re-enter your password to continue!</p>
										<input type="number" name="user_id"
											value="${sessionScope.readUsersInfo.user_id }"
											class="input-first_name" id="all1" hidden /> <input
											type="text" name="email" placeholder="Email"
											value="${sessionScope.readUsersInfo.email }"
											class="input-first_name" id="all1" required hidden /> <input
											type="password" name="paswd"
											placeholder="Enter your password" class="input-first_name"
											id="all1" required /><br>
										<button id="myBtn" class="update-button" type="submit">Continue</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="../js/scripts.js"></script>
</body>
</html>