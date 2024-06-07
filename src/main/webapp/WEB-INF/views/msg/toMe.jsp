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
            <button class="mr-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
                 <img src="/msgIcons/star0.svg" />보관

              </button>
            <button class="ml-4 inline-flex rounded-full border border-[#637381] px-5 py-2 text-sm font-medium text-[#637381] hover:opacity-80">
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
      <div class="bg-white dark:bg-boxdark">
        <!-- table row item -->
        <div class="grid grid-cols-11 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
        style="grid-template-columns: 50px 50px repeat(9, 1fr);">
          <div class="col-span-1" style="width:5px;">
           <input type="checkbox" class="chk">
          </div>

          <div class="col-span-1" style="width:5px;">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                  <path d="M11.1034 3.81714C11.4703 3.07397 12.53 3.07397 12.8968 3.81714L14.8577 7.7896C15.0032 8.08445 15.2844 8.28891 15.6098 8.33646L19.9964 8.97763C20.8163 9.09747 21.1431 10.1053 20.5495 10.6835L17.3769 13.7735C17.1411 14.0033 17.0334 14.3344 17.0891 14.6589L17.8376 19.0231C17.9777 19.8401 17.1201 20.4631 16.3865 20.0773L12.4656 18.0153C12.1742 17.8621 11.8261 17.8621 11.5347 18.0153L7.61377 20.0773C6.88014 20.4631 6.02259 19.8401 6.16271 19.0231L6.91122 14.6589C6.96689 14.3344 6.85922 14.0033 6.62335 13.7735L3.45082 10.6835C2.85722 10.1053 3.18401 9.09747 4.00392 8.97763L8.39051 8.33646C8.71586 8.28891 8.99704 8.08445 9.14258 7.7896L11.1034 3.81714Z" fill="#FFD02C"></path>
            </svg>
          </div>

          <div class="col-span-2">
            <p class="text-[#637381] dark:text-bodydark"> 발신자 </p>
          </div>

          <div class="col-span-5">
            <p class="text-[#637381] dark:text-bodydark">제목</p>
          </div>
          
         <div class="col-span-2">
            <p class="text-[#637381] dark:text-bodydark">날짜</p>
          </div>
     
        </div>
      </div>
      <!-- table body end -->
    </div>
  </div>
</div>



  </div>
  
  <div class="p-4 sm:p-6 xl:p-7.5" id="paging">
                  <nav>
                    <ul class="flex flex-wrap items-center">
                      <li>
                        <a class="flex h-8 w-8 items-center justify-center rounded hover:bg-primary hover:text-white" href="#">
                          <svg class="fill-current" width="8" height="16" viewBox="0 0 8 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.17578 15.1156C7.00703 15.1156 6.83828 15.0593 6.72578 14.9187L0.369531 8.44995C0.116406 8.19683 0.116406 7.80308 0.369531 7.54995L6.72578 1.0812C6.97891 0.828076 7.37266 0.828076 7.62578 1.0812C7.87891 1.33433 7.87891 1.72808 7.62578 1.9812L1.71953 7.99995L7.65391 14.0187C7.90703 14.2718 7.90703 14.6656 7.65391 14.9187C7.48516 15.0312 7.34453 15.1156 7.17578 15.1156Z" fill=""></path>
                          </svg>
                        </a>
                      </li>
                      <li>
                        <a class="flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white" href="#">1</a>
                      </li>
                      <li>
                        <a class="flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white" href="#">2</a>
                      </li>
                      <li>
                        <a class="flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white" href="#">3</a>
                      </li>
                      <li>
                        <a class="flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white" href="#">4</a>
                      </li>
                      <li>
                        <a class="flex items-center justify-center rounded px-3 py-1.5 font-medium hover:bg-primary hover:text-white" href="#">5</a>
                      </li>     
                      <li>
                        <a class="flex h-8 w-8 items-center justify-center rounded hover:bg-primary hover:text-white" href="#">
                          <svg class="fill-current" width="8" height="16" viewBox="0 0 8 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M0.819531 15.1156C0.650781 15.1156 0.510156 15.0593 0.369531 14.9468C0.116406 14.6937 0.116406 14.3 0.369531 14.0468L6.27578 7.99995L0.369531 1.9812C0.116406 1.72808 0.116406 1.33433 0.369531 1.0812C0.622656 0.828076 1.01641 0.828076 1.26953 1.0812L7.62578 7.54995C7.87891 7.80308 7.87891 8.19683 7.62578 8.44995L1.26953 14.9187C1.15703 15.0312 0.988281 15.1156 0.819531 15.1156Z" fill=""></path>
                          </svg>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
</div>

              <!-- ====== Table End -->
            </div>
        
  </main>
  <!-- ===== Main Content End ===== -->
</div>




<jsp:include page="../layout/closer.jsp"/>
