package com.team.proj.board.dto;

public class BoardDTO {
	   
    // material_estimate 관련 필드
    private int orderNo;               // 요청번호
    private String memId;              // 회원 ID
    private String materialNo;         // 자재 번호
    private int materialVolume;        // 자재 수량
    private String calcId;             // 계산 ID
    private int calcNum;               // 계산 수량
    private String orderTitle;         // 요청 제목
    private String orderContent;       // 요청 내용
    private String beforeAfter;        // 전/후 상태
    private String requestDate;          // 요청 날짜

    // order_board 관련 필드
    private String feedbackYn;         // 피드백 여부
    private String delYn;              // 글 삭제 여부

    // Getter and Setter 추가
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
//    Date 대신, String으로 세팅
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