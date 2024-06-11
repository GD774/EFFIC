<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

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
            
            
            <div id="button-wrapper" class="py-3">
            <button class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 조직도보기
             </button>
            <button class="inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 팀메세지
              </button>
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
                          <input type="text" name="recp" placeholder="수신자를 선택하세요" class="ml-50 w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                          </div>
                       
                         </div>
			            </div>
                       </div>
                       
                       
                    <div class="flex items-center">
                    <label class="mr-3 mb-3 block text-sm font-medium text-black dark:text-white w-14">
                            제목
                    </label>
					<input type="text" name="title" placeholder="제목을 입력하세요" class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
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
                      <button type="submit" class="flex justify-center rounded bg-[#212B36] p-3 font-medium text-gray hover:bg-opacity-90">
                        보내기
                      </button>
                      </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>

            </div>
          </div>

  </main>
  
  <!-- ===== Main Content End ===== -->
</div>

<script>


$('#btn-me').on('click', (evt) => {
    evt.preventDefault(); 
    $('#frm').attr('action', '${contextPath}/msg/writeToMe.do');
    $('#frm').attr('method', 'POST');
    $('#frm').submit();
});

</script>

<jsp:include page="../layout/closer.jsp"/>
