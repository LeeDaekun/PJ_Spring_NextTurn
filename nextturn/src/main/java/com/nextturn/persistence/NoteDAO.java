package com.nextturn.persistence;

import java.util.List;

import com.nextturn.domain.NoteDTO;

public interface NoteDAO {
	
	//쪽지 확인 (리턴값은 NoteDTO)
	public List<NoteDTO> note_view(String userid);
	//(Mapper로 바로 이동)

	//쪽지 전송기능
	public void note_send(NoteDTO nDto);
	//전송내용 #{send_id}, #{Receive_id}, #{note_content}
	
	
}//interface end
