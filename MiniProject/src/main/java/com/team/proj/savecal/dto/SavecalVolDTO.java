package com.team.proj.savecal.dto;

public class SavecalVolDTO {
	private int materialVolume;
	private String materialImg;
	private String materialName;
	
	public SavecalVolDTO() {
		super();
	}

	public SavecalVolDTO(int materialVolume, String materialImg, String materialName) {
		super();
		this.materialVolume = materialVolume;
		this.materialImg = materialImg;
		this.materialName = materialName;
	}

	@Override
	public String toString() {
		return "SavecalVolDTO [materialVolume=" + materialVolume + ", materialImg=" + materialImg + ", materialName="
				+ materialName + "]";
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