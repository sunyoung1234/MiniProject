package com.team.proj.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team.proj.member.dao.IMemberDAO;
import com.team.proj.member.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	IMemberDAO dao;
	
	public int registMember(MemberDTO mem) {
		return dao.registMember(mem);
	}
	
	public MemberDTO loginMember(MemberDTO member) {
		return dao.loginMember(member);
	}
	
	public int updateMember(MemberDTO member) { 
		return dao.updateMember(member);
	}
	
	// ȸ�� ��� �ҷ����� �޼ҵ�
	public List<MemberDTO> getMemberList(){
		List<MemberDTO> result = dao.getMemberList();
		return result;
	}
	
	public int deleteMember(String memId) {
		int result = dao.deleteMember(memId);
		return result;
	}
	
}
