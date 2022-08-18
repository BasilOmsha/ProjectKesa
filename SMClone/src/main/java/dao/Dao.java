package dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MultivaluedMap;

import model.User;
import security.SecurityUtils;
import conn.Connections;

public class Dao {
	private static EntityManagerFactory emf;

	/**
	 * Function to connect to database
	 */
	private Connection conn;

	// When new instance is created, also DB-connection is created
	public Dao() {
		try {
			// get the connection to db form the Connections class
			conn = Connections.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// Manually close DB-connection for releasing resource
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private static EntityManager getEntityManager() {
		if (emf == null) {
			emf = Persistence.createEntityManagerFactory("smclone");
		}
		return emf.createEntityManager();
	}

	public static void createUser(User user) {
		// TODO Auto-generated method stub
		EntityManager em = getEntityManager();
		em.getTransaction().begin();
		em.persist(user);
		em.getTransaction().commit();
		// print for test purposes
		System.out.println(user);
		em.close();
	}

	/**
	 * Checks for duplicate users' emails
	 * 
	 * @param uname
	 * @return
	 */
	public boolean checkemail(String email) {
		boolean count = true;
		String sql = "SELECT email FROM user WHERE email=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, email);

			ResultSet resultset = stmt.executeQuery();

			if (resultset.next()) {
				// print for test purposes
				System.out.println("" + email + " is already in use");
				return count;
			} else {
				System.out.println(email + " is not in registered in our database!");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;

	}

	public String getUserSalt(String email) {
		// TODO Auto-generated method stub
		String result = "";
		String sql = "select salt from user where email=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("salt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getUserpasswordHash(String email) {
		// TODO Auto-generated method stub
		String result = "";
		String sql = "select paswd from user where email=?";

		try {
			PreparedStatement stmt = conn.prepareStatement(sql);

			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				result = rs.getString("paswd");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public User readUserInfo(String email) {
		// TODO Auto-generated method stub
		User result = null;
		String sql = "select * from user where email = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet resultset = stmt.executeQuery();
			if (resultset.next()) {
				result = new User();
				result.setUser_id(resultset.getInt("user_id"));
				result.setFname(resultset.getString("fname"));
				result.setLname(resultset.getString("lname"));
				result.setEmail(resultset.getString("email"));
				result.setPaswd(resultset.getString("paswd"));
				result.setMonth(resultset.getString("month"));
				result.setEmail(resultset.getString("email"));
				result.setDay(resultset.getString("day"));
				result.setYear(resultset.getString("year"));
				result.setGender(resultset.getString("gender"));
				result.setPronoun(resultset.getString("pronoun"));
				result.setGenOpt(resultset.getString("genOpt"));

//				result.setSalt(resultset.getString("salt"));

				// list.add(result);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public static void editName(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		// TODO Auto-generated method stub

		EntityManager em = getEntityManager();

		int user_id = Integer.parseInt(mvm.getFirst("user_id"));
		String fname = mvm.getFirst("fname");
		String lname = mvm.getFirst("lname");
		String email = mvm.getFirst("email");
		try {

			System.out.println(user_id + " " + fname + " " + lname + " " + email);

			em.getTransaction().begin();
			Query q = em.createQuery("update User u set u.fname = :fname, u.lname=:lname where u.user_id = :user_id");
			q.setParameter("user_id", user_id);
			q.setParameter("fname", fname);
			q.setParameter("lname", lname).executeUpdate();
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Dao dao = new Dao();

		try {
			// refreshing
			System.out.println("Test 2 passed");
			System.out.println("Test 3 passed");
			String data = email;
			if (!data.equals(null)) {
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
				String encodedURL = response.encodeRedirectURL("/userInfo?email=" + data);
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				dao.close();
				RequestDispatcher rd = request.getRequestDispatcher("./index.html");
				try {
					rd.include(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updateEmail(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManager em = getEntityManager();

		int user_id = Integer.parseInt(mvm.getFirst("user_id"));
		String email = mvm.getFirst("email");
		try {

			System.out.println(user_id + " " + email);

			em.getTransaction().begin();
			Query q = em.createQuery("update User u set u.email = :email where u.user_id = :user_id");
			q.setParameter("user_id", user_id);
			q.setParameter("email", email).executeUpdate();
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Dao dao = new Dao();

		try {
			// refreshing
			System.out.println("Test 2 passed");
			System.out.println("Test 3 passed");
			String data = email;
			if (!data.equals(null)) {
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
				String encodedURL = response.encodeRedirectURL("/userInfo?email=" + data);
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				dao.close();
				RequestDispatcher rd = request.getRequestDispatcher("./index.html");
				try {
					rd.include(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updateGender(MultivaluedMap<String, String> mvm, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManager em = getEntityManager();

		int user_id = Integer.parseInt(mvm.getFirst("user_id"));
		String gender = mvm.getFirst("gender");
		String pronoun = mvm.getFirst("pronoun");
		String genOpt = mvm.getFirst("genOpt");
		String email = mvm.getFirst("email");
		try {

			System.out.println(user_id + " " + gender + " " + pronoun + " " + genOpt);

			em.getTransaction().begin();
			Query q = em.createQuery("update User u set u.gender = :gender, u.pronoun = :pronoun, u.genOpt = :genOpt"
					+ " where u.user_id = :user_id");
			q.setParameter("user_id", user_id);
			q.setParameter("gender", gender);
			q.setParameter("pronoun", pronoun);
			q.setParameter("genOpt", genOpt).executeUpdate();
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Dao dao = new Dao();

		try {
			// refreshing
			System.out.println("Test 2 passed");
			System.out.println("Test 3 passed");
			String data = email;
			if (!data.equals(null)) {
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
				String encodedURL = response.encodeRedirectURL("/userInfo?email=" + data);
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				dao.close();
				RequestDispatcher rd = request.getRequestDispatcher("./index.html");
				try {
					rd.include(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updateBirthday(MultivaluedMap<String, String> mvm, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManager em = getEntityManager();

		int user_id = Integer.parseInt(mvm.getFirst("user_id"));
		String month = mvm.getFirst("month");
		String day = mvm.getFirst("day");
		String year = mvm.getFirst("year");
		String email = mvm.getFirst("email");
		try {

			System.out.println(user_id + " " + month + " " + day + " " + year);

			em.getTransaction().begin();
			Query q = em.createQuery(
					"update User u set u.month = :month, u.day = :day, u.year = :year" + " where u.user_id = :user_id");
			q.setParameter("user_id", user_id);
			q.setParameter("month", month);
			q.setParameter("day", day);
			q.setParameter("year", year).executeUpdate();
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Dao dao = new Dao();

		try {
			// refreshing
			System.out.println("Test 2 passed");
			System.out.println("Test 3 passed");
			String data = email;
			if (!data.equals(null)) {
				HttpSession session = request.getSession();
				User user = dao.readUserInfo(data);
				dao.close();
				System.out.println("Test 4 passed");
				session.setAttribute("LoggedUser", user);
				System.out.println("Session: " + request.getSession(false));
				session.setMaxInactiveInterval(30 * 60);
				System.out.println("Test 5 passed");
				Cookie cookie = new Cookie("LoggedUser", data);
				cookie.setMaxAge(30 * 60);
				response.addCookie(cookie);
				String encodedURL = response.encodeRedirectURL("/userInfo?email=" + data);
				System.out.println("Final Test 6 passed");
				try {
					response.sendRedirect(encodedURL);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else {
				dao.close();
				RequestDispatcher rd = request.getRequestDispatcher("./index.html");
				try {
					rd.include(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void updatingPassword(MultivaluedMap<String, String> mvm, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		EntityManager em = getEntityManager();

		int user_id = Integer.parseInt(mvm.getFirst("user_id"));
		String email = mvm.getFirst("email");
		String paswd = mvm.getFirst("paswd");

		try {

			// Create salt and hashed paswd
			String salt = SecurityUtils.getSalt();
			String hashpw = SecurityUtils.getPasswordHashed(paswd, salt);

			em.getTransaction().begin();
			Query q = em.createQuery("update User u set u.paswd = :paswd, u.salt = :salt  where u.user_id = :user_id");
			q.setParameter("user_id", user_id);
			q.setParameter("salt", salt);
			q.setParameter("paswd", hashpw).executeUpdate();
			em.getTransaction().commit();
			em.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("JSESSIONID")) {
					System.out.println("JSESSIONID=" + cookie.getValue());
				}
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
		}
		// invalidate the session if exists
		HttpSession session = request.getSession(false);
		System.out.println("User=" + session.getAttribute("LoggedUser"));
		System.out.println("User=" + session.getAttribute("LoggedUser1"));
		if (session != null) {
			session.invalidate();
		}

	}

}
