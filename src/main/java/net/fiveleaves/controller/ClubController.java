package net.fiveleaves.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.service.ClubService;

@Controller
@Log4j
@RequestMapping("/club/*")
@AllArgsConstructor
public class ClubController {
	
	private ClubService service;
	
	@GetMapping("/search")
	public void search(Model model) throws Exception {

			log.info("search");
			model.addAttribute("search", service.search(3L));			
	}
}
