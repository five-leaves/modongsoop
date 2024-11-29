package net.fiveleaves.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class ReplyMapperTests {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i -> {
			ReplyDTO dto = new ReplyDTO();
			dto.setBoardNo(1L);
			dto.setReplyContent("댓글테스트" + i);
			dto.setUserNo(1L);
			
			mapper.insert(dto);
		});
	}
	
	@Test
	public void testRead() {
		Long targetreplyNo = 5L;
		ReplyDTO dto = mapper.read(targetreplyNo);
		log.info(dto);
	}
	
	@Test
	public void testDelete() {
		Long targetreplyNo = 1L;
		mapper.delete(targetreplyNo);
	}
	
	@Test
	public void testUpdate() { //오류!
		
		Long targetreplyNo = 5L;
		ReplyDTO dto = mapper.read(targetreplyNo);
		dto.setReplyContent("Update Content");
		int count = mapper.update(dto);
		log.info("UPDATE COUNT: " + count);
	}
	
	@Test
	public void testList() { 
		Criteria cri = new Criteria();
		List<ReplyDTO> replies = mapper.getListWithPaging(cri, 1L);
		replies.forEach(reply -> log.info(replies));
	}
		
}


