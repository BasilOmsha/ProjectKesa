package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.Invocation.Builder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

import model.User;
import security.SecurityUtils;
import dao.Dao;

@WebServlet("/clientDrk")
public class UserClientDrk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserClientDrk() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();

		response.sendRedirect("./html/signupSuccessDrk.html");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String uri = "http://localhost:8080/rest/services/createUser";

		try {

			Dao dao = new Dao();

			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String email = request.getParameter("email");
			String paswd = request.getParameter("paswd");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String year = request.getParameter("year");
			String gender = request.getParameter("gender");
			String pronoun = request.getParameter("pronoun");
			String genOpt = request.getParameter("genOpt");

			// Create salt and hashed paswd
			String salt = SecurityUtils.getSalt();
			String hashpw = SecurityUtils.getPasswordHashed(paswd, salt);

			if (dao.checkemail(email)) { // if email is in use reload the form
				try {

					request.setAttribute("getEmail", email);

					RequestDispatcher rd = request.getRequestDispatcher("./jsp/duplicateEmaildrk.jsp");
					rd.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				User user = new User(fname, lname, email, hashpw, salt, month, day, year, gender, pronoun, genOpt);

				Client c = ClientBuilder.newClient();
				WebTarget wt = c.target(uri);
				Builder b = wt.request();
				Entity<User> e = Entity.entity(user, MediaType.APPLICATION_JSON);

				b.post(e);

				doGet(request, response);
			}
		} catch (

		ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
