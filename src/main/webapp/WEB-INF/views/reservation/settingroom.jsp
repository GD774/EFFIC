<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<main class="flex-1 p-4 overflow-y-auto max-h-screen">
    <div class="mx-auto max-w-screen-lg lg:p-10 lg:p-12">
<!-- Survey Form -->
<div
   class="flex-1 rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
>
  <div
    class="border-b border-stroke py-4 dark:border-strokedark"
  >
    <h3 class="font-medium text-black dark:text-white">
      회의실 등록
    </h3>
  </div>
  <form action="#">
    <div class="p-6.5">
      <div class="mb-5">
        <label
          class="mb-3 block text-sm font-medium text-black dark:text-white"
        >
          회의실 이름
        </label>
        <input
          type="text"
          placeholder="신규로 등록할 회의실을 입력하세요."
          class="w-1/2 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
        />
      </div>

	  <div class="mb-5.5" x-data="{ isChecked: '' }">
        <label
          class="mb-4.5 block text-sm font-medium text-black dark:text-white"
        >
          회의실 상태
        </label>

        <div class="flex flex-col gap-2.5">
          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                @change="isChecked = 'Yes'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'Yes' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'Yes' ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              사용가능
            </label>
          </div>

          <div>
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                @change="isChecked = 'No'"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked === 'No' ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked === 'No' ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              사용불가
            </label>
          </div>

        </div>
      </div>

	  <div class="mb-5">
	    <label
	      class="mb-3 block text-sm font-medium text-black dark:text-white"
	    >
                  가용 시간
       </label>
		<!--TimePicker-->
		<form class="max-w-[16rem] mx-auto flex grid grid-cols-2 gap-4">
		    <div class="flex flex-col w-2/3">
		        <label for="start-time" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
		                <svg class="w-0 h-0 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
		                    <path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm11-4a1 1 0 1 0-2 0v4a1 1 0 0 0 .293.707l3 3a1 1 0 0 0 1.414-1.414L13 11.586V8Z" clip-rule="evenodd"/>
		                </svg>
		            <input type="time" id="start-time" class="bg-gray-50 border leading-none border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/4 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" min="09:00" max="18:00" value="09:00" required />
		        </label>
		    </div>
		    <div class="flex flex-col w-2/3">
		        <label for="end-time" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
		                <svg class="w-0 h-0 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
		                    <path fill-rule="evenodd" d="M2 12C2 6.477 6.477 2 12 2s10 4.477 10 10-4.477 10-10 10S2 17.523 2 12Zm11-4a1 1 0 1 0-2 0v4a1 1 0 0 0 .293.707l3 3a1 1 0 0 0 1.414-1.414L13 11.586V8Z" clip-rule="evenodd"/>
		                </svg>
		            <input type="time" id="end-time" class="bg-gray-50 border leading-none border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/4 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" min="09:00" max="18:00" value="18:00" required/>
				</label>
			</div>
		</form>
		<!--TimePicker End-->
		 </div>

       <div class="mb-6">
        <label
          class="mb-4.5 block text-sm font-medium text-black dark:text-white"
        >
          사용 가능 요일
        </label>

        <div class="flex gap-10">
          <div x-data="{ isChecked: false }">
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                @change="isChecked = true"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              일
            </label>
          </div>

		<div x-data="{ isChecked: true }">
		  <label
		    class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
		  >
		    <input
		      class="sr-only"
		      type="radio"
		      name="roleSelect"
		      id="Logo"
		      x-model="isChecked"
		      @click="isChecked = !isChecked"
		    />

              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              월
            </label>
          </div>

		<div x-data="{ isChecked: true }">
		  <label
		    class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
		  >
		    <input
		      class="sr-only"
		      type="radio"
		      name="roleSelect"
		      id="Logo"
		      x-model="isChecked"
		      @click="isChecked = !isChecked"
		    />

              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              화
            </label>
          </div>

		<div x-data="{ isChecked: true }">
		  <label
		    class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
		  >
		    <input
		      class="sr-only"
		      type="radio"
		      name="roleSelect"
		      id="Logo"
		      x-model="isChecked"
		      @click="isChecked = !isChecked"
		    />
		    <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              수
            </label>
          </div>

		<div x-data="{ isChecked: true }">
		  <label
		    class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
		  >
		    <input
		      class="sr-only"
		      type="radio"
		      name="roleSelect"
		      id="Logo"
		      x-model="isChecked"
		      @click="isChecked = !isChecked"
		    />

              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              목
            </label>
          </div>

		<div x-data="{ isChecked: true }">
		  <label
		    class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
		  >
		    <input
		      class="sr-only"
		      type="radio"
		      name="roleSelect"
		      id="Logo"
		      x-model="isChecked"
		      @click="isChecked = !isChecked"
		    />
		    <span
		      class="flex h-5 w-5 items-center justify-center rounded-full border"
		      :class="isChecked ? 'border-primary': 'border-body'"
		    >
		      <span
		        :class="isChecked ? 'flex': 'hidden'"
		        class="h-2.5 w-2.5 rounded-full bg-primary"
		      ></span>
		    </span>
		    금
		  </label>
		</div>

          <div x-data="{ isChecked: false }">
            <label
              class="relative flex cursor-pointer select-none items-center gap-2 text-sm font-medium text-black dark:text-white"
            >
              <input
                class="sr-only"
                type="radio"
                name="roleSelect"
                id="Logo"
                @change="isChecked = true"
              />
              <span
                class="flex h-5 w-5 items-center justify-center rounded-full border"
                :class="isChecked ? 'border-primary': 'border-body'"
              >
                <span
                  :class="isChecked ? 'flex': 'hidden'"
                  class="h-2.5 w-2.5 rounded-full bg-primary"
                ></span>
              </span>
              토
            </label>
          </div>
        </div>
      </div>

      <div class="mb-5">
		<form class="max-w-sm">
		    <label
         	 class="mb-3 block text-sm font-medium text-black dark:text-white"
        	 >  가용인원 </label>
		    <input type="number" id="number-input" aria-describedby="helper-text-explanation" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/5 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="00" required />
		</form>
      </div>

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
                회의실 삭제
            </label>
             <p class="text-sm">
        자산에 대한 모든 데이터를 삭제합니다.
    </p>
        </div>
    </div>
    <!-- 삭제 안내 -->
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- ====== Form Layout Section End -->
  </div>
</main>
<!-- ===== Main Content End ===== -->
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
<jsp:include page="../layout/closer.jsp"/>
