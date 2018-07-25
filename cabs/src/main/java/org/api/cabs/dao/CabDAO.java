package org.api.cabs.dao;

import org.api.cabs.model.Cabs;
import java.sql.*;
public class CabDAO {
	public Cabs getCab(int cab_id) {
		Cabs cab = new Cabs();
		try{
//			Class.forName("com.mysql.jdbc.Driver");
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

                // Create and execute a SELECT SQL statement.
                String selectSql = "SELECT * FROM cab WHERE cab_id="+ cab_id;
                try (Statement statement = connection.createStatement();
                        ResultSet rs = statement.executeQuery(selectSql)) {

                            // Print results from select statement
                            System.out.println("Top 20 categories:");
                            while (rs.next())
                            {	
                            	System.out.println("Cab  ");
                            	cab.setCab_id(rs.getInt("cab_id"));
                				cab.setColor(rs.getString("color"));
                				cab.setModel(rs.getString("model"));
                				cab.setLocation_lat(rs.getString("location_lat"));
                				cab.setLocation_long(rs.getString("location_long"));
                				cab.setRegno(rs.getString("regno"));
                				cab.setIsactive(rs.getBoolean("isactive"));

                                //System.out.println(resultSet.getString(1) + " + resultSet.getString(2));
                            }
                     connection.close();
                    }                   
            }
            catch (Exception e) {
                    e.printStackTrace();
            }
			/*Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cab", "root", "admin@123");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from cabs where cab_id="+cab_id+";");
			if(rs.next()){
				cab.setCab_id(rs.getInt("cab_id"));
				cab.setDriver_name(rs.getString("driver_name"));
				cab.setCab_model(rs.getString("cab_model"));
				cab.setCab_color(rs.getString("cab_color"));
				cab.setIsactive(rs.getBoolean("isactive"));
				cab.setDriver_rating(rs.getInt("driver_rating"));
				cab.setDriver_phone(rs.getLong("driver_phone"));
				cab.setCab_location(rs.getString("cab_location"));
				cab.setCab_regno(rs.getString("cab_regno"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		/*
		cab.setCab_id(1);
		cab.setDriver_name("Jack");
		cab.setCab_model("BMW 320d");
		cab.setCab_color("black");
		cab.setIsactive(true);
		cab.setDriver_rating(5);
		cab.setDriver_phone(Long.parseLong("0834266686"));
		cab.setCab_location("Dublin 2");
		cab.setCab_regno("12-D-122");
		*/
		return cab;
	}
}
