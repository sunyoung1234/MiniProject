package com.team.proj.substitute.dto;

public class SubJoinDTO {
	private int matNo;
	private int subNo;
	private String subName;
	private String subImg;
	private double gasKg;
	public SubJoinDTO() {
		super();
	}
	public SubJoinDTO(int matNo, int subNo, String subName, String subImg, double gasKg) {
		super();
		this.matNo = matNo;
		this.subNo = subNo;
		this.subName = subName;
		this.subImg = subImg;
		this.gasKg = gasKg;
	}
	@Override
	public String toString() {
		return "SubJoinDTO [matNo=" + matNo + ", subNo=" + subNo + ", subName=" + subName + ", subImg=" + subImg
				+ ", gasKg=" + gasKg + "]";
	}
	public int getMatNo() {
		return matNo;
	}
	public void setMatNo(int matNo) {
		this.matNo = matNo;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubImg() {
		return subImg;
	}
	public void setSubImg(String subImg) {
		this.subImg = subImg;
	}
	public double getGasKg() {
		return gasKg;
	}
	public void setGasKg(double gasKg) {
		this.gasKg = gasKg;
	}
	
	
}
