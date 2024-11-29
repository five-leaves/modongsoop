package net.fiveleaves.mapper;

import java.util.List;

import net.fiveleaves.domain.BoardDTO;

public interface BoardMapper {
	
	public List<BoardDTO> getList(Long clubNo);
	public void insert(BoardDTO board);
	public void insertSelectKey(BoardDTO board);
	public BoardDTO read(Long board_no);
	public int delete(Long board_no);
	public int update(BoardDTO board);
}