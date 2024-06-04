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
    
    
    <script>

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	timeZone: 'UTC' + 9
          , initialView: 'dayGridMonth'
          , aspectRatio: 2
          , selectable: true // 클릭하면 파란색으 선택
          , events:[
        	  {
        	  id: 'a',
        	  title: '프로젝트',
        	  start: '2024-05-31'
        	  }
        	  
          ]
        , eventclick:  function(info) {
            alert('Event: ' + info.event.title);
            alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
            alert('View: ' + info.view.type);

            // change the border color just for fun
            info.el.style.borderColor = 'red';
            
           
          }
        
         
        });
          
        var event = calendar.getEventById('a') // an event object!
        var start = event.start // a property (a Date object)
        
        
        calendar.render();
      });

    </script>

<jsp:include page="../layout/sidebar.jsp"/>
	
	
	<div class="calendarbox">
	<h1 id="calendarhead"
			style="font-size: 50px; font-weight: bold; color: rgb(65,105,225); margin-bottom: 20px;">일정</h1>
	
		
		    <div id='calendar'></div>
	
	</div>
	






<jsp:include page="../layout/closer.jsp"/>

