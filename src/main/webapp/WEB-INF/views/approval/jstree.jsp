<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<%
    long currentTimeMillis = System.currentTimeMillis();
    Date currentDate = new Date(currentTimeMillis);
    request.setAttribute("currentDate", currentDate);
%>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css">


<script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@3.x.x/dist/alpine.min.js" defer></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/alpinejs@2.8.2/dist/alpine.min.js" integrity="sha256-bVwxDrdhDYTLGwa4ZeUH1AN+bTxsM9UtQaJKoXCKvxQ=" crossorigin="anonymous"></script>


    <style>
        .bg-black/90 {
            background-color: rgba(0, 0, 0, 0.9);
        }

        .dark:bg-boxdark {
            background-color: #1a202c;
        }

        .bg-primary {
            background-color: #4f46e5;
        }
        
        #btn-close {
					margin-left: 50%;
				}
    </style>
</head>

<body class="bg-gray-100">
            <div x-data="{modalOpen: false}" id="button-wrapper" class="py-3">
        	    <button id="goAppLine" @click="modalOpen = true" class="inline-flex rounded bg-primary px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
			       		 결재정보
			  		  </button>

        <div x-show="modalOpen" x-transition="" class="fixed left-0 top-0 z-999999 flex h-full min-h-screen w-full items-center justify-center bg-black/90 px-4 py-5">
		 <div @click.outside="modalOpen = false" class="w-full max-w-142.5 rounded-lg bg-white px-8 py-12 text-center dark:bg-boxdark md:px-17.5 md:py-15">
		   <h3 class="pb-2 text-xl font-bold text-black dark:text-white sm:text-2xl">
		     사내조직도
		   </h3>
		   <span class="mx-auto mb-6 inline-block h-1 w-22.5 rounded bg-primary"></span>
		   
		    <div id="jstree">
		    <!-- 여기가 jstree 뜨는 부분 -->
        </div>
     
      <div class="w-full px-3 2xsm:w-1/2">
        <button @click="modalOpen = false"  id="btn-close" class="ml-20 mt-4 block w-full rounded border border-stroke bg-gray p-3 text-center font-medium text-black transition hover:border-meta-1 hover:bg-meta-1 hover:text-white dark:border-strokedark dark:bg-meta-4 dark:text-white dark:hover:border-meta-1 dark:hover:bg-meta-1">
          닫 기
        </button>
    </div>
    </div>
        </div>
        </div></body>
    <script>
    
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
       { "id" : "S1",  "parent" : "R",  "text" : "본사", "icon" : "glyphicon glyphicon-home" },
        { "id" : "S11", "parent" : "S1", "text" : "홍보팀" , "icon" : "glyphicon glyphicon-picture"},
        { "id" : "S12", "parent" : "S1", "text" : "재무팀",   "icon" : "glyphicon glyphicon-picture"},
        { "id" : "S13", "parent" : "S1", "text" : "관리팀" ,"icon" : "glyphicon glyphicon-picture" },

        {
            "id": "tester1",
            "parent": "S11",
            "text": "안성기",
            "data": {
                "value": "tester1"
            }
        },
        {
            "id": "tester2",
            "parent": "S11",
            "text": "신해철",
            "data": {
                "value": "tester2"
            }
        },
        {
            "id": "tester3",
            "parent": "S11",
            "text": "신혜선",
            "data": {
                "value": "tester3"
            }
        },
        {
            "id": "tester4",
            "parent": "S11",
            "text": "구혜선",
            "data": {
                "value": "tester4"
            }
        },
        {
            "id": "testser",
            "parent": "S11",
            "text": "박소담",
            "data": {
                "value": "testser"
            }
        },
        {
            "id": "tester6",
            "parent": "S12",
            "text": "조준영",
            "data": {
                "value": "tester6"
            }
        },
        {
            "id": "tester7",
            "parent": "S12",
            "text": "남민우",
            "data": {
                "value": "tester7"
            }
        },
        {
            "id": "tester8",
            "parent": "S12",
            "text": "박화평",
            "data": {
                "value": "tester8"
            }
        },
        {
            "id": "tester9",
            "parent": "S12",
            "text": "전지현",
            "data": {
                "value": "tester9"
            }
        },
        {
            "id": "tester10",
            "parent": "S12",
            "text": "김지은",
            "data": {
                "value": "tester10"
            }
        },
        {
            "id": "tester11",
            "parent": "S13",
            "text": "주윤발",
            "data": {
                "value": "tester11"
            }
        },
        {
            "id": "tester12",
            "parent": "S13",
            "text": "고길동",
            "data": {
                "value": "tester12"
            }
        },
        {
            "id": "tester13",
            "parent": "S13",
            "text": "나무늬",
            "data": {
                "value": "tester13"
            }
        },
        {
            "id": "tester14",
            "parent": "S13",
            "text": "양희은",
            "data": {
                "value": "tester14"
            }
        },
        {
            "id": "tester15",
            "parent": "S13",
            "text": "신성우",
            "data": {
                "value": "tester15"
            }
        }
    ]; 
      
      //{ "id" : "B21", "parent" : "S21", "text" : "송불곰" , "icon": "glyphicon glyphicon-user", "data": {
      //      "value": "tester1"
      //  } },
      
     $('#jstree').jstree({ 
         'core' : {
            themes: {
                 dots: false, // 이 부분이 연결선을 비활성화합니다.
               },
               
           'data' : data
         }     
       });
      
     var selectedValues = []; 
     // 선택된 사원들 값 여기에 저장 -> 닫기 창 버튼 누르면 이 배열은 초기화.
     // 그래서 하나 추가하고 창 닫았다가 다시 추가는 안됩니다. 창이 열려있을때 넣고 싶은 사람을 다 넣는 구조에요!

     $('#jstree').on("select_node.jstree", function (e, data) {
         if (data.node.children.length === 0) {
             selectedValues.push(data.node.data.value);
             $('#here').val(selectedValues.join(', ')); 
         }
     });
     
     $('#btn-close').click(function() {
           selectedValues = [];
       }); 이 부분이에요!
    
    
    </script>


            		
            		


<jsp:include page="../layout/closer.jsp"/>