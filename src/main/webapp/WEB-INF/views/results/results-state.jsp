<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<style>

@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}



button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}

.w-btn-green {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2 {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-green-outline {
    border: 3px solid #77af9c;
    color: darkgray;
}

.w-btn-green2-outline {
    border: 3px solid #519d9e;
    color: darkgray;
}

.w-btn-green-outline:hover {
    background-color: #77af9c;
    color: #d7fff1;
}

.w-btn-green2-outline:hover {
    background-color: #519d9e;
    color: #9dc8c8;
}

.w-btn-brown {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-brown-outline {
    border: 3px solid #ce6d39;
    color: #b8b8b8;
}

.w-btn-brown-outline:hover {
    background-color: #ce6d39;
    color: #ffeee4;
}

.w-btn-blue {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline {
    border: 3px solid #6aafe6;
    color: #6e6e6e;
}

.w-btn-pink-outline {
    border: 3px solid #f199bc;
    color: #6e6e6e;
}

.w-btn-gray-outline {
    border: 3px solid #a3a1a1;
    color: #6e6e6e;
}

.w-btn-red-outline {
    border: 3px solid #ff5f2e;
    color: #6e6e6e;
}

.w-btn-skin-outline {
    border: 3px solid #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline {
    border: 3px solid #fce205;
    color: #6e6e6e;
}

.w-btn-blue-outline:hover {
    background-color: #6aafe6;
    color: #d4dfe6;
}

.w-btn-pink-outline:hover {
    background-color: #f199bc;
    color: #d4dfe6;
}

.w-btn-gray-outline:hover {
    background-color: #a3a1a1;
    color: #e3dede;
}

.w-btn-red-outline:hover {
    background-color: #ff5f2e;
    color: #e1eef6;
}

.w-btn-skin-outline:hover {
    background-color: #f8e6e0;
    color: #6e6e6e;
}

.w-btn-yellow-outline:hover {
    background-color: #fce205;
    color: #6e6e6e;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn:active {
    transform: scale(1.5);
}

.w-btn-outline:active {
    transform: scale(1.5);
}

.w-btn-gra1 {
    background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    color: white;
}

.w-btn-gra2 {
    background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
    color: white;
}

.w-btn-gra3 {
    background: linear-gradient(
        45deg,
        #ff0000,
        #ff7300,
        #fffb00,
        #48ff00,
        #00ffd5,
        #002bff,
        #7a00ff,
        #ff00c8,
        #ff0000
    );
    color: white;
}

.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}

@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity: 1;
    }
    100% {
        width: 300px;
        height: 300px;
        opacity: 0;
    }
}

.w-btn-neon2 {
    position: relative;
    border: none;
    min-width: 200px;
    min-height: 50px;
    background: linear-gradient(
        90deg,
        rgba(129, 230, 217, 1) 0%,
        rgba(79, 209, 197, 1) 100%
    );
    border-radius: 1000px;
    color: darkslategray;
    cursor: pointer;
    box-shadow: 12px 12px 24px rgba(79, 209, 197, 0.64);
    font-weight: 700;
    transition: 0.3s;
}

.w-btn-neon2:hover {
    transform: scale(1.2);
}

.w-btn-neon2:hover::after {
    content: "";
    width: 30px;
    height: 30px;
    border-radius: 100%;
    border: 6px solid #00ffcb;
    position: absolute;
    z-index: -1;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    animation: ring 1.5s infinite;
}


p {
	font-size: 34px;
	font-weight: bolder;
	position: absolute;
	left: 350px;
	top: 100px;
	color: #2f67c2;

}

div#branch-list {
	margin-left: 50px;
	margin-top: 150px;
	width: 1200px;
	height: 530px;
}
table {
	background-color: #d1e0f0;
	padding-top: 10px	;
	display: table-cell;
	width: 1500px;
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

position: absolute;
left: 340px;
bottom: 100px; 


}

a#branch-add {
	background-color: #6495ED;
	width: 1000px;
	height: 50px;
	text-align: center;
	margin-left: 100px;
	font-size: 20px;
	font-weight: bold;
	
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
  background-color: #d1e0f0;
  width: 600px;
  height: 500px;
  padding: 15px;
  text-align: left;
  padding: 100px;
  
}

#modalContainer.hidden {
	
  display: none;
}


span.material-symbols-outlined{
	display: none;
}

h1#results-create{
	font-size: 30px;
	font-weight: bold;
	color: #4f78e0;
	margin-bottom: 30px;
}

</style>

<jsp:include page="../layout/opener.jsp"/>


<span class="material-symbols-outlined">
open_in_new
</span>


<jsp:include page="../layout/sidebar.jsp"/>

