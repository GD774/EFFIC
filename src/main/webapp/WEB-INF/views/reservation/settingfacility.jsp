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
<form id="frm-faciltiy-register"
	  method="POST"	
	  action="${contextPath}/reservation/registerFacility.do"
	  class="flex-1 overflow-y-auto max-h-screen">
  <div class="mx-auto max-w-screen-lg lg:p-10 lg:p-12">
    <div class="flex-1 rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
	  <div
	    class="border-b border-stroke py-4 dark:border-strokedark"
	  >
        <h3 class="font-medium text-black dark:text-white">
        공용물품 등록
        </h3>  
      </div>
    	<div class="p-6.5">     
   	 	<!--분류 시작-->
		   <div class="mb-5.5">
    		<label class="mb-3 block text-sm font-medium text-black dark:text-white">공용물품 분류</label>
    		<div x-data="{ selectedCategory: '', isOptionSelected: false }" class="relative z-20 bg-transparent dark:bg-form-input">
        	  <select id="mainCategory" x-model="selectedCategory" onchange="selectBoxChange(this.value)" @change="isOptionSelected = true" class="relative z-20 w-1/4 appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary">
            	<option id='mainCat' class="text-body">대분류</option>
            	<c:forEach var="mainCat" items="${mCatList}" varStatus="vs">
            		<option value="${mainCat.catCode}" class="text-body">${mainCat.catName}</option> 
            	</c:forEach>
        	  </select>
       	
        	  <select name="catCode" name="catCode" id="subCat" x-model="selectedCategory" @change="isOptionSelected = true" class="relative z-20 w-1/4 appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary">
              	  <option id="subCat" value="${subCat.catCode}" class="subList" class="text-body">소분류</option>
               </select> 
    		</div>
		  </div>
<script>
    let subcat = {<c:forEach var="c" items="${map}">${c.key}:[<c:forEach var="s" items="${c.value}">"${s.catName}",</c:forEach>],</c:forEach>};
    let slist;

    function selectBoxChange(sel) {
 		console.log(sel);      
		let slist = subcat[sel];
        let subCat = document.querySelector("#subCat");
        subCat.innerHTML = "";
        subCat.options.length=0
		for(let i=0;i<slist.length;i++){
			let option = document.createElement("option");
			option.innerText = slist[i];
			subCat.append(option)	
			
		}
		$(document).ready(function() {
		    $('#subCat').on('change', function() {
		    	var slist = $(this).val();
		    	console.log(slist);
		    });
		});

	}
</script>
	
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
    		value="${facilityMng.modelName}"
            placeholder="예)16Z90SP-KAOWK"
            class="w-1/4 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
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
	    <div class="relative max-w-sm">
		  <div class="w-0 h-0 absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
		    <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
		      <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"/>
		    </svg>
		  </div>
		  <input datepicker datepicker-buttons datepicker-autoselect-today
		  		 name="buyDt"
		  		 type="text" 
		  		 class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="00/00/1900">
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
  	  <div class="mb-5.5" x-data="{ isChecked: '' }">
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
                @change="isChecked = 'normal'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'normal' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'normal' ? 'flex': 'hidden'"
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
                @change="isChecked = 'fixing'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'fixing' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'fixing' ? 'flex': 'hidden'"
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
                @change="isChecked = 'dispose'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'dispose' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'dispose' ? 'flex': 'hidden'"
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
      <div class="mb-5.5" x-data="{ isChecked: '' }">
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
                @change="isChecked = 'normal'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'normal' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'normal' ? 'flex': 'hidden'"
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
                @change="isChecked = 'fixing'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'fixing' ? 'border-primary': 'border-body'"
              >
              <span
                 :class="isChecked === 'fixing' ? 'flex': 'hidden'"
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
  <div id="result" class="mb-5">물품코드
	<a href="#" onclick="getManageCode" class="inline-flex items-center justify-center rounded-full bg-primary px-2 py-1 text-center font-medium text-white hover:bg-opacity-90 lg:px-2 xl:px-2">
    생성
	</a>
 </div>
<script>
function getManageCode(event) {
	document.getElementById('result').innerText = 
		rentChecked;
		console.log(rentChecked);
}		
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
          <button id="btn-register" type="submit" class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">저장</button>
          <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5"><a href="${contextPath}/reservation/facilitymanage">취소</a></button>
          <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">삭제</button>
        </div>

    </div>
  </div>
</div>
</form>
<script>

const fnRegisterFacility = () => {
	if(document.getElementById('mainCategory').value === '') {
		
	} else if(document.getElementById('subCategory').value === '') {
		
	} else if(document.getElementById('modelName').value === '') {
		
	}
}


fnRegisterFacility();
</script>

<!-- ===== Main Content End ===== -->
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<jsp:include page="../layout/closer.jsp"/>