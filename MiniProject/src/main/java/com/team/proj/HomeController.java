package com.team.proj;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.board.vo.SearchVO;
import com.team.proj.greenhouse.dto.GreenDTO;
import com.team.proj.greenhouse.service.GreenService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.member.service.MemberService;
import com.team.proj.point.dto.PointDTO;
import com.team.proj.point.service.PointService;
import com.team.proj.region.dto.RegionDTO;
import com.team.proj.region.service.RegionService;
import com.team.proj.reply.dto.ReplyDTO;
import com.team.proj.reply.service.ReplyService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	RegionService regionservice;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	GreenService greenService;
	
	@Autowired
	ReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	
	@RequestMapping("/")
	public String home(Model model, String regionCategory) {
		
		
		
		return "home";
	}
	
	@ResponseBody
	@PostMapping("/tableView")
	public List<RegionDTO> tableView(RegionDTO regionName, Model model) {
		
		System.out.println("지역이름" + regionName.getPointRegion());
		List<RegionDTO> regionDetail;
		if(regionName.getPointRegion() == null) {
			regionName.setPointRegion("강원");
			List<RegionDTO> regionList = regionservice.getCityPoint(regionName.getPointRegion());
			regionDetail = regionList;
			model.addAttribute("keyRegionPoint",regionList);
		}else {
			List<RegionDTO> regionList = regionservice.getCityPoint(regionName.getPointRegion());
			regionDetail = regionList;
			model.addAttribute("keyRegionPoint",regionList);
		}
		
		return regionDetail; 
	}
	
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model, SearchVO pageSearch) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String memId = login.getMemId();
		
		pageSearch.setMemId(memId);
		
	    int totalRowCount = boardService.getBoardCountById(pageSearch);
	    
	    pageSearch.setBoardCount(totalRowCount);
	    pageSearch.pageSetting();
	    
		 
		 model.addAttribute("member",login);
        List<BoardDTO> boardListById = boardService.getBoardListById(pageSearch);
        
	    model.addAttribute("pageSearch", pageSearch);
	    
	    
        if(boardListById.size()>0) {
        	model.addAttribute("boardListById", boardListById);
        }else {
        	model.addAttribute("noList","작성한 글이 없습니다.");
        }
        
        double replyResult = replyService.getReplyResult(memId);
        
        model.addAttribute("getReplyResult",replyResult);
        System.out.println(replyResult);
        
        double boardCalc = boardService.getCalcResult(memId);
        
        model.addAttribute("getBoardCalc",boardCalc);
		
        
		
		return "member/mypage";
	}

	
	

	@RequestMapping("/adminpage")
	public String adminpage(HttpSession session, Model model, SearchVO pageSearch) {
	    // 로그인 정보 가져오기
	    MemberDTO login = (MemberDTO) session.getAttribute("login");

	    // 로그인 정보가 없거나, 관리자가 아닐 경우 로그인 페이지로 되돌아가기
	    if (login == null || !"admin".equals(login.getMemId())) {
	        return "redirect:/loginView";
	    }

	    // 페이징
	    int totalRowCount = boardService.getBoardCount(pageSearch);
	    System.out.println(pageSearch);
	    pageSearch.setBoardCount(totalRowCount);
	    pageSearch.pageSetting();

	    // 게시글 목록 가져오기
	    List<BoardDTO> boardList = boardService.getBoardList(pageSearch);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("pageSearch", pageSearch);
	    model.addAttribute("member", login);
	    System.out.println(boardList);
	    // 회원 목록 가져오기
	    List<MemberDTO> memberList = memberService.getMemberList();
	    model.addAttribute("keyMemberList", memberList);
	    
	    double boardResultAll = boardService.getCalcResultAll();
	    
	    double replyResultAll = replyService.getReplyResultAll();
	    
	    System.out.println(boardResultAll);
	    System.out.println(replyResultAll);
	    
	    model.addAttribute("getBoardResultAll",boardResultAll);
	    model.addAttribute("getReplyResultAll",replyResultAll);
	    
	    

	    // adminpage 뷰로 이동
	    return "member/adminpage";
	}

	  @RequestMapping("/gasChartView")
	    public String gasChartView(Model model, String regionCategory) throws Exception, ProtocolException {
		  
		
			ArrayList<String> year = new ArrayList<>();
			ArrayList<Double> gas = new ArrayList<>();
			
			List<GreenDTO> greenList = greenService.getListGreen();
			
			for(GreenDTO pd : greenList) {
				System.out.println(pd.getYearMonth());
				year.add(pd.getYearMonth());
			}
			
			for(GreenDTO pd : greenList) {
				System.out.println(pd.getGas());
				gas.add(pd.getGas());
			}
			
			model.addAttribute("getGreenYear",year);
			model.addAttribute("getGreenGas",gas);
		  
	        return "chart/gasChartView"; // gasChartView.jsp로 이동
	    }

	    @RequestMapping("/cityChartView")
	    public String cityChartView(Model model, String regionCategory) throws Exception, ProtocolException {
	    	// 광역시도별
			ArrayList<Double> partList = new ArrayList<>();
			ArrayList<String> regionName = new ArrayList<>();
			ArrayList<String> name = new ArrayList<>();
			
			ArrayList<String> region = new ArrayList<>();
			ArrayList<Double> regionValue = new ArrayList<>();
			
			ArrayList<String> year = new ArrayList<>();
			ArrayList<Double> gas = new ArrayList<>();
			
			List<PointDTO> pointList = pointService.getPointList();
			
			System.out.println(pointList);
			
			model.addAttribute("keyPointList", pointList);
			
			for(PointDTO pd : pointList) {
				System.out.println(pd.getParticipation());
				partList.add(pd.getParticipation());
			}
			
			for(PointDTO pd : pointList) {
				System.out.println(pd.getParticipation());
				regionName.add(pd.getPointRegion());
			}
			
			
			
			String gangwon = "강원";
			List<RegionDTO> city = regionservice.getCityPoint(gangwon);
			model.addAttribute("keyGangwan",city);
			
			for(RegionDTO pd : city) {
				System.out.println(pd.getPointCity());
				region.add(pd.getPointCity());
			}
			
			for(RegionDTO pd : city) {
				System.out.println(pd.getCityParticipation());
				regionValue.add(pd.getCityParticipation());
			}
			
			// 광역시도별
			model.addAttribute("keyPartList",partList);
			model.addAttribute("keyRegionName",regionName);
			
			// 기초 단체별(강원)
			model.addAttribute("keyRegion",region);
			model.addAttribute("keyRegionValue",regionValue);
			
			
	    	
	        return "chart/cityChartView"; // cityChartView.jsp로 이동
	    }
	
	    @RequestMapping("/errPage")
	    public String errPage() {
	    	return "errPage";
	    }
	
	
	

}
