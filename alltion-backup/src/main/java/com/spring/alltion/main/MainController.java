package com.spring.alltion.main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.alltion.productList.ProductlistService;
import com.spring.alltion.productRegistration.ProductVO;

@Controller
public class MainController {

	@Autowired
	private ProductlistService productlistService;
	
	@RequestMapping(method = RequestMethod.GET)
	public void getPopularList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		int limit = 8;
		int listcount = productlistService.getListCount();
		String startrow = Integer.toString((page - 1) * 8 + 1); // 1 9 17 25
		String endrow = Integer.toString(Integer.parseInt(startrow) + limit - 1); // 8 16 24 30
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<ProductVO> mainlist = productlistService.getMain(hashmap);
		
		int maxpage = listcount / limit;
		if (listcount % limit > 0) {
			maxpage++;
		}
		if (maxpage < page) {
		    page = maxpage;
		}

		int startpage = ((page - 1) / 3) * 3 + 1;  
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("mainlist", mainlist);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
	}
	
	@RequestMapping
	public void getVeiwList(Model model, @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		int limit = 8;
		int listcount = productlistService.getListCount();
		String startrow = Integer.toString((page - 1) * 8 + 1); // 1 9 17 25
		String endrow = Integer.toString(Integer.parseInt(startrow) + limit - 1); // 8 16 24 30
		
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		//hashmap.put("sort", sort);
		List<ProductVO> viewList = productlistService.getParticipantsForMain(hashmap); 
		
		int maxpage = listcount / limit;
		if (listcount % limit > 0) {
			maxpage++;
		}
		if (maxpage < page) {
		    page = maxpage;
		}

		int startpage = ((page - 1) / 3) * 3 + 1;  
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("viewList", viewList);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
	}
	
//	@RequestMapping
//	public void getCategorylist(@RequestParam(value="page" , required=false, defaultValue="1") int page, @RequestParam(value = "product_category_1") String product_category_1, Model model) {	
//		int limit = 8;
//		int listcount = productlistService.getListCount();
//		String startrow = Integer.toString((page - 1) * 8 + 1); // 1 9 17 25
//		String endrow = Integer.toString(Integer.parseInt(startrow) + limit - 1); // 8 16 24 30
//		
//		HashMap<String, String> hashmap = new HashMap<String, String>();
//		hashmap.put("startrow", startrow);
//		hashmap.put("endrow", endrow);
//		hashmap.put("product_category_1", product_category_1);
//		
//		List<ProductVO> cateList = productlistService.getCate01List(hashmap);
//
//		int maxpage = listcount / limit;
//		if (listcount % limit > 0) {
//			maxpage++;
//		}
//		if (maxpage < page) {
//		    page = maxpage;
//		}
//
//		int startpage = ((page - 1) / 1) * 1 + 1; 
//	
//		model.addAttribute("page", page);
//		model.addAttribute("listcount", listcount);
//		model.addAttribute("maxpage", maxpage);
//		model.addAttribute("startpage", startpage);
//		model.addAttribute("cateList", cateList);
//		model.addAttribute("product_category_1", product_category_1);
//	}
}