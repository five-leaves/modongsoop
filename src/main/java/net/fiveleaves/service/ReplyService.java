package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

public interface ReplyService {
	public int register(ReplyDTO replyDto);
	public ReplyDTO get(Long replyNo);
	public int modify(ReplyDTO replyDto);
	public int remove(Long replyNo);
	public List<ReplyDTO> getList(Criteria cri, Long boardNo);

}
