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

 .elli {
 max-width: 90%;;
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
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
                중요 메세지
              </h2>
              
            </div>
            <hr style="border-color: #BDBDBD; border-width: 1px; margin-top: 1rem;">
            
            <div id="button-wrapper" class="py-3">
             <button id="btn-remove" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/bin.svg" />삭제
             </button>
            <button id="btn-cancel" class="ml-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 보관해제
            </button>
            <button id="select-all" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
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
          <h5 class="font-medium text-[#637381] dark:text-bodydark"></h5>
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


const fnGetImpList = () => {
	

       $.ajax({
		  // 요청
		  type: 'GET',
		  url: '${contextPath}/msg/getImpList.do',               
		  data : 'page=' + page,
		  // 응답
		  dataType: 'json',
		  success: (resData) => {
			     $('#message-list').html('');
				 $.each(resData.impList, (i, imp) => {
		    	let str=  '<div data-sort="'+imp.sort+'" class="hover:bg-gray grid grid-cols-11 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11 hover:opacity-20" style="grid-template-columns: 50px 50px repeat(9, 1fr);">';
		    	str +=  '<div data-sort="'+imp.sort+'"class="col-span-1" ><input type="checkbox" name="checkbox" value="'+ imp.sort +'" class="chk"></div>';
		    	str += '<div class="star col-span-1" data-chk-impt="'+imp.chkImpt+'" data-sort="'+imp.sort+'"><img data-sort="'+imp.sort+'" data-chk-impt="'+imp.chkImpt+'" src="/msgIcons/star'+imp.chkImpt+'.svg"/></div>';
		    	
		    	if(imp.sort.slice(0, 1) === 'R'){
		    	str += '<div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail col-span-2"> <p class="elli text-[#637381] dark:text-bodydark"> '+ imp.sname +' </p></div>';}
		    	else if(imp.sort.slice(0, 1) === 'M'){
			    str += '<div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail flex items-center col-span-2"> <p class="elli text-[#637381] dark:text-bodydark w-auto"> '+ imp.rname +'<img class="ml-4 inline-block w-5" src="/msgIcons/mailout.svg"/></p></div>';}
		    	else if(imp.sort.slice(0, 1) === 'P'){
				str += '<div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail flex items-center col-span-2"> <p class="elli text-[#637381] dark:text-bodydark w-auto"> '+ imp.sname +'<img class="ml-4 inline-block w-5" src="/msgIcons/me.svg"/></p></div>';
		    	}
		    	
		    	
		    	if(imp.hasAttach === true){
			    	str += ' <div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail col-span-5"><p class="text-[#637381] dark:text-bodydark">'+ imp.title +'<img class="ml-4 inline-block w-5" src="/msgIcons/paperclip.svg"/></p></div>';
			    	} else if(imp.hasAttach === false) {
				    str += ' <div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail col-span-5"><p class="text-[#637381] dark:text-bodydark">'+ imp.title +'</p></div>';
			    	}
		    	
		    	str += '<div data-msg-id="'+imp.msgId+'" data-sort="'+imp.sort+'" class="msg-detail col-span-2"><p class="text-[#637381] dark:text-bodydark">'+ imp.sendDt.slice(0, -3) +'</p></div>';
		    	str += '</div>';
		    	$('#message-list').append(str);
		    }),  $('#paging').html(resData.paging);
		  },
		  error: (jqXHR) => {
			  alert(jqXHR.statusText + '(' + jqXHR.status + ')');
		  }
		})
	};

	
	const fnPaging = (p)=>{
	    page = p;
	    fnGetImpList();
	  }
	
	
	
  // 중요메세지 함에서 중요메시지 토글
	const fnUpdateChkImpt = (evt) => {

		console.log($(evt.target).data('sort'));
	    $.ajax({
	        // 요청
	        type: 'POST',
	        url: '${contextPath}/msg/updateImpChkImpt.do',
	        data: {sort: $(evt.target).data('sort')}, 
	        // 발신메시지인지 수신메시지인지 구분하기 위해 SORT를 사용. 빽단에서 맨 앞 문자를 추출해서 MSG 인지 RECP인지 판단한다
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	            fnGetImpList();
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    });
	};
	
	$(document).on('click', '.msg-detail', function(evt){
		location.href = '${contextPath}/msg/getImpDetail.do?sort=' + $(this).data('sort');
	});

	$(document).on('click', '.star', (evt)=>{
		fnUpdateChkImpt(evt)
	});	
	
	
	//체크한 거 해제 눌러서 중요메세지에서 해제.
	$('#btn-cancel').click(function() {
	    var checkValues = [];
	    $("input[name='checkbox']:checked").each(function() {
	        checkValues.push(this.value);
	        console.log(this.value);
	    });
	    
	    if (checkValues.length === 0) {
	        alert('선택된 항목이 없습니다.');
	        return;
	    }
	    
	    var data = $.param({ checkValues: checkValues });
	    $.ajax({
	        // 요청
	        type: 'POST',
	        url: '${contextPath}/msg/cancelChkImpt.do',
	        data: {checkValues: checkValues},
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	        	fnGetImpList();
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    });
	});	
	
	// 체크한 거 삭제버튼 눌러서 휴지통으로 이동
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
	        url: '${contextPath}/msg/updateImpToBin.do',
	        data: {checkValues: checkValues},
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	        	fnGetImpList();
	           alert('휴지통으로 이동되었습니다');
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    });
	});
	
	
fnGetImpList();
</script>

<jsp:include page="../layout/closer.jsp"/>
