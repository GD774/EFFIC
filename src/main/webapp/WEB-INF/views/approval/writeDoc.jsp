<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<%
    long currentTimeMillis = System.currentTimeMillis();
    Date currentDate = new Date(currentTimeMillis);
    request.setAttribute("currentDate", currentDate);
%>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.4.0/backbone-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
<script defer src="${contextPath}/js/docTemp1.js"></script>


<style>
    .button-container {
        display: inline-block; /* 가로로 나란히 배치 */
        background-color: white;
        text-decoration: none;
        text-align: center;
        font-size: 14px;
        position: relative; 
        height: 50px;
        transition: background-color 0.3s ease;
        margin-right: 10px; /* 버튼 간의 간격 조정 */
    }

    .button-container :hover {
        font-weight: bold;
    }
    
    .wrapper {
        background-color: white;
        overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤 표시 */
        height: 800px; /* 화면 높이에 맞게 스크롤 영역 제한 */
    }
   
   .approvalLine {
     float: right;
     margin-left: 20px;
	    line-height: 150% !important;
	    width: 220px !important;
	    height: 20% !important;
	    border-collapse: collapse !important;
	    
   }
   
   #urgent {
    width: 40px; /* 원하는 크기로 조정하세요 */
    height: 40px; /* 원하는 크기로 조정하세요 */
    margin-right: 5px;
    margin-bottom: 5px;
    display: inline-block; /* 가로로 나란히 배치 */
    display: none;
    position: absolute;
    right: -50px; /* 버튼 컨테이너의 오른쪽에서 10px 떨어진 위치 */
    top: -7px;
    
   }
   


.approvalLine td {
    font-size: 9pt !important;
    width: 50px !important;
    border: 1px solid black !important;
    text-align: center;
}

.approvalLine td[rowspan="3"] {
    text-align: center !important;
    width: 10% !important;
    border-bottom: 1px solid black !important;
}

.approvalLine tr:nth-child(3) td {
    text-align: center !important;
    height: 10px !important;
    border-top: 1px solid black !important;
}
.approveds {
    width: 35px; 
    display: block;
    margin: 0 auto;
    margin-top: 10px;
}
 #dynamic_table tbody tr td{
     border: 1px solid black;
 }
    table.fixed-size {
        width: 100%;
        table-layout: fixed;
        border-collapse: collapse;
    }

    table.fixed-size td, table.fixed-size th {
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        border: 1px solid black;
    }

    .ipt_editor {
        width: 100%;
        box-sizing: border-box;
    }

    .ipt_editor_currency {
        text-align: right;
    }
    
    #amount-label {
        text-align: right !import;   
    }
    .amount-label {
        text-align: right !import;   
    }
   
</style>
</head>

<body>



