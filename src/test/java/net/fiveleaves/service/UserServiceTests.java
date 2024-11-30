package net.fiveleaves.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class UserServiceTests {

	@Autowired
	private UserService service;
	
	// 회원가입
	@Test
	public void testRegister() throws Exception {
		UserDTO user = new UserDTO();

		user.setUsername("jinwon2");
		user.setPassword("1234");
		user.setProfile("/path");
		user.setNickname("김진투");
		user.setBirth(19980523);
	
		service.register(user);
		
		log.info("생성된 게시물의 번호 : " + user.getUserNo());
	}
}
