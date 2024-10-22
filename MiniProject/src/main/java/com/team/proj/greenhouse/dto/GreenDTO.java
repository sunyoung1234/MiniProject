package com.team.proj.greenhouse.dto;

public class GreenDTO {
	
	private String yearMonth;
	private double gas;
	public GreenDTO(String yearMonth, double gas) {
		super();
		this.yearMonth = yearMonth;
		this.gas = gas;
	}
	public GreenDTO() {
		super();
	}
	@Override
	public String toString() {
		return "GreenDTO [yearMonth=" + yearMonth + ", gas=" + gas + "]";
	}
	public String getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}
	public double getGas() {
		return gas;
	}
	public void setGas(double gas) {
		this.gas = gas;
	}
	
	
	
	
	

}
