package net.fiveleaves.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {
	
	@Autowired
	private BoardService boardService;
	
	@Test
	public void testExist() {
		
		log.info(boardService);
		assertNotNull(boardService);
	}
	
	@Test
	public void testRegister() {
		BoardDTO boardDto=new BoardDTO();
		boardDto.setBoardTitle("새제목");
		boardDto.setBoardContent("새내용");
		boardDto.setUserNo(1L);
		boardDto.setClubNo(1L);
		
		boardService.register(boardDto);
		
		log.info("boardNo: "+boardDto.getBoardNo());
	}
	
//	@Test
//	public void testGetList() {
//		 // Service에서 데이터 가져오기
//	    List<BoardDTO> boardList = boardService.getList();
//
//	    // 가져온 데이터가 null이 아니고 비어 있지 않은지 확인
//	    assertNotNull(boardList);
//	    assertFalse(boardList.isEmpty());
//
//	    // 각 DTO의 데이터가 정상적으로 매핑되었는지 확인 및 로그 출력
//	    boardList.forEach(boardDto -> {
//	        assertNotNull(boardDto.getBoardNo());
//	        assertNotNull(boardDto.getBoardTitle());
//	        log.info("Board DTO: " + boardDto.toString());
//	    });
//	}
	@Test
	public void testGetList() {
		boardService.getList(1L, new Criteria(2, 10)).forEach(boardDto -> log.info(boardDto));
	}
	
	@Test
	public void testGet() {
		log.info(boardService.get(5L));
	}
	
	@Test
	public void testUpdate() {
		BoardDTO boardDto= boardService.get(2L);
		if(boardDto==null) {
			return;
		}
		
		boardDto.setBoardTitle("제목 수정");
		log.info("MODIFIY RESULT: "+boardService.modify(boardDto));
	}
	
	@Test
	public void testDelete() {
		//게시물의 존재 여부를 확인하고 테스트 할것
		if (boardService.get(2L)!=null) {
			log.info("REMOVE RESULT: "+boardService.remove(2L));
		}
	}
 
}
