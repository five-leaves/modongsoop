package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.Criteria;
import net.fiveleaves.domain.ReplyDTO;
import net.fiveleaves.mapper.ReplyMapper;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyDTO dto) {
		log.info("register....." + dto);
		return mapper.insert(dto);
	}
	
	@Override
	public ReplyDTO get(Long reply_no) {
		log.info("get.........." + reply_no);
		return mapper.read(reply_no);
	}
	
	@Override
	public int modify(ReplyDTO dto) {
		log.info("modify........." + dto);
		return mapper.update(dto);
	}
	
	@Override
	public int remove(Long reply_no) {
		log.info("remove......." + reply_no);
		return mapper.delete(reply_no);
	}
	
	@Override
	public List<ReplyDTO> getList(Criteria cri, Long board_no) {
		log.info("get Reply List of a Board" + board_no);
		return mapper.getListWithPaging(cri, board_no);
	}

}
