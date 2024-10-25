package com.team.proj.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.vo.SearchVO;

@Mapper
@Repository
public interface BoardDAO {

    // 게시글 목록 가져오기(SELECT)
    List<BoardDTO> getBoardList(SearchVO search);    
    
    // 게시글 상세정보 가져오기(SELECT, WHERE)
    BoardDTO getBoard(int boardNo);
    
    // 게시글 수 가져오기
    int getBoardCount(SearchVO search);
    
    int boardWriteDo(BoardDTO board);
    
    List<BoardDTO> getBoardListById(SearchVO search);
    
    List<BoardDTO> getBoardListByIdConfirm(BoardDTO check);
    
    BoardDTO getBoardByNo(int boardNo);
    
    int updateFeedbackYN(int boardNo);
    
    int getBoardCountById(SearchVO search);
    
    double getCalcResult(String memId);
    
    double getCalcResultAll();
    
    int deleteUpdateBoard(String memId);
}
