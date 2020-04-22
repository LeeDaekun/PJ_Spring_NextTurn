package com.nextturn.service.board;

public class Pager {
	public static final int PAGE_SCALE=10;	// 한 페이지내에 출력할 게시물 수 15개 고정 (상수)
	public static final int BLOCK_SCALE=10;	// 화면당 최대 페이지수   10개 고정(상수)
	
	private int curPage;		// 현재 페이지
	private int prePage;		// 이전 페이지
	private int nextPage;		// 다음 페이지
	private int totPage;		// 전체 페이지 갯수
	private int totBlock;		// 전체 페이지블록 갯수 (1~10까지가 한블록, 11~20까지가 한블록, 블록스케일이 10이니까, 페이지 10개당 한블록으로 본다)
	private int curBlock;		// 현재 블록
	private int prevBlock;		// 이전 블록
	private int nextBlock;		// 다음 블록
	private int pageBegin;		// #{start} 변수에 전달될 값
	private int pageEnd;		// #{end} 변수에 전달될 값
	private int blockBegin;		// 블록의 시작페이지 번호
	private int blockEnd;		// 블록의 끝페이지 번호
	
	// Pager(레코드갯수, 출력할페이지번호)
	public Pager(int count, int curPage) {  //SQL에서 가져온 게시글수 , 페이지 번호를 가져다가 실행
		curBlock = 1;		// 현재블록 번호
		this.curPage = curPage;	// 현재 페이지 번호
		setTotPage(count);	// 전체 페이지 갯수 계산  (게시글이 15개라면, 2페이지까지 만듬)
		setPageRange();		// #{start}, #{end} 값 계산
		setTotBlock();		// 전체 블록 갯수 계산
		setBlockRange();	// 블록의 시작,끝 번호 계산
	}
	public void setBlockRange() {  //최대페이지까지 도달하면, 더이상 블록을 넘어갈수 없게해야함
		// 원하는 페이지가 몇번째 블록에 속하는지 계산
		curBlock=(curPage-1)/BLOCK_SCALE+1;
		// 블록의 시작페이지,끝페이지 번호 계산
		blockBegin=(curBlock-1)*BLOCK_SCALE+1;
		blockEnd=blockBegin+BLOCK_SCALE-1;
		// 마지막 블록 번호가 범위를 초과하지 않도록 처리
		if(blockEnd > totPage) {
			blockEnd = totPage;
		}
		// [이전][다음]을 눌렀을 때 이동할 페이지 번호
		prePage=(curBlock==1) ? 1 : (curBlock-1)*BLOCK_SCALE;
		nextPage=curBlock>totBlock ? (curBlock*BLOCK_SCALE)
				: (curBlock*BLOCK_SCALE)+1;
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if(nextPage >= totPage) {
			nextPage=totPage;
		}
	}
	// 블록의 갯수 계산
	public void setTotBlock() {
		totBlock = (int)Math.ceil(totPage*1.0 / BLOCK_SCALE);
		//수학함수 집합기능 Math을 사용하여. ceil 을 이용하여, 소숫점을 무조건 정수로 반올림함
	}
	
	// where rn betwwen #{start} and #{end}에 입력될 값
	public void setPageRange() {
		// 시작번호=(현재페이지-1)x페이지당 게시물수 + 1
		// 끝번호=시작번호 + 페이지당 게시물수 - 1
		pageBegin = (curPage-1) * PAGE_SCALE + 1; 	// 현재페이지 - 1 은 0이고, 곱하기 '1페이지당 최대게시물수 + 1'
		pageEnd = pageBegin + PAGE_SCALE - 1;		// 페이지비긴이 위에서 1나왔는데 + 1페이지당 최대게시물수 - 1	
													// 페이지 넘버가 엄청 많아졌을때, 제대로 확인가능
	}
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrePage() {
		return prePage;
	}
	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotBlock() {
		return totBlock;
	}
	// 전체 페이지 갯수 계산
	public void setTotPage(int count) {
		// Math.ceil() 올림
		totPage = (int)Math.ceil(count*1.0 / PAGE_SCALE);  //Math는 수학함수 집함.ceil은 천장을 말함. (소숫점을 올림하겠다는 말 1.1도 2로 올려버림) 
					//예 'count15 x 1.0은 = 15.0' 인데, 나누기 '페이지스케일10' = 1.5인데 2로 올린다
					//(한페이지에 최대 10개만 들어갈수 있으니까, 게시글이 15개라면 페이지가 2개 필요하다는 말)
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	public int getTotPage() {
		return totPage;
	}
}
