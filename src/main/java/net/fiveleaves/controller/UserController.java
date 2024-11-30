package net.fiveleaves.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.service.UserService;

@Controller
@RequestMapping("/user/*")
@Log4j
@PropertySource("classpath:application.properties")
public class UserController {
	
	@Autowired
	private UserService service;
	
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
	
	@PostMapping("/signup")
	public String register(UserDTO user/*, @RequestParam("profileImage") MultipartFile profileImage*/) {
	    log.info("회원가입: " + user);

//	    // profileImage가 제대로 전달되었는지 확인
//	    if (profileImage == null || profileImage.isEmpty()) {
//	        log.error("Profile image is missing");
//	        return "errorPage"; // 프로필 이미지가 없는 경우 처리
//	    }

	    // 프로필 이미지 파일 처리
//	    String uploadPath = "/Users/jinwon/dev/upload";  // 파일 저장 경로
//	    String fileName = UUID.randomUUID().toString() + "_" + profileImage.getOriginalFilename();
//	    File saveFile = new File(uploadPath, fileName);
//	    try {
//	        profileImage.transferTo(saveFile);
//	        user.setProfile(fileName);  // 프로필 이미지 파일명 저장
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	        return "errorPage"; // 파일 업로드 실패 시 에러 페이지 처리
//	    }

	    service.register(user);
	    return "redirect:/user/fiveleavesLogin";
	}
	
}
