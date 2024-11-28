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
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public void register(BoardDTO board) {
		log.info("register......." + board);
		mapper.insertSelectKey(board);
	}

	@Override
	public BoardDTO get(Long board_no) {
		log.info("get........." + board_no);
		return mapper.read(board_no);
	}

	@Override
	public boolean modify(BoardDTO board) {
		log.info("modify....." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long board_no) {
		log.info("remove....." + board_no);
		return mapper.delete(board_no) == 1;
	}

	@Override
	public List<BoardDTO> getList() {
		log.info("getList.........");
		return mapper.getList();
	}
	
}
