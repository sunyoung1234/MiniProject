package com.team.proj.region.dto;

public class RegionDTO {

	private String pointRegion;
	private String pointCity;
	private String pointCityApartmentAll; /*POINT_CITY_APARTMENT_ALL*/
	private String pointCityApartmentJoin;
	private double cityParticipation;
	
	public RegionDTO() {
		super();
	}

	public RegionDTO(String pointRegion, String pointCity, String pointCityApartmentAll, String pointCityApartmentJoin,
			double cityParticipation) {
		super();
		this.pointRegion = pointRegion;
		this.pointCity = pointCity;
		this.pointCityApartmentAll = pointCityApartmentAll;
		this.pointCityApartmentJoin = pointCityApartmentJoin;
		this.cityParticipation = cityParticipation;
	}

	@Override
	public String toString() {
		return "RegionDTO [pointRegion=" + pointRegion + ", pointCity=" + pointCity + ", pointCityApartmentAll="
				+ pointCityApartmentAll + ", pointCityApartmentJoin=" + pointCityApartmentJoin + ", cityParticipation="
				+ cityParticipation + "]";
	}

	public String getPointRegion() {
		return pointRegion;
	}

	public void setPointRegion(String pointRegion) {
		this.pointRegion = pointRegion;
	}

	public String getPointCity() {
		return pointCity;
	}

	public void setPointCity(String pointCity) {
		this.pointCity = pointCity;
	}

	public String getPointCityApartmentAll() {
		return pointCityApartmentAll;
	}

	public void setPointCityApartmentAll(String pointCityApartmentAll) {
		this.pointCityApartmentAll = pointCityApartmentAll;
	}

	public String getPointCityApartmentJoin() {
		return pointCityApartmentJoin;
	}

	public void setPointCityApartmentJoin(String pointCityApartmentJoin) {
		this.pointCityApartmentJoin = pointCityApartmentJoin;
	}

	public double getCityParticipation() {
		return cityParticipation;
	}

	public void setCityParticipation(double cityParticipation) {
		this.cityParticipation = cityParticipation;
	}

	

	

	
	
	
	
	
}
