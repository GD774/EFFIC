<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!--header-->
<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<!--body-->
<body>
  <div class="min-h-screen overflow-auto">
    <div class="container mx-auto p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6 2xl:p-8">
      <div class="mx-auto w-full max-w-full sm:max-w-screen-sm md:max-w-screen-md lg:max-w-screen-lg xl:max-w-screen-xl 2xl:max-w-7xl">
        <!-- Breadcrumb Start -->
        <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <h2 class="text-title-md2 font-bold text-black dark:text-white">공용물품 대여</h2>
          <nav>
            <ol class="flex items-center gap-2">
              <li>
                <a class="font-medium" href="../user/main">메인 /</a>
              </li>
              <li class="text-primary">공용물품 대여</li>
            </ol>
          </nav>
        </div>
      <!-- Breadcrumb End -->
      <!-- table header start -->
      <div class="max-w-full overflow-x-auto">
		<div class="grid grid-cols-10 gap-4 rounded-t-[10px] bg-primary px-5 py-4 lg:px-7.5 2xl:px-11">
    	  <div class="col-span-3">
            <h5 class="font-medium text-white">항목</h5>
          </div>
            <div class="col-span-3">
        	  <h5 class="font-medium text-white">장기/단기 항목</h5>
            </div>
		    <div class="col-span-3">
		        <h5 class="font-medium text-white">상태</h5>
		    </div>
		    <div class="col-span-1">
		        <h5 class="text-right font-medium text-white">대여(예정)자</h5>
		    </div>
		  </div>
		  <!-- table header end -->
		  <!-- table body start -->
		  <div class="bg-white dark:bg-boxdark">
    	  <!-- table row item -->
    	  <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">노트북1</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">장기 항목</p>
	        </div>
	
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여 가능</p>
	        </div>
	
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary border border-primary rounded px-2 py-1">대여</button>
	        </div>
	    </div>
    	<!-- table row item -->
	    <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">노트북2</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">단기 항목</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여 불가</p>
	        </div>
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary">김** 대리</button>
	        </div>
	    </div>
	    <!-- table row item -->
	    <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">마우스1</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">장기 항목</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여 가능</p>
	        </div>
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary">대여하기</button>
	        </div>
	    </div>
	    <!-- table row item -->
	    <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">빔프로젝터1</p>
	        </div>
	
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">단기 항목</p>
	        </div>
	
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여 예정</p>
	        </div>
	
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary">박** 과장</button>
	        </div>
	    </div>
	    <!-- table row item -->
	    <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">마우스1</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">장기 항목</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여 가능</p>
	        </div>
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary border border-primary rounded px-2 py-1"">대여하기</button>
	        </div>
	    </div>
	    <!-- table row item -->
	    <div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">빔프로젝터2</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">단기 항목</p>
	        </div>
	        <div class="col-span-3">
	            <p class="text-[#637381] dark:text-bodydark">대여중</p>
	        </div>
	        <div class="col-span-1 flex justify-end">
	            <button class="text-primary border border-primary rounded px-2 py-1">반납 가능</button>
	        </div>
	    </div>
    
      </div>
    </div>
    <!-- ===== Main Content Start ===== -->
    <div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
    <!-- Breadcrumb Start -->
    <div
      class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
    >
    <h6 class="text-title-md2 font-bold text-black dark:text-white">물품 대여 현황</h6>
    </div>
    <!-- Breadcrumb End -->
    <!-- ====== Table Section Start -->
    <div class="flex flex-col gap-10">
    <!-- ====== Table Four Start -->
      <div class="overflow-hidden rounded-[10px]">
 	    <div class="max-w-full overflow-x-auto">
    	  <div class="min-w-[1170px]">
     	    <!-- table header start -->
			  <div class="flex justify-between bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11">
			    <div class="w-1/4">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">항목</h5>
			    </div>
			    <div class="w-1/4">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">대여종류</h5>
			    </div>
			    <div class="w-1/4">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">대여시작시간</h5>
			    </div>
			    <div class="w-1/4">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">반납</h5>
			    </div>
			</div>
        <!-- table header end -->
	    <!-- table body start -->
		  <div class="bg-white dark:bg-boxdark">
		    <!-- table row item -->
		    <div
		      class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
		    >
		      <div class="col-span-3">
		        <p class="text-[#637381] dark:text-bodydark">빔프로젝터2</p>
		      </div>
		      <div class="col-span-3">
		        <p class="text-[#637381] dark:text-bodydark">단기 항목</p>
		      </div>
		      <div class="col-span-2">
		        <p class="text-[#637381] dark:text-bodydark"> 2024.04.06 09:30</p>
		      </div>
		      <div class="col-span-1">
		        <button class="float-right text-primary border border-primary bg-red rounded px-2 py-1">반납요망</button>
		      </div>
		   </div>
		    <!-- table row item -->
		    <div
		      class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
		    >
		      <div class="col-span-3">
		        <p class="text-[#637381] dark:text-bodydark">마우스4</p>
		      </div>
		      <div class="col-span-3">
		        <p class="text-[#637381] dark:text-bodydark">단기 항목</p>
		      </div>
		      <div class="col-span-2">
		        <p class="text-[#637381] dark:text-bodydark">2024.06.03 17:05</p>
		      </div>
		      <div class="col-span-1">
		        <button class="float-right text-primary border border-primary rounded px-2 py-1">반납가능</button>
		      </div>
		    </div>
    	  </div>
  		<!-- table row end -->
		<!-- Paging -->
 		<div class="flex justify-center items-center rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
		  <div class="p-4 sm:p-6 xl:p-7.5">
    		<nav class="flex justify-center">
  			  <ul class="flex flex-wrap items-center">
	    		<li class="inline-block">
		      	  <a
			        class="flex h-9 w-9 items-center justify-center rounded-l-md border border-stroke hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			      >
			        <svg
			          class="fill-current"
			          width="8"
			          height="16"
			          viewBox="0 0 8 16"
			          fill="none"
			          xmlns="http://www.w3.org/2000/svg"
			        >
			          <path
			            d="M7.17578 15.1156C7.00703 15.1156 6.83828 15.0593 6.72578 14.9187L0.369531 8.44995C0.116406 8.19683 0.116406 7.80308 0.369531 7.54995L6.72578 1.0812C6.97891 0.828076 7.37266 0.828076 7.62578 1.0812C7.87891 1.33433 7.87891 1.72808 7.62578 1.9812L1.71953 7.99995L7.65391 14.0187C7.90703 14.2718 7.90703 14.6656 7.65391 14.9187C7.48516 15.0312 7.34453 15.1156 7.17578 15.1156Z"
			            fill=""
			          />
			        </svg>
	      		  </a>
	    		</li>
			    <li class="inline-block">
			      <a
			        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			        >1</a
			      >
			    </li>
		    	<li class="inline-block">
			      <a
			        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			        >2</a
			      >
			    </li>
			    <li class="inline-block">
			      <a
			        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			        >3</a
			      >
			    </li>
			    <li class="inline-block">
			      <a
			        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			        >4</a
			      >
			    </li>
			    <li class="inline-block">
			      <a
			        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			        href="#"
			        >5</a
			      >
		          </li>
			      <li class="inline-block">
			        <a
			          class="flex h-9 w-9 items-center justify-center rounded-r-md border border-stroke border-l-transparent hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
			          href="#"
			        >
			          <svg
			            class="fill-current"
			            width="8"
			            height="16"
			            viewBox="0 0 8 16"
			            fill="none"
			            xmlns="http://www.w3.org/2000/svg"
			          >
			            <path
			              d="M0.819531 15.1156C0.650781 15.1156 0.510156 15.0593 0.369531 14.9468C0.116406 14.6937 0.116406 14.3 0.369531 14.0468L6.27578 7.99995L0.369531 1.9812C0.116406 1.72808 0.116406 1.33433 0.369531 1.0812C0.622656 0.828076 1.01641 0.828076 1.26953 1.0812L7.62578 7.54995C7.87891 7.80308 7.87891 8.19683 7.62578 8.44995L1.26953 14.9187C1.15703 15.0312 0.988281 15.1156 0.819531 15.1156Z"
			              fill=""
			            />
		       		 </svg>
	      		   </a>
	    		 </li>
	   		   </ul>
	  		 </nav>
	       </div>
         </div>
 	     <!--paging-->   
       <!-- table body end -->
  	   </div>
     </div>
   </div>
<!--Table Section End -->
  </div>
</div>
<!--footer-->
<jsp:include page="../layout/closer.jsp"/>
