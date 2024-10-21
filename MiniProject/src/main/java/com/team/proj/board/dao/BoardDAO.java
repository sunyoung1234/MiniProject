package com.team.proj.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.vo.SearchVO;

@Mapper
@Repository
public interface BoardDAO {

    // �Խñ� ��� ��������(SELECT)
    List<BoardDTO> getBoardList(SearchVO search);    
    
    // �Խñ� ������ ��������(SELECT, WHERE)
    BoardDTO getBoard(int boardNo);
    
    // �۾��� (INSERT) �޼��� ����			--- mapper���� ó��
    // int insertBoard(BoardDTO board);
   
    // �ۼ��� (UPDATE) �޼��� ����			--- mapper���� ó��
    // int updateBoard(BoardDTO board);
   
    // �ۻ��� (UPDATE) �޼��� ����			--- mapper���� ó��
    // int deleteBoard(int no);
   
    // �Խñ� �� ��������
    int getBoardCount(SearchVO search);
    
    int boardWriteDo(BoardDTO board);
    
    List<BoardDTO> getBoardListById(String memId);
    
    List<BoardDTO> getBoardListByIdConfirm(BoardDTO check);
    
    BoardDTO getBoardByNo(int boardNo);
    
    int updateFeedbackYN(int boardNo);
}
