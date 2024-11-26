package net.fiveleaves.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeDTO {
	
	private Long likeDto;
	private Long userNo;
	private Long boardNo;

}
