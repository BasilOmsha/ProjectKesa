package app;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import model.User;
import security.SecurityUtils;

@WebServlet("/client")
public class UserClient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserClient() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String uri = "http://localhost:8080/rest/services/createUser";

		

		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String uname = request.getParameter("uname");
		String paswd = request.getParameter("paswd");
		// Create salt and hashed pw
		String salt = SecurityUtils.getSalt();
		String hashpw = SecurityUtils.getPasswordHashed(paswd, salt);
		long dob = Date.parse(request.getParameter("dob"));
		String gender = request.getParameter("gender");
		String pronoun = request.getParameter("pronoun");
		String genOpt = request.getParameter("genOpt");
		User user = new User(fname, lname, email, uname, hashpw, dob, gender, pronoun, genOpt);
		
		Client c = ClientBuilder.newClient();
		WebTarget wt = c.target(uri);
		Builder b = wt.request();
		Entity<User> e = Entity.entity(user, MediaType.APPLICATION_JSON);

		b.post(e);

		doGet(request, response);

	}

}
