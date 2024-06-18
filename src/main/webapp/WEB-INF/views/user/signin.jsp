<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp">
  <jsp:param name="htmlParam" value="class=\"h-full bg-white\""/>
  <jsp:param name="tailwind" value="true"/>
  <jsp:param name="notTailadminBody" value="true"/>
</jsp:include>

<body class="h-full">

<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
    <img class="mx-auto h-10 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="Your Company">
    <h2 class="mt-10 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900">EFFIC</h2>
  </div>

  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
    <form action="${contextPath}/user/signin" method="POST" class="space-y-6">
      <div>
        <label for="empId" class="block text-sm font-medium leading-6 text-gray-900">사원번호</label>
        <div class="mt-2">
          <input id="empId" name="empId" type="text" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
        </div>
      </div>

      <div>
		<label for="pw" class="block text-sm font-medium leading-6 text-gray-900">비밀번호</label>
        <div class="mt-2">
          <input id="pw" name="pw" type="password" autocomplete="current-password" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
        </div>
      </div>

      <div>
        <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">로그인</button>
      </div>
    </form>

    <p class="mt-10 text-center text-sm text-gray-500">
      GD774
      <a href="https://github.com/GD774/EFFIC" class="font-semibold leading-6 text-indigo-600 hover:text-indigo-500">Visit Our Project Page</a>
    </p>
  </div>

<jsp:include page="../layout/closer.jsp"/>
