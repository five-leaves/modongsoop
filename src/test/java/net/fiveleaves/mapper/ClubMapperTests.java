package net.fiveleaves.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.ClubDTO;
import net.fiveleaves.domain.ClubLogDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = "file:**/*-context.xml")
@Log4j
public class ClubMapperTests {
	
	@Autowired
	private ClubMapper mapper;
	
	// 동호회 전체 목록
	@Test
	public void testGetAllClubList() {
		mapper.getAllClubList().forEach(club -> log.info(club));
	}
	
	// 가입한 동호회 목록
	@Test
	public void testGetMyClubList() {
		mapper.getMyClubList(1L).forEach(club -> log.info(club));
	}
	
	// 동호회 정보
	@Test
	public void testReadClub() {
		log.info(mapper.readClub(1L));
	}
	
	// 동호회 회원수
	@Test
	public void testCountMember() {
		log.info(mapper.countMember(1L));
	}
	
	// 동호회 등록
	@Test
	public void testCreateClub() {
		ClubDTO club = new ClubDTO();
		club.setClubName("새싹 동대문 동호회");
		club.setClubContent("새싹 동대문 동호회입니다.");
		club.setClubProfile("");
		club.setAgeMin(0);
		club.setAgeMax(0);
		club.setCategoryNo(1L);
		club.setUserNo(1L);
		
		assertEquals(1, mapper.createClub(club));
	}
	
	// 동호회 가입
	@Test
	public void testJoinClub() {
		ClubLogDTO clubLog = new ClubLogDTO();
		clubLog.setClubNo(1L);
		clubLog.setUserNo(2L);
		
		assertEquals(1, mapper.joinClub(clubLog));
	}
	
	// 동호회 정보 수정
	@Test
	public void testUpdateClub() {
		ClubDTO club = new ClubDTO();
		club.setClubNo(2L);
		club.setClubName("새싹 동대문 동호회");
		club.setClubContent("새싹 동대문 동호회입니다.");
		club.setClubProfile(null);
		club.setAgeMin(null);
		club.setAgeMax(null);
		club.setCategoryNo(1L);
		
		assertEquals(1, mapper.updateClub(club));
	}
	
	// 동호회 삭제
	@Test
	public void testDeleteClub() {
		assertEquals(1, mapper.deleteClub(2L));
	}
	
	// 동호회 회원 삭제
	@Test
	public void testDeleteMember() {
		ClubLogDTO clubLog = new ClubLogDTO();
		clubLog.setClubNo(1L);
		clubLog.setUserNo(2L);
		assertNotEquals(0, mapper.deleteMember(clubLog));
	}
	
	// 동호회 전체 회원 삭제
	@Test
	public void testDeleteAllMember() {
		assertNotEquals(0, mapper.deleteAllMember(2L));
	}
	
	// 동호회 검색
	@Test
	public void testSearchClub () {
		log.info(mapper.searchClub(0L));
	}
	
}
