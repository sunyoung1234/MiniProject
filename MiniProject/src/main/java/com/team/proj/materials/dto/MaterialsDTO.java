package com.team.proj.materials.dto;

public class MaterialsDTO {
	
	private int materialNo;
	private String materialCategory;
	private String materialName;
	private double gasKg;
	private String materialImg;
	
	public MaterialsDTO() {
		super();
	}

	public MaterialsDTO(int materialNo, String materialCategory, String materialName, double gasKg,
			String materialImg) {
		super();
		this.materialNo = materialNo;
		this.materialCategory = materialCategory;
		this.materialName = materialName;
		this.gasKg = gasKg;
		this.materialImg = materialImg;
	}

	@Override
	public String toString() {
		return "MaterialsDTO [materialNo=" + materialNo + ", materialCategory=" + materialCategory + ", materialName="
				+ materialName + ", gasKg=" + gasKg + ", materialImg=" + materialImg + "]";
	}

	public int getMaterialNo() {
		return materialNo;
	}

	public void setMaterialNo(int materialNo) {
		this.materialNo = materialNo;
	}

	public String getMaterialCategory() {
		return materialCategory;
	}

	public void setMaterialCategory(String materialCategory) {
		this.materialCategory = materialCategory;
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

	public String getMaterialImg() {
		return materialImg;
	}

	public void setMaterialImg(String materialImg) {
		this.materialImg = materialImg;
	}
	
	
}
