<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<body>
<form id="frm-facility-modify" name="frm-facility-modify"
	  method="POST"	
	  action="${contextPath}/reservation/modifyfacility.do"
	  class="flex-1 overflow-y-auto max-h-screen">
  <div class="mx-auto max-w-screen-lg lg:p-10 lg:p-12">
    <div class="flex-1 rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
	  <div
	    class="border-b border-stroke py-4 dark:border-strokedark"
	  >
        <h3 class="font-medium text-black dark:text-white">
        공용물품 관리
        </h3>  
      </div>
    	<div class="p-6.5">     
   	 	<!--분류 시작-->
		   <div class="mb-5.5">
    		<label class="mb-3 block text-sm font-medium text-black dark:text-white">공용물품 코드</label>
    		<input
            type="text"
            name="facilityId"
    		value="${facility.facilityId}"
    		readonly
            class="w-1/4 rounded border-[1.5px] border-stroke bg-gray-200 px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
          />
		  </div>
	
        <!--분류 끝-->
        <div class="mb-5">
          <label
            class="mb-3 block text-sm font-medium text-black dark:text-white"
          >
          모델명
          </label>
          <input
            type="text"
            name="modelName"
    		value="${facility.modelName}"
    		readonly
            class="w-1/4 rounded border-[1.5px] border-stroke bg-gray-200 px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
          />
      	</div>
<script>
let writeName;
$(document).ready(function() {
    $('input[name="modelName"]').on(' input', function() {
        var writeName = $(this).val();
        console.log(writeName);
    });
});	      	
</script>
	    <!-- 모델명 끝 -->
	    <div class="mb-5">
	      <label
            class="mb-3 block text-sm font-medium text-black dark:text-white"
          >
          구입일
          </label>
		  <input
            type="text"
            name="buyDt"
    		value="${facility.buyDt}"
    		readonly
            class="w-1/4 rounded border-[1.5px] border-stroke bg-gray-200 px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter "
          />
		
		</div>
	  </div>
<script>
let dateValue;
$(document).ready(function() {
    $('input[name="datepicker"]').on('click', function() {
    	var dateValue = $(this).val();
    	console.log(dateValue);
    });
});
</script>
   <div class="mb-5 p-4" x-data="{ facilityState: ${facility.facilityState} }">
        <label
          for="facilityState"
          class="mb-4.5 block text-sm font-medium text-black dark:text-white"
        >
        사용 가능 여부
        </label>
        <div class="flex flex-wrap items-center gap-5.5">
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="facilityState"
                id="normal"
                value = 0
                x-model="facilityState"
                @change="isChecked = 'normal'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                 :class="facilityState == 0 ? 'border-primary': 'border-body'"
              >
                <span
                  :class="facilityState == 0 ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              정상
            </label>
          </div>
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="facilityState"
                id="fixing"
                value = 1
                x-model="facilityState"
                @change="isChecked = 'fixing'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="facilityState == 1 ? 'border-primary': 'border-body'"
              >
                <span
                  :class="facilityState == 1 ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              수리
            </label>
          </div>
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="facilityState"
                id="dispose"
                value = 2
                x-model="facilityState"
                @change="isChecked = 'dispose'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="facilityState == 2 ? 'border-primary': 'border-body'"
              >
                <span
                  :class="facilityState == 2 ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              폐기
            </label>
          </div>
        </div>
      </div>
<script>

let stateChecked;
$(document).ready(function() {
    $('input[name="facilityState"]').change(function() {
        var stateChecked = $('input[name="facilityState"]:checked').val();
        console.log(stateChecked);
    });
});
</script>
   	  <!--사용 가능 여부 체크 끝-->   
      <!--장기단기 체크-->
   <div class="mb-5 p-4" x-data="{ rentTerm: ${facility.rentTerm} }">
        <label
          for="rentTerm"
          class="mb-4.5 block text-sm font-medium text-black dark:text-white"
        >
          장기/단기 대여 물품 분류
        </label>
        <div class="flex flex-wrap items-center gap-5.5">
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="rentTerm"
                id="normal"
                value = 0
                x-model="rentTerm"
                @change="isChecked = 'normal'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                 :class="rentTerm == 0 ? 'border-primary': 'border-body'"
              >
                <span
                  :class="rentTerm == 0 ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              장기대여
            </label>
          </div>
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="rentTerm"
                id="fixing"
                value = 1
                x-model="rentTerm"
                @change="isChecked = 'fixing'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                 :class="rentTerm == 1 ? 'border-primary': 'border-body'"
              >
              <span
                  :class="rentTerm == 1 ? 'flex': 'hidden'"
                 class="h-2.5 w-2.5 rounded-full bg-primary"
              ></span>
              </span>
              단기대여
            </label>
          </div>
        </div>
      </div>
<script>
let rentChecked;
$(document).ready(function() {
    $('input[name="rentTerm"]').change(function() {
        var rentChecked = $('input[name="rentTerm"]:checked').val();
        console.log(rentChecked);
    });
});

