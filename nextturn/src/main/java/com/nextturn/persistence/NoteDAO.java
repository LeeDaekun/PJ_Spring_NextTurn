package com.nextturn.persistence;

import java.util.List;

import com.nextturn.domain.NoteDTO;

public interface NoteDAO {
	
	//쪽지 보기 (리턴값은 NoteDTO)
	public List<NoteDTO> note_view();
	//(Mapper로 바로 이동)
	
	
	
}//interface end
