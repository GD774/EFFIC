<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>

<style>
* {
    text-decoration: none !important;
}

.calendarbox {
    margin-top: 20px;
    margin-left: 150px;
    width: 1300px;
}
</style>

<!-- fullcalendar -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
<script src='fullcalendar/dist/index.global.js'></script>

<!-- 부트스트랩 Modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="../layout/sidebar.jsp"/>

<div class="calendarbox">
    <h1 id="calendarhead" style="font-size: 50px; font-weight: bold; color: rgb(65,105,225); margin-bottom: 20px;">일정</h1>
    <hr>
    <div id='calendar'></div>
</div>

<!-- Modal -->
<div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="dateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dateModalLabel">일정 등록</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="#" >
                <div>
                    제목: <input id="title" style="border: solid 1px gray;  margin-left: 32px; width: 600px;" placeholder="필수 입력사항입니다.">
                </div>
                    <div>
                        시작날짜: <input class="start-date" style="border: solid 1px gray; margin-top: 20px; width: 600px;" id="datepicker" placeholder="필수 입력사항입니다."><br>
                    </div>
                    <div id="end-date-row">
                        종료날짜: <input class="end-date" style="border: solid 1px gray; margin-top: 20px; width: 600px;" id="datepicker2" placeholder="필수 입력사항입니다."><br>
                    </div>
                    종일 <input type="checkbox" id="all-day-checkbox">
                    <div>
                        공개범위:
                        <select name="openRange" id="openRange" style="border: solid 1px gray; margin-top: 20px;">
                            <option value="" selected="selected">내 일정</option>
                            <option value="">부서일정</option>
                            <option value="">전사일정</option>
                        </select>
                    </div>
                    <div>
                        내용: <input id="contents" style="border: solid 1px gray; margin-top:20px; margin-left: 32px; width: 600px; height: 300px;">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            dateClick: function(info) {
                // 날짜 클릭 시 시작날짜 입력 필드에 값 설정
                $('#datepicker').datepicker('setDate', info.date);
                $('#datepicker2').datepicker('setDate', null);  // 종료날짜를 빈 값으로 설정

                // 모달 표시
                $('#dateModal').modal('show');
            },
            height: 700
        });

        calendar.render();
    });

    $(function() {
        // datepicker 선언
        $("#datepicker").datepicker({
            dateFormat: 'yy-mm-dd', // 달력 날짜 형태
            showOtherMonths: true, // 빈 공간에 현재월의 앞뒤월의 날짜 표시
            showMonthAfterYear: true, // 월-년 순서가 아닌 년도-월 순서
            changeYear: true, // 년 선택 가능
            changeMonth: true, // 월 선택 가능
            yearSuffix: "년", // 년도 부분 텍스트
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 부분 텍스트
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 부분 Tooltip
            dayNamesMin: ['일','월','화','수','목','금','토'], // 요일 텍스트
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'], // 요일 Tooltip
            minDate: "-5Y", // 최소 선택일자
            maxDate: "+5Y" // 최대 선택일자
        });

        // 종료날짜 datepicker 선언
        $("#datepicker2").datepicker({
            dateFormat: 'yy-mm-dd',
            showOtherMonths: true,
            showMonthAfterYear: true,
            changeYear: true,
            changeMonth: true,
            yearSuffix: "년",
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
            dayNamesMin: ['일','월','화','수','목','금','토'],
            dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
            minDate: "-5Y",
            maxDate: "+5Y"
        });

        // 초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker();
        $('#datepicker2').datepicker();

        // 종일 체크박스 이벤트 핸들러
        $('#all-day-checkbox').change(function() {
            if (this.checked) {
                $('#end-date-row').hide();
            } else {
                $('#end-date-row').show();
            }
        });
    });
</script>

<jsp:include page="../layout/closer.jsp"/>
