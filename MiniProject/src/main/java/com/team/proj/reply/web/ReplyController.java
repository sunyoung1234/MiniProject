package com.team.proj.reply.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.reply.dto.ReplyDTO;
import com.team.proj.reply.service.ReplyService;
import com.team.proj.savesubcal.service.SaveSubcalService;

@Controller
public class ReplyController {

	@Autowired
	ReplyService replyService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	SaveSubcalService subcalService;
	
	@ResponseBody
	@RequestMapping("/replyWrite")
	public String replyWriteDo(@RequestBody Map<String, Object> data, HttpSession session) {
		
		 ReplyDTO reply = new ReplyDTO();
		 
		 String sscId = (String) data.get("id");
		 String boardNo = (String) data.get("b_no");
		 String result = (String) data.get("result");
		 String content = (String) data.get("content");
		 String after = (String) data.get("after"); 
		 
		 
		 int bNo = Integer.parseInt(boardNo);
		 
		 BoardDTO board = boardService.getBoardByNo(bNo);
		 String memId = board.getMemId();
		 
		 double r_result = Double.parseDouble(result);
		 double r_after = Double.parseDouble(after);
		 
		 reply.setReplyCalcId(sscId);
		 reply.setBoardId(boardNo);
		 reply.setReplyCalcResult(r_result);
		 reply.setReplyContent(content);
		 reply.setMemId(memId);
		 reply.setAfterCalcResult(r_after);
		 
		 System.out.println(sscId);
		 
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		 String replyId = sdf.format(date);
		 replyId += "admin";
		 reply.setReplyId(replyId);
		 
		 System.out.println(reply);
		 
		 replyService.writeReply(reply);
		 
		 boardService.updateFeedbackYN(bNo);
		 
		 subcalService.updateSubCal(sscId + "admin");
		 
		 subcalService.deleteSubCal();
		 
		
		return "board/boardAdminView";
	}
}
