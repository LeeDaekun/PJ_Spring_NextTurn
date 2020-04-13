package com.nextturn.domain;


/*import java.sql.Date;*/  //2020-03-18 이런식으로 나옴
import java.util.Date; 		//Wed Mar 18 09:53:00 KST 2020 이런식으로 나옴
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@AllArgsConstructor //컨스트럭트 유징필드
@Getter
@Setter
@ToString
public class BoardDTO { 
    private int bno;		//게시글번호
    private String type;	//게시글 타입
    private String title;	//게시글 제목
    private String content;	//게시글 내용
    private String view_content;   //게시글내용 (에디터 태그 추가)
    private String search_content; //게시글 내용 (순수 text만 검색될 수 있게)
    private String writer;	//게시글 작성자 아이디
    private int viewcnt;	//조회수
    private int replycnt;	//댓글수
    private int goodcnt;	//좋아요
    private Date regdate;	//작성일자
    private Date updateDate;//수정일자
    private String show;	//게시글 삭제하면  실제 삭제하는게 아니고 show 를 n 으로 바꾼다
    
    private String[] files; //첨부파일을 몇개를 올릴지 모르니까 스트링 배열로 만듬
    private int filecnt;	//첨부파일 갯수를 뿌려줄때 이걸씀
    
    private int ref;  		//답변그룹 번호
    private int re_step;	//답변 출력 순번
    private int re_level;	//답변 단계 (계층형)
    
    private String name;    //작성자 이름 이름은 조인에서 가져온다 DB에는 이칼럼이 없어도됨
}
