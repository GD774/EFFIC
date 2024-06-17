<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<body>

 <!-- ===== Main Content Start ===== -->
<main class="flex-1 p-4 overflow-y-auto max-h-screen">
  <div class="mx-auto max-w-screen-md p-4 md:p-6 lg:p-8">  
  <!-- Breadcrumb Start -->
    <div class="mb-6 flex flex-col gap-7 sm:flex-row sm:items-center sm:justify-between">
      <h2 class="text-title-md2 font-bold text-black dark:text-white flex-grow">
        물품 관리
      </h2>
      <a href="settingfacility" class="items-center justify-center rounded-md border border-primary px-10 py-2 text-center font-medium text-primary hover:bg-opacity-90 lg:px-8 xl:px-10"
	  > 자산 추가 </a>	
      <nav>
        <ol class="flex items-center gap-2">
          <li>
            <a class="font-medium" href="main">메인 /</a>
          </li>
          <li class="font-medium text-primary">물품 관리</li>
        </ol>
      </nav>
    </div>
  <!-- Breadcrumb End -->

  <!-- ====== Table Section Start -->
    <div class="flex flex-col gap-10">
  <!-- ====== Table Four Start -->
  <div class="overflow-hidden rounded-[10px]">
    <div class="max-w-full overflow-x-auto">
      <div class="min-w-[2400px]">
      <!-- table header start -->
        <div
      	  class="grid grid-cols-12 rounded-lg rounded-t-[10px] bg-primary px-5 py-4 lg:px-7.5 2xl:px-11"
     	 >
          <div class="col-span-1">
            <h5 class="font-medium text-white">물품코드</h5>
          </div>
          <div class="col-span-2">
            <h5 class="font-medium text-white">장기/단기</h5>
          </div>
	        <div class="col-span-2">
    	      <h5 class="font-medium text-white">물품명</h5>
            </div>
          <div class="col-span-2">
            <h5 class="font-medium text-white">모델명</h5>
          </div>
          <div class="col-span-3">
           <h5 class="font-medium text-white">구입일</h5>
          </div>
          <div class="col-span-2">
            <h5 class="font-medium text-white">현재 상태</h5>
          </div>
          <div class="col-span-1">
            <h5 class="font-medium text-white"></h5>
          </div>
      </div>
    <!-- table header end -->
    <!-- table body start -->
     <div class="bg-white dark:bg-boxdark">
    <!-- table row item -->
      <div
      	id = "facility-list"
        class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
      >  
</div>    
      <!-- table body end -->
<!-- ====== Table Four End -->

<script>
var page = 1;
var totalPage = 0;


const fnGetFacilityList = () => {
    $.ajax({
      // 요청
      type: 'GET',
      url: '${contextPath}/reservation/getFacilityList.do', 
      data: 'page=' + page,
      // 응답
      dataType: 'json',
      success: (resData) => {
      	totalPage = resData.totalPage;
      	
      	$.each(resData.getFacilityList, (i, facility) => {
      		
          	let StateDisplay;
          	let rentPeriod;
          	if(facility.facilityState === 0) {
          		StateDisplay = '정상';
          	} else if(facility.facilityState === 1) {
          		StateDisplay = '수리';
          	} else if(facility.facilityState === 2) {
          		StateDisplay = '폐기';
          	}
          	if(facility.rentTerm === 0) {
          		rentPeriod = '장기대여';
          	} else if(facility.rentTerm === 1) {
          		rentPeriod = '단기대여';
          	}
          	let str = ' ';
            	str += '<div class="col-span-1"><p data-facility-id="'+facility.facilityId+'" class="text-[#637381] dark:text-bodydark">' + facility.facilityId + '</p></div>';
            	str += '<div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">' + rentPeriod + '</p></div>';
		      	str += '<div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">' + facility.cat.catName + '</p></div>';
            	str += '<div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">' + facility.modelName + '</p></div>';
            	str += '<div class="col-span-3"><p class="text-[#637381] dark:text-bodydark">' + facility.buyDt + '</p></div>';
                str += '<div class="col-span-1"><p class="text-[#637381] dark:text-bodydark">' + StateDisplay + '</p></div>';
                str += '<div class="col-span-1"><button class="float-right text-primary"><a href="editfacility.do?facilityId=' + facility.facilityId +'">설정</a></button></div>';
                str += '</div>';
                $('#facility-list').append(str);
                
             console.log(facility.modelName);
          })

      },
      error: (jqXHR) => {
        alert(jqXHR.statusText + '(' + jqXHR.status + ')');
      }   
    });
  }



	

const fnScrollHandler = () => {
	  
	  // 스크롤이 바닥에 닿으면 page 증가(최대 totalPage 까지) 후 새로운 목록 요청

	  // 타이머 id (동작한 타이머의 동작 취소를 위한 변수)
	  var timerId;  // undefined, boolean 의 의미로는 false
	  
	  $(window).on('scroll', (evt) => {

	    /*
	      스크롤 이벤트 발생 → setTimeout() 함수 동작 → 목록 가져옴 → setTimeout() 함수 동작 취소
	    */
	    
	    if(timerId) {  // timerId 가 undefined 이면 false, 아니면 true 
	                   // timerId 가 undefined 이면 setTimeout() 함수가 동작한 적 없음
	      clearTimeout(timerId);  // setTimeout() 함수 동작을 취소함 -> 목록을 가져오지 않는다.
	    }
	    
	    // 500밀리초(0.5초) 후에 () => {}가 동작하는 setTimeout 함수
	    timerId = setTimeout(() => {
	      
	      let scrollTop = window.scrollY;  // $(window).scrollTop();
	      let windowHeight = window.innerHeight;  // $(window).height();
	      let documentHeight =  $(document).height();
	      
	      if( (scrollTop + windowHeight + 50) >= documentHeight ) {  // 스크롤과 바닥 사이 길이가 50px 이하인 경우 
	        if(page > totalPage) {
	          return;
	        }
	        page++;
	        fnGetFacilityList();
	      }
	      
	    }, 500);
	    
	  })
	  
	}
	fnGetFacilityList();
	fnScrollHandler();


</script>



  <jsp:include page="../layout/closer.jsp"/>      