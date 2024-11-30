package net.fiveleaves.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.service.CategoryService;
import net.fiveleaves.service.ClubService;

@Controller
@RequestMapping("/club/*")
@AllArgsConstructor
@Log4j
public class ClubController {
	
	private ClubService clubService;
	private CategoryService categoryService;
	
	@GetMapping("/list")
	public String list(@RequestParam(value = "categoryNo", required = false) Long categoryNo, UserDTO userDto, Model model) {
		try {
			model.addAttribute("myClubList", clubService.getMyClubList(userDto.getUserNo()));
			model.addAttribute("allClubList", clubService.getAllClubList(categoryNo));
			model.addAttribute("categoryList", categoryService.getCategoryList());
			return "club/list";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@GetMapping("/search")
	public String search(@RequestParam("clubName") String clubName, Model model) {
		try {
			log.info("search");
			model.addAttribute("searchedClub", clubService.search(clubName));
			return "club/search";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(Model model) throws Exception {
		model.addAttribute("categoryList", categoryService.getCategoryList());
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(ClubDTO clubDto, RedirectAttributes rttr, Authentication auth) throws Exception {
		log.info("register: " + clubDto);
		
		clubDto.setUserNo(1L);
		
		clubService.register(clubDto);
		rttr.addFlashAttribute("result", clubDto.getClubNo());
		return "redirect:/board/list?clubNo="+clubDto.getClubNo();
	}
	
	@GetMapping("/modify")
	public void get(@RequestParam("clubNo") Long clubNo, Model model) throws Exception {
		log.info("modify");
		model.addAttribute("clubDto", clubService.get(clubNo));
	}
	
	@PostMapping("/modify")
	public String modify(ClubDTO clubDto, RedirectAttributes rttr) throws Exception {
		log.info("modify: "+ clubDto);
		if (clubService.modify(clubDto)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list?clubNo=" + clubDto.getClubNo();
	}
	
	@PostMapping(value = "/modify", params = "operation=remove")
	public String remove(
	        @RequestParam("clubNo") Long clubNo,
	        RedirectAttributes rttr) throws Exception {
	    log.info("remove: " + clubNo);
	    clubService.removeClub(clubNo);
	    rttr.addFlashAttribute("result", "success");
	    return "redirect:/club/list";
	}
}
