<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!--header-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<!--body-->
<body>
  <div class="flex-1 max-h-screen overflow-y-auto">
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
		<div class="grid grid-cols-10 gap-4 rounded-t-[10px] bg-primary px-6 py-4 lg:px-7.5 2xl:px-11">
    	  <div class="col-span-2">
            <h5 class="font-medium text-white">항목</h5>
          </div>
          <div class="col-span-3">
            <h5 class="font-medium text-white">모델명</h5>
          </div>
            <div class="col-span-2">
        	  <h5 class="font-medium text-white">장/단기 항목</h5>
            </div>
		    <div class="col-span-1">
		        <h5 class="font-medium text-white">상태</h5>
		    </div>
		    <div class="col-span-2">
		        <h5 class="text-right font-medium text-white"></h5>
		    </div>
		  </div>
		  <!-- table header end -->
		  <div 
		  		id = "facreserve-list"
		  		class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">
		  <!-- table body start -->
   
    	
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

     	    <!-- table header start -->
			  <div class="grid grid-cols-10 bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11">
			    <div class="col-span-3">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">항목</h5>
			    </div>
			    <div class="col-span-2">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">대여종류</h5>
			    </div>
			    <div class="col-span-3">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">대여시작시간</h5>
			    </div>
			    <div class="col-span-2">
			        <h5 class="font-medium text-[#637381] dark:text-bodydark">반납</h5>
			    </div>
			</div>
        <!-- table header end -->
	    <!-- table body start -->
		  <div id="facilityreserve" class="bg-white dark:bg-boxdark">

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



        <!--모달창 시작-->
<!-- Main modal -->
<div id="static-modal" data-modal-backdrop="static" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    공용물품 대여
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="static-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">닫기</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5 space-y-4">
                <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
<!--예약자입력칸-->
    <div class="flex items-center m-5 p-2">
      <input type="hidden" id="facilityId" value="${facility.facilityId}"/>
      <input type="hidden" id="rentTerm" value="${facility.rentTerm}"/>
      <label class="mb-3 block font-medium mr-8 text-sm">
		물품명
      </label>
      <input
        type="text"
		value="${facility.cat.catName}"
		id="catName"
        class="block w-40 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-lg shadow-sm text-xs"
      />
    </div>
<!--예약자입력끝-->
<!-- 날짜/시간 선택 시작 -->
<div class="flex items-center space-x-4 m-5 p-2">
    <h6 class="mb-0 text-sm">예약일시</h6>
    <div class="relative">
    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">

    </div>
    <input name="start" type="text" id="startDt" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700">
  </div>
  <span class="mx-4 text-gray-500">~</span>
  <div class="relative">
    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
    </div>
    <input name="end" type="text" id="endDt" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5 placeholder="0000-00-00">
</div>
</div>
<!--날짜/시간 선택 끝-->
<!--예약자입력칸-->
    <div class="flex items-center m-5 p-2">
      <label
        class="mb-3 block font-medium mr-8 text-sm"
      >
		예약자
      </label>
      <input
        type="text"
        placeholder="예약자명"
		value="${sessionScope.user.name}"
		id="name"
        class="block w-40 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-lg shadow-sm text-xs"
      />
    </div>
<!--예약자입력끝-->
</p>
<p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
    
                </p>
            </div>
            <!-- Modal footer -->
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b">
                <button data-modal-hide="static-modal" id="btn-reserve" type="button" class="text-white bg-primary hover:bg-primary focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">예약</button>
                <button data-modal-hide="static-modal" id="btn-cancel" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100">취소</button>
            </div>
        </div>
    </div>
</div>
<!--모달창 끝-->
<script>
var page = 1;
var totalPage = 0;

