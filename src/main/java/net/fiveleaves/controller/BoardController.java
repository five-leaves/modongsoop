package net.fiveleaves.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.PageDTO;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.service.BoardService;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
	
//	@GetMapping("/list")
//	public void list(Model model) {
//		log.info("list");
//		model.addAttribute("list", boardService.getList());
//	}
	@GetMapping("/list")
	public void list(@RequestParam(value = "clubNo") Long clubNo, Criteria cri, Model model) {
		log.info("list: "+cri);
		cri.setClubNo(clubNo);
		model.addAttribute("list", boardService.getList(cri));
//		model.addAttribute("pageMaker",new PageDTO(cri, 123));
		int total=boardService.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register() {}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardDTO boardDto, RedirectAttributes rttr, Authentication auth) {
		log.info("register: "+boardDto);
		boardService.register(boardDto);
		
		UserDTO user = (UserDTO) auth.getPrincipal();	
		user.getUserNo();
		
		rttr.addFlashAttribute("result", boardDto.getBoardNo());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("boardNo") Long boardNo, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or /modify");
		model.addAttribute("boardDto", boardService.get(boardNo));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO boardDto, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.info("modify: "+boardDto);
		if (boardService.modify(boardDto)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("boardNo") Long boardNo, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("remove: "+boardNo);
		if(boardService.remove(boardNo)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
	}
}