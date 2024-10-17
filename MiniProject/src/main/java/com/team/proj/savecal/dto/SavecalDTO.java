package com.team.proj.savecal.dto;

public class SavecalDTO {
	
	private String calcId;
	private int materialNo;
	private int materialVolume;
	private String confirmYn;
	
	public SavecalDTO() {
		super();
	}

	public SavecalDTO(String calcId, int materialNo, int materialVolume, String confirmYn) {
		super();
		this.calcId = calcId;
		this.materialNo = materialNo;
		this.materialVolume = materialVolume;
		this.confirmYn = confirmYn;
	}

	@Override
	public String toString() {
		return "SavecalDTO [calcId=" + calcId + ", materialNo=" + materialNo + ", materialVolume=" + materialVolume
				+ ", confirmYn=" + confirmYn + "]";
	}

	public String getCalcId() {
		return calcId;
	}

	public void setCalcId(String calcId) {
		this.calcId = calcId;
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

	public String getConfirmYn() {
		return confirmYn;
	}

	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}

	

	
	
	
	
}
