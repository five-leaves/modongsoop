package net.fiveleaves.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
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
	
	private ReplyService replyService;
	
	//@PreAuthorize("isAuthenticated()")
	@PostMapping(value ="/new",
			consumes="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyDTO replyDto) {
		log.info("replyDto: "+replyDto);
		int insertCount= replyService.register(replyDto);
		log.info("Reply INSERT COUNT: "+insertCount);
		
		return insertCount==1
				? new ResponseEntity<>("success", HttpStatus.OK)
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
				
	}
	
//	@GetMapping (value = "/{replyNo}",
//			produces = {MediaType.APPLICATION_XML_VALUE,
//			            MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<ReplyDTO> get(@PathVariable("reply_no")Long replyNo) {
//		log.info("get: " + replyNo);
//		return new ResponseEntity<>(service.get(replyNo),HttpStatus.OK);
//	}
//	
//	@DeleteMapping(value= "/{replyNo}", produces = {MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> remove(@PathVariable("reply_no")Long replyNo) {
//		log.info("remove: " + replyNo);
//		return service.remove(replyNo)
//			    ? new ResponseEntity<>("success", HttpStatus.OK)
//			    : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
//	}
//	
//	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
//			value = "/{replyNo}",
//			consumes = "application/json",
//			produces = {MediaType.TEXT_PLAIN_VALUE })
//	public ResponseEntity<String> modify(
//			@RequestBody ReplyDTO replyDto,
//			@PathVariable("reply_no")Long replyNo) {
//		replyDto.setReplyNo(replyNo);
//		log.info("reply_no: " + replyNo);
//		log.info("modify: " + replyDto);
//		return service.modify(replyDto) == 1
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);		
//	}


	@GetMapping(value="/pages/{boardNo}/{page}",
				produces= {MediaType.APPLICATION_XML_VALUE,
						   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyDTO>> getList(
			@PathVariable("page") int page,
			@PathVariable("boardNo") Long boardNo) {
		log.info("getList.........");
		Criteria cri=new Criteria(page,10);
		log.info(cri);
		return new ResponseEntity<>(replyService.getList(cri,boardNo),HttpStatus.OK);
	}
	
	@GetMapping(value="/{replyNo}",
				produces= {MediaType.APPLICATION_XML_VALUE,
						   MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyDTO> get(@PathVariable("replyNo") Long replyNo) {
		   log.info("get: "+replyNo);
		   return new ResponseEntity<>(replyService.get(replyNo), HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping(value="/{replyNo}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("replyNo") Long replyNo) {
		log.info("remove: "+replyNo);
		
		return replyService.remove(replyNo) == true
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
					value="/{replyNo}",
					consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyDTO replyDto,
			@PathVariable("replyNo") Long replyNo) {
		replyDto.setReplyNo(replyNo);
		log.info("replyNo: "+replyNo);
		log.info("modify: "+replyNo);
		return replyService.modify(replyDto)==1
				? new ResponseEntity<>("success",HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	/*
	@GetMapping(value = "/pages/{boardNo}/{page}", 
			produces = { 
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ReplyPageDTO>> getList(
			@PathVariable("page") int page,
			@PathVariable("boardNo") Long boardNo) {
		log.info("getList..............");
		Criteria cri = new Criteria(page, 10);
		log.info("get Reply List boardNo: " + boardNo);
		log.info("cri:" + cri);
		return new ResponseEntity<>(service.getListPage(cri, boardNo), HttpStatus.OK);
	}
	*/

}
	

