package com.nextturn.service.note;

import java.util.List;

import com.nextturn.domain.NoteDTO;

public interface NoteService {
	public List<NoteDTO> note_list(String menu_option, String userid, int start, int end);	
	
	//쪽지전송 인터페이스
	public void note_send(NoteDTO nDto);
	
	//페이저를 위한 쪽지 갯수 계산
	public int note_count();
	
}//인터페이스
