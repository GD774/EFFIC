<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="../layout/opener.jsp"/>

<style>
* { text-decoration: none !important; }
.calendarbox { margin-top: 20px; margin-left: 150px; width: 1300px; }

#closeToGroup {
 margin-left: 60px;
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
    <h1 id="calendarhead" style="font-size: 50px; font-weight: bold; color: rgb(65,105,225); margin-bottom: 20px;">일정</h1>
    
 <!--    <div
  class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden"
  > -->

  <!-- ===== Header End ===== -->

  <!-- ===== Main Content Start ===== -->
  <!-- <main>
  
     
    <input type="text" id="here" value="">
    
    <div x-data="{modalOpen: false}">
     <button @click="modalOpen = true" class="rounded-md bg-primary px-9 py-3 font-medium text-white">
       조직도 보기
     </button>
     <div x-show="modalOpen" x-transition="" class="fixed left-0 top-0 z-999999 flex h-full min-h-screen w-full items-center justify-center bg-black/90 px-4 py-5">
  <div @click.outside="modalOpen = false" class="w-full max-w-142.5 rounded-lg bg-white px-8 py-12 text-center dark:bg-boxdark md:px-17.5 md:py-15">
    <h3 class="pb-2 text-xl font-bold text-black dark:text-white sm:text-2xl">
      사내조직도
    </h3>
    <span class="mx-auto mb-6 inline-block h-1 w-22.5 rounded bg-primary"></span>
     <div id="jstree">

     </div>


      <div class="w-full px-3 2xsm:w-1/2">
        <button @click="modalOpen = false" id="closeToGroup" class="ml-20 mt-4 block w-full rounded border border-stroke bg-gray p-3 text-center font-medium text-black transition hover:border-meta-1 hover:bg-meta-1 hover:text-white dark:border-strokedark dark:bg-meta-4 dark:text-white dark:hover:border-meta-1 dark:hover:bg-meta-1">
          닫 기
        </button>
    </div>
  </div>
</div>

                </div>

  </main> -->
  
  <!-- ===== Main Content End ===== -->
<!-- </div> -->
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
    
    function parseEvents(data) {
        return data.map(event => ({
            id: event.scheduleId,             // FullCalendar에서 사용할 이벤트 ID
            title: event.title,               // 이벤트 제목
            start: event.startDt,             // 이벤트 시작 날짜 및 시간
            end: event.endDt,                 // 이벤트 종료 날짜 및 시간
            allDay: event.allDay,             // 종일 여부
            extendedProps: {                  // 추가 데이터
                docState: event.docState,
                contents: event.contents,
                empId: event.empId,
                depId: event.depId
            }
        }));
        console.log('파싱되었습니다.')
    }

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        		height: 800 ,
            initialView: 'dayGridMonth',
            events: 
            	function(fetchInfo, successCallback, failureCallback) {
                $.ajax({
                    url: '${contextPath}/calendar/events',
                    type: 'GET',
                    success: function(data) {
                    	 var events = parseEvents(data);
                    	 	console.log(events)
                        successCallback(data);
                        console.log(data);
                    },
                    error: function(xhr, status, error) {
                        alert('일정 조회에 실패했습니다.');
                        console.log("Error details:", status, error, xhr.responseText);
                    }
                });
            },
           
            dateClick: function(info) {
                $('#datepicker').datepicker('setDate', info.date);
                $('#datepicker2').datepicker('setDate', info.date);
                $('#scheduleId').val('');
                $('#title').val('');
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

        $('#deleteScheduleForm').click(function() {
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
        });
    });

</script>


<!-- <script>

 var data = [
 	{ "id" : "R", "parent" : "#", "text" : "EFFIC", "icon" : "glyphicon glyphicon-home" },
    { "id" : "S2", "parent" : "R", "text" : "지점" , "icon" : "glyphicon glyphicon-home"  },
    { "id" : "S21", "parent" : "S2", "text" : "광안리지점" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S22", "parent" : "S2", "text" : "용산지점",   "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S23", "parent" : "S2", "text" : "마포지점" ,"icon" : "glyphicon glyphicon-picture" },
    { "id" : "S24", "parent" : "S2", "text" : "상봉지점" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S25", "parent" : "S2", "text" : "수원지점", "icon" : "glyphicon glyphicon-picture" },
    { "id" : "S26", "parent" : "S2", "text" : "구로지점" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S27", "parent" : "S2", "text" : "홍대지점" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S28", "parent" : "S2", "text" : "전주지점" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "B21", "parent" : "S21", "text" : "송불곰" , "icon": "glyphicon glyphicon-user" },
    { "id" : "B22", "parent" : "S22", "text" : "강사자" , "icon": "glyphicon glyphicon-user"},
    { "id" : "B23", "parent" : "S23", "text" : "송호랑", "icon": "glyphicon glyphicon-user" },
    { "id" : "B24", "parent" : "S24", "text" : "이늑대" , "icon": "glyphicon glyphicon-user"},
    { "id" : "B25", "parent" : "S25", "text" : "감여우", "icon": "glyphicon glyphicon-user" },
    { "id" : "B26", "parent" : "S26", "text" : "공수달" , "icon": "glyphicon glyphicon-user"},
    { "id" : "B27", "parent" : "S27", "text" : "황악어" , "icon": "glyphicon glyphicon-user"},
    { "id" : "B28", "parent" : "S28", "text" : "홍문어" , "icon": "glyphicon glyphicon-user"},
	{ "id" : "S1",  "parent" : "R",  "text" : "본사", "icon" : "glyphicon glyphicon-home" },
    { "id" : "S11", "parent" : "S1", "text" : "홍보팀" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S12", "parent" : "S1", "text" : "재무팀",   "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S13", "parent" : "S1", "text" : "관리팀" ,"icon" : "glyphicon glyphicon-picture" },
    { "id" : "S14", "parent" : "S1", "text" : "개발팀" ,"icon" : "glyphicon glyphicon-picture" },
    { "id" : "H1", "parent" : "S11", "text" : "마동석" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H2", "parent" : "S11", "text" : "김뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H3", "parent" : "S11", "text" : "이뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H4", "parent" : "S12", "text" : "박뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H5", "parent" : "S12", "text" : "정뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H6", "parent" : "S12", "text" : "조뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H7", "parent" : "S13", "text" : "순뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H8", "parent" : "S13", "text" : "서뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H9", "parent" : "S13", "text" : "강뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H10", "parent" : "S14", "text" : "마뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H11", "parent" : "S14", "text" : "최뭐시기" , "icon": "glyphicon glyphicon-user"},
    { "id" : "H12", "parent" : "S14", "text" : "연뭐시기" , "icon": "glyphicon glyphicon-user"},
]; 
  
$('#jstree').jstree({ 
	  'core' : {
		  themes: {
              dots: false, 
            },
	    'data' : data
	  }
	});
	 -->


<!-- //다중선택 일단 적어둠
$("#jstree").jstree(true).get_selected("full", true);

// Node 선택
$('#jstree').on("select_node.jstree", function (e, data) {

    if (data.node.children.length === 0) {
        $('#here').val(data.node.text);
    }
}); 

</script>
-->



<jsp:include page="../layout/closer.jsp"/>