<script>

function btn-1() {
	var btnModify = document.getElementById("btn-modify");
	
}


    </script>
    
  	<p>이번달 실적 기입</p>
  	

<div id='branch-list'>
	<table>
		<tr>
			<th style="padding-right: 100px;">지점 번호</th>
			<th style="padding-right: 200px;">지점 이름</th>
			<th style="padding-right: 200px;">갱신 여부</th>
			<th style="padding-right: 200px; text-align: center;">버튼</th>
			<th>지점별 통계</th>
		</tr>
		<tr>
			
			<td>1</td>
			<td>가산점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
						 style="background-color: #7a8ff5">
					    수정
					</a></td>
			<td>
				<a style="text-decoration:none" 
					href="${contextPath}/results/personal-results" class="material-symbols-outlined">open_in_new</a>
			</td>
		</tr>
		<tr>
			<td>2</td>
			<td>부평점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
						 style="background-color: #7a8ff5">
    수정
</a></td>
			<td>
				<a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a>
			</td>
		</tr>
		<tr>
			<td>3</td>
			<td>용산점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
						 style="background-color: #7a8ff5">
    수정
</a></td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>4</td>
			<td>판교점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
						 style="background-color: #7a8ff5">
    수정
</a></td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>5</td>
			<td>성수점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
			 			 style="background-color: #7a8ff5">
    수정
</a></td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>6</td>
			<td>구로점</td>
			<td id=state><font color="green">완료</td>
			<td><a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
						 style="background-color: #7a8ff5">
    수정
</a></td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>7</td>
			<td>강남점</td>
			<td id=state><font color="red">필요</td>
			<td>
				<a id="btn-create" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5">
	    작성
				</a>
			</td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>8</td>
			<td>신도림점</td>
			<td id=state><font color="green">완료</td>
			<td>
				<a id="btn-modify" href="#" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5"
					 style="background-color: #7a8ff5">
	    			수정
	      </a>
    </td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>9</td>
			<td>광안리점</td>
			<td id=state><font color="green">완료</td>
			<td>
				<a id="btn-modify" href="${contextPath}/expt_results/results-write" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5" 
						style="background-color: #7a8ff5">
	    			수정
	      </a>
			</td>
			<td><a style="text-decoration:none" 
					href="${contextPath}/expt_results/results-write" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
		<tr>
			<td>10</td>
			<td>마포점</td>
			<td id=state
					style="color: #f52525">필요</td>
			<td>
				<a id="modalOpenButton" href="#" data-toggle="modal" class="inline-flex items-center justify-center rounded-full bg-primary px-5 py-2 text-center font-medium text-white hover:bg-opacity-90 lg:px-4 xl:px-5">
	      	작성
	      	
					<div id="modalContainer" class="hidden">
		  		<div id="modalContent"><font color="black">
		  		
		  		<h1 id='results-create'>당월 실적 등록</h1>
		  		<h1>연도:
		  		<select name="year" id="year" style="border: solid 1px gray; margin-left: 264px;	margin-bottom: 10px;">
		  		<option value="22">22년</option>
		  		<option value="23">23년</option>
		  		<option value="24" selected="selected">24년</option>
		  		</select>
		  		</h1>	
		  		<h1 style="padding-right: 20px;">월:
		  		<select name="month" id="month" style="border: solid 1px gray; margin-left: 195px;	margin-bottom: 10px;">
		  		
		  		<option value="none">월을 선택하세요</option>
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
		  		<input style="border: solid 1px gray; margin-left: 130px;	margin-bottom: 10px;" placeholder="필수입력입니다.">
		  		</h1>
		  		
		  		<h1>총 사무실 수
		  		<input style="border: solid 1px gray; margin-left: 87px; margin-bottom: 10px;" placeholder="필수입력입니다.">
		  		</h1>
		  		
		  		<h1>공실 수
		  		<input style="border: solid 1px gray; margin-left: 125px; margin-bottom: 10px;"placeholder="필수입력입니다.">
		  		</h1>
					 <button class="w-btn-outline w-btn-blue-outline" type="button" 
					 				 style="margin-left: 100px; margin-top: 20px;">작성</button>
		  		<button id="modalCloseButton" class="w-btn-outline w-btn-red-outline" type="button"
		  						style="margin-left: 50px;">닫기</button>
        </div>          
	      </a>
			</td>
			<td><a style="text-decoration:none" 
					href="#" class="material-symbols-outlined">open_in_new</a></td>
		</tr>
	</table>
</div>

<div id="branch-add" >
	<a id="branch-add" href="#" class="inline-flex items-center justify-center rounded-md bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
                    지점추가▽
                  </a>
                  
        
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
