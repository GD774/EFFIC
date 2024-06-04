package com.gd774.effic.util;

import org.springframework.stereotype.Component;

import lombok.Data;
	
@Component
@Data
public class MsgPaging {
  
	  
	  private int total;     // 전체 게시글 개수                      (DB에서 구한다.)
	  private int display;   // 한 페이지에 표시할 게시글 개수        (요청 파라미터로 받는다.)
	  private int page;      // 현재 페이지 번호                      (요청 파라미터로 받는다.)
	  private int begin;     // 한 페이지에 표시할 게시글의 시작 번호 (계산한다.)
	  private int end;       // 한 페이지에 표시할 게시글의 종료 번호 (계산한다.)

	  private int pagePerBlock = 10;  // 한 블록에 표시할 페이지 링크의 개수      (임의로 결정한다.)
	  private int totalPage;          // 전체 페이지 개수                         (계산한다.)
	  private int beginPage;          // 한 블록에 표시할 페이지 링크의 시작 번호 (계산한다.)
	  private int endPage;            // 한 블록에 표시할 페이지 링크의 종료 번호 (계산한다.)
	  
	  public void setPaging(int total, int display, int page) {
	    
	    this.total = total;
	    this.display = display;
	    this.page = page;
	    
	    begin = (page - 1) * display + 1;
	    end = begin + display - 1;

	    totalPage = (int) Math.ceil((double)total / display); // 올림처리 해줘야 한다는 거~ 기억나죵 21/5 해서 4 나오면 게시글 1개 증발함 
	    beginPage = ((page - 1) / pagePerBlock) * pagePerBlock + 1 ;
	    endPage = Math.min(totalPage, beginPage + pagePerBlock -1);
	    
	  }
	  
	  public String getAsyncPaging() {
		  
		  String lt= "<ul class=\"flex flex-wrap items-center\"><li><a class=\"flex h-8 w-8 items-center justify-center rounded hover:bg-primary hover:text-white\"><svg class=\"fill-current\" width=\"8\" height=\"16\" viewBox=\"0 0 8 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M7.17578 15.1156C7.00703 15.1156 6.83828 15.0593 6.72578 14.9187L0.369531 8.44995C0.116406 8.19683 0.116406 7.80308 0.369531 7.54995L6.72578 1.0812C6.97891 0.828076 7.37266 0.828076 7.62578 1.0812C7.87891 1.33433 7.87891 1.72808 7.62578 1.9812L1.71953 7.99995L7.65391 14.0187C7.90703 14.2718 7.90703 14.6656 7.65391 14.9187C7.48516 15.0312 7.34453 15.1156 7.17578 15.1156Z\" fill=\"\"></path></svg></a></li>";
		  String gt = "<li><a class=\"flex h-8 w-8 items-center justify-center rounded hover:bg-primary hover:text-white\"><svg class=\"fill-current\" width=\"8\" height=\"16\" viewBox=\"0 0 8 16\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M0.819531 15.1156C0.650781 15.1156 0.510156 15.0593 0.369531 14.9468C0.116406 14.6937 0.116406 14.3 0.369531 14.0468L6.27578 7.99995L0.369531 1.9812C0.116406 1.72808 0.116406 1.33433 0.369531 1.0812C0.622656 0.828076 1.01641 0.828076 1.26953 1.0812L7.62578 7.54995C7.87891 7.80308 7.87891 8.19683 7.62578 8.44995L1.26953 14.9187C1.15703 15.0312 0.988281 15.1156 0.819531 15.1156Z\" fill=\"\"></path></svg></a></li>\r\n</ul>";

	    
	    StringBuilder builder = new StringBuilder();
	    
	    // <
	    if(beginPage == 1) {
	      builder.append("<a>"+lt +"</a>");
	    } else {
	      builder.append("<a href=\"javascript:fnPaging(" + (beginPage -1) + ")\">"+ lt +"</a>");
	    }
	    
	    
	    
	    
	    // 1 2 3 4 5 6 7 8 9 10
	    for(int p = beginPage; p <= endPage; p++) {
	      if(p == page) {
	        builder.append("<a class=\"current-page flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white\">" + p +"</a>");
	      } else {
	    	builder.append("<a class=\"flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white\" href=\"javascript:fnPaging(" + p + ")\">" + p + "</a>");
	      }
	    }
	    
	    
	    // >
	    if(endPage == totalPage) {
	      builder.append("<a>"+ gt +"</a>");
	    } else {
	      builder.append("<a href=\"javascript:fnPaging(" + (endPage + 1) + ")\">"+ gt +"</a>");
	    }
	    
	    return builder.toString();
	  }
	  
