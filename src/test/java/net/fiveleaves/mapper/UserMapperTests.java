package net.fiveleaves.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.UserDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:**/*-context.xml")
@WebAppConfiguration
@Log4j
public class UserMapperTests {

	@Autowired
	private UserMapper mapper;
	
	@Test
	public void testRead() {
		
		UserDTO dto = mapper.read("jinwon");
		
		log.info("dto = " + dto);
		
		dto.getAuthList().forEach(authorityDTO -> log.info(authorityDTO));
		
	}
	
}
