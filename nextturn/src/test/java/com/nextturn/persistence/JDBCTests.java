package com.nextturn.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTests {
	static { // 드라이브로드 계속돌림
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test // 이 메서드 테스트할건데 실행해봐
	public void testConnection() {
		try(Connection conn = 
			DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521:XE",
				"java",
				"1234")) { // 커넥션 맺어지면 출력해라
			System.out.println(conn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}
