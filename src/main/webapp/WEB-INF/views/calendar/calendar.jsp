<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="../layout/opener.jsp"/>

<style>
* { text-decoration: none !important; }
.calendarbox { margin-top: 20px; margin-left: 150px; width: 1300px; }
</style>

<!-- fullcalendar -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
<script src='fullcalendar/dist/index.global.js'></script>

<!-- 부트스트랩 Modal -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
                <form id="scheduleForm">
                    <input type="hidden" name="scheduleId" id="scheduleId">
                    <div>
                        제목: <input name="title" id="title" style="border: solid 1px gray; margin-left: 32px; width: 600px;" placeholder="필수 입력사항입니다.">
                    </div>
                    <div>
                        시작날짜: <input name="startDt" class="start-date" style="border: solid 1px gray; margin-top: 20px; width: 600px;" id="datepicker" placeholder="필수 입력사항입니다."><br>
                    </div>
                    <div id="end-date-row">
                        종료날짜: <input name="endDt" class="end-date" style="border: solid 1px gray; margin-top: 20px; width: 600px;" id="datepicker2" placeholder="필수 입력사항입니다."><br>
                    </div>
                    종일 <input type="checkbox" id="all-day-checkbox">
                    <div>
                        공개범위:
                        <select name="docState" id="openRange" style="border: solid 1px gray; margin-top: 20px;">
                            <option value="1" selected="selected">내 일정</option>
                            <option value="2">부서일정</option>
                            <option value="3">전사일정</option>
                        </select>
                    </div>
                    <div>
                        내용: <textarea name="contents" id="contents" style="border: solid 1px gray; margin-top:20px; margin-left: 32px; width: 600px; height: 300px;"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitScheduleForm">등록</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger" id="deleteScheduleForm" style="display: none;">삭제</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $("#datepicker").datepicker({ dateFormat: 'yy-mm-dd' });
        $("#datepicker2").datepicker({ dateFormat: 'yy-mm-dd' });

        $('#all-day-checkbox').change(function() {
            if (this.checked) {
                $('#end-date-row').hide();
            } else {
                $('#end-date-row').show();
            }
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            events: function(fetchInfo, successCallback, failureCallback) {
                $.ajax({
                    url: '${contextPath}/calendar/events',
                    type: 'GET',
                    success: function(data) {
                        successCallback(data);
                    },
                    error: function() {
                        failureCallback();
                    }
                });
            },
            dateClick: function(info) {
                $('#datepicker').datepicker('setDate', info.date);
                $('#datepicker2').datepicker('setDate', info.date);
                $('#scheduleId').val('');
                $('#title').val('title');
                $('#contents').val('');
                $('#dateModal').modal('show');
                $('#deleteScheduleForm').hide();
            },
            eventClick: function(info) {
                $('#scheduleId').val(info.event.id);
                $('#title').val(info.event.title);
                $('#datepicker').datepicker('setDate', info.event.start);
                $('#datepicker2').datepicker('setDate', info.event.end);
                $('#contents').val(info.event.extendedProps.contents);
                $('#openRange').val(info.event.extendedProps.docState);
                $('#dateModal').modal('show');
                $('#deleteScheduleForm').show();
            }
        });
        calendar.render();
    });

    $(document).ready(function() {
        $('#submitScheduleForm').click(function() {
            var formData = {
                scheduleId: $('#scheduleId').val() || 0,
                title: $('#title').val(),
                startDt: $('#datepicker').val(),
                endDt: $('#datepicker2').val() || null,
                docState: $('#openRange').val(),
                contents: $('#contents').val(),
                allDay: $('#all-day-checkbox').is(':checked')
            };

            $.ajax({
                type: 'POST',
                url: '${contextPath}/calendar/create',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    alert('일정이 등록되었습니다.');
                    $('#dateModal').modal('hide');
                    location.reload();
                },
                error: function(error) {
                    alert('일정 등록에 실패했습니다.');
                }
            });
        });

        $('#deleteScheduleForm').click(function() {
            var scheduleId = $('#scheduleId').val();
            if (scheduleId) {
                $.ajax({
                    type: 'POST',
                    url: '${contextPath}/calendar/delete',
                    contentType: 'application/json',
                    data: JSON.stringify({ scheduleId: scheduleId }),
                    success: function(response) {
                        alert('일정이 삭제되었습니다.');
                        $('#dateModal').modal('hide');
                        location.reload();
                    },
                    error: function(error) {
                        alert('일정 삭제에 실패했습니다.');
                    }
                });
            }
        });
    });
</script>

<jsp:include page="../layout/closer.jsp"/>
