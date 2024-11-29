package net.fiveleaves.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
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
}
