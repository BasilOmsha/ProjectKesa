package model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{
	private int user_id;
	
	private String fname;

	private String lname;
	
	private String email;

	private String paswd;

	private String salt;
	
	private Date dob;

	private String gender;

	private String pronoun;

	private String genOpt;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public User(int user_id, String fname, String lname, String email, String paswd, String salt, Date dob,
			String gender, String pronoun, String genOpt) {
		super();
		this.user_id = user_id;
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.paswd = paswd;
		this.salt = salt;
		this.dob = dob;
		this.gender = gender;
		this.pronoun = pronoun;
		this.genOpt = genOpt;
	}

	public User(String fname2, String lname2, String email2, String uname, String hashpw, long dob2, String gender2,
			String pronoun2, String genOpt2) {
		// TODO Auto-generated constructor stub
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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
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
	
}