<div class="wrapper">
	<div class="mx-auto max-w-screen-2xl p-2 md:p-2 2xl:p-6">
    <div class="mb-9 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <h2 class="text-title-md2 font-bold text-black dark:text-white mt-4">문서 작성</h2>
		</div>

	<div style="font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
    <div class="button-container">
    	<button id="approvalRequest" class="inline-flex rounded bg-primary px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            결재요청
      </button>
    	<button id="saveDraft" class="inline-flex rounded bg-primary px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            임시저장
      </button>
      <button id="cancelWriting" class="inline-flex rounded bg-[#DC3545] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            작성취소
      </button>
    	<button id="goAppLine" class="inline-flex rounded bg-primary px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            결재정보
      </button>
    	<img id="urgent" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAAACXBIWXMAAAsTAAALEwEAmpwYAAADU0lEQVR4nO3YT0zTUBwHcE4ePXjuZGzr/jIIGy0IItAuRk9wAE4kmxLjmWBMlA2Pmo2oBzzowat68k9MBlFR/mh0W0BF0IAxxotESPjTCqLCM284snbd62zfoyTuJd+E0Db5fejb3u9HSUlxFVdx/X9LCDAdAscmBJ5ZF3kWoLLKMeBrfRVIumgQp6icDJpMYMRiFic89OVdKV7k2LNqRefLlNepiIj/TcpFPyBa/HpjjVngmN9aAQLHgOGy0ryAQYoCb/12JzGAyDNBrcVnMuGxI9/C63J6gByAYy/oBcxUupCAhIseJgYQOPaGXsCc34MEvHRYZwgCmId6AV9qKpCAcdoyTxDATuoFzNdXIQHPLOY1YgCRY7/pBSw1+ZGAR6UHN4kUD9rd+wSe3dILgEm5bUjELGvbT+QMwFF8Jh98bjBoUgZMeRx12AGrTf56nIA0osqtCJgsp08T6X8KKixQAzY6A2CzuwWAcFs68Gf4O3hNfn/SmbudiPRFAs92qxX//fghsNnTCkBfh2LgNXhP9jOLR/xgSLaVUk7bXewAkWf71f7yqOKzEfI3kZR1qq+c1gQBAHMLBYBbRK34TDY6ecmznxivBPCCtnwmARhFAdJ7PrvQa2cAGLsPwPg9AAZ6pG+hu0Xy7EKDTwIYs5qXCQDYjyjAVm+7FAALTz3eDoRkXYP3Zj+72lwtAQybD/7EDhB4Zg0foE3y7EozIwEMmUwAa/HLR2sPqH0D5WwhuG0gAhavtoUO+3LngoqKMmwAIVDrVQPg/BDHKQpMV9pbsQFEnjlWyAGG62s0TlHgjddxHh+AY7sKOYW1HGQLCgfZ9mlsv4kT0FdQG7HTSvDpfQ4/2DDbrQSv2EokFFoJmKTL9gQbQOCY6wUD/iHv8zRz6dPYYZ3eU6OkPIsNvrztNPbREscoaehoKWIYJeVZatyl0RJgHCXlGUJsIWyjJe5RMjtPy8xIAJbRcqW5uo4U4DltQQLeeelTugECx7aTAiTz/Mt9Zzb22Pt1FX+iNxo42XvpRygSA0ak69zFX8FIP68ZEIxErxpVfCiTcOyKZkAoEr1jNCAYjt3W/gbCsVGjAaFIdEQHIDpnNCAYic3qAQiGA8JRQTOguIqruEr2/PoDvwomXOvJFOsAAAAASUVORK5CYII=">
    </div>
	</div>
	<form id="documentForm" action="submitDocument.jsp" method="post">
	<div class="btnWrapper col-9" style="margin-bottom: 10px; font-family: S-CoreDream-6Bold">
					<span class="" style="position: relative;left: 650px;">
						<label class="checkbox-inline" for="emergency" style="cursor: pointer;">
							<strong>긴급결재여부</strong>
							<input id="emergency" type="checkbox" style="position:relative;top: 3px; width: 17px;height: 17px;padding-top: 2px;cursor: pointer; border-radius: 3px;">
						</label>
					</span>
			</div>
<!-- Embededd Style이 적용받는 범위 입니다. 상단의 스타일은 이 요소 안에서만 동작합니다. --> 
<div id="divCustomWrapper" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">  
<!-- 1. Title Section (start) : 문서제목이 작성되는 영역입니다.-->
<div id="titleSection" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 19pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
	구 매 신 청 서
</div>
<!-- 1. Title Section (end) -->
<!-- 2. Draft Section (Start) : 결재정보가 작성되는 영역입니다. -->
<div class="partition" id="draftSection" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
	<!-- 2.1 Drafter Information (Start) -->
	<div class="left" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
		<table style="width:250px; height: 120px; margin-bottom: 30px;">
			<colgroup>
				<col width="80"><col width="170">
			</colgroup>
			<tbody>
				<tr>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">		
						기 안 자
					</td>
					<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<span class="comp_item">${user.empId}</span>
					</td>
				</tr>
				<tr>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">			
						소 속
					</td>
					<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<span class="comp_item">${user.depId}</span>
					</td>
				</tr>
				<tr>
					<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">				
						기 안 일
					</td>
					<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
							<span class="comp_item" id="currentDate"><fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd"/></span>
				</td>
			</tr>
			<tr>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					문서번호
				</td>
				<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
						<span class="comp_item"></span>
				</td>
			</tr>
		</tbody>
	</table>
