package net.fiveleaves.service;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	
	@Autowired
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		BoardDTO board = new BoardDTO();
		board.setBoardTitle("새로 작성하는 글");
		board.setBoardContent("새로 작성하는 내용");
		board.setClubNo(1L);
		board.setUserNo(1L);
		
		service.register(board);
		log.info("생성된 게시물의 번호" + board.getBoardNo());
	}
	
	@Test
	public void testGetList() {
		 // Service에서 데이터 가져오기
	    List<BoardDTO> boardList = service.getList();

	    // 가져온 데이터가 null이 아니고 비어 있지 않은지 확인
	    assertNotNull(boardList);
	    assertFalse(boardList.isEmpty());

	    // 각 DTO의 데이터가 정상적으로 매핑되었는지 확인 및 로그 출력
	    boardList.forEach(boardDto -> {
	        assertNotNull(boardDto.getBoardNo());
	        assertNotNull(boardDto.getBoardTitle());
	        log.info("Board DTO: " + boardDto.toString());
	    });
	}
	
	@Test
	public void testGet() {
		log.info(service.get(1L));
	}
	
	@Test
	public void testDelete() {
		//게시물 번호의 존재 여부를 확인하고 테스트할 것
		log.info("REMOVE RESULT: " + service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		BoardDTO board = service.get(1L);
		if (board == null) {
			return;
		}
		board.setBoardTitle("제목 수정합니다.");
		log.info("MODIFY RESULT: " + service.modify(board));
	}

}
