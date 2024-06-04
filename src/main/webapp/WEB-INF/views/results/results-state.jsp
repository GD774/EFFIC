<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>

div#branch-list {
	margin-left: 50px;
	margin-top: 50px;
	width: 1200px;

}
table {
	border: solid 1px gray;
	padding-top: 10px	;
	display: table-cell;
}
td#state{
	font-weight: bold;
	
}

td{
	padding-top: 10px;

}
div#branch-add {

width: 500px;
height: 100px;
background-color: #6495ED;
position: absolute;
bottom: auto;
left: 100px;

}

#modalOpenButton, #modalCloseButton {
  cursor: pointer;
}

#modalContainer {

  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.5);
}

#modalContent {
  position: absolute;
  background-color: #ffffff;
  width: 600px;
  height: 500px;
  padding: 15px;
}

#modalContainer.hidden {
	
  display: none;
}

</style>

<jsp:include page="../layout/opener.jsp"/>





<jsp:include page="../layout/sidebar.jsp"/>

	

<div id='branch-list'>
<a href='${contextPath}/results/results-state'>지점별 통계 보기></a>
	<table>
		<tr>
			<th style="padding-right: 100px;">지점 번호</th>
			<th style="padding-right: 200px;">지점 이름</th>
			<th style="padding-right: 40px;">갱신 여부</th>
			<th style="padding-right: 40px;">버튼</th>
			<th>지점별 통계</th>
			
		</tr>
		<tr>
			<td>1</td>
			<td>가산점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>2</td>
			<td>부평점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>3</td>
			<td>용산점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>4</td>
			<td>판교점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>5</td>
			<td>성수점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>6</td>
			<td>구로점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>7</td>
			<td>강남점</td>
			<td id=state><font color="red">필요</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>8</td>
			<td>신도림점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>9</td>
			<td>광안리점</td>
			<td id=state><font color="green">완료</td>
			<td></td>
			<td>이미지</td>
		</tr>
		<tr>
			<td>10</td>
			<td>마포점</td>
			<td id=state>
			<button id="modalOpenButton"><font color="red">필요</button>
						<div id="modalContainer" class="hidden">
		  		<div id="modalContent"><font color="black">
		  		<h1>연도
		  		<select name="year" id="year" >
		  		<option value="22">22년</option>
		  		<option value="23">23년</option>
		  		<option value="24" selected="selected">24년</option>
		  		</select>
		  		</h1>	
		  		<h1 style="padding-right: 20px;">월:
		  		<select name="month" id="month" >
		  		
		  		<option value="none" style="border: solid 1px gray;">월을 선택하세요</option>
		  		<option value="1">1월</option>
		  		<option value="2">2월</option>
		  		<option value="3">3월</option>
		  		<option value="4">4월</option>
		  		<option value="5">5월</option>
		  		<option value="6">6월</option>
		  		<option value="7">7월</option>
		  		<option value="8">8월</option>
		  		<option value="9">9월</option>
		  		<option value="10">10월</option>
		  		<option value="11">11월</option>
		  		<option value="12">12월</option>
		  		</select>		
		  		
		  		</h1>	  
		  		<h1>총매출
		  		<input style="border: solid 1px gray">
		  		</h1>
		  		
		  		<h1>총 사무실 수
		  		<input style="border: solid 1px gray">
		  		</h1>
		  		
		  		<h1>공실 수
		  		<input style="border: solid 1px gray">
		  		</h1>
		  		
		  		
		    <button>작성</button>
    	<button id="modalCloseButton">닫기</button>
  </div>
</div>
			
</td>
			<td></td>
			<td>이미지</td>
		</tr>
	</table>
</div>

<div>
<button id="branch-add">지점추가</button>
</div>





<script>

const modalOpenButton = document.getElementById('modalOpenButton');
const modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

modalOpenButton.addEventListener('click', () => {
  modal.classList.remove('hidden');
});

modalCloseButton.addEventListener('click', () => {
  modal.classList.add('hidden');
});

</script>



<jsp:include page="../layout/closer.jsp"/>
