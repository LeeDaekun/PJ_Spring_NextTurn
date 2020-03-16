package com.nextturn.persistence;
/* mybatis 테스트 */

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
// JUnit Test Case로 만든 클래스
// JUnit 4 버전으로 테스트
@RunWith(SpringJUnit4ClassRunner.class)
//스프링 설정 파일의 위치를 지정
@ContextConfiguration(locations=
{"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MybatisTests {
	//로깅을 위한 변수
	private static final Logger logger=
			LoggerFactory.getLogger(MybatisTests.class);
	//의존관계 주입 코드
	@Autowired
	private SqlSessionFactory sqlFactory;
	//test할 코드
	@Test
	public void testFactory() {
		logger.info("SqlFactory:"+sqlFactory);
	}
	@Test
	public void testSession() {
		try(SqlSession sqlSession = sqlFactory.openSession()) {
			logger.info("SqlSession:"+ sqlSession);
			logger.info("Mybatis 연결 성공");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
