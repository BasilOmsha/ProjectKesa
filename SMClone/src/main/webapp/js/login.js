/**
 * 
 */
 function loginAjax(form) {
	var user = new Object();
	user.email = form.email.value;
	user.paswd = form.paswd.value;
	var jsonUser = JSON.stringify(user);
	console.log(user.email);
	console.log(user.paswd);
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("result").innerHTML = this.responseText;
			//Empty form fields
			form.email.value = "";
			form.paswd.value = "";
		}
	};
	xmlhttp.open("POST", "./login", true);
	xmlhttp.setRequestHeader("Content-type", "application/json");
	xmlhttp.send(jsonUser);
}