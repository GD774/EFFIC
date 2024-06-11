<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<title>부서기안완료함 | TailAdmin - Tailwind CSS Admin Dashboard Template</title>

<style>
.new-request-button {
	margin-bottom: 7px;
	margin-left: 900px;
    padding: 0.75rem 1rem;
    background-color: #3c50e0; 
    color: white;
    border-radius: 0.25rem;
    transition: background-color 0.3s ease, color 0.3s ease;
}

.new-request-button:hover {
    background-color: #1c2434;
    cursor: pointer;
    font-weight: bold;
}

</style>


</head>

<body>

<div class="wrapper" style="overflow: auto;">
	<div class="mx-auto max-w-screen-2xl p-2 md:p-2 2xl:p-6">
   		 <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
       		 <h2 class="text-title-md2 font-bold text-black dark:text-white mt-4">전자결재 메인페이지</h2>
		 </div>
	
    <div>
	    <button class="new-request-button" onclick="startNewRequest()">새결재진행</button>
	</div>

	<div class="col-span-12 rounded-sm border border-stroke bg-white p-4 shadow-default dark:border-strokedark dark:bg-boxdark">
    <div class="grid grid-cols-1 gap-2 sm:grid-cols-2 xl:grid-cols-4 xl:gap-2">
        <div class="flex flex-col gap-1 border-b border-stroke pb-2 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재상태
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재제목
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안자
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안일
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
        </div>
        <div class="flex flex-col gap-1 border-b border-stroke pb-2 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재상태
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재제목
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안자
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안일
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
        </div>
        <div class="flex flex-col gap-1 border-b border-stroke pb-2 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재상태
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재제목
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안자
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안일
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
        </div>
        <div class="flex flex-col gap-1 border-b border-stroke pb-2 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재상태
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                결재제목
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안자
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
            <div class="mb-0.5 text-xs text-black dark:text-white p-1">
                기안일
                <p class="text-xs font-medium">&nbsp;</p>
            </div>
        </div>
    </div>
</div>

<br>
              
<div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
  <h4 class="mb-6 text-xl font-bold text-black dark:text-white">
    결재진행문서
  </h4>

    <div class="flex flex-col">
    	<div class="grid grid-cols-6 rounded-sm bg-gray-2 dark:bg-meta-4 sm:grid-cols-6">
    		<div class="p-2.5 xl:p-5">
    			<h5 class="text-sm font-medium uppercase xsm:text-base">기안일</h5>
			</div>
		<div class="p-2.5 text-center xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">결재양식</h5>
			</div>
		<div class="p-2.5 text-center xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">긴급</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">제목</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">첨부</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">결재상태</h5>
			</div>
    </div>

    <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
      <div class="p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2024-06-01</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <p class="font-medium text-black dark:text-white">보고서</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
      	<i class="fi fi-rr-light-emergency-on"></i>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">프로젝트 보고</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">${i}</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">완료</p>
      </div>
    </div>

    <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
      <div class="p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2024-06-02</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <p class="font-medium text-black dark:text-white">결재서</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
      	<!-- <i class="fi fi-rr-light-emergency-on"></i> -->
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">예산 결재</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">${i}</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">대기</p>
      </div>
    </div>

    <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
      <div class="p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2024-06-03</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <p class="font-medium text-black dark:text-white">회의록</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
      	<i class="fi fi-rr-light-emergency-on"></i>	
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">팀 회의 결과</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">${i}</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">반려</p>
      </div>
    </div>
    
    <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
	    <div class="p-2.5 xl:p-5">
	      <p class="font-medium text-black dark:text-white">2024-06-01</p>
	    </div>
	    <div class="p-2.5 text-center xl:p-5">
	      <p class="font-medium text-black dark:text-white">보고서</p>
	    </div>
	    <div class="p-2.5 text-center xl:p-5">
	    	<i class="fi fi-rr-light-emergency-on"></i>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">프로젝트 보고</p>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">${i}</p>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">완료</p>
	    </div>
	  </div>
    
    

    <div class="grid grid-cols-6 sm:grid-cols-6">
      <div class="p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2024-06-04</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <p class="font-medium text-black dark:text-white">보고서</p>
      </div>
      <div class="p-2.5 text-center xl:p-5">
      	<i class="fi fi-rr-light-emergency-on"></i>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">일일 업무 보고</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">${i}</p>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <p class="font-medium text-black dark:text-white">진행중</p>
      </div>
    </div>
  </div>