</div>
	<table class="approvalLine" border="1" cellpadding="5" cellspacing="0">
    <tr>
        <td rowspan="3" style="background-color: #DDDDDD;"><strong>결재선</strong></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 50px">
            <img class="approveds" src="${contextPath}/image/approved.png">
						&nbsp;
        </td>
        <td>
        		<img class="approveds" src="${contextPath}/image/approved.png">
        		&nbsp;
     		</td>
    </tr>
    <tr>
        <td>${approval.submitDt}&nbsp;</td>
        <td>${approval.appDt}&nbsp;</td>
    </tr>
</table>


<!-- 2.1 Drafter Information (end) -->
<!-- 2.2 Draft Line (start) -->
<div class="inaRowRight" style="width: 800px; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">

</div>
<!-- 2.2 Draft Line (end) -->
</div>
<!-- 2. Draft Section (end) -->
<!-- 3. Detail Section (start) : 내용이 작성되는 영역입니다. -->
<table id="dynamic_table" class="fixed-size">
	<colgroup>
	<!-- ### 테이블의 컬럼 너비는 colGroup을 통해 지정합니다. td에 지정 X ### -->
		<col width="200">
		<col width="80">
		<col width="60">
		<col width="100">
		<col width="100">
		<col width="260">
	</colgroup>
 
	<tbody>
	<!--기본 행 추가/삭제 + 자동 연산-->
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				소속
			</td>
			<td colspan="3" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
						<input class="ipt_editor" type="text">
					<br>
				</p>
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				작 성 자
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
						<input class="ipt_editor" type="text">
				<br>
			</p>
		</td>
	</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				제 목
			</td>
			<td colspan="5" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
						<input class="ipt_editor" type="text">
					<br>
				</p>
			</td>
		</tr>
		<tr>
			<td colspan="6" style="border:none !important;" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="6" class="viewModeHiddenPart td_button dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<button id="plus" class="inline-flex rounded bg-[#637381] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90" type="button">
        		 추가
        </button>
				<button id="minus" class="inline-flex rounded bg-[#637381] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90" type="button">
        		 삭제
        </button>
			</td>
		</tr>
		<tr>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				품 명
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				규 격
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				수 량
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				단 가
			</td>
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				금 액
			</td>
			<td colspan="1" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				비 고
			</td>
		</tr>
		<!-- 사용자가 입력하는 영역 -->
		<tr class="copyRow">
			<!-- 품명 -->
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor" type="text">
				</span><br></p>
			</td>
			<!-- 규격 -->
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor" type="text">
				</span><br></p>
			</td>
			<!-- 수량 -->
			<td class="detailColumn amount rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor ipt_editor_currency amount-input" id="quantity" type="text" style="width: 100%;">
				</span><br></p>
			</td>
			<!-- 단가 -->
			<td class="detailColumn price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;">
					<span style="width: 100%;">
						<input class="ipt_editor ipt_editor_currency price-input" id="unit-price" type="text" style="width: 100%;">
					</span><br></p>
			</td>
			<!-- 금액 -->
			<td id="amount-label" class="detailColumn cur rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" class="amount-price" style="text-align: right;"> 
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><br></p>
			</td>
			<!-- 비고 -->
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" >
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor" type="text">
				</span><br></p>
			</td>
		</tr>
		<tr>
			<td colspan="1" style="text-align:center; font-weight:bold !important;" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				합 계
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td class="detailColumn total_amount rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td class="detailColumn total_price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td class="detailColumn total_cur rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;"><br></p>
			</td>
		</tr>
		<tr>
			<td style="text-align:center; font-weight:bold !important;" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				기 타
			</td>
			<td colspan="5" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
			    <p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
			        <span style="width: 100%;">
			            <textarea class="txta_editor" style="width: 100%; height: 100px;"></textarea>
			        </span><br>
			    </p>
			</td>
		</tr>
		<!-- 합계 행 End-->
	</tbody>



<style type="text/css">
#divCustomWrapper { word-break: break-all;  font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; width:800px !important; }
#divCustomWrapper * { max-width: 800px !important; }
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 20px !important; vertical-align: middle; }
#divCustomWrapper #titleSection { text-align: center; font-size: 25px; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper #draftSection { display: inline-block; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
#divCustomWrapper table { border-collapse: collapse; word-break:break-all; }
#divCustomWrapper td.subjectColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 1px 3px 1px;/*top right bottom left*/}
#divCustomWrapper td.detailColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 5px 3px 5px; vertical-align: middle;/*top right bottom left*/ }
#divCustomWrapper td.detailColumn { text-align: left; }
#divCustomWrapper td.subjectColumn { background: rgb(221, 221, 221); font-weight: bold; text-align: center; vertical-align: middle; }
#divCustomWrapper td.detailColumn.centerCol { text-align: center; }
#divCustomWrapper td.detailColumn.rightCol { text-align: right; }
#divCustomWrapper td.detailColumn.editorCol { height: 300px; vertical-align: top;}
#divCustomWrapper td.detailColumn.areaCol { height: 120px; vertical-align: top; }
#divCustomWrapper div.partition .left { display: inline-block; clear: left; float: left; }
#divCustomWrapper div.partition .right { display: inline-block; clear: right; float: right; }
#divCustomWrapper div.inaRowRight { text-align: right; }
#divCustomWrapper div.inaRowLeft { text-align: left; }
#divCustomWrapper .td_button { word-break:break-all; padding: 3px; border: none; width: 800px; height: 22px; text-align: right; vertical-align: middle; }
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; border: none; margin-top:2px; margin-bottom:2px; height: 22px; vertical-align: middle;}
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; margin-right: 0px; margin-left: 0px; font-size: 9pt !important; }
p.titleP{font-weight: bold; font-size: 12px; margin: 15px 1px 5px 5px;/*top right bottom left*/}
p.freeP{font-weight: normal; font-size: 12px; margin: 1px 1px 3px 5px;/*top right bottom left*/}
</style>
</table>
</div>
</form>
</div>
</div>
</body>
<script>



