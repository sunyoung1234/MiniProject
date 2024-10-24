package com.team.proj.savesubcal.dto;

public class SaveSubcalDTO {
	
	private String subcalId;
	private String boardId;
	private int matNo;
	private int subNo;
	private double subVol;
	private double differentCo;
	private String confirmYn;
	
	public SaveSubcalDTO() {
		super();
	}

	public SaveSubcalDTO(String subcalId, String boardId, int matNo, int subNo, double subVol, double differentCo,
			String confirmYn) {
		super();
		this.subcalId = subcalId;
		this.boardId = boardId;
		this.matNo = matNo;
		this.subNo = subNo;
		this.subVol = subVol;
		this.differentCo = differentCo;
		this.confirmYn = confirmYn;
	}

	@Override
	public String toString() {
		return "SaveSubcalDTO [subcalId=" + subcalId + ", boardId=" + boardId + ", matNo=" + matNo + ", subNo=" + subNo
				+ ", subVol=" + subVol + ", differentCo=" + differentCo + ", confirmYn=" + confirmYn + "]";
	}

	public String getSubcalId() {
		return subcalId;
	}

	public void setSubcalId(String subcalId) {
		this.subcalId = subcalId;
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
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

	public double getSubVol() {
		return subVol;
	}

	public void setSubVol(double subVol) {
		this.subVol = subVol;
	}

	public double getDifferentCo() {
		return differentCo;
	}

	public void setDifferentCo(double differentCo) {
		this.differentCo = differentCo;
	}

	public String getConfirmYn() {
		return confirmYn;
	}

	public void setConfirmYn(String confirmYn) {
		this.confirmYn = confirmYn;
	}
	
	
	
	
	
	
}
