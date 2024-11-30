package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;
import net.fiveleaves.domain.ReplyPageDTO;

public interface ReplyService {
	public int register(ReplyDTO replyDto);
	public ReplyDTO get(Long replyNo);
	public int modify(ReplyDTO replyDto);
	public boolean remove(Long replyNo);
	public List<ReplyDTO> getList(Long boardNo);
	public ReplyPageDTO getListPage(Criteria cri, Long boardNo);
}
