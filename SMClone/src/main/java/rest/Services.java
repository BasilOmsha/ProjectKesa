package rest;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;

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
