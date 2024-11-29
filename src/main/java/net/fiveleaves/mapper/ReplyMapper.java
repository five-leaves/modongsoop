package net.fiveleaves.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

public interface ReplyMapper {

	public int insert(ReplyDTO replyDto);
	public ReplyDTO read(Long replyNo); //특정 댓글 읽기
	public int delete(Long replyNo);
	public int update(ReplyDTO replyDto);
	public List<ReplyDTO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("boardNo") Long boardNo);
}
