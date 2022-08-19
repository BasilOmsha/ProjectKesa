package rest;

import java.io.*;
import java.util.*;

import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

import dao.Dao;
import model.User;
import security.SecurityUtils;

@Path("/services")
public class Services {

	@POST
	@Path("/createUser")
	@Consumes(MediaType.APPLICATION_JSON)
	public void createUser(User user) {
		Dao.createUser(user);
	}

	@POST
	@Path("/editName")
	@Consumes("application/x-www-form-urlencoded")
	public void editFname(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) throws IOException, ServletException {

		Dao.editName(mvm, request, response);
	}

	@POST
	@Path("/updateEmail")
	@Consumes("application/x-www-form-urlencoded")
	public void updateEmail(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		Dao.updateEmail(mvm, request, response);
	}
	
	@POST
	@Path("/updateGender")
	@Consumes("application/x-www-form-urlencoded")
	public void updateGender(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		Dao.updateGender(mvm, request, response);
	}
	
	@POST
	@Path("/updateBirthday")
	@Consumes("application/x-www-form-urlencoded")
	public void updateBirthday(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		Dao.updateBirthday(mvm, request, response);
	}

	@POST
	@Path("/updatingPassword")
	@Consumes("application/x-www-form-urlencoded")
	public void updatingPassword(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		Dao.updatingPassword(mvm, request, response);
	}
	
	@POST
	@Path("/deleteAccount")
	@Consumes("application/x-www-form-urlencoded")
	public void deleteAccount(MultivaluedMap<String, String> mvm, @Context HttpServletRequest request,
			@Context HttpServletResponse response) {
		Dao.deleteAccount(mvm, request, response);
	}
}
