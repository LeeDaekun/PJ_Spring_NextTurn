package com.nextturn.service.index;

import java.util.List;

import com.nextturn.domain.BoardDTO;
import com.nextturn.domain.ProductDTO;

public interface IndexService {
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
	

	//목록 (페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> iboardList(String sort_option, String search_option, String keyword, String type);
	//셀랙트라 양이 많으니까 리턴을 리스트로 해야함 (오버라이딩에도 boardList를 써야함)
	//BoardServiceImpl 오버라이딩 해서 사용가능 
	//sort_option = 정렬옵션(
	//search_option = 정렬옵션

	//게시글 갯수 계산
	public int countArticle(String search_option, String keyword);


}//class