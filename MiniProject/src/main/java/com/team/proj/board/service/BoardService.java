package com.team.proj.board.service;

import com.team.proj.board.dao.BoardDAO;
import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.vo.SearchVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {

    private final BoardDAO boardDAO; // BoardDAO의 의존성 주입

    @Autowired
    public BoardService(BoardDAO boardDAO) { // 생성자 주입
        this.boardDAO = boardDAO;
    }

    public List<BoardDTO> getBoardList(SearchVO search) {
        return boardDAO.getBoardList(search);
    }

    public BoardDTO getBoard(int boardNo) {
        return boardDAO.getBoard(boardNo);
    }

    // 글 수정 메서드 제거		-- mapper 에서 처리
    // public int updateBoard(BoardDTO board) {
    //     return boardDAO.updateBoard(board);
    // }

    // 글 삭제 메서드 제거 		-- mapper 에서 처리
    // public int deleteBoard(int no) {
    //     return boardDAO.deleteBoard(no);
    // }

    public int getBoardCount(SearchVO search) {
        return boardDAO.getBoardCount(search);
    }
}
