package com.team.proj.board.vo;

public class SearchVO {
	
	private String feedbackYn;
    // 검색 옵션
    private String searchOption;  // 검색 종류 (제목: title, 내용: content, 업체명: company)
    private String searchWord;    // 검색어
    
    // 페이징 관련 변수
    private int pageNo = 1;          // 현재 페이지 번호
    private int rowSizePerPage = 5;  // 한 페이지에서 보여줄 게시글 수
    private int pageSize = 10;        // 페이지 리스트의 페이지 개수
    private int boardCount;           // 전체 게시글 수
    
    // 페이징 계산을 위한 변수
    private int start;                // 현재 페이지의 시작 글 번호
    private int end;                  // 현재 페이	지의 끝 글 번호
    private int firstPage;            // 화면에 표시되는 페이지 번호의 첫 번째 숫자
    private int lastPage;             // 화면에 표시되는 페이지 번호의 마지막 숫자
    private int finalPage;            // 마지막 페이지 번호
    
    // 페이징 메소드
    public void pageSetting() {
        // 전체 페이지 수 계산
        finalPage = (int) Math.ceil((double) boardCount / rowSizePerPage);
        
        // 현재 페이지의 시작 글 번호
        start = (pageNo - 1) * rowSizePerPage + 1;
        
        // 현재 페이지의 끝 글 번호
        end = start + rowSizePerPage - 1;
        
        // 만약 끝 글 번호가 전체 글 수보다 크면, 끝 글 번호를 전체 글 수로 설정
        if (end > boardCount) {
            end = boardCount;
        }
        
        // 페이지 리스트의 첫 번째 페이지 번호
        firstPage = ((pageNo - 1) / pageSize) * pageSize + 1;
        
        // 페이지 리스트의 마지막 페이지 번호
        lastPage = firstPage + pageSize - 1;
        
        // 마지막 페이지가 전체 페이지 수보다 크면, 마지막 페이지를 전체 페이지 수로 설정
        if (lastPage > finalPage) {
            lastPage = finalPage;
        }
    }

	public SearchVO(String feedbackYn, String searchOption, String searchWord, int pageNo, int rowSizePerPage,
			int pageSize, int boardCount, int start, int end, int firstPage, int lastPage, int finalPage) {
		super();
		this.feedbackYn = feedbackYn;
		this.searchOption = searchOption;
		this.searchWord = searchWord;
		this.pageNo = pageNo;
		this.rowSizePerPage = rowSizePerPage;
		this.pageSize = pageSize;
		this.boardCount = boardCount;
		this.start = start;
		this.end = end;
		this.firstPage = firstPage;
		this.lastPage = lastPage;
		this.finalPage = finalPage;
	}


	public SearchVO() {
		super();
	}

	public String getFeedbackYn() {
		return feedbackYn;
	}

	public void setFeedbackYn(String feedbackYn) {
		this.feedbackYn = feedbackYn;
	}

	public String getSearchOption() {
		return searchOption;
	}

	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRowSizePerPage() {
		return rowSizePerPage;
	}

	public void setRowSizePerPage(int rowSizePerPage) {
		this.rowSizePerPage = rowSizePerPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getFinalPage() {
		return finalPage;
	}

	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}

	@Override
	public String toString() {
		return "SearchVO [feedbackYn=" + feedbackYn + ", searchOption=" + searchOption + ", searchWord=" + searchWord
				+ ", pageNo=" + pageNo + ", rowSizePerPage=" + rowSizePerPage + ", pageSize=" + pageSize
				+ ", boardCount=" + boardCount + ", start=" + start + ", end=" + end + ", firstPage=" + firstPage
				+ ", lastPage=" + lastPage + ", finalPage=" + finalPage + "]";
	}

	
    
    
}


