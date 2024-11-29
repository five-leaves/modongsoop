package net.fiveleaves.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations="file:**/*-context.xml")
@WebAppConfiguration
@Log4j
public class ReplyMapperTests {
	
	//테스트 전에 해당 번호의 게시물이 존재하는지 반드시 확인할 것
	private Long[] boardNoArr = {659L, 658L, 99L, 98L, 97L, 96L, 95L, 94L, 93L};
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Test
	public void testMapper() {
		log.info(replyMapper);
	}
	
	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 10).forEach(i->{
			ReplyDTO replyDto=new ReplyDTO();
			
			//게시물번호
			replyDto.setBoardNo(boardNoArr[i%5]);
			replyDto.setReplyContent("댓글 테스트" +i);
			replyDto.setUserNo(1L);
			replyMapper.insert(replyDto);
		});
	}
	
	@Test
	public void testRead() {
		Long targetReplyNo= 5L;
		ReplyDTO replyDto=replyMapper.read(targetReplyNo);
		log.info(replyDto);
	}
	
	@Test
	public void testDelete() {
		Long targetReplyNo=3L;
		replyMapper.delete(targetReplyNo);
	}
	
	@Test
	public void testUpdate() {
		Long targetReplyNo=1L;
		ReplyDTO replyDto= replyMapper.read(targetReplyNo);
		replyDto.setReplyContent("Update Reply");
		int count=replyMapper.update(replyDto);
		log.info("UPDATE COUNT: "+count);
	}
	
	@Test
	public void testList() {
		Criteria cri=new Criteria();
		//659L
		List<ReplyDTO> replyDtos=replyMapper.getListWithPaging(cri, boardNoArr[0]);
		replyDtos.forEach(replyDto -> log.info(replyDto));
	}
	
	
	
	
}
