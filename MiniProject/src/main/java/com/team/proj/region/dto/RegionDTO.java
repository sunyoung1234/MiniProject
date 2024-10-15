package com.team.proj.region.dto;

public class RegionDTO {

	private String pointRegoin;
	private String pointCity;
	private int pointCityApartmentAll;
	private int pointCityApartmentJoin;
	private double cityParticipation;
	
	public RegionDTO() {
		super();
	}

	public RegionDTO(String pointRegoin, String pointCity, int pointCityApartmentAll, int pointCityApartmentJoin,
			double cityParticipation) {
		super();
		this.pointRegoin = pointRegoin;
		this.pointCity = pointCity;
		this.pointCityApartmentAll = pointCityApartmentAll;
		this.pointCityApartmentJoin = pointCityApartmentJoin;
		this.cityParticipation = cityParticipation;
	}

	@Override
	public String toString() {
		return "RegionDTO [pointRegoin=" + pointRegoin + ", pointCity=" + pointCity + ", pointCityApartmentAll="
				+ pointCityApartmentAll + ", pointCityApartmentJoin=" + pointCityApartmentJoin + ", cityParticipation="
				+ cityParticipation + "]";
	}

	public String getPointRegoin() {
		return pointRegoin;
	}

	public void setPointRegoin(String pointRegoin) {
		this.pointRegoin = pointRegoin;
	}

	public String getPointCity() {
		return pointCity;
	}

	public void setPointCity(String pointCity) {
		this.pointCity = pointCity;
	}

	public int getPointCityApartmentAll() {
		return pointCityApartmentAll;
	}

	public void setPointCityApartmentAll(int pointCityApartmentAll) {
		this.pointCityApartmentAll = pointCityApartmentAll;
	}

	public int getPointCityApartmentJoin() {
		return pointCityApartmentJoin;
	}

	public void setPointCityApartmentJoin(int pointCityApartmentJoin) {
		this.pointCityApartmentJoin = pointCityApartmentJoin;
	}

	public double getCityParticipation() {
		return cityParticipation;
	}

	public void setCityParticipation(double cityParticipation) {
		this.cityParticipation = cityParticipation;
	}
	
	
	
	
}
