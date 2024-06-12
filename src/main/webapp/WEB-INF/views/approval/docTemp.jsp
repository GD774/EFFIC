<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<body>

<div>
<table>
<tr>
<td style="width: 799px; height: 153.75px; padding: 1.41pt; border-width: 2px 1px 2px 2px; border-style: solid; border-color: rgb(0, 0, 0);" valign="middle" colspan="11">
<p style="font-family: &quot;맑은 고딕&quot;; font-size: 12pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
	<span unselectable="on" contenteditable="false" class="comp_wrap" data-wrapper="" style="font-family: &quot;맑은 고딕&quot;; font-size: 12pt;">
		<span class="sign_type1_inline" data-group-seq="0" data-group-name="결        재" data-group-max-count="2" data-group-type="type1" data-is-reception="">
			<span class="sign_tit_wrap">
				<span class="sign_tit">
					<strong>결        재</strong>
				</span>
			</span>
    		<span class="sign_member_wrap">
    			<span class="sign_member">
    				<span class="sign_rank_wrap">
    					<span class="sign_rank" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
    						&nbsp;
						</span>
					</span>
					<span class="sign_wrap" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
						&nbsp;
					</span>
					<span class="sign_date_wrap">
						<span class="sign_date" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
							&nbsp;
						</span>
					</span>
				</span>
			</span>
			<span class="sign_member_wrap">
				<span class="sign_member">
					<span class="sign_rank_wrap">
						<span class="sign_rank" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
							&nbsp;
						</span>
					</span>
				<span class="sign_wrap" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
					&nbsp;
				</span>
				<span class="sign_date_wrap">
					<span class="sign_date" style="font-family: &quot;맑은 고딕&quot;; font-size: 9pt;">
						&nbsp;
					</span>
				</span>
			</span>
		</span>
	</span>

	<span contenteditable="false" class="comp_active" style="display: block; font-family: &quot;맑은 고딕&quot;; font-size: 12pt;"> 
		<span class="Active_dot1"></span>
		<span class="Active_dot2"></span> 
		<span class="Active_dot3"></span>
		<span class="Active_dot4"></span> 
	</span>
	<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" style="font-family: &quot;맑은 고딕&quot;; font-size: 12pt;"> 
		<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
	</span>
</span>
<br>
</p>
</td>
</tr>
</table>
</div>




</body>







<script defer src="${contextPath}/js/doc.js"></script>
<script>
    function showElement() {
    var element = document.querySelector('.comp_active');
    element.style.display = 'inline';
</script>


<jsp:include page="../layout/closer.jsp"/>