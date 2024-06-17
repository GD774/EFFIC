<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

<style>
#button-wrapper {
   padding-bottom: 15px;
}
#paging {
   padding-left: 40%;
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
                내게 쓴 메세지
              </h2>
               <nav>
                <ol class="flex items-center gap-2">
                  <li>
                    <a class="font-medium" href="index.html">현재 메세지개수 /</a>
                  </li>
                  <li class="font-medium text-primary">1000</li>
                </ol>
              </nav>
              

            </div>
            <hr style="border-color: #BDBDBD; border-width: 1px; margin-top: 1rem;">
            
            <div id="button-wrapper" class="py-3">

            <button id="btn-remove" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/bin.svg" />삭제
             </button>
            <button id="btn-star" class="mr-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/star0.svg" />보관

              </button>
            <button id="select-all" class="ml-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                전체선택
            </button>
          </div>       
          

			 <!-- ====== Table Section Start -->
			 <div class="flex flex-col gap-11">
			   <!-- ====== Table Four Start -->
			 <div class="overflow-hidden rounded-[10px]">
 
  <div class="max-w-full overflow-x-auto">
    <div class="min-w-[1150px]">
      <!-- table header start -->
      <div class="grid grid-cols-11 bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11"
      style="grid-template-columns: 50px 50px repeat(9, 1fr);">
        <div class="col-span-1">
          <h5 class="font-medium text-[#637381] dark:text-bodydark"></h5>
        </div>

        <div class="col-span-1">
          <h5 class="font-medium text-[#637381] dark:text-bodydark"></h5>
        </div>

        <div class="col-span-2">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">발신자</h5>
        </div>

        <div class="col-span-5">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">제목</h5>
        </div>
        
        <div class="col-span-2">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">날짜</h5>
        </div>
      </div>
      <!-- table header end -->

      <!-- table body start -->
      <div class="bg-white dark:bg-boxdark" id="message-list">
       
     

      <!-- table body end -->
    </div>
  </div>
</div>
  </div>
  
  <div class="p-4 sm:p-6 xl:p-7.5" id="paging">
                 
                </div>
</div>

              <!-- ====== Table End -->
            </div>
        
  </main>
  <!-- ===== Main Content End ===== -->
</div>

<script>
var page = 1;
var totalPage = 0;

const fnGetToMeList = () => {
	

    $.ajax({
		  // 요청
		  type: 'GET',
		  url: '${contextPath}/msg/getToMeList.do',               
		  data : 'page=' + page,
		  // 응답
		  dataType: 'json',
		  success: (resData) => {
			     $('#message-list').html('');
				 $.each(resData.msgList, (i, msg) => {
		    	let str=  '<div class="hover:bg-gray grid grid-cols-11 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11 hover:opacity-20" style="grid-template-columns: 50px 50px repeat(9, 1fr);">';
		    	str +=  '<div class="col-span-1" ><input type="checkbox" name="checkbox" class="chk" value="'+ msg.msgId +'"></div>';
		    	str += '<div class="star col-span-1" data-chk-impt="'+msg.chkImpt+'" data-msg-id="'+msg.msgId+'"><img data-msg-id="'+msg.msgId+'" data-chk-impt="'+msg.chkImpt+'" src="/msgIcons/star'+msg.chkImpt+'.svg"/></div>';
		    	str += '<div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-2"> <p class="text-[#637381] dark:text-bodydark"> '+ msg.name +' </p></div>';
		    	
		    	
		    	if(msg.hasAttach === true){
			    	str += ' <div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-5"><p class="text-[#637381] dark:text-bodydark">'+ msg.title +'<img class="ml-4 inline-block w-5" src="/msgIcons/paperclip.svg"/></p></div>';
			    	} else if(msg.hasAttach === false) {
				    str += ' <div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-5"><p class="text-[#637381] dark:text-bodydark">'+ msg.title +'</p></div>';
			    	}
		    	
		    	
		    	str += '<div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-2"><p class="text-[#637381] dark:text-bodydark">'+ msg.sendDt.slice(0, -3) +'</p></div>';
		    	str += '</div>';
		    	$('#message-list').append(str);
		    }),  $('#paging').html(resData.paging);
				 $('#total').html(resData.total);
		  },
		  error: (jqXHR) => {
			  alert(jqXHR.statusText + '(' + jqXHR.status + ')');
		  }
		})
		};
		
const fnPaging = (p)=>{
    page = p;
    fnGetToMeList();
  }		
		
$(document).on('click', '.msg-detail', function(evt){
	location.href = '${contextPath}/msg/getToMeDetail.do?msgId=' + $(this).data('msgId');
});

const fnUpdateChkImpt = (evt) => {

	console.log($(evt.target).data('msgId'));
    $.ajax({
        // 요청
        type: 'POST',
        url: '${contextPath}/msg/updateSentChkImpt.do',
        data: {msgId: $(evt.target).data('msgId') }, // 클릭된 요소의 데이터 사용
        // 응답
        dataType: 'json',
        success: (resData) => { 
        	fnGetToMeList();
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
};

$(document).on('click', '.star', (evt)=>{
     fnUpdateChkImpt(evt)
});

document.getElementById('select-all').addEventListener('click', function(evt) {
	  const checkboxes = document.querySelectorAll('input[type="checkbox"]');
	  let allChecked = true;

	  checkboxes.forEach((checkbox) => {
	    if (!checkbox.checked) {
	      allChecked = false;
	    }
	  });

	  checkboxes.forEach((checkbox) => {
	    if (allChecked) {
	      checkbox.checked = false;
	    } else {
	      checkbox.checked = true;
	    }
	  });
	});

//체크한 거 삭제버튼 눌러서 휴지통으로 이동
$('#btn-remove').click(function() {
    var checkValues = [];
    $("input[name='checkbox']:checked").each(function() {
        checkValues.push(this.value);
    });
    
    if (checkValues.length === 0) {
        alert('선택된 항목이 없습니다.');
        return;
    }
    
    var data = $.param({ checkValues: checkValues });
    $.ajax({
        // 요청
        type: 'POST',
        url: '${contextPath}/msg/updateSentToBin.do',
        data: {checkValues: checkValues},
        // 응답
        dataType: 'json',
        success: (resData) => { 
        	fnGetToMeList();
           alert('휴지통으로 이동되었습니다');
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
});

//체크한 거 눌러서 중요메세지로 설정. 이경우 alert 뜸
$('#btn-star').click(function() {
    var checkValues = [];
    $("input[name='checkbox']:checked").each(function() {
        checkValues.push(this.value);
    });
    
    if (checkValues.length === 0) {
        alert('선택된 항목이 없습니다.');
        return;
    }
    
    var data = $.param({ checkValues: checkValues });
    $.ajax({
        // 요청
        type: 'POST',
        url: '${contextPath}/msg/updatesSentChkImpt.do',
        data: {checkValues: checkValues},
        // 응답
        dataType: 'json',
        success: (resData) => { 
        	fnGetToMeList();
           alert('중요메세지로 설정되었습니다');
        },
        error: (jqXHR) => {
            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
        }
    });
});
		
		

fnGetToMeList();
</script>




<jsp:include page="../layout/closer.jsp"/>
