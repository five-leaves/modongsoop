package net.fiveleaves.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.ReplyDTO;
import net.fiveleaves.service.ReplyService;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService replyService;
	
	@PostMapping(value="/new",
				 consumes="application/json",
				 produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO replyDto) {
		log.info("ReplyDTO: "+replyDto);
		int insertCount=replyService.register(replyDto);
		log.info("Reply INSERT COUNT: "+insertCount);
		return insertCount==1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
			//삼항연산자처리
	}

}
