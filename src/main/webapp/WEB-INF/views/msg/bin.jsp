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
                휴지통
              </h2>
              
              
                <nav>
                <ol class="flex items-center gap-2">
                  <li>
                   <a id="total" class="font-medium" > </a>
                  </li>
                  <li class="font-medium text-primary"> / 500</li>
                </ol>
              </nav>

            </div>
            <hr style="border-color: #BDBDBD; border-width: 1px; margin-top: 1rem;">
            
            <div id="button-wrapper" class="py-3">
            <button id="btn-remove" class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 삭제
             </button>
            <button id="btn-clear" class="mr-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 비우기
             </button>
            <button id="btn-cancel" class="ml-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 해제
            </button>
          </div>       
          

			 <!-- ====== Table Section Start -->
			 <div class="flex flex-col gap-11">
			   <!-- ====== Table Four Start -->
			 <div class="overflow-hidden rounded-[10px]">
 
  <div class="max-w-full overflow-x-auto">
    <div class="min-w-[1150px]">
      <!-- table header start -->
      <div class="grid grid-cols-10 bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11"
      style="grid-template-columns: 50px 50px repeat(9, 1fr);">
        <div class="col-span-1">
          <h5 class="font-medium text-[#637381] dark:text-bodydark"></h5>
        </div>

        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark"></h5>
        </div>

        <div class="col-span-4">
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
	
const fnGetBinList = () => {
	
    $.ajax({
		  // 요청
		  type: 'GET',
		  url: '${contextPath}/msg/getBinList.do',               
		  data : 'page=' + page,
		  // 응답
		  dataType: 'json',
		  success: (resData) => {
			     $('#message-list').html('');
				 $.each(resData.binList, (i, bin) => {
		    	let str=  '<div data-sort="'+bin.sort+'" class="hover:bg-gray grid grid-cols-11 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11 hover:opacity-20" style="grid-template-columns: 50px 50px repeat(9, 1fr);">';
		    	str +=  '<div data-sort="'+bin.sort+'"class="col-span-1" ><input type="checkbox" name="checkbox" value="'+ bin.sort +'" class="chk"></div>';
		    	
		    	
		    	if(bin.sort.slice(0, 1) === 'R'){
		    	str += '<div data-msg-id="'+bin.msgId+'" class="col-span-3"> <p class="text-[#637381] dark:text-bodydark"> '+ bin.sname +' </p></div>';}
		    	else if(bin.sort.slice(0, 1) === 'M'){
			    str += '<div data-msg-id="'+bin.msgId+'" class="flex items-center col-span-3"> <p class="text-[#637381] dark:text-bodydark w-auto"> '+ bin.rname +'<img class="ml-4 inline-block w-5" src="/msgIcons/mailout.svg"/></p></div>';}
		    	else if(bin.sort.slice(0, 1) === 'P'){
				str += '<div data-msg-id="'+bin.msgId+'" class="flex items-center col-span-3"> <p class="text-[#637381] dark:text-bodydark w-auto"> '+ bin.sname +'<img class="ml-4 inline-block w-5" src="/msgIcons/me.svg"/></p></div>';
			    }
				 
				 
		    	if(bin.hasAttach === true){
		    	str += ' <div data-msg-id="'+bin.msgId+'" class="col-span-4"><p class="text-[#637381] dark:text-bodydark">'+ bin.title +'<img class="ml-4 inline-block w-5" src="/msgIcons/paperclip.svg"/></p></div>';
		    	} else if(bin.hasAttach === false) {
			    str += ' <div data-msg-id="'+bin.msgId+'" class="col-span-4"><p class="text-[#637381] dark:text-bodydark">'+ bin.title +'</p></div>';
		    	}
		    	
		    	str += '<div data-msg-id="'+bin.msgId+'" class="col-span-2"><p class="text-[#637381] dark:text-bodydark">'+ bin.sendDt.slice(0, -3) +'</p></div>';
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
	    fnGetBinList();
	  }
	
	
	
	//체크박스 선택 후 삭제버튼 눌러서 메세지 삭제
	$('#btn-remove').click(function() {
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
	    
		if(!confirm('정말로 삭제하시겠습니까? 삭제된 메세지는 복원이 불가능할 수 있습니다.')){
			return;
		} 

	    $.ajax({
	        // 요청
	        type: 'POST',
	        url: '${contextPath}/msg/updateRemove.do',
	        data: {checkValues: checkValues},
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	        	fnGetBinList();
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    })
	});
	
	//체크박스 선택 후 해제 버튼 눌러서 원래 보관함으로 돌아가기
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
	        url: '${contextPath}/msg/cancelBin.do',
	        data: {checkValues: checkValues},
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	        	fnGetBinList();
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    });
	});	
	
//비우기 버튼을 눌러서 휴지통 비우기
const fnClearBin = () => {
	if(!confirm('정말로 삭제하시겠습니까? 삭제된 메세지는 복원이 불가능할 수 있습니다.')){
		return;
	} 
	
	 $.ajax({
	        // 요청
	        type: 'POST',
	        url: '${contextPath}/msg/clearBin.do',
	        // 응답
	        dataType: 'json',
	        success: (resData) => { 
	        	fnGetBinList();
	        },
	        error: (jqXHR) => {
	            alert(jqXHR.statusText + '(' + jqXHR.status + ')');
	        }
	    })
    };
    
$('#btn-clear').on('click', () => {
     fnClearBin();
	
})    
	

fnGetBinList();
	

</script>

<jsp:include page="../layout/closer.jsp"/>
