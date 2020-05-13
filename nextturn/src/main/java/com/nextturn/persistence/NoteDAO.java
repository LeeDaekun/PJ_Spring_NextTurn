package com.nextturn.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nextturn.domain.NoteDTO;

public interface NoteDAO {
	
	//쪽지 확인 (리턴값은 NoteDTO)
	public List<NoteDTO> note_list(@Param("map") Map<String, Object> map);
	//(Mapper로 바로 이동)

	//쪽지 전송기능
	public void note_send(NoteDTO nDto);
	//전송내용 #{send_id}, #{receive_id}, #{note_content}

	//페이저를 위한 쪽지 카운트 확인
	public int note_count();



	
	
	
}//interface end
