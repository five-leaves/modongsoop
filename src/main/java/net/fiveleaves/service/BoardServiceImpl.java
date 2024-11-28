package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.mapper.BoardMapper;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	private BoardMapper boardMapper;
	
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

	@Override
	public boolean remove(Long boardNo) {
		log.info("remove: "+boardNo);
		return boardMapper.delete(boardNo)==1;
	}

	@Override
	public List<BoardDTO> getList() {
		
		log.info("getList...");
		return boardMapper.getList();
	}

}
