<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>


<!-- fullcalendar -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.13/index.global.min.js'></script>
<script src='fullcalendar/dist/index.global.js'></script>



<style>

#calendar {
      text-align: center;
    width:850px;
    height: auto;
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

.grid-cols-6 > * {
    padding: 10px; 
      color: black
}


#weatherIcon {
   display: inline-block
   
}

#today {

   font-size: 30px;
}

#weather {
	text-align: center;
	margin-top: 50px;
	border: solid 4px #b5b3b3;
}

#map {
   margin-top: 100px;
}

/* #weatherMap {
   margin: auto;
   
} */

</style>


<!-- ===== Content Area Start ===== -->
<div
  class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden"
  >

  <!-- ===== Header End ===== -->

  <!-- ===== Main Content Start ===== -->
 <main>

   <div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
            <div class="grid grid-cols-1 gap-4 md:grid-cols-2 md:gap-6 xl:grid-cols-4 2xl:gap-7.5">
              <!-- Card Item Start -->
              <div class="rounded-sm border border-stroke bg-white px-7.5 py-6 shadow-default dark:border-strokedark dark:bg-boxdark" style="padding-top:15px;">
              

                <div class="mt-4 flex items-end justify-between">
                  <div>
                                                     
              <c:forEach items="${myDocListUserMain}" var="approval" begin="0" end="0">
                <span>
                         <c:choose>
                              <c:when test="${approval.urgent == 1}">
                                  <i class="fi fi-rr-light-emergency-on">${urgent}</i>
                              </c:when>
                              <c:when test="${approval.urgent == 0}">
                                    <p class="text-[#637381] dark:text-bodydark"></p>
                              </c:when>
                                </c:choose>
                    <p  class="text-lg font-medium" style="font-weight:bold;">결재상태</p>
                    <c:choose>
                        <c:when test="${approval.docState == 0}">
                            <p class="text-lg font-medium" style="font-weight:bold;">진행</p>
                        </c:when>
                        <c:when test="${approval.docState == 1}">
                            <p class="text-lg font-medium" style="font-weight:bold;">결재</p>
                        </c:when>
                        <c:when test="${approval.docState == 2}">
                            <p class="text-lg font-medium" style="font-weight:bold;">반려</p>
                        </c:when>
                        <c:when test="${approval.docState == 3}">
                            <p class="text-lg font-medium" style="font-weight:bold;">임시저장</p>
                        </c:when>
                    </c:choose>
                </span>
                <span>
                    <p class="text-lg font-medium" style="font-weight:bold;">&nbsp;</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.title}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${user.name}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.writeDt}</p>
                </span>
            </span>
        </c:forEach>

             </div>      
                  </div>
              </div>

              <!-- Card Item End -->

              <!-- Card Item Start -->
              <div class="rounded-sm border border-stroke bg-white px-7.5 py-6 shadow-default dark:border-strokedark dark:bg-boxdark" style="padding-top:15px;">
               

                <div class="mt-4 flex items-end justify-between">
                  <div>
                 <c:forEach items="${myDocListUserMain}" var="approval" begin="1" end="1">
                <span>
                         <c:choose>
                              <c:when test="${approval.urgent == 1}">
                                  <i class="fi fi-rr-light-emergency-on">${urgent}</i>
                              </c:when>
                              <c:when test="${approval.urgent == 0}">
                                    <p class="text-[#637381] dark:text-bodydark"></p>
                              </c:when>
                                </c:choose>
                    <p  class="text-lg font-medium" style="font-weight:bold;">결재상태</p>
                    <c:choose>
                        <c:when test="${approval.docState == 0}">
                            <p class="text-lg font-medium" style="font-weight:bold;">진행</p>
                        </c:when>
                        <c:when test="${approval.docState == 1}">
                            <p class="text-lg font-medium" style="font-weight:bold;">결재</p>
                        </c:when>
                        <c:when test="${approval.docState == 2}">
                            <p class="text-lg font-medium" style="font-weight:bold;">반려</p>
                        </c:when>
                        <c:when test="${approval.docState == 3}">
                            <p class="text-lg font-medium" style="font-weight:bold;">임시저장</p>
                        </c:when>
                    </c:choose>
                </span>
                <span>
                    <p class="text-lg font-medium" style="font-weight:bold;">&nbsp;</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.title}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${user.name}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.writeDt}</p>
                </span>
            </span>
        </c:forEach>
                  
                  </div>

                 
                </div>
              </div>
              <!-- Card Item End -->

              <!-- Card Item Start -->
              <div class="rounded-sm border border-stroke bg-white px-7.5 py-6 shadow-default dark:border-strokedark dark:bg-boxdark" style="padding-top:15px;">
                

                <div class="mt-4 flex items-end justify-between">
                  <div>
                         <c:forEach items="${myDocListUserMain}" var="approval" begin="2" end="2">
                <span>
                         <c:choose>
                              <c:when test="${approval.urgent == 1}">
                                  <i class="fi fi-rr-light-emergency-on">${urgent}</i>
                              </c:when>
                              <c:when test="${approval.urgent == 0}">
                                    <p class="text-[#637381] dark:text-bodydark"></p>
                              </c:when>
                                </c:choose>
                    <p  class="text-lg font-medium" style="font-weight:bold;">결재상태</p>
                    <c:choose>
                        <c:when test="${approval.docState == 0}">
                            <p class="text-lg font-medium" style="font-weight:bold;">진행</p>
                        </c:when>
                        <c:when test="${approval.docState == 1}">
                            <p class="text-lg font-medium" style="font-weight:bold;">결재</p>
                        </c:when>
                        <c:when test="${approval.docState == 2}">
                            <p class="text-lg font-medium" style="font-weight:bold;">반려</p>
                        </c:when>
                        <c:when test="${approval.docState == 3}">
                            <p class="text-lg font-medium" style="font-weight:bold;">임시저장</p>
                        </c:when>
                    </c:choose>
                </span>
                <span>
                    <p class="text-lg font-medium" style="font-weight:bold;">&nbsp;</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.title}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${user.name}</p>
                </span>
                <span>
                    
                    <p class="text-lg font-medium" style="font-weight:bold;">${approval.writeDt}</p>
                </span>
            </span>
        </c:forEach>
                   
                  </div>

               
                </div>
              </div>
              <!-- Card Item End -->

              <!-- Card Item Start -->
              <div class="rounded-sm border border-stroke bg-white px-7.5 py-6 shadow-default dark:border-strokedark dark:bg-boxdark" style="padding-top:15px;">
               

                <div class="mt-4 flex items-end justify-between">
                  <div>
                    <h4 class="text-title-md font-bold text-black dark:text-white">
                      ${noread} 건 / 미열람
                      
                    </h4>
                    
                  </div>

                 
                </div>
              </div>
              <!-- Card Item End -->
            </div>

            
            
  <div id="scheduleBox" class="mt-4 grid grid-cols-12 gap-4 md:mt-6 md:gap-6 2xl:mt-7.5 2xl:gap-7.5">
  <!-- ====== Chart One Start -->
  <div class="col-span-12 rounded-sm border border-stroke bg-white px-5 pb-5 pt-7.5 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:col-span-8">
	  <div class="flex flex-wrap items-start justify-between gap-3 sm:flex-nowrap">
	  	
	  	<div id='calendar'></div>
	  	
	  </div>
  </div>