$(document).ready(function() {
    // 문서 상태가 2일 때 결재선 이미지를 보이도록 설정
    var docStatus = 2; // 문서 상태 값 (예시로 2로 설정)

    if (docStatus === 2) {
        $(".approved").show(); // 결재선 이미지 보이기
    } else {
        $(".approved").hide(); // 결재선 이미지 숨기기
    }
});


document.addEventListener("DOMContentLoaded", function() {
    // 추가 버튼 이벤트 처리
    document.getElementById("plus").addEventListener("click", function() {
        var table = document.getElementById("dynamic_table").getElementsByTagName('tbody')[0];
        
        // 현재 행 개수 확인
        var rowCount = table.rows.length;

        // 최대 행 개수 설정 (합계 행, 기타 행 포함하여 최대 10개)
        var maxRows = 17;

        if (rowCount < maxRows) { // 최대 행 개수보다 적은 경우에만 추가
            var newRow = table.insertRow(table.rows.length - 2); // 합계 행과 기타 행 사이에 새로운 행 삽입

            var cells = newRow.insertCell(0);
            cells.innerHTML = '<input type="text" class="ipt_editor">'; // 품명 입력 필드

            cells = newRow.insertCell(1);
            cells.innerHTML = '<input type="text" class="ipt_editor">'; // 규격 입력 필드

            cells = newRow.insertCell(2);
            cells.innerHTML = '<input type="text" class="ipt_editor ipt_editor_currency amount-input">'; // 수량 입력 필드
            cells.querySelector(".amount-input").addEventListener("input", calculateAmount); // 수량 입력 이벤트 리스너 추가

            cells = newRow.insertCell(3);
            cells.innerHTML = '<input type="text" class="ipt_editor ipt_editor_currency price-input">'; // 단가 입력 필드
            cells.querySelector(".price-input").addEventListener("input", calculateAmount); // 단가 입력 이벤트 리스너 추가

            cells = newRow.insertCell(4);
            cells.innerHTML = '<span class="amount-label" style="text-align: right"></span>'; // 금액 표시 Span (오른쪽 정렬)
            cells.style.textAlign = "right";


            cells = newRow.insertCell(5);
            cells.innerHTML = '<input type="text" class="ipt_editor">'; // 비고 입력 필드

            // 추가 후 행 개수 다시 확인
            rowCount = table.rows.length;
            
            // 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(rowCount);
        }
    });

    // 삭제 버튼 이벤트 처리
    document.getElementById("minus").addEventListener("click", function() {
        var table = document.getElementById("dynamic_table").getElementsByTagName('tbody')[0];
        if (table.rows.length > 8) { // 기본 행과 합계/기타 행을 제외한 경우에만 삭제 가능
            table.deleteRow(table.rows.length - 3); // 합계 행과 기타 행 사이의 마지막 행을 삭제

            // 삭제 후 행 개수 다시 확인
            var rowCount = table.rows.length;
            
            // 삭제 후 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(rowCount);
        }
    });

    // 금액을 계산하고 표시하는 함수
    function calculateAmount() {
        var row = this.closest("tr"); // 현재 입력 필드가 포함된 행 선택
        var quantity = parseFloat(row.querySelector(".amount-input").value); // 수량
        var unitPrice = parseFloat(row.querySelector(".price-input").value); // 단가
        var amountLabel = row.querySelector(".amount-label"); // 금액 표시 Span

        // 수량과 단가가 숫자로 변환 가능한지 확인
        if (!isNaN(quantity) && !isNaN(unitPrice)) {
            var amount = quantity * unitPrice; // 수량 * 단가 계산
            amountLabel.textContent = amount.toLocaleString('en-US'); // 계산된 금액을 화면에 표시
        } else {
            amountLabel.textContent = ''; // 수량 혹은 단가가 입력되지 않았을 경우 금액을 비움
        }
    }

    // 삭제 버튼 활성화 여부를 설정하는 함수
    function toggleDeleteButton(rowCount) {
        var minusButton = document.getElementById("minus");
        if (rowCount > 5) { // 추가된 행이 있을 때 삭제 버튼 활성화
            minusButton.disabled = false;
        } else { // 추가된 행이 없을 때 삭제 버튼 비활성화
            minusButton.disabled = true;
        }
    }
});

