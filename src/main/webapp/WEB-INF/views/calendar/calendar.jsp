<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="../layout/opener.jsp"/>

<style>
* { text-decoration: none !important; }
.calendarbox { 
		margin-top: 20px; 
		margin-left: 150px; 
		width: 1300px;
		height: auto;
		
		}
		
#closeToGroup {
 margin-left: 60px;
}

.btn-third {
    color: #fff !important;
    background-color: #0d6efd !important;
    border-color: #0d6efd !important;
}

.fc-day-mon a {
		color: black
}
.fc-day-tue a {
		color: black
}
.fc-day-wed a {
		color: black
}
.fc-day-thu a {
		color: black
}
.fc-day-fri a {
		color: black
}



.fc-day-sun a {
    color: red;
}
  
/* 토요일 날짜: 파란색 */
.fc-day-sat a {
    color: blue;
}


.form-group {
    display: flex;
    align-items: center;
}

.form-group label {
    margin-top: 15px;
    white-space: nowrap; /* 레이블이 텍스트 영역의 줄바꿈을 막기 위해 */
    align-self: flex-start; /* 레이블이 텍스트 영역의 위쪽에 위치하지 않도록 */
    
}



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

<!-- jstree -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/jstree.min.js"></script>
<link rel="stylesheet" href="//static.jstree.com/3.3.15/assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/themes/default/style.min.css" />
 -->

<jsp:include page="../layout/sidebar.jsp"/>

<div class="calendarbox">
    <h1 id="calendarhead" style="font-size: 50px; font-weight: bold; color: rgb(65,105,225); margin-bottom: 20px;">일정관리</h1>
		 
  
 
    <hr>
    <div id='calendar'></div>
</div>





