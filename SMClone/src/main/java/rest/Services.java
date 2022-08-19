package rest;

import java.io.*;
import java.util.*;

import javax.persistence.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

import org.glassfish.jersey.media.multipart.*;

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

	@POST
	@Path("/fileupload")
	@Consumes({ MediaType.MULTIPART_FORM_DATA })
	public Response uploadFile(@FormDataParam("file") InputStream fileInputStream,
			@FormDataParam("file") FormDataContentDisposition fileMetaData, @Context ServletContext sc)
			throws Exception {
//		Dao.uploadFile(fileInputStream, fileMetaData, sc);
		String UPLOAD_PATH = sc.getRealPath("/");
		try {
			int read = 0;
			byte[] bytes = new byte[1024];

			OutputStream out = new FileOutputStream(new File(UPLOAD_PATH + "/" + fileMetaData.getFileName()));
			while ((read = fileInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();

		} catch (IOException e) {
			throw new WebApplicationException("Error while uploading file. Please try again !!");
		}
		return Response.ok("Data uploaded successfully !!").build();
	}
}