$(function() {
    // 숫자만 입력하도록 제한하는 함수
    function allowNumbersOnly(event) {
        // 입력된 값에서 숫자와 소수점을 제외한 모든 문자를 제거
        event.target.value = event.target.value.replace(/[^0-9.]/g, '');

        // 소수점이 여러 개인 경우 첫 번째 소수점만 남기고 나머지는 제거
        var decimalIndex = event.target.value.indexOf('.');
        if (decimalIndex !== -1) {
            event.target.value = event.target.value.slice(0, decimalIndex + 1) + event.target.value.slice(decimalIndex + 1).replace(/\./g, '');
        }
    }

    // 수량과 단가 입력 필드에서 숫자만 입력하도록 제한
    $("#quantity, #unit-price").on("input", function(event) {
        allowNumbersOnly(event); // 숫자만 입력하도록 제한하는 함수 호출
        calculateAmount(); // 계산 함수 호출
    });

    // 수량과 단가를 곱하여 금액을 계산하고 화면에 표시하는 함수
    function calculateAmount() {
        var quantity = parseFloat($("#quantity").val()); // 수량
        var unitPrice = parseFloat($("#unit-price").val()); // 단가

        // 수량과 단가가 숫자로 변환 가능한지 확인
        if (!isNaN(quantity) && !isNaN(unitPrice)) {
            var amount = quantity * unitPrice; // 수량 * 단가 계산
            $("#amount-label").text(amount.toLocaleString('en-US')); // 계산된 금액을 화면에 표시
        } else {
            $("#amount-label").text(''); // 수량 혹은 단가가 입력되지 않았을 경우 금액을 비움
        }
    }
});

document.getElementById('emergency').addEventListener('change', function() {
    var urgentImage = document.getElementById('urgent');
    if (this.checked) {
        urgentImage.style.display = 'inline'; // 체크되면 이미지 보이기
    } else {
        urgentImage.style.display = 'none'; // 체크 해제되면 이미지 숨기기
    }
});
</script>



<jsp:include page="../layout/closer.jsp"/>