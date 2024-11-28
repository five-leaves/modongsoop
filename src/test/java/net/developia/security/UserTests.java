package net.developia.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:**/*-context.xml")
@WebAppConfiguration
@Log4j
public class UserTests {

	@Autowired
	private PasswordEncoder pwencoder;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testInsertUser() {
		
		String sql = "insert into users(user_no, username, password, profile, nickname, birth) values(?,?,?,?,?,?)";
					
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			// 김진원
			pstmt.setLong(1, 3);
			pstmt.setString(2, "jinwon");
			pstmt.setString(3, pwencoder.encode("1234"));
			pstmt.setString(4, "");
			pstmt.setString(5, "김진원");
			pstmt.setLong(6, 19980523);
			
			pstmt.executeUpdate();
			
			// 정희준
			pstmt.setLong(1, 4);
			pstmt.setString(2, "chlorella");
			pstmt.setString(3, pwencoder.encode("1234"));
			pstmt.setString(4, "");
			pstmt.setString(5, "정희준");
			pstmt.setLong(6, 19960101);
			
			pstmt.executeUpdate();
			
			// 이화경
//			pstmt.setLong(1, 1);
//			pstmt.setString(2, "hwakyung");
//			pstmt.setString(3, pwencoder.encode("1234"));
//			pstmt.setString(4, "");
//			pstmt.setString(5, "이화경");
//			pstmt.setLong(6, 19990929);
//			
//			pstmt.executeUpdate();
			
			// 유하늘
			pstmt.setLong(1, 5);
			pstmt.setString(2, "asounm");
			pstmt.setString(3, pwencoder.encode("1234"));
			pstmt.setString(4, "");
			pstmt.setString(5, "유하늘");
			pstmt.setLong(6, 19950101);
			
			pstmt.executeUpdate();
			
			// 장다은
			pstmt.setLong(1, 6);
			pstmt.setString(2, "ekdms");
			pstmt.setString(3, pwencoder.encode("1234"));
			pstmt.setString(4, "");
			pstmt.setString(5, "장다은");
			pstmt.setLong(6, 20000101);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(con != null) { try { con.close(); } catch(Exception e) {} }
			
		}
		
	}
	
	@Test
	public void testInsertAuthority() {
		
		String sql = "insert into authorities values(?,?)";
		
		for(int i=1; i<=6; i++) {
			
			Connection con = null;
			PreparedStatement pstmt = null;
		
			try {
				
				con = ds.getConnection();
				pstmt = con.prepareStatement(sql);
				
				pstmt.setLong(1, i);
				pstmt.setString(2, "ROLE_USER");
				
				pstmt.executeUpdate();
				
			} catch(Exception e) {
				
				e.printStackTrace();
				
			} finally {
				
				if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
				if(con != null) { try { con.close(); } catch(Exception e) {} }
				
			}
		}
		
	}
	
	@Test
	public void testUpdateUser() {
		
		String sql = "update users set password = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pwencoder.encode("1234"));
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			if(pstmt != null) { try { pstmt.close(); } catch(Exception e) {} }
			if(con != null) { try { con.close(); } catch(Exception e) {} }
			
		}
		
	}
	
}
