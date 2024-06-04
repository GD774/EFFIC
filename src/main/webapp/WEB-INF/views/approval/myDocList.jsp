<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<title>기안문서함 | TailAdmin - Tailwind CSS Admin Dashboard Template</title>





<style>
    .filter-button {
        padding: 0.75rem 1rem;
        color: black;
        border-radius: 0.25rem;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .filter-button:hover {
        cursor: pointer;
        font-weight: bold; 
    }

    .new-request-button {
    	margin-bottom: 7px;
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

    .button-group {
        display: flex;
        gap: 0.5rem;
        align-items: center;
        margin-bottom: 10px;
    }

    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .table-section {
        margin-top: 10px;
    }

    .search-form-wrapper {
        display: flex;
        justify-content: center;
        margin: 20px 0;
    }

    .search-form {
        display: flex;
    }

    .dropdown-container {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #f9f9f9
    }

    .dropdown-container:hover .dropdown-content {
        display: block;
    }

    .dropdown-container:hover .dropbtn {
        background-color: #3c50e0;
        font-weight: bold;
    }
    
    .search-button {
        background-color: #f9f9f9;
        color: #333;
        transition: background-color 0.3s ease;
    }

    .search-button:hover {
        background-color: #1e3a8a;
        color: white;
    }
    
</style>
</head>

<body>


     <div class="flex h-screen overflow-hidden">
        <!-- Layout contents -->
    </div>

    <div class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">
        <main>
            <div class="mx-auto max-w-screen-2xl p-2 md:p-2 2xl:p-6">
                <div class="mb-3 flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
                    <h2 class="text-title-md2 font-bold text-black dark:text-white mt-4">기안문서함</h2>
                </div>

                <div class="flex items-center justify-between mb-3">
                    <!-- Tap 요소들과 Select 요소를 포함하는 Flex 컨테이너 -->
                    <div class="flex gap-3">
                        <div x-data="{ openTab: 1, activeClasses: 'text-primary border-primary', inactiveClasses: 'border-transparent' }">
                            <div class="flex gap-3 border-b border-stroke dark:border-strokedark sm:gap-5">
                                <a href="#" @click.prevent="openTab = 1" :class="openTab === 1 ? activeClasses : inactiveClasses" class="border-b-2 py-2 text-sm font-medium hover:text-primary md:text-base text-primary border-primary">
                                    전체
                                </a>
                                <a href="#" @click.prevent="openTab = 2" :class="openTab === 2 ? activeClasses : inactiveClasses" class="border-b-2 py-2 text-sm font-medium hover:text-primary md:text-base border-transparent">
                                    진행
                                </a>
                                <a href="#" @click.prevent="openTab = 3" :class="openTab === 3 ? activeClasses : inactiveClasses" class="border-b-2 py-2 text-sm font-medium hover:text-primary md:text-base border-transparent">
                                    반려
                                </a>
                                <a href="#" @click.prevent="openTab = 4" :class="openTab === 4 ? activeClasses : inactiveClasses" class="border-b-2 py-2 text-sm font-medium hover:text-primary md:text-base border-transparent">
                                    완료
                                </a>
                            </div>
                        </div>
                        <div class="relative z-20">
                            <select class="w-full appearance-none rounded border border-stroke bg-transparent py-2 pl-3 pr-10 outline-none transition focus:border-primary active:border-primary dark:border-form-strokedark dark:bg-form-input">
                                <option value="" class="text-body">20</option>
                                <option value="" class="text-body">30</option>
                                <option value="" class="text-body">40</option>
                            </select>
                        </div>
                    </div>
                    <button class="new-request-button" onclick="startNewRequest()">기안 작성</button>
                </div>

                <!-- ====== Table Section Start ===== -->
                <div class="flex flex-col gap-1">
                    <!-- ====== Table Four Start -->
                    <div class="overflow-hidden rounded-[10px]">
                        <div class="max-w-full overflow-x-auto">
                            <div class="min-w-[1170px]">
                                <!-- table header start -->
                                <div class="grid grid-cols-12 bg-[#F9FAFB] px-3 py-2 dark:bg-meta-4 lg:px-5 2xl:px-9">
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">기안일</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">완료일</h5>
                                    </div>
                                    <div class="col-span-2">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">결재양식</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">긴급</h5>
                                    </div>
                                    <div class="col-span-3">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">제목</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">첨부</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">기안부서</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">문서번호</h5>
                                    </div>
                                    <div class="col-span-1">
                                        <h5 class="font-bold text-[#637381] dark:text-bodydark">결재상태</h5>
                                    </div>
                                </div>
                                <!-- table header end -->

                                <!-- table body start -->
                                <div class="bg-white dark:bg-boxdark">
                                    <!-- table row item -->
                                    <c:forEach var="i" begin="1" end="20">
                                        <div class="grid grid-cols-12 border-t border-[#EEEEEE] px-3 py-2 dark:border-strokedark lg:px-5 2xl:px-9">
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">2024-06-<fmt:formatNumber value="${i}" pattern="00"/></p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">2024-06-<fmt:formatNumber value="${i + 14}" pattern="00"/></p>
                                            </div>
                                            <div class="col-span-2">
                                                <p class="text-[#637381] dark:text-bodydark">보고서</p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">중요</p>
                                            </div>
                                            <div class="col-span-3">
                                                <p class="text-[#637381] dark:text-bodydark">프로젝트 보고 ${i}</p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">${i}</p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">기술부서</p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">DOC-<fmt:formatNumber value="${1234 + i}" pattern="0000"/></p>
                                            </div>
                                            <div class="col-span-1">
                                                <p class="text-[#637381] dark:text-bodydark">승인</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <!-- table body end -->
                            </div>
                        </div>
                    </div>
                    <!-- ====== Table Four End -->

                    <!-- ====== Table Five Start -->
                    <div class="max-w-full overflow-x-auto">
                        <div class="min-w-[1170px]">

                        </div>
                    </div>
                    <!-- ====== Table Five End -->
                </div>
                <!-- ====== Table Section End -->
            </div> 
            
	<!-- 검색 폼 -->
    <form class="max-w-lg mx-auto">
        <div class="flex">
            <label for="search-dropdown" class="mb-2 text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
            <button id="dropdown-button" data-dropdown-toggle="dropdown" class="flex-shrink-0 z-10 inline-flex items-center py-2.5 px-4 text-sm font-medium text-center text-gray-900 bg-gray-100 border border-gray-300 rounded-s-lg hover:bg-gray-200 focus:ring-4 focus:outline-none focus:ring-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:focus:ring-gray-700 dark:text-white dark:border-gray-600" type="button">검색
                <svg class="w-2.5 h-2.5 ms-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
                </svg>
            </button>
            <div id="dropdown" class="z-10 hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
                <ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdown-button">
                    <li>
                        <button type="button" class="inline-flex w-full px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">제목</button>
                    </li>
                    <li>
                        <button type="button" class="inline-flex w-full px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">날짜</button>
                    </li>

                </ul>
            </div>
            <div class="relative w-full">
                <input type="search" id="search-dropdown" class="block p-2.5 w-full z-20 text-sm text-gray-900 bg-gray-50 rounded-e-lg border-s-gray-50 border-s-2 border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-s-gray-700  dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:border-blue-500" placeholder="검색 내용을 입력하세요." required />
                <button type="submit" class="search-button absolute top-0 end-0 p-2.5 text-sm font-medium h-full border border-blue-700 rounded-e-lg focus:ring-4 focus:outline-none focus:ring-blue-300">
                    <svg class="w-4 h-4" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                    </svg>
                    <span class="sr-only">Search</span>
                </button>
            </div>
        </div>
    </form>
   
            
        </main>
        <!-- ===== Main Content End ===== -->
    </div>
    <!-- ===== Content Area End ===== -->
</div>
<!-- ===== Page Wrapper End ===== -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js">


    function filterDocuments(status) {
        const rows = document.querySelectorAll('.document-row');

        rows.forEach(row => {
            const rowStatus = row.getAttribute('data-status');
            if (status === 'all' || rowStatus === status) {
                row.style.display = 'grid'; // 해당 행 표시
            } else {
                row.style.display = 'none'; // 해당 행 숨김
            }
        });
    }

</script>

</body>

<jsp:include page="../layout/closer.jsp"/>