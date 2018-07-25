package org.api.cabs.model;

public class Cabs {
	private int cab_id;
	private String color;
	private String model;
	private String regno;
	private String location_lat;
	private String location_long;
	private Boolean isactive;
	public int getCab_id() {
		return cab_id;
	}
	public void setCab_id(int cab_id) {
		this.cab_id = cab_id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getRegno() {
		return regno;
	}
	public void setRegno(String regno) {
		this.regno = regno;
	}
	public String getLocation_lat() {
		return location_lat;
	}
	public void setLocation_lat(String location_lat) {
		this.location_lat = location_lat;
	}
	public String getLocation_long() {
		return location_long;
	}
	public void setLocation_long(String location_long) {
		this.location_long = location_long;
	}
	public Boolean getIsactive() {
		return isactive;
	}
	public void setIsactive(Boolean isactive) {
		this.isactive = isactive;
	}
	
	@Override
	public String toString() {
		return "Cabs [cab_id=" + cab_id + ", color=" + color + ", model=" + model + ", regno=" + regno
				+ ", location_lat=" + location_lat + ", location_long=" + location_long + ", isactive=" + isactive
				+ "]";
	}
	
}
