package rest;

import java.io.*;

import javax.ws.rs.*;

import javax.ws.rs.core.*;

import dao.Dao;
import model.User;

@Path("/services")
public class Services {

	@POST
	@Path("/createUser")
	@Consumes(MediaType.APPLICATION_JSON)
	public void createUser(User user) {
		Dao.createUser(user);
	}
}
