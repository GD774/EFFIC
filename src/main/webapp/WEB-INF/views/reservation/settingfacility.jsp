<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calendar | TailAdmin - Tailwind CSS Admin Dashboard Template</title>
    <link rel="icon" href="${contextPath}/css/favicon.ico">
    <link href="${contextPath}/css/globalstyle.css" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
  	
  	 <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
  </head>
  <body>
    <div class="flex min-h-screen">
     <div>
      <jsp:include page="../layout/sidebar.jsp" />
     </div>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>
    <!-- Survey Form -->
        <div
		   class="flex-1 rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
        >
          <div
            class="border-b border-stroke px-6.5 py-4 dark:border-strokedark"
          >
            <h3 class="font-medium text-black dark:text-white">
              공용물품 등록
            </h3>
          </div>
   <form action="#">
    <div class="p-6.5">     
   	 <!--분류 시작-->
<div class="mb-5.5">
    <label class="mb-3 block text-sm font-medium text-black dark:text-white">공용물품 분류</label>
    <div x-data="{ selectedCategory: '', isOptionSelected: false }" class="relative z-20 bg-transparent dark:bg-form-input">
        <select x-model="selectedCategory" @change="isOptionSelected = true" class="relative z-20 w-1/4 appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary">
            <option value="" class="text-body">대분류</option>
            <option value="machinery" class="text-body">기계</option>
            <option value="consumables" class="text-body">소모품</option>
        </select>
        <select x-show="selectedCategory || isOptionSelected" class="relative z-20 w-1/4 appearance-none rounded border border-stroke bg-transparent px-5 py-3 outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input dark:focus:border-primary">
            <template x-for="subcategory in subcategories[selectedCategory]" :key="subcategory">
                <option x-text="subcategory" class="text-body"></option>
            </template>
        </select>
        <span x-show="!selectedCategory && !isOptionSelected" class="absolute right-4 top-1/2 z-30 -translate-y-1/2">
            <svg class="fill-current" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <g opacity="0.8">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M5.29289 8.29289C5.68342 7.90237 6.31658 7.90237 6.70711 8.29289L12 13.5858L17.2929 8.29289C17.6834 7.90237 18.3166 7.90237 18.7071 8.29289C19.0976 8.68342 19.0976 9.31658 18.7071 9.70711L12.7071 15.7071C12.3166 16.0976 11.6834 16.0976 11.2929 15.7071L5.29289 9.70711C4.90237 9.31658 4.90237 8.68342 5.29289 8.29289Z" fill=""></path>
                </g>
            </svg>
        </span>
    </div>
</div>
<script>
    const subcategories = {
        machinery: ['노트북', '빔 프로젝터'],
        consumables: ['마우스', '마우스패드']
    };
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
          placeholder="예)16Z90SP-KAOWK"
          class="w-1/4 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
        />
      </div>
      
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
		  <input datepicker datepicker-buttons datepicker-autoselect-today type="text" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="00/00/1900">
		</div>
	  </div>
      
      
      
      

  	 <div class="mb-5.5" x-data="{ isChecked: '' }">
        <label
          for="roleSelect"
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
                name="roleSelect"
                id="normal"
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
                name="roleSelect"
                id="fixing"
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
                name="roleSelect"
                id="dispose"
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
	<!--물품 담당자 지정-->
	 <div class="mb-5">
    <label
      class="mb-3 block text-sm font-medium text-black dark:text-white"
    >
      물품 담당자
    </label>
	<form class="max-w-md mx-auto">   
	    <label for="default-search" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
	    <div class="relative w-1/4">
	        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
	            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
	                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
	            </svg>
	        </div>
	        <input type="search" id="default-search" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="직원 검색" required />
	        <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">찾기</button>
	    </div>
	</form>
	</div>
	<!--담당자 지정 끝-->
	
	<div class="flex flex-col gap-5.5 p-6.5">
    <div class="flex justify-between items-center">
        <!-- 버튼 -->
        <div class="flex gap-1 items-center">
            <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">저장</button>
            <button class="flex justify-start rounded bg-primary py-1 px-4 font-medium text-gray hover:bg-opacity-90 w-4/5">취소</button>
        </div>

        <!-- 삭제 여부 -->
        <div x-data="{ checkboxToggle: false }" class="ml-auto">
            <label for="checkboxLabelOne" class="flex cursor-pointer select-none items-center text-sm font-medium">
                <div class="relative">
                    <input type="checkbox" id="checkboxLabelOne" class="sr-only" @change="checkboxToggle = !checkboxToggle" />
                    <div :class="checkboxToggle && 'border-primary bg-gray dark:bg-transparent'" class="mr-4 flex h-5 w-5 items-center justify-center rounded border">
                        <span :class="checkboxToggle && 'bg-primary'" class="h-2.5 w-2.5 rounded-sm"></span>
                    </div>
                </div>
                공용물품 삭제
            </label>
             <p class="text-sm">
        자산에 대한 모든 데이터를 삭제합니다.
    </p>
        </div>
    </div>
    <!-- 삭제 안내 -->
   
	</div>
	 </div>
	 
    </div>
  </form>
  </div>
 </div>
 </div>
 <!-- ====== Form Layout Section End -->
</div>
</main>
<!-- ===== Main Content End ===== -->

