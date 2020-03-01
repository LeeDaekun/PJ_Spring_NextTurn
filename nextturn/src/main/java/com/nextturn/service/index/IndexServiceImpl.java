package com.nextturn.service.index;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nextturn.domain.ProductDTO;
import com.nextturn.persistence.ProductDAO;

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
	
	@Autowired
	public void newProductDAO() {
		pDao = sqlSession.getMapper(ProductDAO.class);
	} //  여기 pDao는 sqlSession 실행할 것을 담음(ProductDAO.class에 있는)
	
	
	@Override //인덱스 서비스를 오버라이딩 해서 만듬 (부모가 인터페이스-> 자식은 추상메서드를 무조건 구현해야돼)
	public List<ProductDTO> newPdtList() {
		// TODO Auto-generated method stub
		return pDao.newPdtList(); //
	}
	
	
	
}
