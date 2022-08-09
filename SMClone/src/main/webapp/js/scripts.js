/**
 * 
 */
//shows an info when user clicks on question mark on signup form
function myFunction() {
	var x = document.getElementById("birthday-info-container");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}
//When user clicks somewhere else info box disapears
document.addEventListener('mouseup', function(e) {
	var container = document.getElementById('birthday-info-container');
	if (!container.contains(e.target)) {
		container.style.display = 'none';
	}
});

function genderFunction() {
	var x = document.getElementById("gender-info-container");
	if (x.style.display === "none") {
		x.style.display = "block";
	} else {
		x.style.display = "none";
	}
}

document.addEventListener('mouseup', function(e) {
	var container = document.getElementById('gender-info-container');
	if (!container.contains(e.target)) {
		container.style.display = 'none';
	}
});
//More study needed to go into this in order for the dark mode to presiste
// even when refreshing the page. Changes only, on the user command.
function darkMode() {
	var element = document.body;
	element.classList.toggle("darkmode");
}
//this expands the form when user selects "custom gender"
function expand() {
	if (document.getElementById("other").checked) {
		document.getElementById("toExpand").style.visibility = "visible";
		document.getElementById("toExpand").style.display = "block";
		const list = document.getElementById("myForm").classList;
		list.add("sign-up-form-expanded");
	}
	else if (document.getElementById("female").checked) {
		document.getElementById("toExpand").style.visibility = "hidden";
		document.getElementById("toExpand").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");

	}
	else if (document.getElementById("male").checked) {
		document.getElementById("toExpand").style.visibility = "hidden";
		document.getElementById("toExpand").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");

	}
	else
		return;
}

function expandDrk() {
	if (document.getElementById("other1").checked) {
		document.getElementById("toExpandDark").style.visibility = "visible";
		document.getElementById("toExpandDark").style.display = "block";
		const list = document.getElementById("myForm").classList;
		list.add("sign-up-form-expanded");
	}
	else if (document.getElementById("female1").checked) {
		document.getElementById("toExpandDark").style.visibility = "hidden";
		document.getElementById("toExpandDark").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");

	}
	else if (document.getElementById("male1").checked) {
		document.getElementById("toExpandDark").style.visibility = "hidden";
		document.getElementById("toExpandDark").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");

	}
	else
		return;
}

/** closes the success alert after signup. Source: W3Schools */
// Get all elements with class="closebtn"
var close = document.getElementsByClassName("closebtn");
var i;

// Loop through all close buttons
for (i = 0; i < close.length; i++) {
	// When someone clicks on a close button
	close[i].onclick = function() {
		// Get the parent of <span class="closebtn"> (<div class="alert">)
		var div = this.parentElement;
		// Set the opacity of div to 0 (transparent)
		div.style.opacity = "0";
		// Hide the div after 600ms (the same amount of milliseconds it takes to fade out)
		setTimeout(function() { div.style.display = "none"; }, 600);
	}
}

// When the user scrolls the page, execute myFunction. Source: W3Schools
window.onscroll = function() { scrollFunction() };
// Get the navbar
var navbar = document.getElementById("navbar");
// Get the offset position of the navbar
var sticky = navbar.offsetTop;
// Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
function scrollFunction() {
	if (window.pageYOffset >= sticky) {
		navbar.classList.add("sticky")
	} else {
		navbar.classList.remove("sticky");
	}
}

const element1 = document.getElementById("about").classList;
const element2 = document.getElementById("posts").classList;
const element3 = document.getElementById("friends").classList;
const element4 = document.getElementById("photos").classList;
function blueBottom() {
	if (document.getElementById("about")) {
		element1.add("profile-nav-buttons-blue");
		element1.remove("profile-nav-buttons");
		element2.remove("profile-nav-buttons-blue");
		element3.remove("profile-nav-buttons-blue");
		element4.remove("profile-nav-buttons-blue");
	} else {
		element1.remove("profile-nav-buttons-blue");
		element1.add("profile-nav-buttons");
	}
}

function blueBottom2() {
	if (document.getElementById("posts")) {
		element2.add("profile-nav-buttons-blue");
		element2.remove("profile-nav-buttons");
		element1.remove("profile-nav-buttons-blue");
		element3.remove("profile-nav-buttons-blue");
		element4.remove("profile-nav-buttons-blue");
	} else {
		element2.remove("profile-nav-buttons-blue");
		element2.add("profile-nav-buttons");
	}
}

function blueBottom3() {
	if (document.getElementById("friends")) {
		element3.add("profile-nav-buttons-blue");
		element3.remove("profile-nav-buttons");
		element1.remove("profile-nav-buttons-blue");
		element2.remove("profile-nav-buttons-blue");
		element4.remove("profile-nav-buttons-blue");
	} else {
		element3.remove("profile-nav-buttons-blue");
		element3.add("profile-nav-buttons");
	}
}

function blueBottom4() {
	if (document.getElementById("photos")) {
		element4.add("profile-nav-buttons-blue");
		element4.remove("profile-nav-buttons");
		element1.remove("profile-nav-buttons-blue");
		element2.remove("profile-nav-buttons-blue");
		element3.remove("profile-nav-buttons-blue");
	} else {
		element4.remove("profile-nav-buttons-blue");
		element4.add("profile-nav-buttons");
	}
}

const ov = document.getElementById("overview").classList;
const w = document.getElementById("work").classList;
const c = document.getElementById("contact").classList;
const d = document.getElementById("details").classList;
function changeColors() {
	if (document.getElementById("overview")) {
		ov.add("left-columns-buttons-clicked");
		w.remove("left-columns-buttons-clicked");
		c.remove("left-columns-buttons-clicked");
		d.remove("left-columns-buttons-clicked");
	} else {
		ov.remove("left-columns-buttons-clicked");
		ov.add("left-columns-buttons");
	}
}

function changeColors2() {
	if (document.getElementById("work")) {
		w.add("left-columns-buttons-clicked");
		ov.remove("left-columns-buttons-clicked");
		c.remove("left-columns-buttons-clicked");
		d.remove("left-columns-buttons-clicked");
	} else {
		w.remove("left-columns-buttons-clicked");
		w.add("left-columns-buttons");
	}
}

function changeColors3() {
	if (document.getElementById("contact")) {
		c.add("left-columns-buttons-clicked");
		w.remove("left-columns-buttons-clicked");
		ov.remove("left-columns-buttons-clicked");
		d.remove("left-columns-buttons-clicked");
	} else {
		c.remove("left-columns-buttons-clicked");
		c.add("left-columns-buttons");
	}
}

function changeColors4() {
	if (document.getElementById("details")) {
		d.add("left-columns-buttons-clicked");
		w.remove("left-columns-buttons-clicked");
		c.remove("left-columns-buttons-clicked");
		ov.remove("left-columns-buttons-clicked");
	} else {
		d.remove("left-columns-buttons-clicked");
		d.add("left-columns-buttons");
	}
}
