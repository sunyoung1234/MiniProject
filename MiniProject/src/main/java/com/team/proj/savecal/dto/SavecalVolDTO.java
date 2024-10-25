package com.team.proj.savecal.dto;

public class SavecalVolDTO {
	private int materialNo;
	private int materialVolume;
	private String materialImg;
	private String materialName;
	
	public SavecalVolDTO() {
		super();
	}

	public SavecalVolDTO(int materialNo, int materialVolume, String materialImg, String materialName) {
		super();
		this.materialNo = materialNo;
		this.materialVolume = materialVolume;
		this.materialImg = materialImg;
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "SavecalVolDTO [materialNo=" + materialNo + ", materialVolume=" + materialVolume + ", materialImg="
				+ materialImg + ", materialName=" + materialName + "]";
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

	

	
	
	
}