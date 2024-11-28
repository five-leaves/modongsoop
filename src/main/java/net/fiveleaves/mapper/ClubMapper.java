package net.fiveleaves.mapper;

import java.util.List;

import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;

public interface ClubMapper {
	public List<ClubDTO> getAllClubList(Long categoryNo);	// 동호회 전체 목록
	public List<ClubDTO> getAllClubListWithPaging();	// 동호회 전체 목록 페이징	
	public List<ClubDTO> getMyClubList(Long userNo);	// 가입한 동호회 목록
	public ClubDTO readClub(Long clubNo);				// 동호회 정보
	public Long countMember(Long clubNo);				// 동호회 회원수
	public int createClub(ClubDTO club);				// 동호회 등록
	public int joinClub(ClubLogDTO clubLog);			// 동호회 가입
	public int updateClub(ClubDTO club);				// 동호회 정보 수정
	public int deleteClub(Long clubNo);					// 동호회 삭제
	public int deleteMember(ClubLogDTO clubLog);		// 동호회 회원 삭제
	public int deleteAllMember(Long clubNo);			// 동호회 전체 회원 삭제
	public List<ClubDTO> searchClub (Long categoryNo);	// 동호회 검색
}
