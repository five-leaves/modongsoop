package net.fiveleaves.mapper;

import java.util.List;

import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.domain.Criteria;

public interface BoardMapper {
	
	public List<BoardDTO> getList();
	public List<BoardDTO> getListWithPaging(Criteria cri);
	public void insert(BoardDTO boardDto);
	public void insertSelectKey(BoardDTO boardDto);
	public BoardDTO read(Long board_no);
	public int delete(Long board_no);
	public int update(BoardDTO boardDto);
	public int getTotalCount(Criteria cri);
}