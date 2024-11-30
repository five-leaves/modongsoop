package net.fiveleaves.controller;

import java.math.BigDecimal;
import java.util.Map;

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
	public void list(@RequestParam(value = "clubNo") Long clubNo, Criteria cri, Model model, Authentication auth) {
//		UserDTO user = (UserDTO) auth.getPrincipal();
//		log.info(user.getNickname());
		
		//인증된 사용자 이름
		String username= auth.getName();
		log.info("auth.name: "+username);
		
//		//사용자및 클럽 정보 조회
//		Map<String, Object> userInfo = boardService.getUserAndClubInfo(username);
//		BigDecimal userNoBigDecimal =(BigDecimal) userInfo.get("USERNO");
//		Long userNo= userNoBigDecimal.longValue();
//		BigDecimal clubNoBigDecimal =(BigDecimal) userInfo.get("USERNO");
//		Long clubNoFromDb= clubNoBigDecimal.longValue();
//		String nickname=(String)userInfo.get("NICKNAME");
//		
//		if (clubNo==null) {
//			clubNo=clubNoFromDb;
//		}
//		log.info(userInfo);
//		log.info("*************************userNo:"+userNo+", clubNo:"+clubNo+", nickname:"+nickname);
		
		
		log.info("list: "+cri);
		cri.setClubNo(clubNo);
		model.addAttribute("list", boardService.getList(cri));
//		model.addAttribute("pageMaker",new PageDTO(cri, 123));
		int total=boardService.getTotal(cri);
		log.info("total: "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
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
	public void get(@RequestParam("boardNo") Long boardNo, @ModelAttribute("cri") Criteria cri, Model model, Authentication auth) {
		
		//인증된 사용자 이름
		String username= auth.getName();
		log.info("auth.name: "+username);
		
		//사용자및 클럽 정보 조회
		Map<String, Object> userInfo = boardService.getUserAndClubInfo(username);
		BigDecimal userNoBigDecimal =(BigDecimal) userInfo.get("USERNO");
		Long userNo= userNoBigDecimal.longValue();
		BigDecimal clubNoBigDecimal =(BigDecimal) userInfo.get("USERNO");
		Long clubNoFromDb= clubNoBigDecimal.longValue();
		String nickname=(String)userInfo.get("NICKNAME");
		
		log.info("/get or /modify");
		model.addAttribute("boardDto", boardService.get(boardNo));
		model.addAttribute("userNo", userNo);
		model.addAttribute("userNickname", nickname);
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