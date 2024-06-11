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

    .button-container a:hover {
        font-weight: bold;
    }
    
    .wrapper {
        background-color: white;
        overflow-y: auto; /* 세로 스크롤이 필요할 때만 스크롤 표시 */
        height: 100vh; /* 화면 높이에 맞게 스크롤 영역 제한 */
    }
   
   .approvalLine {
     float: right;
     margin-left: 20px;
   }
   
   #urgent {
    width: 50px; /* 원하는 크기로 조정하세요 */
    height: 48px; /* 원하는 크기로 조정하세요 */
    margin-right: 5px;
    margin-bottom: 7px;
    display: inline-block; /* 가로로 나란히 배치 */
   }
   
   .approvalLine {
    font-size: 10pt !important;
    line-height: 150% !important;
    width: 220px !important;
    height: 20% !important;
    border-collapse: collapse !important;
}

.approvalLine td {
    font-size: 9pt !important;
    width: 50px !important;
    border: 1px solid black !important;
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
    width: 30px; 
    display: block;
    text-align: center
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
    <span class="button-container">
    	<a href="#" id="approvalRequest" class="inline-flex items-center justify-center rounded-md bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
            결재요청
      </a>
    	<a href="#" id="saveDraft" class="inline-flex items-center justify-center rounded-md bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
            임시저장
      </a>
    	<a href="#" id="cancelWriting" class="inline-flex items-center justify-center rounded-md bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
            작성취소
      </a>
    	<a href="#" id="approvalLine" class="inline-flex items-center justify-center rounded-md bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
            결재정보
      </a>
    </span>
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
		<table style="width:250px; height: 120px;">
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
        <td rowspan="3"><strong>결재선</strong></td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td style="height: 50px">
            <img class="approveds" src="${contextPath}/image/approved.png">
            &nbsp;
        </td>
        <td>&nbsp;</td>
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
<table id="dynamic_table" class="detailSection">
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
				<a class="addRow" id="plus" data-bypass="">추가</a>
				<a class="removeRow" id="minus" data-bypass="">삭제</a>
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


	<!-- 3. Detail Section (end) -->
	<!-- Page Wrapping (end) -->
	<!--Style Start---------------------------------------->
	<!-- Common style (Don't modify) -->
<style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper { word-break: break-all;  font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt; width:800px !important; }
#divCustomWrapper * { max-width: 800px !important; }
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 20px !important; vertical-align: middle; }
#divCustomWrapper #titleSection { text-align: center; font-size: 25px; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper #draftSection { display: inline-block; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
/* (2) Table */
#divCustomWrapper table { border-collapse: collapse; word-break:break-all; }
</style><style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 1px 3px 1px;/*top right bottom left*/}
#divCustomWrapper td.detailColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 5px 3px 5px; vertical-align: middle;/*top right bottom left*/ }
#divCustomWrapper td.detailColumn { text-align: left; }
#divCustomWrapper td.subjectColumn { background: rgb(221, 221, 221); font-weight: bold; text-align: center; vertical-align: middle; }
/* (2) detailColumn :  3Type(center / right / high), Affacted elements(All), Range('detailColumn' 하단요소) */
/* 설명 : detailColumn 커스텀 시 사용 */
/* 사용방법 : 번호와 중앙정렬 텍스트 작성 시 'centerCol' CLASS 적용, 숫자와 금액 작성 시 'rightCol' CLASS 적용,
   editor 작성 시 'editorCol' CLASS 적용, textarea 작성 시 'areaCol' CLASS 적용 */
#divCustomWrapper td.detailColumn.centerCol { text-align: center; }
#divCustomWrapper td.detailColumn.rightCol { text-align: right; }
#divCustomWrapper td.detailColumn.editorCol { height: 300px; vertical-align: top;}
#divCustomWrapper td.detailColumn.areaCol { height: 120px; vertical-align: top; }
/* (3) Partition option : 2Type (left / right), Affacted elements(div), Range('partition'div영역 하단요소) */
/* 설명 : 좌,우로 분할되는 레이아웃 작성시 사용, 1라인에 1개 요소만 배치(줄바뀜 동반) */
/* 사용방법 : 분할할 영역에 partition CLASS를 적용 -> 분할배치하고자하는 하위요소에 'left, right' CLASS 적용 */
#divCustomWrapper div.partition .left { display: inline-block; clear: left; float: left; }
#divCustomWrapper div.partition .right { display: inline-block; clear: right; float: right; }
/* (4) In a row option : 2Type(left / right), Affacted elements(All), Range('inaRowRight or inRowLeft'div영역 하단요소) */
/* 설명 : 좌,우 끝에 정렬되는 레이아웃 작성 시 사용, 1라인에 여러개 요소 배치, Partition option과 조합(줄바뀜 없이 배치) */
/* 사용방법 : 나란히 정렬하고자 하는 요소들을, 'in a row'div 영역 내에 배치 */
#divCustomWrapper div.inaRowRight { text-align: right; }
#divCustomWrapper div.inaRowLeft { text-align: left; }
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button { word-break:break-all; padding: 3px; border: none; width: 800px; height: 22px; text-align: right; vertical-align: middle; }
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; border: none; margin-top:2px; margin-bottom:2px; height: 22px; vertical-align: middle;}
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; margin-right: 0px; margin-left: 0px; font-size: 9pt !important; }
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP{font-weight: bold; font-size: 12px; margin: 15px 1px 5px 5px;/*top right bottom left*/}
p.freeP{font-weight: normal; font-size: 12px; margin: 1px 1px 3px 5px;/*top right bottom left*/}
</style><!-- Common style (Don't modify) --><!-- Print style (Don't modify) --><style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
.viewModeHiddenPart {display: none;}
h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, div,body { -webkit-print-color-adjust:exact; }}
</style><!-- Print style (Don't modify)--><style><!-- Custom style -->
/* 추가적인 스타일이 필요한 경우, 하단의 style에서 정의하여야 합니다. 상단의 Common style은 변경하지 않습니다. */
/* (스타일이 중복되는 경우, 기본적으로 하단에 작성한 style이 우선적으로 적용됩니다.) */
</style><!-- Custom style -->
</table>
</div>
	</form>
</div>
</div>
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

</script>

<jsp:include page="../layout/closer.jsp"/>