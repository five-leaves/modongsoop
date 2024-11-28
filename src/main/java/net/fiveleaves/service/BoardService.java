package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.BoardDTO;

public interface BoardService {
	
	public void register(BoardDTO board);
	public BoardDTO get(Long board_no);
	public boolean modify(BoardDTO board);
	public boolean remove(Long board_no);
	public List<BoardDTO> getList();

}