<!-- Modal -->
<div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="dateModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="dateModalLabel">일정 등록</h5>
                <h5 class="modal-title" id="dateModalLabel2">일정 상세보기</h5>
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
                    <div>
										    시작시간:
										    <select name="startHour" id="startHour" style="border: solid 1px gray; margin-top: 20px; width: 600px;">
										        <% for (int i = 0; i < 24; i++) { %>
										            <option value="<%= i %>"><%= String.format("%02d:00", i) %></option>
										        <% } %>
										    </select>
										</div>
										
										<div id="end-hour-row">
										    종료시간:
										    <select name="endHour" id="endHour" style="border: solid 1px gray; margin-top: 20px; width: 600px;">
										        <% for (int i = 0; i < 24; i++) { %>
										            <option value="<%= i %>"><%= String.format("%02d:00", i) %></option>
										        <% } %>
										    </select>
										</div>
                    
                    
                        공개범위:
                        <select name="docState" id="openRange" style="border: solid 1px gray; margin-top: 20px;">
                            <option value="1" selected="selected">내 일정</option>
                            <option value="2">부서일정</option>
                            <option value="3">전사일정</option>
                        </select>
                    </div>
                    <div class="form-group">
                    <label for="contents">내용  :</label>
                     <textarea name="contents" id="contents" style="border: solid 1px gray; margin-top:20px; margin-left:32px; width: 600px; height: 300px;"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitScheduleForm">등록</button>
                <button type="button" class="btn btn-third" id="modifyScheduleForm" style="display: none;">수정</button>
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
                // 종료 시간을 18:00으로 설정하고 종료 시간 입력을 숨깁니다.
                $('#datepicker2').datepicker('setDate', $('#datepicker').datepicker('getDate'));
                $('#endHour').val('23');
                $('#end-date-row').hide();
                $('#end-hour-row').hide();
            } else {
                $('#end-date-row').show();
                $('#end-hour-row').show();
            }
        });
    });

    function parseEvents(data) {
    	return data.map(event => {
           // startHour와 endHour가 제대로 설정되었는지 확인
            const startHour = (event.startHour || '00').trim();
       		  const endHour = (event.endHour || '00').trim();

		        // startDateTime와 endDateTime 설정
		        const startDateTime = event.startDt ? `\${event.startDt}T\${startHour.padStart(2, '0')}:00` : null;
		        const endDateTime = event.endDt ? `\${event.endDt}T\${endHour.padStart(2, '0')}:00` : null;
       	  	console.log(startDateTime, endDateTime);
       	  	
       	  	
            return {
                id: event.scheduleId,
                title: event.title,
                start: startDateTime,
                end: endDateTime,
                allDay: event.allDay || false,
                extendedProps: {
                    docState: event.docState,
                    contents: event.contents,
                    empId: event.empId,
                    depId: event.depId
                },
                backgroundColor: event.docState == 1 ? '#2ef061' : event.docState == 2 ? 'orange' : 'blue',
                borderColor: event.docState == 1 ? '#2ef061' : event.docState == 2 ? 'orange' : 'blue',
            };
        });
    }
    
    
    

    document.addEventListener('DOMContentLoaded', function() {
    	
    	 const holiday = {
    		        googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
    		        color: 'white',
    		        textColor: 'red'
    		    };
    	 console.log("공휴일정보 : " , holiday);	
    	
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
        		eventSources: [
        			holiday
        		],
        		dayMaxEventRows: true,
        		views: {
        		    timeGrid: {
        		      dayMaxEventRows: 3 // 이벤트 날짜 겹치는 일정 최대 3개까지 등장
        		    }
        		  },
            height: 800,
            slotLabelFormat: {
                hour: 'numeric',
                minute: '2-digit',
                omitZeroMinute: true,
                meridiem: 'short' // 'long'로 변경하여 'am'/'pm' 표기
            },
            eventTimeFormat: {
                hour: 'numeric',
                minute: '2-digit',
                omitZeroMinute: true,
                meridiem: 'short' // 'long'로 변경하여 'am'/'pm' 표기
            },
   
            events: function(fetchInfo, successCallback, failureCallback) {
                $.ajax({
                    url: '${contextPath}/calendar/events',
                    type: 'GET',
                    success: function(data) {
                        var events = parseEvents(data);
                        successCallback(events);
                        console.log("Parsed events:", events);
                    },
                    error: function(xhr, status, error) {
                        alert('일정 조회에 실패했습니다.');
                        console.log("Error details:", status, error, xhr.responseText);
                    }
                });
            },
            dateClick: function(info) {
            	
            		$('#dateModalLabel').show();
                $('#dateModalLabel2').hide();
                $('#datepicker').datepicker('setDate', info.date);
                $('#datepicker2').datepicker('setDate', info.date);
                $('#scheduleId').val('');
                $('#title').val('');
                $('#contents').val('');
                $('#startHour').val('9');  // 시작 시간 기본값
                $('#endHour').val('18');    // 종료 시간 기본값
                $('#dateModal').modal('show');
                $('#submitScheduleForm').show();
                $('#modifyScheduleForm').hide();
                $('#deleteScheduleForm').hide();
            },
            eventClick: function(info) {
               
                $('#dateModalLabel2').show();
                $('#dateModalLabel').hide();
                $('#scheduleId').val(info.event.id);
                $('#title').val(info.event.title);
                $('#datepicker').datepicker('setDate', info.event.start);
                $('#datepicker2').datepicker('setDate', info.event.end);
                $('#contents').val(info.event.extendedProps.contents);
                $('#openRange').val(info.event.extendedProps.docState);
             		// DB에서 가져온 시작 시간과 종료 시간 셀렉트 박스에 설정
                const startHour = info.event.start.getHours().toString();
             		console.log('startHour =' + startHour);
                const endHour = info.event.end.getHours().toString();
             		console.log('endHour =' + endHour);
                $('#startHour').val(startHour);
                $('#endHour').val(endHour);
                $('#dateModal').modal('show');
                $('#submitScheduleForm').hide();
                $('#modifyScheduleForm').show();
                $('#deleteScheduleForm').show();
            }
            
            
            
        });
        calendar.render();
        
        $('#eventFilter').change(function() {
            calendar.refetchEvents();
        });
    });

    $(document).ready(function() {
        $('#submitScheduleForm').click(function() {
            var title = $('#title').val().trim();
            if (!title) {
                alert('제목은 필수 입력 사항입니다.');
                return;
            }

            var formData = {
                scheduleId: $('#scheduleId').val() || 0,
                title: title,
                startDt: $('#datepicker').val(),
                endDt: $('#datepicker2').val() || null,
                startHour: $('#startHour').val(),
                endHour: $('#endHour').val(),
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
                    if (response.status === "success") {
                        alert('일정이 등록되었습니다.');
                        $('#dateModal').modal('hide');
                        location.reload();
                    } else {
                        alert('일정 등록에 실패했습니다. 사유: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('일정 등록에 실패했습니다.');
                    console.error("Error details:", status, error, xhr.responseText);
                }
            });
        });
        
        $('#modifyScheduleForm').click(function() {
            var title = $('#title').val().trim();
            if (!title) {
                alert('제목은 필수 입력 사항입니다.');
                return;
            }

            var formData = {
                scheduleId: $('#scheduleId').val(),
                title: title,
                startDt: $('#datepicker').val(),
                endDt: $('#datepicker2').val() || null,
                startHour: $('#startHour').val(),
                endHour: $('#endHour').val(),
                docState: $('#openRange').val(),
                contents: $('#contents').val(),
                allDay: $('#all-day-checkbox').is(':checked')
            };

            $.ajax({
                type: 'POST',
                url: '${contextPath}/calendar/update',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function(response) {
                    if (response.status === "success") {
                        alert('일정이 수정되었습니다.');
                        $('#dateModal').modal('hide');
                        location.reload();
                    } else {
                        alert('일정 수정에 실패했습니다. 사유: ' + response.message);
                    }
                },
                error: function(xhr, status, error) {
                    alert('일정 수정에 실패했습니다.');
                    console.error("Error details:", status, error, xhr.responseText);
                }
            });
        });
        
        

        $('#deleteScheduleForm').click(function() {
        		if(confirm("삭제하시겠습니다?")){
        			
        			
        			
            var scheduleId = $('#scheduleId').val();
            if (scheduleId) {
                $.ajax({
                    type: 'POST',
                    url: '${contextPath}/calendar/delete',
                    contentType: 'application/json',
                    data: JSON.stringify({ scheduleId: scheduleId }),
                    success: function(response) {
                        if (response.status === "success") {
                            alert('일정이 삭제되었습니다.');
                            $('#dateModal').modal('hide');
                            location.reload();
                        } else {
                            alert('일정 삭제에 실패했습니다. 사유: ' + response.message);
                        }
                    },
                    error: function(xhr, status, error) {
                        alert('일정 삭제에 실패했습니다.');
                        console.error("Error details:", status, error, xhr.responseText);
                    }
                });
            }
            
        		} else {
        			return false;
        		}
            
        });
    });
</script>





<jsp:include page="../layout/closer.jsp"/>
