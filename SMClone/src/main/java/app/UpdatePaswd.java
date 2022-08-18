package app;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import model.User;
import security.SecurityUtils;

@WebServlet(name = "UpdatePaswd", urlPatterns = { "/UpdatePaswd" })
public class UpdatePaswd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.sendRedirect("index.html");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Dao dao = new Dao();

		int user_id = Integer.parseInt(request.getParameter("user_id"));
		String email = request.getParameter("email");
		String password = request.getParameter("paswd");

		String salt = dao.getUserSalt(email);
		String hashpw = dao.getUserpasswordHash(email);
		System.out.println("Test 1 passed");
		dao.checkemail(email);
		String data = email;
		try {
			System.out.println("Test 2 passed");
			if (SecurityUtils.isPasswordOk(hashpw, password, salt)) {
				System.out.println("Test 3 passed");
				HttpSession session = request.getSession();
				User user = dao.readUserInfo(data);
				dao.close();
				System.out.println("Test 4 passed");
				session.setAttribute("LoggedUser1", user);
				System.out.println("Session: " + request.getSession(false));
				session.setMaxInactiveInterval(30 * 60);
				Cookie cookie = new Cookie("LoggedUser1", data);
				cookie.setMaxAge(30 * 60);
				response.addCookie(cookie);
				String encodedURL = response.encodeRedirectURL("./ToUpdatePswd?email=" + data);
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else if (!SecurityUtils.isPasswordOk(hashpw, password, salt)) {
				String encodedURL = response.encodeRedirectURL("./userInfo");
				System.out.println("Final Test 6 passed wrong paswd!!");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				dao.close();
			} else {
				// Back to list
				try {
					response.sendRedirect("./index.html");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}