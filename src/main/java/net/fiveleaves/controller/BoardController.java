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
import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.PageDTO;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.service.BoardService;
import net.fiveleaves.service.ClubService;
import net.fiveleaves.service.ReplyService;
import net.fiveleaves.service.UserService;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService boardService;
	private ClubService clubService;
	private UserService userSevice;
	private ReplyService replyService;

	@GetMapping("/list")
	@PreAuthorize("isAuthenticated()")
	public void list(@RequestParam(value = "clubNo") Long clubNo, Criteria cri, Model model, Authentication auth) {
		//인증된 사용자 이름
		String username= auth.getName();
		log.info("auth.name: "+username);
		
		log.info("list: "+cri);
		
		try {
			cri.setClubNo(clubNo);
			
			// 회원 정보 가져오기
			UserDTO userDto = userSevice.read(auth.getName());
			
			// 멤버인지 확인
			ClubLogDTO clubLogDto = new ClubLogDTO();
			clubLogDto.setClubNo(clubNo);
			clubLogDto.setUserNo(userDto.getUserNo());
			int isMember = clubService.isMember(clubLogDto);
			
			// 동호회 정보 가져오기
			ClubDTO clubDto = clubService.get(clubNo);
			
			// 리더인지 확인
			boolean isLeader = clubDto.getUserNo() == userDto.getUserNo();
			
			model.addAttribute("isMember", isMember);
			model.addAttribute("isLeader", isLeader);
			model.addAttribute("userAge", userDto.getBirth());
			model.addAttribute("list", boardService.getList(cri));
			model.addAttribute("clubDto", clubDto);
			model.addAttribute("clubMemberCount", clubService.countMember(clubNo));
			int total=boardService.getTotal(cri);
			log.info("total: "+total);
			model.addAttribute("pageMaker", new PageDTO(cri, total));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(Model model, Authentication auth) {
		try {
			UserDTO userDto = userSevice.read(auth.getName());
			model.addAttribute("userNo", userDto.getUserNo());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardDTO boardDto, RedirectAttributes rttr, Authentication auth) {
		log.info("register: "+boardDto);
		boardService.register(boardDto);
		
		try {
			UserDTO userDto = userSevice.read(auth.getName());
			userDto.getUserNo();
			
			rttr.addFlashAttribute("result", boardDto.getBoardNo());
			return "redirect:/board/list?clubNo="+boardDto.getClubNo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@GetMapping({"/get","/modify"})
	@PreAuthorize("isAuthenticated()")
	public void get(@RequestParam("boardNo") Long boardNo, @RequestParam("clubNo") Long clubNo, @ModelAttribute("cri") Criteria cri, Model model, Authentication auth) {
		log.info("/get or /modify");
		try {
			log.info("auth.getName()="+auth.getName());
			UserDTO userDto = userSevice.read(auth.getName());
			model.addAttribute("clubDto", clubService.get(clubNo));
			model.addAttribute("boardDto", boardService.get(boardNo));
			model.addAttribute("userNo", userDto.getUserNo());
			model.addAttribute("nickname", userDto.getNickname());
			model.addAttribute("clubMemberCount", clubService.countMember(clubNo));
			//model.addAttribute("replyDto", replyService.getList(cri, boardNo));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@PostMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public String modify(BoardDTO boardDto, @RequestParam("boardNo") Long boardNo, @RequestParam("clubNo") Long clubNo, @ModelAttribute("cri") Criteria cri ,RedirectAttributes rttr) {
		log.info("modify: "+boardDto);
		if (boardService.modify(boardDto)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("boardNo", boardNo);
		rttr.addAttribute("clubNo", clubNo);
		return "redirect:/board/list";
	}
	
	@PostMapping("/remove")
	@PreAuthorize("isAuthenticated()")
	public String remove(@RequestParam("boardNo") Long boardNo, @RequestParam("clubNo") Long clubNo, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
		log.info("remove: "+boardNo);
		if(boardService.remove(boardNo)){
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("boardNo", boardNo);
		rttr.addAttribute("clubNo", clubNo);
		return "redirect:/board/list";
	}
	
	@GetMapping("/replyDel")
	@PreAuthorize("isAuthenticated()")
	public String replyDel(@RequestParam("replyNo") Long replyNo, @RequestParam("clubNo") Long clubNo, @RequestParam("boardNo") Long boardNo,  RedirectAttributes rttr) {
		log.info("delete replyNo: "+replyNo);
		if(replyService.remove(replyNo)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("boardNo", boardNo);
		return "redirect:/board/get?clubNo="+clubNo+"&boardNo="+boardNo;
	}
}