	  public String getPaging(String requestURI, String sort, int display) {
	    
	    StringBuilder builder = new StringBuilder();
	    
	    // <
	    if(beginPage == 1) {
	      builder.append("<div class=\"dont-click\">&lt;</div>");
	    } else {
	      builder.append("<div><a href=\"" + requestURI + "?page=" + (beginPage - 1) + "&sort=" + sort + "&display=" + display + "\">&lt;</a></div>");
	    }
	    
	    // 1 2 3 4 5 6 7 8 9 10
	    for(int p = beginPage; p <= endPage; p++) {
	      if(p == page) {
	        builder.append("<div><a class=\"current-page\" href=\"" + requestURI + "?page=" + p + "&sort=" + sort + "&display=" + display + "\">" + p + "</a></div>");
	      } else {
	        builder.append("<div><a href=\"" + requestURI + "?page=" + p + "&sort=" + sort + "&display=" + display + "\">" + p + "</a></div>");
	      }
	    }
	    
	    // >
	    if(endPage == totalPage) {
	      builder.append("<div class=\"dont-click\">&gt;</div>");
	    } else {
	      builder.append("<div><a href=\"" + requestURI + "?page=" + (endPage + 1) + "&sort=" + sort + "&display=" + display + "\">&gt;</a></div>");
	    }
	    
	    return builder.toString();
	    
	  }
	  
	  // 검색결과에서 page 2 클릭하면 검색결과가 다 풀리고 getPaging 으로 초기화되는 문제. 여기에 query와 column이 없기 때문임.
	  // 최초 paging에서 column 과 query를 뒤에 쫘르륵 붙여줘야함. 그걸 위해 검색용으로 메소드 오버로딩을 한다. String params로 매개변수 추가. "&"+ params  이걸 주소에 넣어준다.
	  public String getPaging(String requestURI, String sort, int display, String params) {
	      
	      StringBuilder builder = new StringBuilder();
	      
	      // <
	      if(beginPage == 1) {
	        builder.append("<div class=\"dont-click\">&lt;</div>");
	      } else {
	        builder.append("<div><a href=\"" + requestURI + "?page=" + (beginPage - 1) + "&sort=" + sort + "&display=" + display + "&"+ params + "\">&lt;</a></div>");
	      }
	      
	      // 1 2 3 4 5 6 7 8 9 10
	      for(int p = beginPage; p <= endPage; p++) {
	        if(p == page) {
	          builder.append("<div><a class=\"current-page\" href=\"" + requestURI + "?page=" + p + "&sort=" + sort + "&display=" + display+ "&"+ params + "\">" + p + "</a></div>");
	        } else {
	          builder.append("<div><a href=\"" + requestURI + "?page=" + p + "&sort=" + sort + "&display=" + display + "&"+ params + "\">" + p + "</a></div>");
	        }
	      }
	      
	      // >
	      if(endPage == totalPage) {
	        builder.append("<div class=\"dont-click\">&gt;</div>");
	      } else {
	        builder.append("<div><a href=\"" + requestURI + "?page=" + (endPage + 1) + "&sort=" + sort + "&display=" + display + "&"+ params + "\">&gt;</a></div>");
	      }
	      
	      return builder.toString();
	      
	    }
	  
	}




