<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<link href="${contextPath}/css/enroll.css" rel="stylesheet">

<div class="container-fluid">
  <div class="row">

	<jsp:include page="../layout/sidebar.jsp"/>

	<div id="user-list" class="col overflow-auto">
	  <table class="table table-hover table-striped">
		<thead>
		  <tr>
			<th scope="col">사원번호</th>
			<th scope="col">이름</th>
			<th scope="col">부서</th>
		  </tr>
		</thead>
		<tbody>
		  <c:forEach items="${userList}" var="user">
			<tr>
			  <td>${user.eid}</td>
			  <td>${user.name}</td>
			  <td>${user.email}</td>
			</tr>
		  </c:forEach>
		</tbody>
	  </table>
	</div>

	<div class="col-lg-6 overflow-auto" style="max-height: 100vh;">
      <h4 class="mb-3">사원 추가</h4>
      <form action="${contextPath}/humanresource/enroll" method="POST" class="needs-validation" novalidate>
		<div class="row g-3">

		  <div class="col-4">
			<div class="input-group">
			  <span class="input-group-text float-end" style="width: 100px">이름</span>
				<input id="name" type="text" name="name" class="form-control" placeholder="필수" value="" required>
				<label for="eid"></label>
			</div>
		  </div>

          <div class="col-4">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">사원번호</span>
				<input id="eid" type="text" name="eid" class="form-control" placeholder="필수" value="" required>
				<label for="eid"></label>
			</div>
          </div>

		  <div class="col-4">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">비밀번호</span>
				<input id="pw" type="password" name="pw" class="form-control" placeholder="필수" value="" required>
				<label for="pw"></label>
			</div>
          </div>

		  <div class="col-3">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">부서</span>
			  <select class="form-select" id="org-dep">
				<option value="">선택</option>
				<option value="null">미정</option>
			  </select>
			</div>
          </div>

		  <div class="col-3">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">직위</span>
			  <select class="form-select" id="org-pos">
				<option value="">선택</option>
				<option value="null">미정</option>
			  </select>
			</div>
          </div>

		  <div class="col-3">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">직책</span>
			  <select class="form-select" id="org-res">
				<option value="">선택</option>
				<option value="null">미정</option>
			  </select>
			</div>
          </div>

		  <div class="col-6">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">이메일</span>
			  <input id="email" type="email" name="email" class="form-control" placeholder="example@example.com" value="">
			  <label for="eid"></label>
			</div>
		  </div>

		  <div class="col-6">
			<div class="input-group">
			  <span class="input-group-text" style="width: 100px">휴대전화</span>
			  <input id="phone" type="text" name="phone" class="form-control" placeholder="010-0000-0000" value="">
			  <label for="eid"></label>
			</div>
		  </div>
		<button class="btn btn-primary btn-lg" type="submit">등록</button>
      </form>
	</div>
  </div>
</div>

<script src="${contextPath}/js/enroll.js"></script>

<jsp:include page="../layout/closer.jsp"/>
