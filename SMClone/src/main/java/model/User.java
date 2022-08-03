package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name="User.findAll", query="SELECT u FROM User u")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int user_id;
	
	private String fname;

	private String lname;
	
	private String email;

	private String paswd;

	private String salt;
	
	private String month;
	
	private String day;
	
	private String year;

	private String gender;

	private String pronoun;

	private String genOpt;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int user_id, String fname, String lname, String email, String paswd, String salt, String month,
			String day, String year, String gender, String pronoun, String genOpt) {
		super();
		this.user_id = user_id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.paswd = paswd;
		this.salt = salt;
		this.month = month;
		this.day = day;
		this.year = year;
		this.gender = gender;
		this.pronoun = pronoun;
		this.genOpt = genOpt;
	}

	public User(String fname, String lname, String email, String hashpw, String salt, String month, String day,
			String year, String gender, String pronoun, String genOpt) {
		// TODO Auto-generated constructor stub
		
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.paswd = hashpw;
		this.salt = salt;
		this.month = month;
		this.day = day;
		this.year = year;
		this.gender = gender;
		this.pronoun = pronoun;
		this.genOpt = genOpt;
	}

	public User(String email) {
		// TODO Auto-generated constructor stub
		this.email = email;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPaswd() {
		return paswd;
	}

	public void setPaswd(String paswd) {
		this.paswd = paswd;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPronoun() {
		return pronoun;
	}

	public void setPronoun(String pronoun) {
		this.pronoun = pronoun;
	}

	public String getGenOpt() {
		return genOpt;
	}

	public void setGenOpt(String genOpt) {
		this.genOpt = genOpt;
	}

	@Override
	public String toString() {
		return "A New User Has Been Added:" + "\n" + "user_id=" + user_id + "\n" + "fname=" + fname + "\n" + "lname=" + lname + "\n" + "email=" + email + "\n" + "paswd="
				+ paswd + "\n" + "salt=" + salt + "\n" + "month=" + month + "\n" + "day=" + day + "\n" + "year=" + year + "\n" + "gender="
				+ gender + "\n" + "pronoun=" + pronoun + "\n" + "genOpt=" + genOpt;
	}

}
