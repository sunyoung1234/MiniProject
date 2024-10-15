package com.team.proj.board.vo;

public class SearchVO {
    private String searchOption;  // 검색 종류(제목 title, 내용 content, 작성자 name)
    private String searchWord;    // 검색어
    private int pageNo = 1;       // 현재 페이지 번호
    private int rowSizePerPage = 10; // 한 페이지에서 보여줄 게시글의 수
    private int start;            // 현재 페이지의 시작 글 번호
    private int end;              // 현재 페이지의 끝 글 번호
    private int firstPage;        // 화면에 그려지는 페이지 번호의 첫번째 숫자
    private int lastPage;         // 화면에 그려지는 페이지 번호의 마지막 숫자
    private int boardCount;       // 전체 게시글의 수
    private int finalPage;        // 마지막 페이지의 번호

    // getters and setters
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

    public int getBoardCount() {
        return boardCount;
    }

    public void setBoardCount(int boardCount) {
        this.boardCount = boardCount;
    }

    public int getFinalPage() {
        return finalPage;
    }

    public void setFinalPage(int finalPage) {
        this.finalPage = finalPage;
    }
}