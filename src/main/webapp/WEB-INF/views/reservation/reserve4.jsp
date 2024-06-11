<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>
<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<body>
  <main class="flex-1 p-4 overflow-auto">
    <!-- 스케줄러 시작 -->
    <div class="mx-auto max-w-full p-2 md:p-3 2xl:p-5">
      <div class="mx-auto max-w-7xl bg-gray-100 p-4">
        <!-- Breadcrumb Start -->
        <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <h2 class="text-title-md2 font-bold text-black dark:text-white">
            3층 대회의실
          </h2>
          <nav>
            <ol class="flex items-center gap-2">
              <li>
                <a class="font-medium" href="roomstatus">회의실 예약 현황 /</a>
              </li>ㅋ
              <li class="text-primary">3층 대회의실</li>
            </ol>
          </nav>
        </div>
        <!-- Breadcrumb End -->

	<!--날짜 선택 화살표-->
	
	<div
  class="flex items-center justify-center border-t border-stroke p-4 dark:border-strokedark sm:px-6"
	>
	  <div class="flex items-center space-x-3">
	    <button
	      class="flex h-7.5 w-7.5 items-center justify-center rounded border border-stroke bg-white hover:border-primary hover:bg-primary hover:text-white"
	    >
	      <svg
	        width="18"
	        height="18"
	        viewBox="0 0 18 18"
	        fill="none"
	        xmlns="http://www.w3.org/2000/svg"
	      >
	        <path
	          d="M14.25 10C14.8023 10 15.25 9.55228 15.25 9C15.25 8.44771 14.8023 8 14.25 8L14.25 10ZM3.75 9L3.04289 8.29289C2.65237 8.68342 2.65237 9.31658 3.04289 9.70711L3.75 9ZM8.29289 14.9571C8.68342 15.3476 9.31658 15.3476 9.70711 14.9571C10.0976 14.5666 10.0976 13.9334 9.70711 13.5429L8.29289 14.9571ZM9.7071 4.45711C10.0976 4.06658 10.0976 3.43342 9.7071 3.04289C9.31658 2.65237 8.68342 2.65237 8.29289 3.04289L9.7071 4.45711ZM14.25 8L3.75 8L3.75 10L14.25 10L14.25 8ZM9.70711 13.5429L4.4571 8.29289L3.04289 9.70711L8.29289 14.9571L9.70711 13.5429ZM4.4571 9.70711L9.7071 4.45711L8.29289 3.04289L3.04289 8.29289L4.4571 9.70711Z"
	          fill="currentColor"
	        />
	      </svg>
	    </button>
	    <button
	      class="flex h-7.5 w-7.5 items-center justify-center rounded border border-stroke bg-white hover:border-primary hover:bg-primary hover:text-white"
	    >
	      <svg
	        width="18"
	        height="18"
	        viewBox="0 0 18 18"
	        fill="none"
	        xmlns="http://www.w3.org/2000/svg"
	      >
	        <path
	          d="M3.75 8C3.19772 8 2.75 8.44772 2.75 9C2.75 9.55229 3.19772 10 3.75 10V8ZM14.25 9L14.9571 9.70711C15.3476 9.31658 15.3476 8.68342 14.9571 8.29289L14.25 9ZM9.70711 3.04289C9.31658 2.65237 8.68342 2.65237 8.29289 3.04289C7.90237 3.43342 7.90237 4.06658 8.29289 4.45711L9.70711 3.04289ZM8.29289 13.5429C7.90237 13.9334 7.90237 14.5666 8.29289 14.9571C8.68342 15.3476 9.31658 15.3476 9.70711 14.9571L8.29289 13.5429ZM3.75 10H14.25V8H3.75V10ZM8.29289 4.45711L13.5429 9.70711L14.9571 8.29289L9.70711 3.04289L8.29289 4.45711ZM13.5429 8.29289L8.29289 13.5429L9.70711 14.9571L14.9571 9.70711L13.5429 8.29289Z"
	          fill="currentColor"
	        />
	      </svg>
	    </button>
	  </div>
	</div>

	<!--날짜 선택 화살표 끝-->

            <!-- ====== Calendar Section Start -->
<div class="w-full max-w-full rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
  <table class="w-full">
    <thead>
<tr class="bg-primary text-white">
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block"></span>
    <span class="block lg:hidden"></span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Sunday</span>
    <span class="block lg:hidden">Sun</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Monday</span>
    <span class="block lg:hidden">Mon</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Tuesday</span>
    <span class="block lg:hidden">Tue</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Wednesday</span>
    <span class="block lg:hidden">Wed</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Thursday</span>
    <span class="block lg:hidden">Thur</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Friday</span>
    <span class="block lg:hidden">Fri</span>
  </th>
  <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/7">
    <span class="hidden lg:block">Saturday</span>
    <span class="block lg:hidden">Sat</span>
  </th>
</tr>
    </thead>
    <tbody>
      <!-- Line 1 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">09:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
 				 <!-- Line 2 -->
       <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">10:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 2 -->
        <!-- Line 3 -->
       <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">11:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 3 -->
        <!-- Line 4 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">12:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 4 -->
        <!-- Line 5 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">13:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 5 -->
        <!-- Line 6 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">14:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 6 -->
      <!-- Line 7-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">15:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 7-->
      <!-- Line 8-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">16:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 8-->
      <!-- Line 9-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">17:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 9-->
      <!-- Line 10-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">18:00</span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td data-modal-target="static-modal" data-modal-toggle="static-modal"
        	class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 10-->
    </tbody>
  </table>
