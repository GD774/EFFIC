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
       	
        	  <select name="catCode" id="subCat" x-model="selectedCategory" @change="isOptionSelected = true" class="relative z-20 w-1/4 appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary">
              	  <option  class="subList" class="text-body">소분류</option>
               </select> 
    		</div>
		  </div>
<script>

    let subcat = {
    		<c:forEach var="c" items="${map}">
    			${c.key}:[
    				<c:forEach var="s" items="${c.value}">
    				"${s.catName}",</c:forEach>],
    		</c:forEach>
    			};

    let subcatCode = {
            <c:forEach var="c" items="${map}">
               ${c.key}:[
                  <c:forEach var="s" items="${c.value}">
                  "${s.catCode}",</c:forEach>],
            </c:forEach>
               };
    
    function selectBoxChange(sel) {
 		console.log(sel);
 		console.log(subcat)
 		console.log(subcatCode)
 
		let slist = subcat[sel];
 	    let slistCode = subcatCode[sel];
 	    
        let subCat = document.querySelector("#subCat");
        subCat.innerHTML = "";
        subCat.options.length=0
		
        for(let i=0;i<slist.length;i++){
			let option = document.createElement("option");
			option.innerText = slist[i];
			option.value = slistCode[i];
			
			subCat.append(option)	
			console.log(slist[i])
			console.log(slistCode[i])
			
		}
		$(document).ready(function() {
		    $('#subCat').on('change', function() {
		    //	var slist = $(this);
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
		  		 value="${facilityMng.buyDt}"
		  		 class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="00/00/1900">
		</div>
	  </div>
<script>
$(document).ready(function() {
    $('input[name="buyDt"]').on('click', function() {
    	var dateValue = $(this).val();
    	console.log(dateValue);
    });
});
</script>
<!-- 사용가능 여부 시작 -->
<div class="mb-5 p-4" x-data="{ isChecked: 'normal' }"> 
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
    <!--사용 가능 여부 체크 끝-->   
    <!--장기단기 체크-->
    <div class="mb-5 p-4" x-data="{ isChecked: 'long' }"> 
        <label
          for="rentTerm"
          class="mb-4.5 block text-sm font-medium text-black dark:text-white"
        >
          장기/단기 대여 물품 분류
        </label>
        <div class="flex flex-wrap items-center gap-5.5">
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black"
            >
              <input
                class="sr-only"
                type="radio"
                name="rentTerm"
                id="long"
                value = 0
                @change="isChecked = 'long'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked == 'long' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked == 'long' ? 'flex': 'hidden'"
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
                id="short"
                value = 1
                @change="isChecked = 'short'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked == 'short' ? 'border-primary': 'border-body'"
              >
              <span
                 :class="isChecked == 'short' ? 'flex': 'hidden'"
                 class="h-2.5 w-2.5 rounded-full bg-primary"
              ></span>
              </span>
              단기대여
            </label>
          </div>
        </div>
      </div>
      <!--장기 단기 체크 끝-->
	 
	<div class="flex flex-col gap-5.5 p-6.5">
      <div class="flex justify-between items-center">
      <!-- 버튼 -->
        <div class="flex gap-1 items-center">
          <button id="btn-register" type="submit" class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">저장</button>
          <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5"><a href="${contextPath}/reservation/facilitymanage">취소</a></button>
        </div>

    </div>
  </div>
</div>
</form>
<script>


fnRegisterFacility();
</script>

<!-- ===== Main Content End ===== -->
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<jsp:include page="../layout/closer.jsp"/>