package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

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
			
		} catch (SQLException e ) {
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
			
        //        list.add(result);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return result;
	}

}
