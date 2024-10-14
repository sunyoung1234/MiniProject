package com.team.proj;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.proj.point.dto.PointDTO;
import com.team.proj.point.service.PointService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PointService pointService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		List<PointDTO> pointList = pointService.getPointList();
		
		System.out.println(pointList);
		model.addAttribute("keyPointList", pointList);
//		for(PointDTO pd of pointList) {
//			pd.getParticipation()
//		}
		
		return "home";
	}
	
}
