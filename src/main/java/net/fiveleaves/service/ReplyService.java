package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;

public interface ReplyService {
	
	public int register(ReplyDTO dto);
	public ReplyDTO get(Long reply_no);
	public int modify(ReplyDTO dto);
	public int remove(Long reply_no);
	public List<ReplyDTO> getList(Criteria cri, Long board_no);

}
