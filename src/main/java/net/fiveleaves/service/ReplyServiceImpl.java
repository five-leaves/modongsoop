package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;
import net.fiveleaves.domain.ReplyPageDTO;
import net.fiveleaves.mapper.ReplyMapper;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public int register(ReplyDTO replyDto) {
		log.info("register: "+replyDto);
		return replyMapper.insert(replyDto);
	}

	@Override
	public ReplyDTO get(Long replyNo) {
		log.info("get: "+replyNo);
		return null;
	}
	
	@Override
	public int modify(ReplyDTO replyDto) {
		log.info("modify: "+replyDto);
		return replyMapper.update(replyDto);
	}

	@Override
	public boolean remove(Long replyNo) {
		log.info("remove: "+replyNo);
		return replyMapper.delete(replyNo)==1;
	}

	@Override
	public List<ReplyDTO> getList(Long boardNo) {
		log.info("get Reply List of a Board: "+boardNo);
		return replyMapper.getBoardReplyList(boardNo);
	}
	
	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long boardNo) {
		return new ReplyPageDTO(
				replyMapper.getCountByBoardNo(boardNo),
				replyMapper.getListWithPaging(cri, boardNo));
	}

}