</script>

      <!--장기 단기 체크 끝-->
	  <!--물품 담당자 지정-->
	  <div class="mb-5">
    	<label
          class="mb-3 block text-sm font-medium text-black dark:text-white"
    	>
        물품 담당자
    	</label>
    	<div class="flex items-center gap-2 sm:gap-4 lg:hidden">
      	<!-- Hamburger Toggle BTN -->
      	  <button
        	class="z-99999 block rounded-sm border border-stroke bg-white p-1.5 shadow-sm dark:border-strokedark dark:bg-boxdark lg:hidden"
        	@click.stop="sidebarToggle = !sidebarToggle"
      	  >
        	<span class="relative block h-5.5 w-5.5 cursor-pointer">
          	  <span class="du-block absolute right-0 h-full w-full">
                <span
              	  class="relative left-0 top-0 my-1 block h-0.5 w-0 rounded-sm bg-black delay-[0] duration-200 ease-in-out dark:bg-white"
              	  :class="{ '!w-full delay-300': !sidebarToggle }"
            	></span>
            	<span
              	  class="relative left-0 top-0 my-1 block h-0.5 w-0 rounded-sm bg-black delay-150 duration-200 ease-in-out dark:bg-white"
              	  :class="{ '!w-full delay-400': !sidebarToggle }"
            	></span>
            	<span
              	  class="relative left-0 top-0 my-1 block h-0.5 w-0 rounded-sm bg-black delay-200 duration-200 ease-in-out dark:bg-white"
              	  :class="{ '!w-full delay-500': !sidebarToggle }"
            	></span>
          	  </span>
          	<span class="du-block absolute right-0 h-full w-full rotate-45">
              <span
                class="absolute left-2.5 top-0 block h-full w-0.5 rounded-sm bg-black delay-300 duration-200 ease-in-out dark:bg-white"
                :class="{ '!h-0 delay-[0]': !sidebarToggle }"
              ></span>
              <span
                class="delay-400 absolute left-0 top-2.5 block h-0.5 w-full rounded-sm bg-black duration-200 ease-in-out dark:bg-white"
                :class="{ '!h-0 dealy-200': !sidebarToggle }"
              ></span>
            </span>
          </span>
        </button>
        
      	<!-- Hamburger Toggle BTN -->
        <a class="block flex-shrink-0 lg:hidden" href="index.html">
          <img src="src/images/logo/logo-icon.svg" alt="Logo" />
        </a>
      </div>
      
      <div class="hidden sm:block">
  
          <div class="relative">
            <button class="absolute left-0 top-1/2 -translate-y-1/2">
              <svg
                class="fill-body hover:fill-primary dark:fill-bodydark dark:hover:fill-primary"
                width="20"
                height="20"
                viewBox="0 0 20 20"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M9.16666 3.33332C5.945 3.33332 3.33332 5.945 3.33332 9.16666C3.33332 12.3883 5.945 15 9.16666 15C12.3883 15 15 12.3883 15 9.16666C15 5.945 12.3883 3.33332 9.16666 3.33332ZM1.66666 9.16666C1.66666 5.02452 5.02452 1.66666 9.16666 1.66666C13.3088 1.66666 16.6667 5.02452 16.6667 9.16666C16.6667 13.3088 13.3088 16.6667 9.16666 16.6667C5.02452 16.6667 1.66666 13.3088 1.66666 9.16666Z"
                  fill=""
                />
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M13.2857 13.2857C13.6112 12.9603 14.1388 12.9603 14.4642 13.2857L18.0892 16.9107C18.4147 17.2362 18.4147 17.7638 18.0892 18.0892C17.7638 18.4147 17.2362 18.4147 16.9107 18.0892L13.2857 14.4642C12.9603 14.1388 12.9603 13.6112 13.2857 13.2857Z"
                  fill=""
                />
              </svg>
            </button>
            <input
              type="text"
              placeholder="Type to search..."
              class="w-full bg-transparent pl-9 pr-4 focus:outline-none xl:w-125"
            />
          </div>
    
      </div>
	  <!--담당자 지정 끝-->
	<div class="flex flex-col gap-5.5 p-6.5">
      <div class="flex justify-between items-center">
      <!-- 버튼 -->
        <div class="flex gap-1 items-center">
          <button id="btn-modify" type="submit" class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">수정</button>
          <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5"><a href="${contextPath}/reservation/facilitymanage">취소</a></button>
          <button id="btn-remove" class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">삭제</button>
        </div>

    </div>
  </div>
</div>
</form>

<script>
$(document).ready(function() {
    const btnModify = document.getElementById('btn-modify');
    const btnRemove = document.getElementById('btn-remove');

    btnModify.addEventListener('click', function(evt) {
        // Modify 버튼 클릭 시 동작
        $('#frm-facility-modify').attr('action', '${contextPath}/reservation/modifyfacility.do');
        $('#frm-facility-modify').submit();
    });

    $('#btn-remove').on('click', function(evt) {
        // Remove 버튼 클릭 시 동작
        if (confirm('물품을 삭제하시겠습니까?')) {
            $('#frm-facility-modify').attr('action', '${contextPath}/reservation/removefacility.do');
            $('#frm-facility-modify').submit();
        }
    });
});
</script>


<!-- ===== Main Content End ===== -->
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<jsp:include page="../layout/closer.jsp"/>