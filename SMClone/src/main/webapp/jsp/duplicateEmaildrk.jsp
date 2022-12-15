<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.User"%>

<!DOCTYPE html>
<html lang="en">
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
<title>ChatNook - log in or sign up</title>
<link rel="stylesheet" href="../css/signupDrk-style.css" />
<link rel="shortcut icon" href="../images/Logo2.png" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet" />
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MQ3B34C"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->
	<!--ChatNook Signup from start-->
	<div class="main">
		<form class="sign-up-form" id="myForm" action='../clientDrk'
			method='post'>
			<h2 class="first_title">Sign Up</h2>
			<img class="cancel-img" alt="Light Mode" src="../images/X.png"
				onclick="location.href='./html/indexDarkMode.html';">
			<p class="first_sub_title">It's quick and easy.</p>
			<p class="sub_title_2" style="color: #e83038; margin-top: -10px">${requestScope.getEmail }
				is already in use!</p>
			<hr />
			<!--Input section start-->
			<div class="signup-input-container">
				<input type="text" name="fname" placeholder="First name"
					class="first_name" id="all" required /> <input type="text"
					name="lname" placeholder="Last name" class="sure_name" id="all"
					required /> <br /> <input type="email"
					style="border: 1px solid #e83038;" name="email"
					placeholder="Use a different email address" id="all1" required />
				<br /> <input type="password" name="paswd"
					placeholder="New password" id="all1" required /> <br />
			</div>
			<!--Input section end-->
			<!--Date of Birth section start-->
			<p class="sub_title_2">
				Birthday<a class="question-mark" href="#"
					title="Click for more information" role="button"
					aria-decriobedby="" onclick="myFunction()"><i
					class="question-mark-imag"></i></a>
			</p>
			<div id="birthday-info-text-positioning">
				<div id="birthday-info-container">
					<b>Providing your birthday</b> helps make sure you get the right
					ChatNook experience for your age. If you want to change who sees
					this, go to the About section of your profile. For more details,
					please visit our <a class="fine-prin-hover" href="#"
						style="color: #00875a">Data Policy.</a>
				</div>
			</div>
			<select required name="month">
				<option value="" style="display: none">Month</option>
				<option value="01">Jan</option>
				<option value="02">Feb</option>
				<option value="03">Mar</option>
				<option value="04">Apr</option>
				<option value="05">May</option>
				<option value="06">Jun</option>
				<option value="07">Jul</option>
				<option value="08">Aug</option>
				<option value="09">Sep</option>
				<option value="10">Oct</option>
				<option value="11">Nov</option>
				<option value="12">Dec</option>
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
			<!--Date of Birth section end-->
			<br />
			<!--Gender section start-->
			<p class="sub_title_3">
				Gender<a class="question-mark" href="#"
					title="Click for more information" role="button"
					aria-decriobedby="" onclick="genderFunction()"><i
					class="question-mark-imag"></i></a>
			</p>
			<div id="gender-info-text-positioning">
				<div id="gender-info-container">You can change who sees your
					gender on your profile later. Select Custom to choose another
					gender, or if you'd rather not say.</div>
			</div>
			<div class="gender-container">
				<div class="all_gender">
					<label class="gender-lable" for="female">Female</label> <input
						class="gender-radio" type="radio" name="gender" id="female1"
						value="female" required onclick="expandDrk()" />
				</div>
				<div class="all_gender">
					<label class="gender-lable" for="male">Male<b
						style="color: #1e1e1e;"> ...</b></label> <input class="gender-radio"
						type="radio" name="gender" id="male1" value="male" required
						onclick="expandDrk()" />
				</div>
				<div class="all_gender">
					<label class="gender-lable" for="other">Custom</label> <input
						class="gender-radio" type="radio" name="gender" id="other1"
						value="other" required onclick="expandDrk()" />
				</div>
			</div>
			<div id="toExpandDark" style="visibility: hidden; display: none">
				<select class="pronoun" name="pronoun">
					<option style="display: none">Select your pronoun</option>
					<option disabled>Select your pronoun</option>
					<option value="she">She: "Wish her a happy birthday!"</option>
					<option value="he">He: "Wish him a happy birthday!"</option>
					<option value="they">They: "Wish them a happy birthday!"</option>
				</select>
				<p class="sub_title_3">Your pronoun is visible to everyone.</p>
				<input type="text" placeholder="Gender (optional)" name="genOpt"
					class="gender" id="all1" />
			</div>
			<!--Gender section end-->
			<br />
			<p class="fine-print">
				People who use our service may have uploaded your contact
				information to ChatNook. <a class="fine-prin-hover" href="#"
					style="color: #00875a">Learn more.</a>
			</p>
			<br>
			<p class="fine-print">
				By clicking Sign Up, you agree to our <a class="fine-prin-hover"
					href="#" style="color: #00875a">Terms</a>. Learn how we collect,
				use and share your data in our <a class="fine-prin-hover" href="#"
					style="color: #00875a">Data Policy</a> and how we use cookies and
				similar technology in our <a class="fine-prin-hover" href="#"
					style="color: #00875a">Cookies Policy</a>. You may receive SMS
				Notifications from us and can opt out any time.
			</p>
			<input type="submit" value="Sign Up" class="submit" />
		</form>
	</div>
	<!--Facebook Signup from end-->
	<script src="../js/scripts.js"></script>
</body>
</html>