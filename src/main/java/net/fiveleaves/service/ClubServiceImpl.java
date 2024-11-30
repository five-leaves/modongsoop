package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;
import net.fiveleaves.mapper.ClubMapper;

@Service
public class ClubServiceImpl implements ClubService{

	@Autowired
	ClubMapper mapper;
	
	// 동호회 등록
	@Override
	public void register(ClubDTO club) throws Exception {	
		mapper.createClub(club);
		
		ClubLogDTO clubLog = new ClubLogDTO();
		clubLog.setClubNo(club.getClubNo());
		clubLog.setUserNo(club.getUserNo());
		
		mapper.joinClub(clubLog);
	}

	// 동호회 정보
	@Override
	public ClubDTO get(Long clubNo) throws Exception {
		ClubDTO club = mapper.readClub(clubNo);
		if(club == null) {
			throw new RuntimeException(clubNo + "번 동호회가 없습니다.");
		}
		return club;
	}

	// 동호회 전체 목록
	@Override
	public List<ClubDTO> getAllClubList(Long categoryNo) throws Exception {
		List<ClubDTO> allClubList = mapper.getAllClubList(categoryNo);
		return allClubList;
	}
	
	// 가입한 동호회 목록
	@Override
	public List<ClubDTO> getMyClubList(Long userNo) throws Exception {
		List<ClubDTO> myClubList = mapper.getMyClubList(userNo);
		return myClubList;
	}

	// 동호회 수정
	@Override
	public boolean modify(ClubDTO club) throws Exception {
		if (mapper.updateClub(club) == 0) {
			throw new RuntimeException(club.getClubNo() + "번 동호회가 없습니다.");
		}
		return true;
	}

	// 동호회 삭제
	@Override
	public boolean removeClub(Long clubNo) throws Exception {
		mapper.deleteAllMember(clubNo);
		mapper.deleteClub(clubNo);
		if (mapper.deleteAllMember(clubNo) == 0) {
			throw new RuntimeException(clubNo + "번 동호회의 회원이 없습니다.");
		}
		if (mapper.deleteClub(clubNo) == 0) {
			throw new RuntimeException(clubNo + "번 동호회가 없습니다.");
		}
		return true;
	}

	// 동호회 가입
	@Override
	public void join(ClubLogDTO clubLog) {
		mapper.joinClub(clubLog);
	}

	// 동호회 탈퇴
	@Override
	public void withdraw(ClubLogDTO clubLog) {
		if(mapper.deleteMember(clubLog) == 0) {
			throw new RuntimeException(clubLog.getClubNo() + "번 동호회, " + clubLog.getUserNo() + "번 회원이 없습니다.");
		};
	}

	// 동호회 검색
	@Override
	public List<ClubDTO> search (String clubName) throws Exception {
		List<ClubDTO> searchedClubList = mapper.searchClub(clubName);
		return searchedClubList;
	}

	// 동호회 회원수
	@Override
	public int countMember(Long clubNo) throws Exception {
		return mapper.countMember(clubNo);
	}

	// 동호회 회원 확인
	@Override
	public int isMember(ClubLogDTO clubLog) throws Exception {
		return mapper.isMember(clubLog);
	}
	
}
