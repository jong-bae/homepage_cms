package com.cms.common.util;

/**
 * 
 * @ClassName PagingUtil.java
 * @description pagination Util 
 * @author JB
 * @since 2016. 7. 6.
 */
public class PagingUtil {

	private int currentPage = 1;		// 현재 선택된 페이지 넘버
	private int totalPages;				// 총 페이지 수
	private int visiblePage = 5;		// 보여질 페이지 갯수
	private int totalRows;				// 총 데이터 수
	private int nextRows;				// 다음 데이터 시작 넘버
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getVisiblePage() {
		return visiblePage;
	}
	public void setVisiblePage(int visiblePage) {
		this.visiblePage = visiblePage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
		setTotalPage();
	}
	public int getNextRows() {
		nextRows = (currentPage-1) * visiblePage;
		return nextRows;
	}
	public void setNextRows(int nextRows) {
		this.nextRows = nextRows;
	}
	/**
	 * 
	 * @name setTotalPage
	 * @description TotalPages 연산
	 * @param 
	 * @return void
	 * @author JB
	 * @since 2016. 7. 6.
	 */
	private void setTotalPage() {
		totalPages = totalRows / visiblePage;
		if((totalRows % visiblePage) > 0) {
			totalPages++;
		}
	}
	
}
