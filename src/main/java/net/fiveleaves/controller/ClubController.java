package net.fiveleaves.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String list(UserDTO userDto, Model model) {
		try {
			model.addAttribute("myClubList", clubService.getMyClubList(userDto.getUserNo()));
			model.addAttribute("allClubList", clubService.getAllClubList());
			model.addAttribute("categoryList", categoryService.getCategoryList());
			return "club/list";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	@GetMapping("/search")
	public void search(Model model) throws Exception {

			log.info("search");
			model.addAttribute("search", service.search(3L));			
	}
}
