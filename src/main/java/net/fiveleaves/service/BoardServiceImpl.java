package net.fiveleaves.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.mapper.BoardMapper;
import net.fiveleaves.mapper.ReplyMapper;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper boardMapper;
	private ReplyMapper replyMapper;
	
	public void register(BoardDTO boardDto) {
		log.info("register:"+boardDto);
		
		boardMapper.insertSelectKey(boardDto);
		
	}

	@Override
	public BoardDTO get(Long boardNo) {
		log.info("get: "+boardNo);
		return boardMapper.read(boardNo);
	}

	@Override
	public boolean modify(BoardDTO boardDto) {
		log.info("modify: "+boardDto);
		return boardMapper.update(boardDto)==1;
	}

	@Transactional
	@Override
	public boolean remove(Long boardNo) {
		log.info("remove: "+boardNo);
		boolean result = boardMapper.delete(boardNo)==1;
		replyMapper.removeAll(boardNo);
		
		return result;
	}

	@Override
	public List<BoardDTO> getList(Criteria cri) {
		log.info("getList with criteria: "+ cri);
		return boardMapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");
		return boardMapper.getTotalCount(cri);
	}
	
	@Override
	public Map<String, Object> getUserAndClubInfo(String username) {
		return boardMapper.getUserAndClubInfo(username);
	}

}
