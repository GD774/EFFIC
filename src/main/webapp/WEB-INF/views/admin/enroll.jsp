<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar-admin.jsp"/>

      <!-- ===== Content Area Start ===== -->
      <div
        class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden"
      >

        <!-- ===== Header End ===== -->

        <!-- ===== Main Content Start ===== -->
        <main>

		  유저 이름: ${user.name} <br>
		  유저 이메일: ${user.email} <br>
		  유저 휴대전화: ${user.phone} <br>
		  등등 유저 정보를 가지고 여기서 구현

        </main>
        <!-- ===== Main Content End ===== -->
      </div>
      <!-- ===== Content Area End ===== -->

<jsp:include page="../layout/closer.jsp"/>
