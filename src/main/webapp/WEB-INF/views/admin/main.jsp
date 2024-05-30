<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.min.css" rel="stylesheet">

<link href="${contextPath}/css/dashboard.css" rel="stylesheet">

<div class="container-fluid">
  <div class="row">

	<jsp:include page="../layout/sidebar.jsp"/>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
    </main>
  </div>
</div>

<script src="${contextPath}/js/dashboard.js"></script>

<jsp:include page="../layout/closer.jsp"/>
