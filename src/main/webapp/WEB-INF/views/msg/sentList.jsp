<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

<style>



#paging {
   padding-left: 40%;
}

.current-page {
 font-weight: bold;
}

</style>




<!-- ===== Content Area Start ===== -->
<div class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">

  <!-- ===== Header End ===== -->

  <!-- ===== Main Content Start ===== -->
  <main>

	<div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
            <!-- Breadcrumb Start -->
            <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
              <h2 class="text-title-md2 font-bold text-black dark:text-white">
                보낸 메세지
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
            
            <div id="button-wrapper" class="flex justify-between py-3">
            <div>
            <button class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/bin.svg" />삭제
             </button>
            <button class="mr-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/starlight.svg" />보관
              </button>
            <button class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80" id="select-all">
                 전체선택
            </button>
            </div>
            <div>
           <button id="team-btn" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                      팀메세지
           </button>
           </div>
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
          <h5 class="font-medium text-[#637381] dark:text-bodydark">수신자</h5>
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


const fnGetMsgList = () => {
	

       $.ajax({
		  // 요청
		  type: 'GET',
		  url: '${contextPath}/msg/getSentList.do',               
		  data : 'page=' + page,
		  // 응답
		  dataType: 'json',
		  success: (resData) => {
			     $('#message-list').html('');
				 $.each(resData.msgList, (i, msg) => {
		    	let str=  '<div class="hover:bg-gray grid grid-cols-11 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11 hover:opacity-20" style="grid-template-columns: 50px 50px repeat(9, 1fr);">';
		    	str +=  '<div class="col-span-1"><input type="checkbox" class="chk"></div>';

		    	str += '<div class="col-span-1"> <img src="/msgIcons/starlight.svg"/></div>';
		    	str += '<div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-2"> <p class="text-[#637381] dark:text-bodydark"> '+ msg.recipient +' </p></div>';
		    	str += ' <div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-5"><p class="text-[#637381] dark:text-bodydark">'+ msg.title +'</p></div>';
		    	str += '<div data-msg-id="'+msg.msgId+'" class="msg-detail col-span-2"><p class="text-[#637381] dark:text-bodydark">'+ msg.sendDt +'</p></div>';
		    	str += '</div>';
		    	$('#message-list').append(str);
		    }),  $('#paging').html(resData.paging);
		  },
		  error: (jqXHR) => {
			  alert(jqXHR.statusText + '(' + jqXHR.status + ')');
		  }
		})
		};
		
$(document).on('click', '.msg-detail', function(evt){
	location.href = '${contextPath}/msg/getSentDetail.do?msgId=' + $(this).data('msgId');
});

const fnPaging = (p)=>{
    page = p;
    fnGetMsgList();
  }
	
	
fnGetMsgList();	
</script>

<jsp:include page="../layout/closer.jsp"/>
