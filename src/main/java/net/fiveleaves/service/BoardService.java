package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.BoardDTO;
import net.fiveleaves.domain.Criteria;

public interface BoardService {

	public void register(BoardDTO boardDto);
	public BoardDTO get(Long boardNo);
	public boolean modify(BoardDTO boardDto);
	public boolean remove(Long boardDto);
//	public List<BoardDTO> getList();
	public List<BoardDTO> getList(Criteria cri);
	public int getTotal(Criteria cri);
}
