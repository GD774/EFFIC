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

<div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
            <!-- Breadcrumb Start -->
            <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <h2 class="text-title-md2 font-bold text-black dark:text-white">
                 
              </h2>


            </div>
            <!-- Breadcrumb End -->

            <div class="rounded-sm border border-stroke bg-white px-5 py-10 shadow-default dark:border-strokedark dark:bg-boxdark sm:py-20">
              <div class="mx-auto max-w-[410px]">
                <img src="${contextPath}/image/illustration-01.svg" alt="illustration">

                <div class="mt-7.5 text-center">
                  <h2 class="mb-3 text-2xl font-bold text-black dark:text-white">
                    Sorry, the page can’t be found
                  </h2>
                  <p class="font-medium">
                    죄송합니다. 일치하는 회원정보가 없습니다.
                    <br>
                    다시 시도해주세요.
                  </p>
                  <a href="${contextPath}/signin" class="mt-7.5 inline-flex items-center gap-2 rounded-md bg-primary px-6 py-3 font-medium text-white hover:bg-opacity-90">
                    <svg class="fill-current" width="16" height="14" viewBox="0 0 16 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M14.7492 6.38125H2.73984L7.52109 1.51562C7.77422 1.2625 7.77422 0.86875 7.52109 0.615625C7.26797 0.3625 6.87422 0.3625 6.62109 0.615625L0.799219 6.52187C0.546094 6.775 0.546094 7.16875 0.799219 7.42188L6.62109 13.3281C6.73359 13.4406 6.90234 13.525 7.07109 13.525C7.23984 13.525 7.38047 13.4687 7.52109 13.3562C7.77422 13.1031 7.77422 12.7094 7.52109 12.4563L2.76797 7.64687H14.7492C15.0867 7.64687 15.368 7.36562 15.368 7.02812C15.368 6.6625 15.0867 6.38125 14.7492 6.38125Z" fill=""></path>
                    </svg>
                    <span>로그인페이지로 돌아가기</span>
                  </a>
                </div>
              </div>
            </div>
          </div>

<jsp:include page="../layout/closer.jsp"/>
