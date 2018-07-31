package org.api.cabs.dao;

import org.api.cabs.model.Cabs;
import java.sql.*;
public class CabDAO {
	public Cabs getClosestCab(Float source_Lat, Float source_Long) {
		Cabs cab = new Cabs();
		try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String hostName = "cabsqlserv.database.windows.net";
	        String dbName = "cabs";
	        String user = "cabsqlserv@cabsqlserv";
	        String password = "muzzi@22";
	        String url = String.format("jdbc:sqlserver://%s:1433;database=%s;user=%s;password=%s;encrypt=true;hostNameInCertificate=*.database.windows.net;loginTimeout=30;", hostName, dbName, user, password);
	        Connection connection = null;
	        connection = DriverManager.getConnection(url);
            String schema = connection.getSchema();
            System.out.println("Successful connection - Schema: " + schema);

            System.out.println("Query data example:");
            System.out.println("=========================================");

            String selectSql = "SELECT TOP(1) cab.cab_id, driver_id,name,rating,driver_phone, color, model, is_active, regno, loc_lat, loc_long, (((loc_lat - "+ source_Lat +") * (loc_lat - "+ source_Lat +")) + ((loc_long - "+ source_Long +") * (loc_long - "+ source_Long +"))) AS delta FROM cab "
            		+"  LEFT JOIN driver ON cab.cab_id = driver.cab_id ORDER BY delta ASC;";
        	Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(selectSql);
    		while (rs.next()){	
            	System.out.println("Cab  ");
            	cab.setCab_id(rs.getInt("cab_id"));
				cab.setColor(rs.getString("color"));
				cab.setModel(rs.getString("model"));
				cab.setLoc_lat(rs.getFloat("loc_lat"));
				cab.setLoc_long(rs.getFloat("loc_long"));
				cab.setRegno(rs.getString("regno"));
				cab.setIsactive(rs.getBoolean("is_active"));
				cab.setDelta(rs.getFloat("delta"));
				cab.setDriver_id(rs.getInt("driver_id"));
				cab.setName(rs.getString("name"));
				cab.setRating(rs.getInt("rating"));
				cab.setPhone(rs.getInt("driver_phone"));
                System.out.println("Cab  "+cab.toString());
    		}
    		connection.close();
		}catch (Exception e) {
            e.printStackTrace();
        }
		return cab;
	}
}
