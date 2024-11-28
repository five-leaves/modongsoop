package net.fiveleaves.service;

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
public class CategoryServiceTests {
	
	@Autowired
	private CategoryService service;
	
	// 카테고리 목록
	@Test
	public void testGetCategoryList() throws Exception {
		service.getCategoryList().forEach(club -> log.info(club));
	}

}
