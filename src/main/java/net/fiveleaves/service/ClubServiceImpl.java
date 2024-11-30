package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;
import net.fiveleaves.mapper.ClubMapper;

@Service
public class ClubServiceImpl implements ClubService{

	@Autowired
	ClubMapper clubMapper;
	
	// 동호회 등록
	@Transactional
	@Override
	public void register(ClubDTO clubDto) throws Exception {	
clubMapper.createClub(clubDto);
		
		ClubLogDTO clubLog = new ClubLogDTO();
		clubLog.setClubNo(clubDto.getClubNo());
		clubLog.setUserNo(clubDto.getUserNo());
		
		clubMapper.joinClub(clubLog);
	}

	// 동호회 정보
	@Override
	public ClubDTO get(Long clubNo) throws Exception {
		ClubDTO clubDto = clubMapper.readClub(clubNo);
		if(clubDto == null) {
			throw new RuntimeException(clubNo + "번 동호회가 없습니다.");
		}
		return clubDto;
	}

	// 동호회 전체 목록
	@Override
	public List<ClubDTO> getAllClubList(Long categoryNo) throws Exception {
		List<ClubDTO> allClubList = clubMapper.getAllClubList(categoryNo);
		return allClubList;
	}
	
	// 가입한 동호회 목록
	@Override
	public List<ClubDTO> getMyClubList(Long userNo) throws Exception {
		List<ClubDTO> myClubList = clubMapper.getMyClubList(userNo);
		return myClubList;
	}

	// 동호회 수정
	@Override
	public boolean modify(ClubDTO clubDto) throws Exception {
		if (clubMapper.updateClub(clubDto) == 0) {
			throw new RuntimeException(clubDto.getClubNo() + "번 동호회가 없습니다.");
		}
		return true;
	}

	// 동호회 삭제
	@Override
	public boolean removeClub(Long clubNo) throws Exception {
		clubMapper.deleteAllMember(clubNo);
		clubMapper.deleteClub(clubNo);
		if (clubMapper.deleteAllMember(clubNo) == 0) {
			throw new RuntimeException(clubNo + "번 동호회의 회원이 없습니다.");
		}
		if (clubMapper.deleteClub(clubNo) == 0) {
			throw new RuntimeException(clubNo + "번 동호회가 없습니다.");
		}
		return true;
	}

	// 동호회 가입
	@Override
	public void join(ClubLogDTO clubLog) {
		clubMapper.joinClub(clubLog);
	}

	// 동호회 탈퇴
	@Override
	public void withdraw(ClubLogDTO clubLog) {
		if(clubMapper.deleteMember(clubLog) == 0) {
			throw new RuntimeException(clubLog.getClubNo() + "번 동호회, " + clubLog.getUserNo() + "번 회원이 없습니다.");
		};
	}

	// 동호회 검색
	@Override
	public List<ClubDTO> search (String clubName) throws Exception {
		List<ClubDTO> searchedClubList = clubMapper.searchClub(clubName);
		return searchedClubList;
	}

	// 동호회 회원수
	@Override
	public int countMember(Long clubNo) throws Exception {
		return clubMapper.countMember(clubNo);
	}

	// 동호회 회원 확인
	@Override
	public int isMember(ClubLogDTO clubLog) throws Exception {
		return clubMapper.isMember(clubLog);
	}
	
}
