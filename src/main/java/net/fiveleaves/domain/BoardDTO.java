package net.fiveleaves.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BoardDTO {
	
	private Long boardNo;
	private String boardTitle;
	private String boardContent;
	private Long viewCount;
	private Date regdate;
	private Date updateDate;
	private Long clubNo;
	private Long userNo;
	private String nickname;
	private String clubName;
	
}
