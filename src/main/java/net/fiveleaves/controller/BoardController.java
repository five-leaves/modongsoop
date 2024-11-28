package net.fiveleaves.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.service.BoardService;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
	
	@GetMapping("/list")
	public void list(@RequestParam(value = "clubNo") Long clubNo, Model model) {
		log.info("list");
		model.addAttribute("list", boardService.getList(clubNo));
	}
	
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String register(BoardDTO boardDto, RedirectAttributes rttr) {
		log.info("register: "+boardDto);
		boardService.register(boardDto);
		rttr.addFlashAttribute("result", boardDto.getBoardNo());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get","/modify"})
	public void get(@RequestParam("boardNo") Long boardNo, Model model) {
		log.info("/get or /modify");
		model.addAttribute("boardDto", boardService.get(boardNo));
	}
	
	@PostMapping("/modify")
	public String modify(BoardDTO boardDto, RedirectAttributes rttr) {
		log.info("modify: "+boardDto);
		if (boardService.modify(boardDto)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("boardNo") Long boardNo, RedirectAttributes rttr) {
		log.info("remove: "+boardNo);
		if(boardService.remove(boardNo)){
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
}