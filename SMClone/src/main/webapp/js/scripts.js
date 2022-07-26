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
	else if (document.getElementById("female").checked){
		document.getElementById("toExpand").style.visibility = "hidden";
		document.getElementById("toExpand").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");
		
	}
	else if (document.getElementById("male").checked){
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
	else if (document.getElementById("female1").checked){
		document.getElementById("toExpandDark").style.visibility = "hidden";
		document.getElementById("toExpandDark").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");
		
	}
	else if (document.getElementById("male1").checked){
		document.getElementById("toExpandDark").style.visibility = "hidden";
		document.getElementById("toExpandDark").style.display = "none";
		const list = document.getElementById("myForm").classList;
		list.remove("sign-up-form-expanded");
		
	}
	else 
	return;
}

/** function expand() {
	if (document.getElementById("other").checked){
		document.getElementById("toExpand").style.visibility = "visible";
	}
	else if (document.getElementById("female").checked){
		document.getElementById("toExpand").style.visibility = "hidden";
	}
	else if (document.getElementById("male").checked){
		document.getElementById("toExpand").style.visibility = "hidden";
	}
	else document.getElementById("toExpand").style.display = "hidden";
	return;
}*/

/** function stretch() {
	const list = document.getElementById("myForm").classList;
	list.add("sign-up-form-expanded");

	var element = document.body;
	element.classList.toggle("sign-up-form-expanded");
}*/