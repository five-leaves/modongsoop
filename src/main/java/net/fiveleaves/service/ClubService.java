package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;

public interface ClubService {
	public void register(ClubDTO club) throws Exception;				// 동호회 등록
	public ClubDTO get(Long clubNo) throws Exception;					// 동호회 정보
	public List<ClubDTO> getAllClubList(Long categoryNo) throws Exception;	// 동호회 전체 목록
	public List<ClubDTO> getMyClubList(Long userNo) throws Exception;	// 가입한 동호회 목록
	public boolean modify(ClubDTO club) throws Exception;				// 동호회 수정
	public boolean removeClub(Long clubNo) throws Exception;			// 동호회 삭제
	public void join(ClubLogDTO clubLog) throws Exception;				// 동호회 가입
	public void withdraw(ClubLogDTO clubLog) throws Exception;			// 동호회 탈퇴
	public List<ClubDTO> search(Long categoryNo) throws Exception;		// 동호회 검색 
}
