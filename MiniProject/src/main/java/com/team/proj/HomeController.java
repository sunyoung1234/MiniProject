package com.team.proj;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.point.dto.PointDTO;
import com.team.proj.point.service.PointService;
import com.team.proj.region.dto.RegionDTO;
import com.team.proj.region.service.RegionService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	RegionService regionservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping("/")
	public String home(Model model, String regionCategory) {
		
		ArrayList<Double> partList = new ArrayList<>();
		ArrayList<String> regionName = new ArrayList<>();
		ArrayList<String> name = new ArrayList<>();
		
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
		
		String gangwan = "강원";
		List<RegionDTO> city = regionservice.getCityPoint(gangwan);
		model.addAttribute("keyGangwan",city);
		
		
		model.addAttribute("keyPartList",partList);
		model.addAttribute("keyRegionName",regionName);
		
		return "home";
	}
	
	@ResponseBody
	@PostMapping("/tableView")
	public List<RegionDTO> tableView(RegionDTO regionName, Model model) {
		
		System.out.println("지역이름" + regionName.getPointRegion());
		List<RegionDTO> absd;
		if(regionName.getPointRegion() == null) {
			regionName.setPointRegion("강원");
			List<RegionDTO> regionList = regionservice.getCityPoint(regionName.getPointRegion());
			absd = regionList;
			model.addAttribute("keyRegionPoint",regionList);
		}else {
			List<RegionDTO> regionList = regionservice.getCityPoint(regionName.getPointRegion());
			absd = regionList;
			model.addAttribute("keyRegionPoint",regionList);
		}

		
		
		String resp = "success";
		System.out.println(resp);
		
		return absd; 
	}
	
	
}
