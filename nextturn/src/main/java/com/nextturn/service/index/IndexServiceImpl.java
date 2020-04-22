package com.nextturn.service.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.BoardDTO;
import com.nextturn.domain.ProductDTO;
import com.nextturn.persistence.BoardDAO;
import com.nextturn.persistence.ProductDAO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service //어노테이션 컨트롤러 서비스 컴포넌트 리포지토리가 IOC 패턴 적용하는거 @Autowired 가 이것들을 해줌  
public class IndexServiceImpl implements IndexService{
	
	// 기존에는 DAO -> Mybatis -> DB(Oracle) 순차적으로
	// 동작해서 비효율적이던 실행방법을 다음과 같이
	// DAO+Mapper를 결합해서 사용하는 방식을 사용
	
	// sqlSession을 사용하기 위한 의존성 주입
	// : root-context.xml에서 생성된 sqlSession빈즈를 주입받음
	@Autowired
	private SqlSession sqlSession;
	ProductDAO pDao; // 전역변수, 값이 없으면 null   DAO가 SQL문을 실행해서 DB에 다녀옴
	BoardDAO bDao;  //인덱스에 게시글 출력하려고 만듬
	
	/*===sqlSession 의존성주입 (데이터베이스 접속코드)==============================*/
	@Autowired
	public void newProductDAO() {
		pDao = sqlSession.getMapper(ProductDAO.class);
	} //  여기 pDao는 sqlSession 실행할 것을 담음(ProductDAO.class에 있는)
	
	@Autowired
	public void iBoardList() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	/*=====================================================================*/
	
	
	
	
	
	@Override //인덱스 서비스를 오버라이딩 해서 만듬 (부모가 인터페이스-> 자식은 추상메서드를 무조건 구현해야돼)
	public List<ProductDTO> newPdtList() {
		// TODO Auto-generated method stub
		return pDao.newPdtList(); //
	}

	//인덱스에 미니게시판 띄울때 생성
	@Override
	public List<BoardDTO> iboardList(String sort_option, String search_option, String keyword, String type) {
		Map<String, Object> map = new HashMap<>();
		log.info("■■■■indesService Impl ■■ iboardList 접속■■■■■");
		map.put("sort_option", sort_option);//매개변수를 "sort_option" 맵에 담는다.
		map.put("search_option",search_option);  //키워드 검색에 필요함
		map.put("type",type);	//게시글 카테고리
		//DAO의 boardList 에서 작업을 처리하고, 리턴하라

		log.info("type:" + map.get("list_type"));  //로그인포는 "" 문자열로 시작해야한다.
		log.info("sort_opation" + map.get("sort_option"));
		return bDao.iboardList(map);
	}

	
	@Override
	public int countArticle(String search_option, String keyword) {
		return 0;
	}
	
	
}
