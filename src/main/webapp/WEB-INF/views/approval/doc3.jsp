<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.4.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>


<style>
    .button-container {
        
        margin-bottom: 10px; /* 버튼들 아래 여백 추가 */
    }

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
</style>

<div class="wrapper">
<div class="mx-auto max-w-screen-2xl p-2 md:p-2 2xl:p-6">
    <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
        <h2 class="text-title-md2 font-bold text-black dark:text-white mt-4">문서 작성</h2>
</div>

<div style="font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
    <span class="button-container">
        <a href="#" class="items-center justify-center rounded-md bg-primary px-7 py-3 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-5">
            결재요청
        </a>
        <a href="#" class="items-center justify-center rounded-md bg-primary px-7 py-3 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-5">
            임시저장
        </a>
        <a href="#" class="items-center justify-center rounded-md bg-primary px-7 py-3 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-5">
            작성취소
        </a>
        <a href="#" class="items-center justify-center rounded-md bg-primary px-7 py-3 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-5">
            결재정보
        </a>
    </span>
    <span>
    	<i class="fi fi-rr-light-emergency-on"></i>
    </span>

    <table style="border: 0px solid rgb(0, 0, 0); width: 800px; font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse;">
        <!-- Header -->
        <colgroup>
            <col width="310">
            <col width="490">
        </colgroup>

        <tbody>
            <tr>
                <td style="background: white; padding: 0px !important; border: 0px currentColor; height: 60px; text-align: center; color: black; font-size: 25px; font-weight: bold; vertical-align: middle;" colspan="2" class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                    법인카드 지출결의서
                </td>
            </tr>
            <tr>
                <td style="background: white; padding: 0px !important; border: currentColor; text-align: left; color: black; font-size: 12px; font-weight: normal; vertical-align: top;">

                    <table style="border: 1px solid rgb(0, 0, 0); font-family: malgun gothic,dotum,arial,tahoma; margin-top: 1px; border-collapse: collapse;">
                        <!-- User -->
                        <colgroup>
                            <col width="90">
                            <col width="220">
                        </colgroup>
        
	<tbody>
		<tr>
			<td style="background: rgb(226, 226, 226); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				기안자 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="0" data-dsl="{{label:draftUser}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">
						기안자
					</span>
					
					<span contenteditable="false" class="comp_active" style="display: block; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<span class="Active_dot1"></span>
						<span class="Active_dot2"></span> 
						<span class="Active_dot3"></span>
						<span class="Active_dot4"></span> 
					</span> 
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="0" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span> 
				</span> 
			</td>
		</tr>
		<tr>
			<td style="background: rgb(226, 226, 226); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				소속 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="1" data-dsl="{{label:draftDept}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">
						기안부서
					</span>
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<span class="Active_dot1"></span>
						<span class="Active_dot2"></span> 
						<span class="Active_dot3"></span>
						<span class="Active_dot4"></span> 
					</span> 
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="1" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span> 
				</span> 
			</td>
		</tr>
		<tr>
			<td style="background: rgb(226, 226, 226); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				 기안일 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="2" data-dsl="{{label:draftDate}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">
						기안일
					</span>
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<span class="Active_dot1"></span><span class="Active_dot2"></span> 
						<span class="Active_dot3"></span><span class="Active_dot4"></span> 
					</span> 
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="2" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span> 
				</span> 
			</td>
		</tr>
		<tr>
			<td style="background: rgb(226, 226, 226); padding: 5px; border: 1px solid black; height: 18px; text-align: center; color: rgb(0, 0, 0); font-size: 12px; font-weight: bold; vertical-align: middle;">
				문서번호 
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; text-align: left; color: rgb(0, 0, 0); font-size: 12px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="3" data-dsl="{{label:docNo}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
					<span class="comp_item" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;">
						문서번호
					</span>
					<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<span class="Active_dot1"></span>
						<span class="Active_dot2"></span> 
						<span class="Active_dot3"></span>
						<span class="Active_dot4"></span> 
					</span> 
					
					<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="3" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
						<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
					</span> 
				</span> 
			</td>
		</tr>
	</tbody>
</table>
			</td>

		</tr>
	</tbody>
</table>
 </span>
 <div style="font-family: 돋움; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; background-color: white;">
 <br>
 </div>
 
 <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 800px; height: 142px; background-color: white;">
	<colgroup>
		<col width="72" style="width: 72px;"> 
		<col width="27" style="width: 27px;"> 
		<col width="50" span="3" style="width: 51px;"> 
		<col width="72" style="width: 72px;"> 
		<col width="84" style="width: 84px;"> 
		<col width="43" style="width: 43px;"> 
		<col width="72" span="4" style="width: 72px;"> 
		<col width="96" style="width: 96px;"> 
	</colgroup>
	<tbody>
		<tr>
			<td height="30" width="72" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border: 1px solid windowtext; height: 30px; width: 80px; background-color: rgb(226, 226, 226);">
				<strong style="font-size: 9pt;">제 목</strong>
			</td>
			<td colspan="12" width="760" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; border-image: initial; font-size: 10pt; text-align: center; border-width: 1px; border-style: solid; border-color: windowtext black windowtext windowtext; width: 720px;">
				<p style="text-align: left; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="4" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;" data-value="" data-autotype="">
						<input class="ipt_editor" type="text">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="4" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
					<br>
				</p>
			</td>
		</tr>
		<tr>
			<td height="30" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 30px; border-top: none; background-color: rgb(226, 226, 226); width: 83px;" class="dext_table_border_t">
				<strong style="font-size: 9pt;">작성일자</strong>
			</td>
			<td colspan="6" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 303px;" class="dext_table_border_l">
				<p style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="5" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;" data-value="" data-autotype="">
						<input class="ipt_editor ipt_editor_date" type="text" style="width: 100px;">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="5" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
					<br>
				</p>
			</td>
			<td style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 30px; border-top: none; background-color: rgb(226, 226, 226); width: 79px;" class="dext_table_border_t">
				<strong style="font-size: 9pt;">소 속</strong>
			</td>
			<td colspan="5" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 242px;" class="dext_table_border_l">
				<p style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;" data-value="" data-autotype="">
						<input class="ipt_editor" type="text">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
					<br>
				</p>
			</td>
		</tr>
		<tr>
			<td height="30" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 30px; border-top: none; background-color: rgb(226, 226, 226); width: 83px;" class="dext_table_border_t">
				<strong style="font-size: 9pt;">작 성 자</strong>
			</td>
			<td colspan="6" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 303px;" class="dext_table_border_l">
				<p style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;" data-value="" data-autotype="">
						<input class="ipt_editor" type="text">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
					<br>
				</p>
			</td>
			<td style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 30px; border-top: none; background-color: rgb(226, 226, 226); width: 79px;" class="dext_table_border_t">
				<strong style="font-size: 9pt;">금 액</strong>
			</td>
			<td class="total_price dext_table_border_l" colspan="5" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 242px;">
				<p><br></p>
			</td>
		</tr>
		<tr>
			<td height="150" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: middle; text-align: center; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-left: 1px solid windowtext; border-image: initial; height: 51px; border-top: none; background-color: rgb(226, 226, 226); width: 83px;" class="dext_table_border_t">
				<strong style="font-size: 9pt;">지출사유</strong>
			</td>
			<td colspan="12" style="padding-top: 1px; padding-right: 1px; padding-left: 1px; font-family: &quot;맑은 고딕&quot;, monospace; vertical-align: top; font-size: 10pt; text-align: center; border-top: 1px solid windowtext; border-right: 1px solid windowtext; border-bottom: 1px solid windowtext; border-image: initial; border-left: none; width: 683px; height: 51px; background-repeat: no-repeat;" class="dext_table_border_l">
				<p style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt; line-height: 20px; margin-top: 0px; margin-bottom: 0px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{textarea}}" data-wrapper="" style="width: 100%; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;" data-value="" data-autotype="">
						<textarea class="txta_editor"></textarea>
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8" style="font-family: &quot;맑은 고딕&quot;, monospace; font-size: 10pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
					<br>
				</p>
			</td>
		</tr>
	</tbody>
</table>

<div id="divCustomWrapper" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;">
	<table id="dynamic_table1" class="detailSection" style="margin-top: 5px !important; height: 100px;">
		<colgroup>
			<col width="135"> 
			<col width="180"> 
			<col width="255"> 
			<col width="110">
			<col width="120"> 
		</colgroup>
		<tbody>
			<tr>
				<td colspan="5" class="viewModeHiddenPart td_button dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					<a class="button" id="plus1" data-bypass="">추가</a>
					<a class="button" id="minus1" data-bypass="">삭제</a>
				</td>
			</tr>
			<tr>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
					<span style="font-size: 9pt;">
						일 자
					</span>
				</td>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
					<span style="font-size: 9pt;">
						분 류
					</span>
				</td>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
					<span style="font-size: 9pt;">
						사용 내역
					</span>
				</td>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
					<span style="font-size: 9pt;">
						금 액
					</span>
				</td>
				<td class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="">
					<span style="font-size: 9pt;">
						비 고
					</span>
				</td>
			</tr>
			<tr class="copyRow1">
				<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="9" data-dsl="{{calendar}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
						<input class="ipt_editor ipt_editor_date" type="text" style="width: 100px;">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="9" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
				</td>
				<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="10" data-dsl="{{cSel__물품구입비_잡비_회식비_식비_교통비_기타}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
						<select class="editor_slt" style="width:100%">
							<option selected="selected"></option>
							<option>물품구입비</option>
							<option>잡비</option>
							<option>회식비</option>
							<option>식비</option>
							<option>교통비</option>
							<option>기타</option>
						</select>
						<span contenteditable="false" class="comp_active" "="" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="10" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
				</td>
				<td class="detailColumn centerCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="12" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
						<input class="ipt_editor" type="text" style="width: 200px;">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="12" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
				</td>
				<td class="detailColumn centerCol price dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="11" data-dsl="{{currency_0}}" data-wrapper="" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
						<input class="ipt_editor ipt_editor_currency" type="text" style="width: 100px;">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="11" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
				</td>
				<td class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l" style="height: 29px;">
					<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="13" data-dsl="{{text}}" data-wrapper="" style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;" data-value="" data-autotype="">
						<input class="ipt_editor" type="text" style="width: 100px;">
						<span contenteditable="false" class="comp_active" style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<span class="Active_dot1"></span>
							<span class="Active_dot2"></span> 
							<span class="Active_dot3"></span>
							<span class="Active_dot4"></span> 
						</span> 
						<span contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="13" style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt;"> 
							<a contenteditable="false" class="ic_prototype ic_prototype_trash" data-content-protect-cover="true" data-component-delete-button="true"></a> 
						</span> 
					</span>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="subjectColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					합계
				</td>
				<td class="detailColumn total_price rightCol dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
						<br>
					</p>
				</td>
				<td colspan="1" class="detailColumn dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
					<p style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 9pt; line-height: 150%; margin-top: 0px; margin-bottom: 0px;">
						<br>
					</p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</div>
<div class="flex flex-col gap-2 p-4">
    <div>
        <label class="mb-2 block text-sm font-medium text-black dark:text-white">
            파일첨부
        </label>
        <input type="file" class="w-full cursor-pointer rounded-lg border-[1.5px] border-stroke bg-transparent font-normal outline-none transition file:mr-3 file:border-collapse file:cursor-pointer file:border-0 file:border-r file:border-solid file:border-stroke file:bg-whiter file:px-3 file:py-1 file:hover:bg-primary file:hover:bg-opacity-10 focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-form-strokedark dark:file:bg-white/30 dark:file:text-white dark:focus:border-primary">
    </div>
</div>
<div>


<style type="text/css">
/* 1. Essential style : 반드시 적용되어야 하는 스타일입니다. 문서작성 시, Sample에서 제거불가 한 스타일 */
#divCustomWrapper { word-break: break-all;  font-family: malgun gothic, dotum, arial, tahoma; font-size: 9pt;  }
#divCustomWrapper * { max-width: 800px !important; }
/* (1) Section(제목, 결재선, 내용) */
#divCustomWrapper #titleSection,
#divCustomWrapper #draftSection,
#divCustomWrapper .detailSection { width:800px !important; clear:both; margin-top: 20px !important; vertical-align: middle; }
#divCustomWrapper #titleSection { text-align: center; font-size: 25px; font-weight: bold; margin-bottom: 30px !important; margin-top: 20px !important; }
#divCustomWrapper #draftSection { display: inline-block; }
#divCustomWrapper .detailSection > * { margin-bottom: 10px; }
/* (2) Table */
#divCustomWrapper table { border-collapse: collapse; table-layout:fixed; word-break:break-all; }
</style>
<style type="text/css">
/* 2. Option style : 용도에 따라 적용합니다.*/
/* (1) Table option : 2Type(subject / detail), Affacted elements(td), Range('divCustomWrapper' 하단요소) */
#divCustomWrapper td.subjectColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 1px 3px 1px;/*top right bottom left*/}
#divCustomWrapper td.detailColumn { border: 1px solid black !important; font-size: 9pt !important; height:22px; padding: 3px 5px 3px 5px;/*top right bottom left*/ }
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
#divCustomWrapper div.inaRowLeft { text-align: left;  }
/* (5) button :  2Type(td / div), Affacted elements(All) */
/* 설명 : 행 추가, 행 삭제 버튼 작성 시 'viewModeHiddenPart'(기안 시 버튼 가려주는 클래스)와 조합해서 사용 */
/* 사용방법 : 테이블에 한줄로 사용 시 td에 'viewModeHiddenPart .td_button' CLASS 적용 -> 각 버튼에 'button' CLASS 적용 td 내 텍스트 아래에 쓰이거나 테이블 밖에서 사용 시 div에 viewModeHiddenPart .div_button CLASS 적용 -> 각 버튼에 button CLASS 적용 */
#divCustomWrapper .td_button { word-break:break-all; padding: 3px; border: none; width: 800px; height: 22px; text-align: right; vertical-align: middle; }
#divCustomWrapper .div_button { word-break:break-all; padding: 3px; border: none; margin-top:2px; margin-bottom:2px; height: 22px; vertical-align: middle;}
#divCustomWrapper a.button { background: rgb(102, 102, 102); color: rgb(255, 255, 255); padding: 2px 5px; border-radius: 3px; margin-right: 0px; margin-left: 0px; font-size: 9pt !important;}
/* (6) p :  2Type(titleP / freeP), Affacted elements(All) */
/* 설명 : 테이블 별 소제목과 테이블 아래 설명 작성 시 사용*/
p.titleP{font-weight: bold; font-size: 12px; margin: 15px 1px 5px 5px;/*top right bottom left*/}
p.freeP{font-weight: normal; font-size: 12px; margin: 1px 1px 3px 5px;/*top right bottom left*/}
</style>
<!-- Common style (Don't modify) -->
<!-- Print style (Don't modify) -->
<style type="text/css">
/* 인쇄시에만 적용되는 스타일입니다. 순서대로 1.양식 인쇄 시 중앙으로 위치 2.테이블 테두리 고정 3.버튼 가리기 */
@media print {
.viewModeHiddenPart {display: none;}
h1, h2, h3, h4, h5, dl, dt, dd, ul, li, ol, th, td, p, blockquote, form, fieldset, legend, div,body { -webkit-print-color-adjust:exact; }
}
</style>
<!-- Print style (Don't modify)-->
<!-- Custom style -->
<style>
/* 추가적인 스타일이 필요한 경우, 하단의 style에서 정의하여야 합니다. 상단의 Common style은 변경하지 않습니다. */
/* (스타일이 중복되는 경우, 기본적으로 하단에 작성한 style이 우선적으로 적용됩니다.) */
#divCustomWrapper td.subjectColumn.no { background: rgb(255, 255, 255);border:none !important;}
#divCustomWrapper td.detailColumn.no { border:none !important;}
#divCustomWrapper td.subjectColumn.leftCol { text-align: left !important; }
</style>





<script defer src="${contextPath}/js/doc.js"></script>
<script>
    function showElement() {
    var element = document.querySelector('.comp_active');
    element.style.display = 'inline';
</script>


<jsp:include page="../layout/closer.jsp"/>