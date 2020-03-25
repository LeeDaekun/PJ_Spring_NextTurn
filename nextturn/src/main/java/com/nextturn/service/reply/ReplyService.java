package com.nextturn.service.reply;

import java.util.List;

import com.nextturn.domain.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> list(int bno);
}
