<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>

<link href="${contextPath}/css/signin.css" rel="stylesheet">

<main class="form-signin w-100 m-auto">
  <form action="${contextPath}/user/signin" method="POST">
	<a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-black text-decoration-none">
	  <svg class="bi pe-none me-2" width="50" height="50"><use xlink:href="#github"/></svg>
      <span class="fs-4">EFFIC</span>
    </a>
	<br>
    <div class="form-floating">
      <input id="eid" type="text" class="form-control" name="uid" placeholder="사원번호">
      <label for="eid">사원번호</label>
    </div>
    <div class="form-floating">
      <input id="pw" type="password" class="form-control" name="pw" placeholder="비밀번호">
      <label for="pw">비밀번호</label>
    </div>

    <div class="form-check text-start my-3">
      <input id="check-signin-persist" class="form-check-input" type="checkbox" name="checkSigninPersist" value="remember-me">
      <label class="form-check-label" for="flexCheckDefault">
        자동 로그인
      </label>
    </div>
    <button class="btn btn-primary w-100 py-2" type="submit">로그인</button>
  </form>
  <!--
  <hr>
  <div class="btn-group" role="group" aria-label="help">
	<button id="open-help-desk" class="btn btn-outline-info w-100 py-2" type="submit">관리자 호출</button>
	<button id="" class="btn btn-outline-primary w-100 py-2" type="submit">아이디 찾기</button>
	<button id="" class="btn btn-outline-primary w-100 py-2" type="submit">비밀번호 찾기</button>
  </div>
  -->
  <p class="mt-5 mb-3 text-body-secondary">&copy; 2024-, GD774&#8482 and its members</p>
</main>

<!-- Modal -->
<div id="help-desk" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 id="help-title" class="modal-title fs-5">도움 및 안내</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	  <form action="${contextPath}/admin/main">
		<div class="modal-body">
		  <div class="mb-3">
			<label for="">이메일</label>
			<input type="text" class="form-control">
		  </div>
		  <div class="mb-3">
			<label for="">전화번호</label>
			<input type="text" class="form-control">
		  </div>
		  <div class="mb-3">
			<label for="">내용</label>
			<textarea class="form-control"></textarea>
		  </div>
		</div>
		<div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		  <button id="xl-help-desk" type="button" class="btn btn-outline-dark" style="">큰 창</button>
		  <button id="full-help-desk" type="button" class="btn btn-outline-dark" style="display: none">전체 창</button>
		  <button id="default-help-desk" type="button" class="btn btn-outline-dark" style="display: none">기본 창</button>
          <button type="submit" class="btn btn-primary">보내기</button>
		</div>
	  </form>
    </div>
  </div>
</div>

<script>

  const xlClassName = "modal-xl";
  const fullClassName = "modal-fullscreen";
  const helpDeskModal = new bootstrap.Modal("#help-desk");
  document.getElementById("open-help-desk").addEventListener('click', (evt) => {
	  helpDeskModal.show();
  });
  const cycleSizeChange = (beforeId, afterId, beforeSize, afterSize) => {
	  document.getElementById(beforeId).addEventListener('click', (evt) => {
		  document.getElementById(beforeId).setAttribute("style", "display: none");
		  document.getElementById(afterId).setAttribute("style", "");

		  sizeFactors = document.getElementById("help-desk").children[0].classList;
		  if (beforeSize && sizeFactors.contains(beforeSize))
			  sizeFactors.remove(beforeSize);
		  if (afterSize && !sizeFactors.contains(afterSize))
			  sizeFactors.add(afterSize);
	  });
  };

  cycleSizeChange("xl-help-desk", "full-help-desk", null, xlClassName);
  cycleSizeChange("full-help-desk", "default-help-desk", xlClassName, fullClassName);
  cycleSizeChange("default-help-desk", "xl-help-desk", fullClassName, null);

</script>

<jsp:include page="../layout/closer.jsp"/>
