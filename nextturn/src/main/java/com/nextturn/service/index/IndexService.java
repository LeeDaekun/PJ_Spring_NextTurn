package com.nextturn.service.index;

import java.util.List;

import com.nextturn.domain.ProductDTO;

public interface IndexService {
	// 신상품을 5건 출력
	public List<ProductDTO> newPdtList();
}
