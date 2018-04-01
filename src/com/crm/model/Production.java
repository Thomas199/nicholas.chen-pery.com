package com.crm.model;

/**
 * 产品信息
 */
public class Production {
	private int id;
	private String production_name;
	private String description;
	private String price;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduction_name() {
		return production_name;
	}
	public void setProduction_name(String production_name) {
		this.production_name = production_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
