package net.fiveleaves.domain;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReplyDTO {
	
	private Long replyNo;
	private String replyContent;
	
	private UserDTO userDto;
	private BoardDTO boardDto;

}
