package com.nextturn.service.note;

import java.util.List;

import com.nextturn.domain.NoteDTO;

public interface NoteService {
	public List<NoteDTO> note_view(String userid);	
	
	//쪽지전송 인터페이스
	public void note_send(NoteDTO nDto);
	
	
}//인터페이스
