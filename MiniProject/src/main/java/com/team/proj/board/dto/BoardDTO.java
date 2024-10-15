package com.team.proj.board.dto;

public class BoardDTO {
	   
    // material_estimate ���� �ʵ�
    private int orderNo;               // ��û��ȣ
    private String memId;              // ȸ�� ID
    private String materialNo;         // ���� ��ȣ
    private int materialVolume;        // ���� ����
    private String calcId;             // ��� ID
    private int calcNum;               // ��� ����
    private String orderTitle;         // ��û ����
    private String orderContent;       // ��û ����
    private String beforeAfter;        // ��/�� ����
    private String requestDate;          // ��û ��¥

    // order_board ���� �ʵ�
    private String feedbackYn;         // �ǵ�� ����
    private String delYn;              // �� ���� ����

    // Getter and Setter �߰�
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

    public String getMaterialNo() {
        return materialNo;
    }

    public void setMaterialNo(String materialNo) {
        this.materialNo = materialNo;
    }

    public int getMaterialVolume() {
        return materialVolume;
    }

    public void setMaterialVolume(int materialVolume) {
        this.materialVolume = materialVolume;
    }

    public String getCalcId() {
        return calcId;
    }

    public void setCalcId(String calcId) {
        this.calcId = calcId;
    }

    public int getCalcNum() {
        return calcNum;
    }

    public void setCalcNum(int calcNum) {
        this.calcNum = calcNum;
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

    public String getBeforeAfter() {
        return beforeAfter;
    }

    public void setBeforeAfter(String beforeAfter) {
        this.beforeAfter = beforeAfter;
    }
//    Date ���, String���� ����
    public String getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(String requestDate) {
        this.requestDate = requestDate;
    }

    // Getters and Setters for order_board fields
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