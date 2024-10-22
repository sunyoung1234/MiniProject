package com.team.proj.savecal.dto;

public class SavecalMatDTO {
	
	private int materialNo;
	private int materialVolume;
	private String materialImg;
	private String materialName;
	private double gasKg;
	
	public SavecalMatDTO() {
		super();
	}
	public SavecalMatDTO(int materialNo, int materialVolume, String materialImg, String materialName, double gasKg) {
		super();
		this.materialNo = materialNo;
		this.materialVolume = materialVolume;
		this.materialImg = materialImg;
		this.materialName = materialName;
		this.gasKg = gasKg;
	}
	@Override
	public String toString() {
		return "SavecalMatList [materialNo=" + materialNo + ", materialVolume=" + materialVolume + ", materialImg="
				+ materialImg + ", materialName=" + materialName + ", gasKg=" + gasKg + "]";
	}
	public int getMaterialNo() {
		return materialNo;
	}
	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}
	public int getMaterialVolume() {
		return materialVolume;
	}
	public void setMaterialVolume(int materialVolume) {
		this.materialVolume = materialVolume;
	}
	public String getMaterialImg() {
		return materialImg;
	}
	public void setMaterialImg(String materialImg) {
		this.materialImg = materialImg;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public double getGasKg() {
		return gasKg;
	}
	public void setGasKg(double gasKg) {
		this.gasKg = gasKg;
	}
	
	
	
	
}
