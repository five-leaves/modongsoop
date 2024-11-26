package net.fiveleaves.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReplyDTO {
	
	private Long replyNo;
	private String replyContent;
	private Long userNo;
	private Long boardNo;
	
}
