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
import net.fiveleaves.domain.ClubLogDTO;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.service.CategoryService;
import net.fiveleaves.service.ClubService;
import net.fiveleaves.service.UserService;

@Controller
@RequestMapping("/club/*")
@AllArgsConstructor
@Log4j
public class ClubController {
	
	private ClubService clubService;
	private CategoryService categoryService;
	private UserService userService;
	
	// 동호회 목록 페이지
	@GetMapping("/list")
	public String list(@RequestParam(value = "categoryNo", required = false) Long categoryNo, Model model, Authentication auth) {
		try {
			UserDTO userDto = userService.read(auth.getName());
			model.addAttribute("myClubList", clubService.getMyClubList(userDto.getUserNo()));
			model.addAttribute("allClubList", clubService.getAllClubList(categoryNo));
			model.addAttribute("categoryList", categoryService.getCategoryList());
			return "club/list";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 동호회 검색
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
	
	// 동호회 등록 페이지
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(Model model) throws Exception {
		model.addAttribute("categoryList", categoryService.getCategoryList());
	}
	
	// 동호회 등록
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(ClubDTO clubDto, RedirectAttributes rttr, Authentication auth) throws Exception {
		log.info("register: " + clubDto);
		
		try {
			UserDTO userDto = userService.read(auth.getName());
			clubDto.setUserNo(userDto.getUserNo());
			clubService.register(clubDto);
			rttr.addFlashAttribute("result", clubDto.getClubNo());
			rttr.addFlashAttribute("isClub", "success");
			return "redirect:/board/list?clubNo="+clubDto.getClubNo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 동호회 수정 페이지
	@GetMapping("/modify")
	public void get(@RequestParam("clubNo") Long clubNo, Model model) {
		log.info("modify");
		try {
			model.addAttribute("clubDto", clubService.get(clubNo));
			model.addAttribute("categoryList", categoryService.getCategoryList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 동호회 수정
	@PostMapping("/modify")
	public String modify(ClubDTO clubDto, RedirectAttributes rttr) {
		log.info("modify: "+ clubDto);
		try {
			if (clubService.modify(clubDto)){
				rttr.addFlashAttribute("result", "success");
				return "redirect:/board/list?clubNo=" + clubDto.getClubNo();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@PostMapping(value = "/remove")
	public String remove(@RequestParam("clubNo") Long clubNo, RedirectAttributes rttr) throws Exception {
	    log.info("remove: " + clubNo);
	    try {
			clubService.removeClub(clubNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	    rttr.addFlashAttribute("result", "success");
	    return "redirect:/club/list";
	}
	
	// 동호회 가입
	@PostMapping("/join")
	@PreAuthorize("isAuthenticated()")
	public String join(ClubLogDTO clubLogDto, RedirectAttributes rttr, Authentication auth) {
		log.info("join: " + clubLogDto);
		try {
			UserDTO userDto = userService.read(auth.getName());
			clubLogDto.setUserNo(userDto.getUserNo());
			clubService.join(clubLogDto);
			rttr.addFlashAttribute("isJoin", "success");
			return "redirect:/board/list?clubNo=" + clubLogDto.getClubNo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//동호회 탈퇴
	@PostMapping("/withdraw")
	@PreAuthorize("isAuthenticated()")
	public String withdraw(ClubLogDTO clubLogDto, Authentication auth) {
		log.info("withdraw: " + clubLogDto);
		try {
			UserDTO userDto = userService.read(auth.getName());
			clubLogDto.setUserNo(userDto.getUserNo());
			clubService.withdraw(clubLogDto);
			return "redirect:/club/list";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
