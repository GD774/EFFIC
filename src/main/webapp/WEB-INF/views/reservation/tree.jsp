<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

    <!-- jstree를 위한 cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/jstree.min.js"></script>
    <link rel="stylesheet" href="//static.jstree.com/3.3.15/assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.15/themes/default/style.min.css" />

<!-- ===== Content Area Start ===== -->
<div
  class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden"
  >

  <!-- ===== Header End ===== -->

  <!-- ===== Main Content Start ===== -->
  <main>
  
     
<div x-data="{modalOpen: false}" class="flex items-center justify-center h-full"> <!-- flex 속성 추가 -->
    <button @click="modalOpen = true" class="rounded-md bg-primary px-9 py-3 font-medium text-white">
        조직도 보기
    </button>
    <div x-show="modalOpen" x-transition="" class="fixed left-0 top-0 z-999999 flex h-full min-h-screen w-full items-center justify-center bg-black/90 px-4 py-5">
        <div @click.outside="modalOpen = false" class="w-full max-w-142.5 rounded-lg bg-white px-8 py-12 text-center dark:bg-boxdark md:px-17.5 md:py-15">
            <h3 class="pb-2 text-xl font-bold text-black dark:text-white sm:text-2xl">
                사내조직도
            </h3>
            <span class="mx-auto mb-6 inline-block h-1 w-22.5 rounded bg-primary"></span>
            <div id="jstree"></div>
            <div class="flex justify-center"> <!-- 닫기 버튼 컨테이너에 flex 속성 추가 -->
                <button @click="modalOpen = false"  class="mt-4 block w-32 rounded border border-stroke bg-gray p-3 text-center font-medium text-black transition hover:border-meta-1 hover:bg-meta-1 hover:text-white dark:border-strokedark dark:bg-meta-4 dark:text-white dark:hover:border-meta-1 dark:hover:bg-meta-1">
                    닫 기
                </button>
            </div>
        </div>
    </div>
</div>


  </main>
  
  <!-- ===== Main Content End ===== -->
</div>

<script defer src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ==" data-cf-beacon="{&quot;rayId&quot;:&quot;891ddd7b2fc9dba2&quot;,&quot;r&quot;:1,&quot;version&quot;:&quot;2024.4.1&quot;,&quot;token&quot;:&quot;67f7a278e3374824ae6dd92295d38f77&quot;}" crossorigin="anonymous"></script>

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
              dots: false, // 이 부분이 연결선을 비활성화합니다.
            },
	    'data' : data
	  }
	});
	


//다중선택 일단 적어둠
$("#jstree").jstree(true).get_selected("full", true);

// Node 선택했을 땡
$('#jstree').on("select_node.jstree", function (e, data) {

    if (data.node.children.length === 0) {
        $('#here').val(data.node.text);
    }
});

</script>

<jsp:include page="../layout/closer.jsp"/>
