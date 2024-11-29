package net.fiveleaves.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.domain.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:**/*-context.xml")
@WebAppConfiguration
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		boardMapper.getList().forEach(boardDto -> log.info(boardDto));
	}
	
	@Test
	public void testPaging() {
		Criteria cri =new Criteria();
		//10개씩 3페이지
		cri.setPageNum(3);
		cri.setAmount(10);
		List<BoardDTO> list= boardMapper.getListWithPaging(cri);
		list.forEach(boardDto -> log.info(boardDto));
	}
	
	@Test
	public void testInsert() {
		BoardDTO boardDto = new BoardDTO();
		boardDto.setBoardTitle("삽입테스트제목");
		boardDto.setBoardContent("삽입테스트내용");
		boardDto.setClubNo(1L);
		boardDto.setUserNo(1L);
		
		boardMapper.insert(boardDto);
		
		log.info(boardDto);
		
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardDTO boardDto=new BoardDTO();
		boardDto.setBoardTitle("번호지정삽입테스트제목");
		boardDto.setBoardContent("번호지정삽입테스트내용");
		boardDto.setClubNo(1L);
		boardDto.setUserNo(1L);
		
		boardMapper.insertSelectKey(boardDto);
		
		log.info(boardDto);
	}
	
	@Test
	public void testRead() {
		BoardDTO boardDto = boardMapper.read(5L);
		log.info(boardDto);
		
	}
	
	@Test
	public void testDelete() {
		log.info(boardMapper.delete(8L));
				
	}
	
	@Test
	public void testUpdate() {
		BoardDTO boardDto= new BoardDTO();
		boardDto.setBoardNo(7L);
		boardDto.setBoardTitle("게시물 제목");
		boardDto.setBoardContent("수정된 게시물 내용");
		boardDto.setUserNo(1L);
		boardDto.setClubNo(1L);
		
		int count=boardMapper.update(boardDto);
		log.info("UPDATE COUNT: " + count);
	}
	

}
