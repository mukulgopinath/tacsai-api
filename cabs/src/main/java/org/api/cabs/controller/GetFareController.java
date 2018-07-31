package org.api.cabs.controller;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Servlet implementation class GetFareController
 */
public class GetFareController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject responseObject = new JSONObject();
		try {
			String origin = request.getParameter("origin");
			String destination = request.getParameter("destination");
			if(origin != null && destination != null) {
				responseObject = GetFareController.calculateFare(origin,destination);
				int responseCode = responseObject.getInt("responseCode");
				if(responseCode == 200) {
					responseObject.put("msg", "success");
				}else {
					responseObject.put("msg", "failure");					
				}
			}else {
				responseObject.put("msg", "failure");					
			}
			request.setAttribute("respJSON", responseObject);
			RequestDispatcher rd = request.getRequestDispatcher("booking_confirm.jsp");
			rd.forward(request, response);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public static JSONObject calculateFare(String origin,String destination) {
		JSONObject responseObj = new JSONObject();
		try {
			String originParam = new String();
			String destinationParam = new String();
			originParam = origin.replace(" ", "+");
			destinationParam = destination.replace(" ", "+");
			String key = "AIzaSyDAZTRIPzIm5FTAUR2MnrtgWqjMXbCgHsg";
			String url = "https://maps.googleapis.com/maps/api/directions/json?origin="+originParam
					+"&destination="+destinationParam+"&key="+key+"&format=json";
		     URL obj = new URL(url);
		     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		     con.setRequestMethod("GET");
		     con.setRequestProperty("User-Agent", "Mozilla/5.0");
		     int responseCode = con.getResponseCode();
		     System.out.println("\nSending 'GET' request to URL : " + url);
		     System.out.println("Response Code : " + responseCode);
		     if(responseCode == 200) {
		    	 BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			     String inputLine;
			     StringBuffer response = new StringBuffer();
			     while ((inputLine = in.readLine()) != null) {
			     	response.append(inputLine);
			     }
			     in.close();
			     JSONObject myResponse = new JSONObject(response.toString());
			     JSONArray routeObj = myResponse.getJSONArray("routes");
			     JSONObject legsObj = routeObj.getJSONObject(0).getJSONArray("legs").getJSONObject(0);
			     
			     String timeText = legsObj.getJSONObject("duration").getString("text");
			     int timeVal = (Integer)legsObj.getJSONObject("duration").getInt("value")/60;
			     double distVal = legsObj.getJSONObject("distance").getDouble("value")/100;
			     
			     double finalCost = 0.00F;
			     double baseFare = 4.00F;
			     double baseDist = 2.50F;
			     double baseTime = 10.00F;
			     double costperkm = 0.25F;
			     double costpermin = 0.15F;
				
			     double payableTime =  timeVal > baseTime ? timeVal - baseTime : 0;
			     double payableDist =  distVal > baseDist ? distVal - baseDist : 0;
				
			     finalCost = baseFare + (payableDist * costperkm) + (payableTime * costpermin);
			     finalCost = Math.round(finalCost * 100D) / 100D;
			     
			     responseObj.put("source", origin);
			     responseObj.put("destination", destination);
			     responseObj.put("travelTime", timeText);
			     responseObj.put("estimatedFare", finalCost);
			     responseObj.put("responseCode", responseCode);
		     }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return responseObj;
	}

}