<div id="weatherMap" class="col-span-12 rounded-sm border border-stroke bg-white p-7.5 shadow-default dark:border-strokedark dark:bg-boxdark xl:col-span-4">
  <div class="mb-4 justify-between gap-4 sm:flex">
    <div>
      <h4 class="text-xl font-bold text-black dark:text-white">
      
      <!-- 날씨  -->
            <div id="weather" class="rounded-sm border border-stroke bg-white p-7.5 dark:border-strokedark dark:bg-boxdark xl:col-span-4">
            </div>
      

				    	<div id="map" style=" width: 400px; height: 300px;"></div>
			
			
        
        
      </h4>
    </div>

</div>
    </div>
  </div>
</div>

    

  </main>
  <!-- ===== Main Content End ===== -->
</div>



<script>
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
          googleCalendarApiKey: 'AIzaSyAovOUlYT-fKpoVo18NKTy6aWJvBxKPpDQ',
          eventSources: [
             {
                  googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
                  color: 'white',   // an option!
                  textColor: 'red' // an option!
                }
          ],
          dayMaxEventRows: true,
          views: {
              timeGrid: {
                dayMaxEventRows: 2 // 이벤트 날짜 겹치는 일정 최대 N개까지 등장
              }
            },
        initialView: 'dayGridMonth',
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
        timeZoneName: 'short', // 기본값은 'short'이나, 'long'으로 변경하여 'am'/'pm' 표기

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
</script>