</div>

<br>

<div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
<h4 class="mb-6 text-xl font-bold text-black dark:text-white">
  완료 문서
</h4>

  <div class="flex flex-col">
  	<div class="grid grid-cols-6 rounded-sm bg-gray-2 dark:bg-meta-4 sm:grid-cols-6">
  		<div class="p-2.5 xl:p-5">
  			<h5 class="text-sm font-medium uppercase xsm:text-base">기안일</h5>
			</div>
		<div class="p-2.5 text-center xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">결재양식</h5>
			</div>
		<div class="p-2.5 text-center xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">긴급</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">제목</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">첨부</h5>
			</div>
		<div class="hidden p-2.5 text-center sm:block xl:p-5">
				<h5 class="text-sm font-medium uppercase xsm:text-base">결재상태</h5>
			</div>
  </div>

  <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
    <div class="p-2.5 xl:p-5">
      <p class="font-medium text-black dark:text-white">2024-06-01</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
      <p class="font-medium text-black dark:text-white">보고서</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
    	<i class="fi fi-rr-light-emergency-on"></i>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">프로젝트 보고</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">${i}</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">완료</p>
    </div>
  </div>

  <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
    <div class="p-2.5 xl:p-5">
      <p class="font-medium text-black dark:text-white">2024-06-02</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
      <p class="font-medium text-black dark:text-white">결재서</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
    	<i class="fi fi-rr-light-emergency-on"></i>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">예산 결재</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">${i}</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">대기</p>
    </div>
  </div>

  <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
    <div class="p-2.5 xl:p-5">
      <p class="font-medium text-black dark:text-white">2024-06-03</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
      <p class="font-medium text-black dark:text-white">회의록</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
    	<i class="fi fi-rr-light-emergency-on"></i>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">팀 회의 결과</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">${i}</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">반려</p>
    </div>
  </div>
  
  <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
	    <div class="p-2.5 xl:p-5">
	      <p class="font-medium text-black dark:text-white">2024-06-01</p>
	    </div>
	    <div class="p-2.5 text-center xl:p-5">
	      <p class="font-medium text-black dark:text-white">보고서</p>
	    </div>
	    <div class="p-2.5 text-center xl:p-5">
	    	<i class="fi fi-rr-light-emergency-on"></i>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">프로젝트 보고</p>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">${i}</p>
	    </div>
	    <div class="hidden p-2.5 text-center sm:block xl:p-5">
	      <p class="font-medium text-black dark:text-white">완료</p>
	    </div>
	  </div>
  
  

  <div class="grid grid-cols-6 sm:grid-cols-6">
    <div class="p-2.5 xl:p-5">
      <p class="font-medium text-black dark:text-white">2024-06-04</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
      <p class="font-medium text-black dark:text-white">보고서</p>
    </div>
    <div class="p-2.5 text-center xl:p-5">
    	<i class="fi fi-rr-light-emergency-on"></i>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">일일 업무 보고</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">${i}</p>
    </div>
    <div class="hidden p-2.5 text-center sm:block xl:p-5">
      <p class="font-medium text-black dark:text-white">진행중</p>
    </div>
  </div>
</div>
</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js">

    document.addEventListener('DOMContentLoaded', function() {
        // Initialize Flowbite components here
    });


</script>

</body>

<jsp:include page="../layout/closer.jsp"/>