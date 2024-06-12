<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>


<form id="frm-upload-register"
method="POST"
enctype="multipart/form-data"
action = "${contextPath}/upload/register.do">

<div>
<span>작성자</span>
<span>${sessionScope.user.email}</span>
</div>

<div>
<label for="title">제목</label>
<input type="text" name="title" id="title">
</div>      

<div>
<textarea id="contents" name="contents" placeholder="내용을 입력하세요"></textarea>
</div>

<div>
<label for="files">첨부</label>
<input type="file" name="files" id="files" multiple>
</div>

<div id="attach-list">첨부파일목록</div>

<div>
<input type="hidden" name="userNo" value="${sessionScope.user.userNo}">
<button type="submit">작성완료</button>
<a href="${contextPath}/upload/list.do"><button type="button">작성취소</button></a>
</div>

</form>




<script defer src="${contextPath}/js/doc.js"></script>
<script>
    function showElement() {
    var element = document.querySelector('.comp_active');
    element.style.display = 'inline';
</script>


<jsp:include page="../layout/closer.jsp"/>