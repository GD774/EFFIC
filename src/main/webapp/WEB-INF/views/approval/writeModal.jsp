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


<title>기안작성 | TailAdmin - Tailwind CSS Admin Dashboard Template</title>

</head>

<body>
  <!-- 새 결재 진행 모달창 --> 
<div class="flex justify-end">
    <div x-data="{ modalOpen: false, redirectToPage() {
                    var selectBox = document.getElementById('options');
                    var selectedValue = selectBox.value;
                    
                    if (selectedValue === 'option2') {
                        // Replace with your actual context path and JSP file name
                        window.location.href = '${contextPath}/approval/writeDoc.page';
                    } else {
                        alert('문서 양식을 선택해주세요.');
                    }
                }}" x-init="modalOpen = false">
        <button @click="modalOpen = true"
                class="rounded-md bg-primary px-9 py-3 font-medium text-white">
            기안작성
        </button>
        <div x-show="modalOpen"
             x-transition
             class="fixed left-0 top-0 z-999999 flex h-full min-h-screen w-full items-center justify-center bg-black/90 px-4 py-5">
            <div @click.outside="modalOpen = false"
                 class="w-full max-w-142.5 rounded-lg bg-white px-8 py-12 text-center dark:bg-boxdark md:px-17.5 md:py-15">
                <h3 class="pb-2 text-xl font-bold text-black dark:text-white sm:text-2xl">
                    새 결재 진행
                </h3>
                <span class="mx-auto mb-6 inline-block h-1 w-22.5 rounded bg-primary"></span>
                <p class="mb-10 font-medium">

                </p>
                <!-- Select Box -->
                <div class="mb-10">
                    <label for="options"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">문서양식 선택</label>
                    <select id="options"
                            class="block w-full p-2.5 border border-gray-300 rounded-lg bg-gray-50 focus:ring-primary focus:border-primary dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:focus:ring-primary dark:focus:border-primary">
                        <option value="option1">문서양식을 선택하세요</option>
                        <option value="option2">구매신청서</option>
                        <option value="option3">휴가신청서</option>
                        <option value="option4">지출결의서</option>
                    </select>
                </div>
                <div class="-mx-3 flex flex-wrap gap-y-4">
                    <div class="w-full px-3 2xsm:w-1/2">
                        <button @click="modalOpen = false"
                                class="block w-full rounded border border-stroke bg-gray p-3 text-center font-medium text-black transition hover:border-meta-1 hover:bg-meta-1 hover:text-white dark:border-strokedark dark:bg-meta-4 dark:text-white dark:hover:border-meta-1 dark:hover:bg-meta-1">
                            취소
                        </button>
                    </div>
                    <div class="w-full px-3 2xsm:w-1/2">
                        <button @click="redirectToPage()"
                                class="block w-full rounded border border-primary bg-primary p-3 text-center font-medium text-white transition hover:bg-opacity-90">
                            작성하러 가기
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ===== Main Content End ===== -->

<!-- ===== Content Area End ===== -->

<!-- ===== Page Wrapper End ===== -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

<script>



</script>

</body>

