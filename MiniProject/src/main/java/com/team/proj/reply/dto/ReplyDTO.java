package com.team.proj.reply.dto;

public class ReplyDTO {
	private String replyId;
	private String boardId;
	private String replyContent;
	private String replyCalcId;
	private String replyDate;
	private double replyCalcResult;
	public ReplyDTO() {
		super();
	}
	
	
	public ReplyDTO(String replyId, String boardId, String replyContent, String replyCalcId, double replyCalcResult) {
		super();
		this.replyId = replyId;
		this.boardId = boardId;
		this.replyContent = replyContent;
		this.replyCalcId = replyCalcId;
		this.replyCalcResult = replyCalcResult;
	}


	public ReplyDTO(String replyId, String boardId, String replyContent, String replyCalcId, String replyDate,
			double replyCalcResult) {
		super();
		this.replyId = replyId;
		this.boardId = boardId;
		this.replyContent = replyContent;
		this.replyCalcId = replyCalcId;
		this.replyDate = replyDate;
		this.replyCalcResult = replyCalcResult;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyId=" + replyId + ", boardId=" + boardId + ", replyContent=" + replyContent
				+ ", replyCalcId=" + replyCalcId + ", replyDate=" + replyDate + ", replyCalcResult=" + replyCalcResult
				+ "]";
	}
	public String getReplyId() {
		return replyId;
	}
	public void setReplyId(String replyId) {
		this.replyId = replyId;
	}
	public String getBoardId() {
		return boardId;
	}
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyCalcId() {
		return replyCalcId;
	}
	public void setReplyCalcId(String replyCalcId) {
		this.replyCalcId = replyCalcId;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public double getReplyCalcResult() {
		return replyCalcResult;
	}
	public void setReplyCalcResult(double replyCalcResult) {
		this.replyCalcResult = replyCalcResult;
	}
	
	
	
}
