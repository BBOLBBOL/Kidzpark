package com.kidzpark.kidzzone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kidzpark.kidzzone.domain.KidzzoneVo;
import com.kidzpark.kidzzone.mapper.KidzzoneMapper;
import com.kidzpark.paging.PagingVo;

@Controller
public class KidzzoneController {

	@Autowired
	private KidzzoneMapper kidzzoneMapper;

	@ResponseBody
	@RequestMapping(value = "/Kidzzone", method = RequestMethod.GET)
	public ModelAndView kidzzone(KidzzoneVo vo) {

		List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzone();

		ModelAndView mv = new ModelAndView();

		mv.addObject("selectkiddzone", selectkiddzone);

		mv.setViewName("kidzzone/kidzzone");

		ObjectMapper mapper = new ObjectMapper();

		String json = "";
		try {
			json = mapper.writeValueAsString(mv.getModel());
			System.out.println(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("json", json);
		
		System.out.println(json);

		return mv;

	}

	@RequestMapping("/Kidzzonelist")
	@ResponseBody
	public Map<String, Object> getKidzzonelist(KidzzoneVo vo, PagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();

		int total = kidzzoneMapper.countKiddzone(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzonelist(pg);
		
		System.out.println(pg);

		result.put("selectkiddzone", selectkiddzone);
		result.put("pg", pg);
		return result;
	}

	@RequestMapping("/KidzzoneSearch")
	@ResponseBody
	public ModelAndView KidzzoneSearch(KidzzoneVo vo, @RequestParam("searchOption") String searchOption,
			@RequestParam("kz_category") String kz_category, @RequestParam("kz_location") String kz_location,
			@RequestParam("searchKeyword") String searchKeyword) {

		if (kz_category.equals("all") && kz_location.equals("all")
				&& (searchOption.equals("all") || searchKeyword.equals(""))) {
			Map<String, Object> map = new HashMap<>();
			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzone();

			ModelAndView mv = new ModelAndView();

			mv.addObject("selectkiddzone", selectkiddzone);

			mv.setViewName("kidzzone/kidzzonesearch");

			ObjectMapper mapper = new ObjectMapper();

			String json = "";
			try {
				json = mapper.writeValueAsString(mv.getModel());
				System.out.println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("json", json);
			
			mv.addObject("map", map);

			System.out.println("전부");

			return mv;

		} else {

			Map<String, Object> map = new HashMap<>();
			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKiddzoneSearch(map);

			ModelAndView mv = new ModelAndView();

			mv.addObject("selectkiddzone", selectkiddzone);

			mv.setViewName("kidzzone/kidzzonesearch");
			
			mv.addObject("map", map);

			ObjectMapper mapper = new ObjectMapper();

			String json = "";
			try {
				json = mapper.writeValueAsString(mv.getModel());
				System.out.println(json);
			} catch (Exception e) {
				e.printStackTrace();
			}
			mv.addObject("json", json);

			System.out.println("검색");

			return mv;
		}
	}

	@RequestMapping("/KidzzoneSearchlist")
	@ResponseBody
	public Map<String, Object> getKidzzoneSearchlist(KidzzoneVo vo, PagingVo pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam("kz_category") String kz_category, @RequestParam("searchOption") String searchOption,
			@RequestParam("kz_location") String kz_location, @RequestParam("searchKeyword") String searchKeyword, Model model)
			throws Exception {
		
		if (kz_category.equals("all") && kz_location.equals("all")
				&& (searchOption.equals("all") || searchKeyword.equals(""))) {
			Map<String, Object> result = new HashMap<String, Object>();
			Map<String, Object> map = new HashMap<String, Object>();

			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);
			map.put("pg", pg);

			int total = kidzzoneMapper.countKiddzoneSearch1(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "4";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "4";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKidzzoneSearchlist1(map);

			result.put("selectkiddzone", selectkiddzone);
			result.put("pg", pg);
			model.addAttribute("selectkidzone", selectkiddzone);
			System.out.println(result);
			return result;
		} else {

			Map<String, Object> result = new HashMap<String, Object>();

			Map<String, Object> map = new HashMap<String, Object>();

			map.put("kz_location", kz_location);
			map.put("searchKeyword", searchKeyword);
			map.put("searchOption", searchOption);
			map.put("kz_category", kz_category);

			int total = kidzzoneMapper.countKiddzoneSearch2(map);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "4";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "4";
			}
			
			pg = new PagingVo(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			map.put("pg", pg);

			List<KidzzoneVo> selectkiddzone = kidzzoneMapper.selectKidzzoneSearchlist2(map);

			result.put("selectkiddzone", selectkiddzone);
			result.put("pg", pg);
			System.out.println("result : "+ result);
			return result;
		}

	}

}