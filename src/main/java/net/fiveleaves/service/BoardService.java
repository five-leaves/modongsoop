package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.BoardDTO;

public interface BoardService {

	public void register(BoardDTO board);
	public BoardDTO get(Long boardNo);
	public boolean modify(BoardDTO boardDto);
	public boolean remove(Long boardDto);
	public List<BoardDTO> getList();
}
