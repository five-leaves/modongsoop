package net.fiveleaves.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user/*")
@Log4j
public class UserController {
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
	}
	
	@GetMapping("/fiveleavesLogin")
	public void loginInput(Authentication auth, String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
	}
	
	@GetMapping("/fiveleavesLogout")
	public void logoutGET() {
		
		log.info("fiveleaves logout");
		
	}
	
	@GetMapping("/main")
	public void doMain() {
		
		log.info("main");
	}
	
	@GetMapping("/all")
	public void doAll() {
		
		log.info("do all can access everybody");
	}
	   
	@GetMapping("/mypage")
	public void doMypage() {
		
		log.info("mypage");
	}
	
	@GetMapping("/signup")
	public void doSignUp() {
		
		log.info("signup");
	}
	
}
