<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

  <body>
   <div class="min-h-screen overflow-auto">
  <div class="container mx-auto p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6 2xl:p-8">
    <div class="mx-auto w-full max-w-full sm:max-w-screen-sm md:max-w-screen-md lg:max-w-screen-lg xl:max-w-screen-xl 2xl:max-w-7xl">
        <!-- Breadcrumb Start -->
        <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
          <h2 class="text-title-md2 font-bold text-black dark:text-white">
            회의실 이름
          </h2>
          <nav>
            <ol class="flex items-center gap-2">
              <li>
                <a class="font-medium" href="../user/main">메인 /</a>
              </li>
              <li class="text-primary">회의실 이름</li>
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
	    <span class="text-xl">2024.06.04 ~ 2024.06.10</span>
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
        <th class="h-12 rounded-tl-sm p-1 text-xs font-semibold sm:text-sm xl:p-2 w-1/10">
          <span class="hidden lg:block">회의실이름</span>
          <span class="block lg:hidden">회의실이름</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Sunday</span>
          <span class="block lg:hidden">Sun</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Monday</span>
          <span class="block lg:hidden">Mon</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Tuesday</span>
          <span class="block lg:hidden">Tue</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Wednesday</span>
          <span class="block lg:hidden">Wed</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Thursday</span>
          <span class="block lg:hidden">Thur</span>
        </th>
        <th class="h-12 p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Friday</span>
          <span class="block lg:hidden">Fri</span>
        </th>
        <th class="h-12 rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2">
          <span class="hidden lg:block">Saturday</span>
          <span class="block lg:hidden">Sat</span>
        </th>
      </tr>
    </thead>
    <tbody>
      <!-- Line 1 -->
      <tr>
		<td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
		  <a href="reserve1" class="flex items-center justify-center w-full h-full">
		    <span class="font-medium text-black">1층 소회의실</span>
		  </a>
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
       <tr>
		<td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
		  <a href="reserve2" class="flex items-center justify-center w-full h-full">
		    <span class="font-medium text-black">1층 대회의실</span>
		  </a>
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
		<td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
		  <a href="reserve3" class="flex items-center justify-center w-full h-full">
          <span class="font-medium text-black dark:text-white">3층 소회의실</span>
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
		<td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
		  <a href="reserve4" class="flex items-center justify-center w-full h-full">
          <span class="font-medium text-black dark:text-white">3층 대회의실</span>
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
		<td class="ease relative h-16 cursor-pointer border border-stroke p-1 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-20 md:p-3 xl:h-24">
		  <a href="reserve5" class="flex items-center justify-center w-full h-full">
          <span class="font-medium text-black dark:text-white">컨퍼런스 룸</span>
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
    </tbody>
  </table>
</div>
            <!-- ====== Calendar Section End -->
            
               <!-- ===== Main Content Start ===== -->
        <main>
          <div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
            <!-- Breadcrumb Start -->
            <div
              class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
            >
              <h6 class="text-title-md2 font-bold text-black dark:text-white">
                회의실 예약 현황
              </h6>
            </div>
            <!-- Breadcrumb End -->

            <!-- ====== Table Section Start -->
            <div class="flex flex-col gap-10">
              <!-- ====== Table Four Start -->
              <div class="overflow-hidden rounded-[10px]">
  <div class="max-w-full overflow-x-auto">
    <div class="min-w-[1170px]">
      <!-- table header start -->
      <div
        class="grid grid-cols-12 bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11"
      >
        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">회의실</h5>
        </div>

        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">반복여부</h5>
        </div>

        <div class="col-span-2">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">예약시간</h5>
        </div>
      </div>
      <!-- table header end -->

  <!-- table body start -->
  <div class="bg-white dark:bg-boxdark">
    <!-- table row item -->
    <div
      class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
    >
      <div class="col-span-3">
        <p class="text-[#637381] dark:text-bodydark">1층 1회의실</p>
      </div>

      <div class="col-span-3">
        <p class="text-[#637381] dark:text-bodydark">
          일반 예약
        </p>
      </div>
      <div class="col-span-2">
        <p class="text-[#637381] dark:text-bodydark"> 수 09:00 ~ 11:00</p>
      </div>

      <div class="col-span-1">
        <button class="float-right text-primary">취소</button>
      </div>
   </div>

    <!-- table row item -->
    <div
      class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
    >
      <div class="col-span-3">
        <p class="text-[#637381] dark:text-bodydark">컨퍼런스 룸</p>
      </div>

      <div class="col-span-3">
        <p class="text-[#637381] dark:text-bodydark">
          일반 예약
        </p>
      </div>

      <div class="col-span-2">
        <p class="text-[#637381] dark:text-bodydark">금 3:00 ~ 5:30</p>
      </div>

      <div class="col-span-1">
        <button class="float-right text-primary">취소</button>
      </div>
    </div>

    </div>

  <!-- ====== Table Four End -->
              
 <!-- Paging -->
 <div class="flex justify-center items-center rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
  <div class="p-4 sm:p-6 xl:p-7.5">
    <nav class="flex justify-center">
  	<ul class="flex flex-wrap items-center">
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center rounded-l-md border border-stroke hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	      >
	        <svg
	          class="fill-current"
	          width="8"
	          height="16"
	          viewBox="0 0 8 16"
	          fill="none"
	          xmlns="http://www.w3.org/2000/svg"
	        >
	          <path
	            d="M7.17578 15.1156C7.00703 15.1156 6.83828 15.0593 6.72578 14.9187L0.369531 8.44995C0.116406 8.19683 0.116406 7.80308 0.369531 7.54995L6.72578 1.0812C6.97891 0.828076 7.37266 0.828076 7.62578 1.0812C7.87891 1.33433 7.87891 1.72808 7.62578 1.9812L1.71953 7.99995L7.65391 14.0187C7.90703 14.2718 7.90703 14.6656 7.65391 14.9187C7.48516 15.0312 7.34453 15.1156 7.17578 15.1156Z"
	            fill=""
	          />
	        </svg>
	      </a>
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	        >1</a
	      >
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	        >2</a
	      >
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	        >3</a
	      >
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	        >4</a
	      >
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center border border-stroke border-l-transparent font-medium hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	        >5</a
	      >
	    </li>
	    <li class="inline-block">
	      <a
	        class="flex h-9 w-9 items-center justify-center rounded-r-md border border-stroke border-l-transparent hover:border-primary hover:bg-gray hover:text-primary dark:border-strokedark dark:hover:border-primary dark:hover:bg-graydark"
	        href="#"
	      >
	        <svg
	          class="fill-current"
	          width="8"
	          height="16"
	          viewBox="0 0 8 16"
	          fill="none"
	          xmlns="http://www.w3.org/2000/svg"
	        >
	          <path
	            d="M0.819531 15.1156C0.650781 15.1156 0.510156 15.0593 0.369531 14.9468C0.116406 14.6937 0.116406 14.3 0.369531 14.0468L6.27578 7.99995L0.369531 1.9812C0.116406 1.72808 0.116406 1.33433 0.369531 1.0812C0.622656 0.828076 1.01641 0.828076 1.26953 1.0812L7.62578 7.54995C7.87891 7.80308 7.87891 8.19683 7.62578 8.44995L1.26953 14.9187C1.15703 15.0312 0.988281 15.1156 0.819531 15.1156Z"
	            fill=""
	          />
	        </svg>
	      </a>
	    </li>
	   </ul>
	  </nav>
	</div>
   </div>
  <!--paging-->
 <!-- table body end -->
    </div>
  </div>
</div>

<jsp:include page="../layout/closer.jsp"/>
