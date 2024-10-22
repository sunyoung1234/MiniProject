package com.team.proj.greenhouse.dto;

public class GreenDTO {
	
	private String yearMonth;
	private int gas;
	public GreenDTO(String yearMonth, int gas) {
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
	public int getGas() {
		return gas;
	}
	public void setGas(int gas) {
		this.gas = gas;
	}
	
	

}
