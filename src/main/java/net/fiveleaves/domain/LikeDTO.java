package net.fiveleaves.domain;

import lombok.Data;

@Data
public class LikeDTO {
	
	private Long likeDto;
	
	private UserDTO userDto;
	private BoardDTO boardDto;

}
