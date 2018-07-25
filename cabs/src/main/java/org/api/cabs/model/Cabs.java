package org.api.cabs.model;

public class Cabs {
	private int cab_id;
	private String color;
	private String model;
	private String regno;
	private Float loc_lat;
	private Float loc_long;
	private Boolean isactive;
	private Float delta;
	private String name;
	private int phone;
	private int rating;
	private int driver_id;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public int getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(int driver_id) {
		this.driver_id = driver_id;
	}
	public Float getDelta() {
		return delta;
	}
	public void setDelta(Float delta) {
		this.delta = delta;
	}
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
	public Float getLoc_lat() {
		return loc_lat;
	}
	public void setLoc_lat(Float loc_lat) {
		this.loc_lat = loc_lat;
	}
	public Float getLoc_long() {
		return loc_long;
	}
	public void setLoc_long(Float loc_long) {
		this.loc_long = loc_long;
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
				+ ", loc_lat=" + loc_lat + ", loc_long=" + loc_long + ", isactive=" + isactive
				+ "]";
	}
	
}
