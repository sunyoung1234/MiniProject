package com.team.proj.board.dto;

import java.util.Date;

public class BoardDTO {
	   
    // material_estimate 관련 필드
	private String boardId;			   // 게시글 id
    private int orderNo;               // 번호
    private String memId;              // 회원 ID
    private String calcId;             // 계산 ID
    private double calcResult;               // 계산 결과
    private String orderTitle;         // 요청 제목
    private String orderContent;       // 요청 내용
    private String requestDate;          // 요청 날짜
    private String feedbackYn;         // 피드백 여부
    private String delYn;              // 글 삭제 여부
    private String entpName;
    
	public BoardDTO() {
		super();
	}

	public BoardDTO(String boardId, int orderNo, String memId, String calcId, double calcResult, String orderTitle,
			String orderContent, String requestDate, String feedbackYn, String delYn, String entpName) {
		super();
		this.boardId = boardId;
		this.orderNo = orderNo;
		this.memId = memId;
		this.calcId = calcId;
		this.calcResult = calcResult;
		this.orderTitle = orderTitle;
		this.orderContent = orderContent;
		this.requestDate = requestDate;
		this.feedbackYn = feedbackYn;
		this.delYn = delYn;
		this.entpName = entpName;
	}

	@Override
	public String toString() {
		return "BoardDTO [boardId=" + boardId + ", orderNo=" + orderNo + ", memId=" + memId + ", calcId=" + calcId
				+ ", calcResult=" + calcResult + ", orderTitle=" + orderTitle + ", orderContent=" + orderContent
				+ ", requestDate=" + requestDate + ", feedbackYn=" + feedbackYn + ", delYn=" + delYn + ", entpName="
				+ entpName + "]";
	}

	public String getBoardId() {
		return boardId;
	}

	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getCalcId() {
		return calcId;
	}

	public void setCalcId(String calcId) {
		this.calcId = calcId;
	}

	public double getCalcResult() {
		return calcResult;
	}

	public void setCalcResult(double calcResult) {
		this.calcResult = calcResult;
	}

	public String getOrderTitle() {
		return orderTitle;
	}

	public void setOrderTitle(String orderTitle) {
		this.orderTitle = orderTitle;
	}

	public String getOrderContent() {
		return orderContent;
	}

	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public String getFeedbackYn() {
		return feedbackYn;
	}

	public void setFeedbackYn(String feedbackYn) {
		this.feedbackYn = feedbackYn;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getEntpName() {
		return entpName;
	}

	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}

	
	

	
	
    
}