const fnGetFacReserveList = () => {
    $.ajax({
      // 요청
      type: 'GET',
      url: '${contextPath}/reservation/getFacReserveList.do', 
      data: 'page=' + page,
      // 응답
      dataType: 'json',
      success: (resData) => {
          console.log(resData);
        totalPage = resData.totalPage;
        
        $.each(resData.getFacReserveList, (i, facility) => {
            let rentTerm = facility.rentTerm;
            let rentState;
            var rentPeriod;
            if(facility.facilityState === 0) {
                rentState = '대여 가능';
            } else if(facility.facilityState === 1) {
                rentState = '대여 불가';
            }
        
            
            if(facility.rentTerm === 0) {
                rentPeriod = '장기대여';
            } else {
                rentPeriod = '단기대여';
            }
            let str = '';
                str += '<div class="col-span-2"><p data-cat-name="' + facility.cat.catName + '" class="text-[#637381] dark:text-bodydark">' + facility.cat.catName + '</p></div>';
                str += '<div class="col-span-3"><p class="text-[#637381] dark:text-bodydark">' + facility.modelName + '</p></div>';
                str += '<div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">' + rentPeriod + '</p></div>';
                str += '<div class="col-span-1"><p class="text-[#637381] dark:text-bodydark">' + rentState + '</p></div>';
                str += '<div class="col-span-2 flex justify-end" data-cat-name="' + facility.cat.catName + '"><button data-facility-id="' + facility.facilityId + '" data-modal-target="static-modal" data-modal-toggle="static-modal" data-rent-Term="' + facility.rentTerm + '" class="text-primary border border-primary rounded px-2 py-1 open-modal">대여하기</p></div>';
                str += '</div>';
                $('#facreserve-list').append(str);
          });
          
        var modalstartDt = new Date().toISOString().substring(0,10);
        
        
            $(document).on('click', '.open-modal', function(event){
                console.log("나옴?");
                var facilityId = $(this).data('facilityId');
                var catName = $(this).parent().data('cat-name');
                var rentTerm = $(this).data('rent-term');
                console.log(facilityId);
                console.log(catName);
                console.log(rentTerm);
                
                var modalendDt= new Date(modalstartDt);
                $('#facilityId').val(facilityId);
                $('#catName').val(catName);
                $('#startDt').val(modalstartDt);
                $('#endDt').val(modalendDt);
                if(rentTerm === 0) {
                    modalendDt.setFullYear(modalendDt.getFullYear() + 1);
                } else {
                    modalendDt.setDate(modalendDt.getDate() + 7);
                }
                 var modalendDtISOString = modalendDt.toISOString().substring(0, 10);
                $('#endDt').val(modalendDtISOString);
            });
        
        
      },
      error: (jqXHR, textStatus, errorThrown) => {
          console.error('Error fetching facility reserve list:', textStatus, errorThrown);
          alert(jqXHR.statusText + '(' + jqXHR.status + ')');
      } 
    });
  }
  
const fnGetReserve = () => {
    $(document).on('click', '#btn-reserve', (evt) =>{
        evt.preventDefault();
        
        const selectedFacilityId = $('#facilityId').val();
        const requestData = {
                facilityId: selectedFacilityId,
                page: page
        };
        
        $.ajax({
            type:'POST',
            url:'${contextPath}/reservation/reservefac.do',
            data: requestData,
            dataType:'json',
            success: (resData) => {
            if(facility.rentTerm === 0) {
                rentPeriod = '장기대여';
            } else {
                rentPeriod = '단기대여';
            }
            const facilityreserve = $('#facilityreserve');
            const paging = $('#paging');
            paging.empty();
			facilityreserve.empty();
            
            $.each(resData.facilityReserve, (i, facility) => {
                let res = '';
                res += '<div class="grid grid-cols-10 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11">';
                res += ' <div class="col-span-3"><p class="text-[#637381] dark:text-bodydark">' + facility.cat.catName + '</p></div>';
                res += '<div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">' + rentPeriod + '</p></div>';
                res += '<div class="col-span-3"><p class="text-[#637381] dark:text-bodydark">' + facility.startDt + '</p></div>';
                res += '<div class="col-span-2"><button class="text-primary border border-primary bg-red rounded px-2 py-1">반납요망</button></div>';
                res += '</div>';
                facilityreserve.append(res);
                console.log(facility.facilityId);
    
            })
        }
        })
    })
}

fnGetReserve();


fnGetFacReserveList();

</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>
<jsp:include page="../layout/closer.jsp"/>
