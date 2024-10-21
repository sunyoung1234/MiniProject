package com.team.proj.substitute.dto;

public class SubByMatNoDTO {
	private String subName;
	private int matNo;
	public SubByMatNoDTO() {
		super();
	}
	public SubByMatNoDTO(String subName, int matNo) {
		super();
		this.subName = subName;
		this.matNo = matNo;
	}
	@Override
	public String toString() {
		return "SubByMatNoDTO [subName=" + subName + ", matNo=" + matNo + "]";
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public int getMatNo() {
		return matNo;
	}
	public void setMatNo(int matNo) {
		this.matNo = matNo;
	}
	
	
}
