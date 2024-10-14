package com.team.proj.point.dto;

public class PointDTO {
	
	private String pointRegion;			/* ���� �̸� */
	private String pointApartmentAll;		/* ������ */
	private String pointApartmentJoin;		/* ���� ������ */
	private double participation;		/* ������ */
	
	
	public PointDTO() {
		super();
	}


	public PointDTO(String pointRegion, String pointApartmentAll, String pointApartmentJoin, double participation) {
		super();
		this.pointRegion = pointRegion;
		this.pointApartmentAll = pointApartmentAll;
		this.pointApartmentJoin = pointApartmentJoin;
		this.participation = participation;
	}


	@Override
	public String toString() {
		return "PointDTO [pointRegion=" + pointRegion + ", pointApartmentAll=" + pointApartmentAll
				+ ", pointApartmentJoin=" + pointApartmentJoin + ", participation=" + participation + "]";
	}


	public String getPointRegion() {
		return pointRegion;
	}


	public void setPointRegion(String pointRegion) {
		this.pointRegion = pointRegion;
	}


	public String getPointApartmentAll() {
		return pointApartmentAll;
	}


	public void setPointApartmentAll(String pointApartmentAll) {
		this.pointApartmentAll = pointApartmentAll;
	}


	public String getPointApartmentJoin() {
		return pointApartmentJoin;
	}


	public void setPointApartmentJoin(String pointApartmentJoin) {
		this.pointApartmentJoin = pointApartmentJoin;
	}


	public double getParticipation() {
		return participation;
	}


	public void setParticipation(double participation) {
		this.participation = participation;
	}


	
	
	
	
	
	
	
	

}
