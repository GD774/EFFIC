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
                받은메세지
              </h2>
            </div>
            
            <hr style="border-color: #BDBDBD; border-width: 1px; margin-top: 1rem;">

            <!-- Breadcrumb End -->
             
           <div id="button-wrapper" class="py-3">
           <button class="inline-flex rounded bg-[#637381] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
             삭제
           </button>
           <button class="inline-flex rounded bg-[#3BA2B8] px-2 py-1 text-sm font-medium text-white hover:bg-opacity-90">
             보관
           </button>
            </div>

            <div class="grid grid-cols-1 gap-9 lg:grid-cols-2">
              <div class="flex flex-col gap-9">
                <!-- Contact Form Two -->
                <div class="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark">
                    <div class="p-6.5">
                    
                    <div class="mb-4.5 flex flex-col gap-6 xl:flex-row">
                        <div class="flex w-full xl:w-4/12 items-center">
                          <label class="mr-2 mb-3 block text-sm font-bold text-black dark:text-white">
                            수신자
                          </label>
                          <input type="text"  class="w-2/5 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                        </div>

                        <div class="flex w-full xl:w-4/12 items-center">
                          <label class="ml-2 mr-2 mb-3 block text-sm font-bold text-black dark:text-white">
                            첨부파일
                          </label>
                          <input type="text"  class="w-4/5 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                        </div>
                        
                          <div class="flex w-full xl:w-4/12 items-center">
                          <label class="mr-2 mb-3 block text-sm font-bold text-black dark:text-white">
                            발신일자
                          </label>
                          <input type="text"  class="w-4/5 rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                        </div>
                        
                      </div>
                    
                    
                      <div class="mb-5 flex flex-col gap-6 xl:flex-row">
                        <div class="w-full xl:w-1/3">
                        <div class="flex items-center">
                          <div style="width: 700px;">
                          <input type="text"  class="ml-50 w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
                          </div>
                       
                         </div>
			            </div>
                       </div>
                       
                       
                    <div class="flex items-center">
					<input type="text"  class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary">
					 </div>                      
                      

                      <div class="mb-6">
                        <label class="mb-3 block text-sm font-medium text-black dark:text-white">
                        </label>
                        <textarea rows="13"  class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"></textarea>
                      </div>
                      <div class="flex justify-between">
                      <input type="text" class="w-1/4 cursor-pointer rounded-lg border-[1.5px] border-stroke bg-transparent font-normal outline-none transition file:mr-5 file:border-collapse file:cursor-pointer file:border-0 file:border-r file:border-solid file:border-stroke file:bg-whiter file:px-5 file:py-3 file:hover:bg-primary file:hover:bg-opacity-10 focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:file:border-form-strokedark dark:file:bg-white/30 dark:file:text-white dark:focus:border-primary">
                      </div>
                    </div>
                </div>
              </div>

            </div>
          </div>

  </main>
  <!-- ===== Main Content End ===== -->
</div>

<jsp:include page="../layout/closer.jsp"/>
