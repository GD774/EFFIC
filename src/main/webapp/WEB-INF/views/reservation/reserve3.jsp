<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

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
            3층 소회의실
          </h2>
          <nav>
            <ol class="flex items-center gap-2">
              <li>
                <a class="font-medium" href="roomstatus">회의실 예약 현황 /</a>
              </li>
              <li class="text-primary">3층 소회의실</li>
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
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="w-40 ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
 				 <!-- Line 2 -->
       <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">10:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 2 -->
        <!-- Line 3 -->
       <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">11:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 3 -->
        <!-- Line 4 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">12:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 4 -->
        <!-- Line 5 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">13:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
        <!-- Line 5 -->
        <!-- Line 6 -->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">14:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 6 -->
      <!-- Line 7-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">15:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 7-->
      <!-- Line 8-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">16:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 8-->
      <!-- Line 9-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">17:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
      </tr>
      <!-- Line 9-->
      <!-- Line 10-->
      <tr>
        <td class="text-sm w-15 ease text-center relative h-16 border border-stroke p-1 transition duration-500 dark:border-strokedark md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white">18:00</span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
          <span class="font-medium text-black dark:text-white"></span>
        </td>
        <td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
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
<jsp:include page="../layout/closer.jsp"/>
    