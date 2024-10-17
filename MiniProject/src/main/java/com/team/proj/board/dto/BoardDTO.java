package com.team.proj.board.dto;

import java.util.Date;

public class BoardDTO {
	   
    // material_estimate ���� �ʵ�
    private int orderNo;               // ��û��ȣ
    private String memId;              // ȸ�� ID
    private String calcId;             // ��� ID
    private double calcResult;               // ��� ���
    private String orderTitle;         // ��û ����
    private String orderContent;       // ��û ����
    private Date requestDate;          // ��û ��¥
    private String feedbackYn;         // �ǵ�� ����
    private String delYn;              // �� ���� ����
    
	public BoardDTO() {
		super();
	}

	public BoardDTO(int orderNo, String memId, String calcId, double calcResult, String orderTitle, String orderContent,
			Date requestDate, String feedbackYn, String delYn) {
		super();
		this.orderNo = orderNo;
		this.memId = memId;
		this.calcId = calcId;
		this.calcResult = calcResult;
		this.orderTitle = orderTitle;
		this.orderContent = orderContent;
		this.requestDate = requestDate;
		this.feedbackYn = feedbackYn;
		this.delYn = delYn;
	}

	@Override
	public String toString() {
		return "BoardDTO [orderNo=" + orderNo + ", memId=" + memId + ", calcId=" + calcId + ", calcResult=" + calcResult
				+ ", orderTitle=" + orderTitle + ", orderContent=" + orderContent + ", requestDate=" + requestDate
				+ ", feedbackYn=" + feedbackYn + ", delYn=" + delYn + "]";
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

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
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

	
    
}