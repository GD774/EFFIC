<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/backbone.js/1.4.0/backbone-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.13.1/underscore-min.js"></script>
<script defer src="${contextPath}/js/docTemp1.js"></script>


<style>
    .button-container a {
        display: inline-block; /* 가로로 나란히 배치 */
        padding: 8px 12px; /* 버튼의 padding 조정 */
        border: 1px solid #3182ce; /* 테두리 추가 */
        border-radius: 4px; /* 버튼을 둥글게 */
        background-color: #4f61e3;
        color: white;
        text-decoration: none;
        text-align: center;
        font-size: 14px;
        
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
    width: 50px; /* 원하는 크기로 조정하세요 */
    height: 48px; /* 원하는 크기로 조정하세요 */
    margin-right: 5px;
    margin-bottom: 7px;
    display: inline-block; /* 가로로 나란히 배치 */
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
      <button id="cancelWriting" class="inline-flex rounded bg-[#DC3545] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            상신취소
      </button>
    	<button id="goAppLine" class="inline-flex rounded bg-primary px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
            문서수정
      </button>
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
							<span class="comp_item" id="currentDate"></span>
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
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
			<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				금 액
			</td>
			<td colspan="1" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				비 고
			</td>
		</tr>
		<tr class="copyRow">
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor" type="text">
				</span><br></p>
			</td>
			<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor" type="text">
				</span><br></p>
			</td>
			<td class="detailColumn amount rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px;">
					<span style="width: 100%;">
						<input class="ipt_editor ipt_editor_currency" type="text" style="width: 100%;">
				</span><br></p>
			</td>
			<td class="detailColumn price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;">
					<span style="width: 100%;">
						<input class="ipt_editor ipt_editor_currency" type="text" style="width: 100%;">
					</span><br></p>
			</td>
			<td class="detailColumn cur rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
				<p style="font-size: 9pt; line-height: 18px; margin-top: 0px; margin-bottom: 0px; text-align: right;"><br></p>
			</td>
			<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
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
            var inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor");
            cells.appendChild(inputElement);

            cells = newRow.insertCell(1);
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor");
            cells.appendChild(inputElement);

            cells = newRow.insertCell(2);
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor ipt_editor_currency");
            cells.appendChild(inputElement);

            cells = newRow.insertCell(3);
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor ipt_editor_currency");
            cells.appendChild(inputElement);

            cells = newRow.insertCell(4);
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor ipt_editor_currency");
            cells.appendChild(inputElement);

            cells = newRow.insertCell(5);
            inputElement = document.createElement("input");
            inputElement.setAttribute("type", "text");
            inputElement.setAttribute("class", "ipt_editor");
            cells.appendChild(inputElement);

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
</script>



<jsp:include page="../layout/closer.jsp"/>