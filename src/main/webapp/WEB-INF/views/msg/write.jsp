<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>


<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>


<style>
#btn-close {
margin-left: 50%;
}
</style>

<!-- ===== Content Area Start ===== -->
<div
  class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden"
  >

  <!-- ===== Header End ===== -->

  <!-- ===== Main Content Start ===== -->
  <main>
  

<div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
            <!-- Breadcrumb Start -->
            <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <h2 class="text-title-md2 font-bold text-black dark:text-white">
                메세지 쓰기
              </h2>
            </div>
            <hr style="border-color: #BDBDBD; border-width: 1px; margin-top: 1rem;">
            
            
            
            <div x-data="{modalOpen: false}" id="button-wrapper" class="py-3">
            <button @click="modalOpen = true"  class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 조직도보기
             </button>
            <button id="team" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 팀메세지
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
        </div>
        
            <!-- Breadcrumb End -->

            <!-- ====== Form Layout Section Start -->
            <div class="grid grid-cols-1 gap-9 lg:grid-cols-2">
              <div class="flex flex-col gap-9">
                <!-- Contact Form Two -->
                <div class="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
                  <form action="${contextPath}/msg/write.do" id="frm" method="post" enctype="multipart/form-data">
                    <div class="p-6.5">
                    
                    
                      <div class="mb-5 flex flex-col gap-6 xl:flex-row">
                        <div class="w-full xl:w-1/3">
                        <div class="flex items-center">
                          <label class="mr-3 mb-3 block text-sm font-medium text-black dark:text-white w-14">
                            수신자
                          </label>
                          <div style="width: 700px;">
                          <input type="text" value="${sender}" id="here" name="recp" placeholder="수신자를 선택하세요" class="ml-50 w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                          </div>
                       
                         </div>
			            </div>
                       </div>
                       
                       
                    <div class="flex items-center">
                    <label class="mr-3 mb-3 block text-sm font-medium text-black dark:text-white w-14">
                            제목
                    </label>
					<input type="text" id="title" name="title" placeholder="제목을 입력하세요" class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
					 </div>                      
                      

                      <div class="mb-6">
                        <label class="mb-3 block text-sm font-medium text-black dark:text-white">
                        </label>
                        <textarea rows="20" name="contents" placeholder="2000 BYTE" class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"></textarea>
                      </div>
                      <div class="flex justify-between">
                      <input type="file" name="files" id="files" multiple class="w-1/2 cursor-pointer rounded-lg border-[1.5px] border-stroke bg-transparent font-normal outline-none transition file:mr-5 file:border-collapse file:cursor-pointer file:border-0 file:border-r file:border-solid file:border-stroke file:bg-whiter file:px-5 file:py-3 file:hover:bg-primary file:hover:bg-opacity-10 focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-form-strokedark dark:file:bg-white/30 dark:file:text-white dark:focus:border-primary">
                      <div class="flex">
                      <button type="button" id="btn-me" class="mr-5 flex justify-center rounded bg-[#637381] p-3 font-medium text-gray hover:bg-opacity-90">
                        나에게 쓰기
                      </button>
                      <button id="btn-submit" type="submit" class="flex justify-center rounded bg-[#212B36] p-3 font-medium text-gray hover:bg-opacity-90">
                        보내기
                      </button>
                      </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

        <input type="hidden" id="team-list" value="${teamList}">

            </div>
          </div>

  </main>
  
  <!-- ===== Main Content End ===== -->
</div>

<script src="https://static.cloudflareinsights.com/beacon.min.js/vcd15cbe7772f49c399c6a5babf22c1241717689176015" 
        integrity="sha512-ZpsOmlRQV6y907TI0dKBHq9Md29nnaEIPlkf84rnaERnq6zvWvPUqr2ft8M1aS28oN72PdrCzSjY4U6VaAw1EQ==" 
        data-cf-beacon='{"rayId":"891ddd7b2fc9dba2","r":1,"version":"2024.4.1","token":"67f7a278e3374824ae6dd92295d38f77"}' 
        crossorigin="anonymous">
</script>

<script>


$('#btn-me').on('click', (evt) => {
	 if($('#title').val() === '') {
	      alert('제목은 필수입니다.')
	      evt.preventDefault();
	      return; }
	
	 if(!confirm('메세지를 보내시겠습니까?')){
		return;
	 }
	 
	 
    evt.preventDefault(); 
    $('#frm').attr('action', '${contextPath}/msg/writeToMe.do');
    $('#frm').attr('method', 'POST');
    $('#frm').submit();
    sendMessage();
    
});

$(document).ready(function() {
    $('#btn-submit').click(function(evt) {
        evt.preventDefault();

        if (confirm('메세지를 보내시겠습니까?')) {
            $('#frm').submit();
        } return;
    });
});

//제이쿼리 아닌 것도 써보기...
const fnSubmitChk = () => {
	  document.getElementById('btn-submit').addEventListener('click', (evt) => {
	    if(document.getElementById('title').value === '') {
	      alert('제목을 입력해주세요.');
	      evt.preventDefault();
	      return;
	    }
	   
	    if(document.getElementById('here').value === '') {
		      alert('수신자를 입력해주세요.');
		      evt.preventDefault();
		      return;
		    }
	    
	    
	  });
	}

//jstree 추가를 위한 부분
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
    { "id" : "S11", "parent" : "S1", "text" : "총무팀" , "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S12", "parent" : "S1", "text" : "경영팀",   "icon" : "glyphicon glyphicon-picture"},
    { "id" : "S13", "parent" : "S1", "text" : "인사팀" ,"icon" : "glyphicon glyphicon-picture" },

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
	});
 
  
  
//다중선택 일단 적어둠
//$('#jstree').jstree(true).get_selected("full", true);


// Node 선택했을 때
//$('#jstree').on("select_node.jstree", function (e, data) {
//
//    if (data.node.children.length === 0) {
//        $('#here').val(data.node.data.value);
///
//    }
//});

$('#team').on('click', () => {
    $('#here').val($('#team-list').val());
});


fnSubmitChk();





</script>


<jsp:include page="../layout/closer.jsp"/>