<script>
        $(document).ready(function() {
            //const apiKey = '117b9ffd59be6b785defaf8aa207ef3a'; // OpenWeather API 키
            const apiUrl = `https://api.openweathermap.org/data/2.5/weather?lat=37.5665&lon=126.9780&units=metric&appid=117b9ffd59be6b785defaf8aa207ef3a&lang=kr`;

            function fetchWeather() {
                console.log("API 요청 URL:", apiUrl);
                $.ajax({
                    url: apiUrl,
                    type: 'GET',
                    success: function(data) {

                        
                        // 온도와 날씨 설명 및 아이콘 추출
                        const temperature = Math.round(data.main.temp); // 온도
                        const description = data.weather[0].description; // 날씨 설명
                        const icon = data.weather[0].icon; // 아이콘 코드

                        // 아이콘 URL
                        const iconUrl = `http://openweathermap.org/img/wn/\${icon}.png`;
                       
                        
                        // HTML 업데이트
                        $('#weather').append(`
                               <div>
                                   <h5 id="today">오늘의 날씨</h5>
                                   <br>
                                   <h5>서울</h5>
                                   <p>온도: \${temperature}°C</p>
                                   <p>\${description}<img id="weatherIcon"src="\${iconUrl}" alt="날씨 아이콘"></p>
                                   
                               </div>
                           `);
                    },
                    error: function(xhr, status, error) {
                        alert('날씨 정보를 가져오는데 실패했습니다. API 키 또는 URL을 확인하세요.');
                        console.error('날씨 정보를 가져오는데 실패했습니다.', error);
                    }
                });
            }

            fetchWeather();
        });
    </script>
    
    
    <script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbNmIjC1fPeLBAuaI5SopaXeOTR0DKiYI&callback=initMap"></script>
    
     <script>
window.initMap = function () {
     const map = new google.maps.Map(document.getElementById("map"), {
       center: { lat: 37.5321526, lng: 126.9714061 },
       zoom: 1
     });
     const office = [
       { label: "", name: "본사", lat: 37.5321526, lng: 126.9714061 },
       { label: "", name: "이촌", lat: 37.5167173, lng: 126.9720073 }
     ];
    
     const bounds = new google.maps.LatLngBounds();
     const infoWindow = new google.maps.InfoWindow();
     office.forEach(({ label, name, lat, lng }) => {
       const marker = new google.maps.Marker({
         position: { lat, lng },
         label,
         map
       });
       bounds.extend(marker.position);
       marker.addListener("click", () => {
         map.panTo(marker.position);
         infoWindow.setContent(name);
         infoWindow.open({
           anchor: marker,
           map
         });
       });
     });
     map.fitBounds(bounds);
   };
  </script>




<jsp:include page="../layout/closer.jsp"/>
