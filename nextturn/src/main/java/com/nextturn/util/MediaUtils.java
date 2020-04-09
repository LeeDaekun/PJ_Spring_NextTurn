package com.nextturn.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	private static Map<String, MediaType> mediaMap;  //MediaType은 스프링프레임워크꺼로 해야함
	// 클래스를 로딩할때 제일 먼저 실행되는 코드
	// static 블럭 : 안에있는 모든걸 static을 하고싶을때 사용함 
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	public static MediaType getMediaType(String type) {
		// toUpperCase() 대문자로 변환
		return mediaMap.get(type.toUpperCase());   //위에 "JPG" "GIF" "PNG" 이런걸 가져옴
		                        //대문자 변환
	}
}

