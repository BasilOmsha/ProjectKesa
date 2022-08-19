package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import dao.Dao;
import model.User;
import security.SecurityUtils;

@WebServlet(name = "login", urlPatterns = { "/login" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.sendRedirect("index.html");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("application/x-www-form-urlencoded");
		response.setCharacterEncoding("UTF-8");

		Dao dao = new Dao();

		// return values as string.
		String email = request.getParameter("email");
		String password = request.getParameter("paswd");

	
		System.out.println("Test passed0");
		// Read reference values from DB
		String salt = dao.getUserSalt(email);
		String hashpw = dao.getUserpasswordHash(email);
		System.out.println("Test 1 passed");
		dao.checkemail(email);
		
			System.out.println("Test 2 passed");
			if (SecurityUtils.isPasswordOk(hashpw, password, salt)) {
				System.out.println("Test 3 passed");
				String data = email;
				HttpSession session = request.getSession();
				User user = dao.readUserInfo(data);
				dao.close();
				System.out.println("Test 4 passed");
				session.setAttribute("LoggedUser", user);
				System.out.println("Session: " + request.getSession(false));
				session.setMaxInactiveInterval(30 * 60);
				Cookie cookie = new Cookie("LoggedUser", data);
				cookie.setMaxAge(30 * 60);
				response.addCookie(cookie);
				System.out.println("Test 5 passed");
				String encodedURL = response.encodeRedirectURL("/userInfo?email=" + data +"#ty");
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {
				dao.close();
				response.sendRedirect("./html/wup.html");

			}


	}

}
