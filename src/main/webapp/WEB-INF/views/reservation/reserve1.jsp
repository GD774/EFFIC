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
  </head>
     <body>
    <div class="flex min-h-screen">
      <div>
      <jsp:include page="../layout/sidebar.jsp" />
   </div>

  	<!-- ===== Main Content Start ===== -->
  <main class="flex-1 p-4">
  <div class="mx-auto max-w-full p-2 md:p-3 2xl:p-5">
    <div class="mx-auto max-w-7xl">
		<!-- Breadcrumb Start -->
    <div
      class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
    >
      <h2 class="text-title-md2 font-bold text-black dark:text-white">
        회의실1
      </h2>

      <nav>
        <ol class="flex items-center gap-2">
          <li>
            <a class="font-medium" href="./reservestatus">회의실 현황/</a>
          </li>
          <li class="text-primary">회의실1</li>
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
<div
  class="h-[calc(100vh-186px)] overflow-hidden sm:h-[calc(100vh-174px)]" 
>
  <div
    x-data="{inboxSidebarToggle: false}"
    class="h-full rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark lg:flex"
  >
	<div
	  :class="inboxSidebarToggle && '!translate-x-0 duration-300 ease-linear'"
	  class="fixed bottom-0 top-22.5 z-999 flex w-[230px] -translate-x-[50%] pl-0 flex-col rounded-md border border-stroke bg-white dark:border-strokedark dark:bg-boxdark lg:static lg:w-1/5 lg:translate-x-0 lg:border-none"
	>
      <button
        :class="inboxSidebarToggle && '!-right-9'"
        class="absolute -right-20 z-99999 block rounded-md border border-stroke bg-white p-1.5 shadow-sm dark:border-strokedark dark:bg-boxdark lg:hidden"
        @click="inboxSidebarToggle = !inboxSidebarToggle"
      >
        <svg
          class="h-5 w-5 fill-current"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 32 32"
        >
          <path
            d="M 22.1875 2.28125 L 20.78125 3.71875 L 25.0625 8 L 4 8 L 4 10 L 25.0625 10 L 20.78125 14.28125 L 22.1875 15.71875 L 28.90625 9 Z M 9.8125 16.28125 L 3.09375 23 L 9.8125 29.71875 L 11.21875 28.28125 L 6.9375 24 L 28 24 L 28 22 L 6.9375 22 L 11.21875 17.71875 Z"
          />
        </svg>
      </button>

      <div class="px-4 pt-4">
        
      </div>

      <div class="no-scrollbar max-h-full overflow-auto py-6">
        <ul
          class="flex flex-col gap-2"
          x-data="{ isActive: 'inbox' }"
        >
         <table class="w-full">
         	<thead>
         	<th></th>
         	</thead>
         	<tbody>
         	<tr class="h-8 text-right">
         	  <td>09:00</td>
         	</tr>
         	<tr class="h-40 text-right">
         	  <td>10:00</td>
         	</tr>
         	<tr class="h-10 text-right">
         	  <td>11:00</td>
         	</tr>
         	<tr class="h-40 text-right">
         	  <td>12:00</td>
         	</tr>
         	<tr class="h-10 text-right">
         	  <td>13:00</td>
         	</tr>
         	<tr class="h-40 text-right">
         	  <td>14:00</td>
         	</tr>
         	<tr class="h-10 text-right">
         	  <td>15:00</td>
         	</tr>
         	<tr class="h-40 text-right">
         	  <td>16:00</td>
         	</tr>
         	<tr class="h-10 text-right">
         	  <td>17:00</td>
         	</tr>
         	<tr class="h-40 text-right">
         	  <td>18:00</td>
         	</tr>
         	</tbody>
         </table>
        </ul>
      </div>
    </div>
    <div
      class="flex h-full flex-col border-l border-stroke dark:border-strokedark lg:w-4/5"
    >
      <!-- ====== Inbox List Start -->
      <div
        class="flex flex-col-reverse justify-between gap-6 sm:flex-row"
      >
	  <!-- ====== Calendar Section Start -->
    
	  <div class="w-full max-w-full rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
	  	<table class="w-full">
	   	<thead>
	     	<tr class="grid grid-cols-8 rounded-t-sm bg-primary text-white">
	       <th class="flex h-12 items-center justify-center rounded-tl-sm p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> 시간 </span>
	         <span class="block lg:hidden"> 시간 </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Sunday </span>
	         <span class="block lg:hidden"> Sun </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Monday </span>
	         <span class="block lg:hidden"> Mon </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Tuesday </span>
	         <span class="block lg:hidden"> Tue </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Wednesday </span>
	         <span class="block lg:hidden"> Wed </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Thursday </span>
	         <span class="block lg:hidden"> Thur </span>
	       </th>
	       <th class="flex h-12 items-center justify-center p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Friday </span>
	         <span class="block lg:hidden"> Fri </span>
	       </th>
	       <th class="flex h-12 items-center justify-center rounded-tr-sm p-1 text-xs font-semibold sm:text-sm xl:p-2">
	         <span class="hidden lg:block"> Saturday </span>
	         <span class="block lg:hidden"> Sat </span>
	       </th>
	     </tr>
	   </thead>
	   <tbody>
	     <!-- Line 1 -->
	     <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	     </tr>
	                 <!-- Repeat for other lines -->
	  			 <!-- Line 2 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	       <!-- Line 2 -->
	       <!-- Line 3 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	       <!-- Line 3 -->
	         <!-- Line 1 -->
	     <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	     </tr>
	       <!-- Line 1 -->
	     <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	     </tr>
	       <!-- Line 1 -->
	     <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	     </tr>
	       <!-- Line 1 -->
	     <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	     </tr>
	       <!-- Line 4 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	       <!-- Line 4 -->
	       <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	          <!-- Line 1 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	                    <!-- Repeat for other lines -->
	   				 <!-- Line 2 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	          <!-- Line 2 -->
	          <!-- Line 3 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	          <!-- Line 3 -->
	          <!-- Line 4 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	          <!-- Line 4 -->
	          <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	              <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	              <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	              <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	              <!-- Line 5 -->
	       <tr class="grid grid-cols-7">
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	         <td                 
	           class="ease relative h-12 cursor-pointer border border-stroke p-2 transition duration-500 hover:bg-gray dark:border-strokedark dark:hover:bg-meta-4 md:h-15 md:p-6 xl:h-15"
	           <span class="font-medium text-black dark:text-white"
	           > </span
	         >
	         </td> 
	       </tr>
	              <!-- Line 5 -->
	          </tbody>
	        </table>
	      </div>
	           <!-- ====== Calendar Section End -->
      </div>
      <!-- ====== Inbox List End -->
      <!-- ===== Content Area End ===== -->
    </div>
    <!-- ===== Page Wrapper End ===== -->
</main>
   <!-- ===== Main Content End ===== -->
