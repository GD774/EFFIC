<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="dt" value="${currentTimestamp}"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<title>전자결재 메인 | TailAdmin - Tailwind CSS Admin Dashboard Template</title>

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

        <div class="col-span-12 rounded-sm border border-stroke bg-white p-4 shadow-default dark:border-strokedark dark:bg-boxdark">
            <div class="grid grid-cols-1 gap-2 sm:grid-cols-2 xl:grid-cols-4 xl:gap-2">
                <c:forEach items="${myDocList}" var="approval" varStatus="status"  begin="1" end="4">
                <c:if test="${approval.docState == 0 || approval.title != null}">
                    <div class="flex flex-col gap-1 border-b border-stroke pb-2 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
                        <div class="mb-0.5 text-lg text-black dark:text-white p-1">
                            
			                     <c:choose>
			                        <c:when test="${approval.docState == 0}">
			                            <p class="text-lg font-medium">진행</p>
			                        </c:when>
			                        <c:when test="${approval.docState == 1}">
			                            <p class="text-lg font-medium">결재</p>
			                        </c:when>
			                        <c:when test="${approval.docState == 2}">
			                            <p class="text-lg font-medium">반려</p>
			                        </c:when>
			                        <c:when test="${approval.docState == 3}">
			                            <p class="text-lg font-medium">임시저장</p>
			                        </c:when>
			                    </c:choose>                       
                        </div>
   											<br>
                        <div class="mb-0.5 text-lg text-black dark:text-white p-1">
                            <p class="text-lg font-medium">${approval.title}</p>
                        </div>
                        <div class="mb-0.5 text-lg text-black dark:text-white p-1">
                            <p class="text-lg font-medium">${user.name}</p>
                        </div>
                        <div class="mb-0.5 text-lg text-black dark:text-white p-1">
                            <p class="text-lg font-medium">${approval.writeDt}</p>
                        </div>
                    </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>

        <br>
        
        <div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
            <h4 class="mb-6 text-xl font-bold text-black dark:text-white">
                기안 문서
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
                        <h5 class="text-sm font-medium uppercase xsm:text-base">상태</h5>
                    </div>
                    <div class="p-2.5 text-center xl:p-5">
                        <h5 class="text-sm font-medium uppercase xsm:text-base">기안자</h5>
                    </div>
                </div>
                <div>
                    <c:forEach items="${myDocList}" var="approval" begin="0" end="3">
                        <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
                            <div class="flex items-center gap-3 p-2.5 xl:p-5">
                                <p class="text-black dark:text-white">${approval.writeDt}</p>
                            </div>
                            <div class="flex items-center justify-center p-2.5 xl:p-5">
                               <c:choose>
															  <c:when test="${approval.docTempCode == '1'}">
															  	<p class="text-[#637381] dark:text-bodydark">구매신청서</p>
															  </c:when>
															  <c:when test="${approval.docTempCode =='2'}">
															  	<p class="text-[#637381] dark:text-bodydark">휴가신청서</p>
															  </c:when>
															  <c:when test="${approval.docTempCode =='3'}">
															  	<p class="text-[#637381] dark:text-bodydark">지출결의서</p>
																</c:when>
															</c:choose>
                            </div>
                            <div class="flex items-center justify-center p-2.5 xl:p-5">
           										<c:choose>
                              <c:when test="${approval.urgent == 1}">
                                 <p class="inline-flex rounded-full bg-danger bg-opacity-10 px-3 py-1 text-sm font-medium text-danger">
            												  긴급
           											 </p>
                              </c:when>
                              <c:when test="${approval.urgent == 0}">
                               <p class="inline-flex rounded-full bg-meta-2 py-1 px-3 text-sm font-medium text-meta-3">
                                    일반
                                </p>
                              </c:when>
                                </c:choose>
                            </div>
                            <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
                                <p class="text-black dark:text-white">${approval.title}</p>
                            </div>
                            <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
                                <p class="inline-flex rounded-full bg-primary bg-opacity-10 py-1 px-3 text-sm font-medium text-primary">
                                    진행중
                                </p>
                            </div>
                            <div class="flex items-center justify-center p-2.5 xl:p-5">
                                <p class="text-meta-2">${user.name}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
				<br>
        <div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
            <h4 class="mb-6 text-xl font-bold text-black dark:text-white">
                결재 문서
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
                        <h5 class="text-sm font-medium uppercase xsm:text-base">상태</h5>
                    </div>
                    <div class="p-2.5 text-center xl:p-5">
                        <h5 class="text-sm font-medium uppercase xsm:text-base">기안자</h5>
                    </div>
                </div>
                <div>
                    <c:forEach items="${myAppDocList}" var="approval" varStatus="status" begin="0" end="3">
                        <div class="grid grid-cols-6 border-b border-stroke dark:border-strokedark sm:grid-cols-6">
                            <div class="flex items-center gap-3 p-2.5 xl:p-5">
                                <p class="text-black dark:text-white">${approval.writeDt}</p>
                            </div>
                               <c:choose>
															  <c:when test="${approval.docTempCode == '1'}">
															  	<p class="text-[#637381] dark:text-bodydark">구매신청서</p>
															  </c:when>
															  <c:when test="${approval.docTempCode =='2'}">
															  	<p class="text-[#637381] dark:text-bodydark">휴가신청서</p>
															  </c:when>
															  <c:when test="${approval.docTempCode =='3'}">
															  	<p class="text-[#637381] dark:text-bodydark">지출결의서</p>
																</c:when>
															</c:choose>
                            <div class="flex items-center justify-center p-2.5 xl:p-5">
           										<c:choose>
                              <c:when test="${approval.urgent == 1}">
                                 <p class="inline-flex rounded-full bg-danger bg-opacity-10 px-3 py-1 text-sm font-medium text-danger">
            												  긴급
           											 </p>
                              </c:when>
                              <c:when test="${approval.urgent == 0}">
                               <p class="inline-flex rounded-full bg-meta-2 py-1 px-3 text-sm font-medium text-meta-3">
                                    일반
                                </p>
                              </c:when>
                                </c:choose>
                            </div>
                            <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
                                <p class="text-black dark:text-white">${approval.title}</p>
                            </div>
                            <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
                                <p class="inline-flex rounded-full bg-primary bg-opacity-10 py-1 px-3 text-sm font-medium text-primary">
                                    진행중
                                </p>
                            </div>
                            <div class="flex items-center justify-center p-2.5 xl:p-5">
                                <p class="text-meta-3">${user.name}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../layout/closer.jsp"/>