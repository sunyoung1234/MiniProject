package com.team.proj.board.vo;

public class SearchVO {
    // �˻� �ɼ�
    private String searchOption;  // �˻� ���� (����: title, ����: content, ��ü��: company)
    private String searchWord;    // �˻���
    
    // ����¡ ���� ����
    private int pageNo = 1;          // ���� ������ ��ȣ
    private int rowSizePerPage = 5;  // �� ���������� ������ �Խñ� ��
    private int pageSize = 10;        // ������ ����Ʈ�� ������ ����
    private int boardCount;           // ��ü �Խñ� ��
    
    // ����¡ ����� ���� ����
    private int start;                // ���� �������� ���� �� ��ȣ
    private int end;                  // ���� ����	���� �� �� ��ȣ
    private int firstPage;            // ȭ�鿡 ǥ�õǴ� ������ ��ȣ�� ù ��° ����
    private int lastPage;             // ȭ�鿡 ǥ�õǴ� ������ ��ȣ�� ������ ����
    private int finalPage;            // ������ ������ ��ȣ

    // Getters and Setters
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

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    
    // ����¡ �޼ҵ�
    public void pageSetting() {
        // ��ü ������ �� ���
        finalPage = (int) Math.ceil((double) boardCount / rowSizePerPage);
        
        // ���� �������� ���� �� ��ȣ
        start = (pageNo - 1) * rowSizePerPage + 1;
        
        // ���� �������� �� �� ��ȣ
        end = start + rowSizePerPage - 1;
        
        // ���� �� �� ��ȣ�� ��ü �� ������ ũ��, �� �� ��ȣ�� ��ü �� ���� ����
        if (end > boardCount) {
            end = boardCount;
        }
        
        // ������ ����Ʈ�� ù ��° ������ ��ȣ
        firstPage = ((pageNo - 1) / pageSize) * pageSize + 1;
        
        // ������ ����Ʈ�� ������ ������ ��ȣ
        lastPage = firstPage + pageSize - 1;
        
        // ������ �������� ��ü ������ ������ ũ��, ������ �������� ��ü ������ ���� ����
        if (lastPage > finalPage) {
            lastPage = finalPage;
        }
    }
}


