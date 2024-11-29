package net.fiveleaves.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;
import net.fiveleaves.service.ReplyService;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;
	
	@PostMapping(value = "/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
		log.info("ReplyDTO: " + dto);
		int insertCount = service.register(dto);
		log.info("Reply INSERT COUNT: " + insertCount);
		
		return insertCount == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
	@GetMapping (value = "/pages/{boardNo}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyDTO>> getList(
			@PathVariable("Page")int page,
			@PathVariable("board_no")Long board_no) {
		log.info("getList.........");
		Criteria cri = new Criteria(page,10);
		log.info(cri);
		return new ResponseEntity<>(service.getList(cri, board_no), HttpStatus.OK);
	}
	
	@GetMapping (value = "/{replyNo}",
			produces = {MediaType.APPLICATION_XML_VALUE,
			            MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyDTO> get(@PathVariable("reply_no")Long reply_no) {
		log.info("get: " + reply_no);
		return new ResponseEntity<>(service.get(reply_no),HttpStatus.OK);
	}
	
	@DeleteMapping(value= "/{replyNo}", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("reply_no")Long reply_no) {
		log.info("remove: " + reply_no);
		return service.remove(reply_no) == 1
			    ? new ResponseEntity<>("success", HttpStatus.OK)
			    : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
			@RequestBody ReplyDTO dto,
			@PathVariable("reply_no")Long reply_no) {
		dto.setReplyNo(reply_no);
		log.info("reply_no: " + reply_no);
		log.info("modify: " + dto);
		return service.modify(dto) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
	}
	
	
}
