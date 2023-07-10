package city.olooe.jsp.domain;

import lombok.Data;

@Data
public class PageDto {
	
	// 하단 표시 페이지 개수
	private int iconCount = 10;
	
	// 시작 페이지 숫자 1
	private int startPage;
	
	// 종료 페이지 숫자 
	private int endPage;
	
	// 게시글 총 개수
	private int total = 41;
	
	// next, prev
	private boolean prevPage;
	private boolean nextPage;
	private boolean prevPages;
	private boolean nextPages;
	
	// Criteria
	private Criteria cri;

	public PageDto(int total, Criteria cri) {
		this(10, total, cri);
	}


	public PageDto(int iconCount, int total, Criteria cri) {
		this.iconCount = iconCount;
		this.total = total;
		this.cri = cri;
		
		endPage = (cri.getPageNum() + (iconCount - 1)) / iconCount * iconCount;
		startPage = endPage - (iconCount - 1);
		
		int realEnd = (total + (cri.getAmount() - 1)) / cri.getAmount();
		
		
		if(endPage > realEnd) {
			endPage = realEnd;
		}
		
		prevPage = cri.getPageNum() > 1;
		nextPage = cri.getPageNum() < realEnd;
		
		prevPages = startPage > 1;
		nextPages = endPage < realEnd;
		
	}
	
	
	
	public static void main(String[] args) {
		Criteria cri = new Criteria(13, 10);
		PageDto page = new PageDto(123, cri);
		System.out.println(page);
		
	}
	
}