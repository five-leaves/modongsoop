package net.fiveleaves.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class CategoryMapperTests {

	@Autowired
	private CategoryMapper mapper;
	
	@Test
	public void testGetCategoryList() {
		mapper.getCategoryList().forEach(category -> log.info(category));
	}
}