</div>
            <!-- ====== Calendar Section End -->
            
 
<!--스케줄러 끝-->
   </div>
  </div>
 </div>
<!-- ===== Main Content End ===== -->
        <!--모달창 시작-->
<!-- Main modal -->
<div id="static-modal" data-modal-backdrop="static" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    회의실 예약
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="static-modal">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>
            <!-- Modal body -->
            <div class="p-4 md:p-5 space-y-4">
                <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
<!-- 날짜/시간 선택 시작 -->
<div class="flex items-center space-x-4 mt-5">
    <h6 class="mb-0 text-sm">예약일시</h6>
    <div
        x-data
        x-init="flatpickr($refs.startdatetimewidget, {wrap: true, enableTime: true, dateFormat: 'M j, Y h:i K', minuteIncrement: 30}); flatpickr($refs.enddatetimewidget, {wrap: true, enableTime: true, dateFormat: 'M j, Y h:i K', minuteIncrement: 30});"
        class="flex items-center space-x-4"
    >
        <!-- 시작 날짜/시간 선택기 -->
        <div x-ref="startdatetimewidget" class="flatpickr container">
            <div class="flex items-center">
                <input
                    x-ref="startdatetime"
                    type="text"
                    id="startdatetime"
                    data-input
                    placeholder="Date/Time"
                    class="block w-40 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-l-md shadow-sm text-xs"
                >
                <a
                    class="h-8.5 w-10 input-button cursor-pointer rounded-r-md bg-transparent border-gray-300 border-t border-b border-r"
                    title="clear" data-clear
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-7 mt-2 ml-1" viewBox="0 0 20 20" fill="#c53030">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"/>
                    </svg>
                </a>
            </div>
        </div>

        <!-- 끝 날짜/시간 선택기 -->
        <div x-ref="enddatetimewidget" class="flatpickr container">
            <div class="flex items-center">
                <input
                    x-ref="enddatetime"
                    type="text"
                    id="enddatetime"
                    data-input
                    placeholder="Date/Time"
                    class="block w-40 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-l-md shadow-sm text-xs"
                >
                <a
                    class="h-8.5 w-10 input-button cursor-pointer rounded-r-md bg-transparent border-gray-300 border-t border-b border-r"
                    title="clear" data-clear
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-7 mt-2 ml-1" viewBox="0 0 20 20" fill="#c53030">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"/>
                    </svg>
                </a>
            </div>
        </div>
    </div>
</div>
<!--날짜/시간 선택 끝-->
<!--예약자입력칸-->
    <div class="flex items-center mb-4">
      <label
        class="mb-3 block font-medium mr-8 text-sm"
      >
		예약자
      </label>
      <input
        type="text"
        placeholder="예약자명"
        class="block w-40 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-lg shadow-sm text-xs"
      />
    </div>
<!--예약자입력끝-->
<!--예약목적입력-->
 <div class="flex items-center mb-4">
      <label
        class="mb-3 block font-medium mr-4 text-sm"
      >
		예약목적
      </label>
      <input
        type="text"
        placeholder="예약목적입력"
        class="block w-80 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-lg shadow-sm text-xs"
      />
    </div>
<!--예약목적입력끝-->
                </p>
                <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
<!--참석자 리스트-->
 <div class="flex items-center mb-4">
  <label
    class="mb-3 block font-medium mr-8 text-sm"
  >
	참석자
  </label>
      <div class="flex items-center gap-2.5">
    <input
      type="text"
      name="taskList"
      id="taskList"
      placeholder="참석자 리스트 입력"
      class="block w-80 px-2 border-gray-300 focus:border-indigo-300 focus:ring focus:ring-indigo-200 focus:ring-opacity-50 rounded-lg shadow-sm text-xs"
    />

    <button
      class="flex h-8.5 w-8.5 text-xl items-center justify-center rounded-sm border border-stroke bg-white p-4 hover:text-primary rounded-lg"
    >
      -
        <path
          d="M18.4375 10.7187H1.5625C1.1875 10.7187 0.84375 10.4062 0.84375 10C0.84375 9.625 1.15625 9.28125 1.5625 9.28125H18.4375C18.8125 9.28125 19.1562 9.59375 19.1562 10C19.1562 10.375 18.8125 10.7187 18.4375 10.7187Z"
          fill=""
        />
      </svg>
    </button>
    <button
      class="flex h-8.5 w-8.5 text-xl items-center justify-center rounded-sm border border-stroke bg-white p-4 hover:text-primary rounded-lg"
    >
      +
    </button>
  </div>
</div>   
<!--참석자 리스트 끝-->                
                </p>
            </div>
            <!-- Modal footer -->
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b">
                <button data-modal-hide="static-modal" type="button" class="text-white bg-primary hover:bg-primary focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">예약</button>
                <button data-modal-hide="static-modal" type="button" class="py-2.5 px-5 ms-3 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700">취소</button>
            </div>
        </div>
    </div>
</div>

	        <!--모달창 끝-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js"></script>

<jsp:include page="../layout/closer.jsp"/>
    