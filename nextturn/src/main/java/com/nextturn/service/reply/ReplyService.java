package com.nextturn.service.reply;

import java.util.List;

import com.nextturn.domain.ReplyDTO;
import com.nextturn.persistence.BoardDAO;

public interface ReplyService {
	//작성된 리플목록 출력
	public List<ReplyDTO> list(int bno);
	
	//게시글에 리플 등록하기
	public void insert(ReplyDTO rDto);

	//게시글에 리플 삭제하기
	public void deleteReply(int rno, int bno);
}


