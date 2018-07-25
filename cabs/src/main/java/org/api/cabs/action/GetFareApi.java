package org.api.cabs.action;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;

import javax.ws.rs.core.MediaType;

import org.api.cabs.controller.GetFareController;
import org.json.JSONObject;

@Path("/getFare")
public class GetFareApi {
	@GET
    @Produces(MediaType.TEXT_HTML)	 
	public static String getCabs(@QueryParam("origin") String origin,@QueryParam("destination") String destination) {
		String jsonRes = new String();
		JSONObject responseObj = new JSONObject();
		try {
			responseObj = GetFareController.calculateFare(origin,destination);
			int responseCode = responseObj.getInt("responseCode");

	    	 JSONObject statusObj = new JSONObject();
		     statusObj.put("responseCode", responseCode);
		     statusObj.put("message", responseCode == 200 ? "success" : "failure");
		     responseObj.put("status", statusObj);
		     jsonRes = responseObj.toString();
	     }catch(Exception e) {
	    	 e.printStackTrace();
	     }		
	     return jsonRes;
	}
}
