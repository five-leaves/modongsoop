package net.fiveleaves.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

public interface ReplyMapper {
	
	public int insert(ReplyDTO dto);
	public ReplyDTO read(Long reply_no);
	public int delete(Long reply_no);
	public int update(ReplyDTO reply);
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("boardNo")Long boardNo);
}
