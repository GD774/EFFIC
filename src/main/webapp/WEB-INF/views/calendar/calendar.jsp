<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>




<jsp:include page="../layout/opener.jsp"/>

<style>
.calendarbox {
	margin-top: 20px;
  margin-left: 150px;
	width: 1000px;
}


</style>


    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
    <script src='fullcalendar/dist/index.global.js'></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<jsp:include page="../layout/sidebar.jsp"/>



    <div class="calendarbox">
	<h1 id="calendarhead"
			style="font-size: 50px; font-weight: bold; color: rgb(65,105,225); margin-bottom: 20px;">일정</h1>
	
		
		    <div id='calendar'></div>
	
	</div>
	
    
 

<!-- Modal -->
<div class="modal fade" id="dateModal" tabindex="-1" role="dialog" aria-labelledby="dateModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="dateModalLabel">일정 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p id="start-date"></p>
        <p id="end-date"></p>
        <p id="openRange"><select name="openRange" id="openRange">
        										<option value="내 일정">
        										<option value="내 부서">
        										<option value="전 사원">
        									</select></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">Close</button>
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
                $('#start-date').text('일시: ' + info.dateStr);
                $('#end-date').text('~ ' + info.dateStr);
                $('#end-date').text('~ ' + info.dateStr);
                $('#openRange').attr('공개범위: ' + $('#openRange'));
                
                $('#dateModal').modal('show');
            }
        });

        calendar.render();
    });
	
    </script>






<jsp:include page="../layout/closer.jsp"/>

