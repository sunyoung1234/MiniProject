package com.team.proj.board.service;

import com.team.proj.board.dao.BoardDAO;
import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    private final BoardDAO boardDAO; // BoardDAO�� ������ ����

    @Autowired
    public BoardService(BoardDAO boardDAO) { // ������ ����
        this.boardDAO = boardDAO;
    }

    public List<BoardDTO> getBoardList(SearchVO search) {
        return boardDAO.getBoardList(search);
    }

    public BoardDTO getBoard(int boardNo) {
        return boardDAO.getBoard(boardNo);
    }

    // �� ���� �޼��� ����		-- mapper ���� ó��
    // public int updateBoard(BoardDTO board) {
    //     return boardDAO.updateBoard(board);
    // }

    // �� ���� �޼��� ���� 		-- mapper ���� ó��
    // public int deleteBoard(int no) {
    //     return boardDAO.deleteBoard(no);
    // }

    public int getBoardCount(SearchVO search) {
        return boardDAO.getBoardCount(search);
    }
}
