package net.fiveleaves.domain;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
	
	private Long userNo;
	private String username;
	private String password;
	private String profile;
	private String nickname;
	private Integer birth;
	private boolean enabled;
	private Date regdate;
	private Date updateDate;

	private List<AuthorityDTO> authList;
	
}
