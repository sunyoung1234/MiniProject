package com.team.proj.member.dto;

public class MemberDTO {

	private String memId;
	private String memPw;
	private String memEmail;
	private String memPhone;
	private String entpName;
	private String memProfile;
	private int memLevel;
	
	public MemberDTO() {
		super();
	}
	
	

	public MemberDTO(String memId, String memPw, String memEmail, String memPhone, String entpName, String memProfile) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.entpName = entpName;
		this.memProfile = memProfile;
	}



	public MemberDTO(String memId, String memPw, String memEmail, String memPhone, String entpName, String memProfile,
			int memLevel) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.entpName = entpName;
		this.memProfile = memProfile;
		this.memLevel = memLevel;
	}

	@Override
	public String toString() {
		return "MemberDTO [memId=" + memId + ", memPw=" + memPw + ", memEmail=" + memEmail + ", memPhone=" + memPhone
				+ ", entpName=" + entpName + ", memProfile=" + memProfile + ", memLevel=" + memLevel + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getEntpName() {
		return entpName;
	}

	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}

	public String getMemProfile() {
		return memProfile;
	}

	public void setMemProfile(String memProfile) {
		this.memProfile = memProfile;
	}

	public int getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}
	
	
	
}
