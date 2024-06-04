<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.css" rel="stylesheet" />
<script defer src="https://cdn.jsdelivr.net/npm/@alpinejs/persist@3.x.x/dist/cdn.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.min.js"></script>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp" />

<title>부서기안완료함 | TailAdmin - Tailwind CSS Admin Dashboard Template</title>


</head>

<body>

<div class="wrapper">
	<div class="mx-auto max-w-screen-2xl p-2 md:p-2 2xl:p-6">
   		 <div class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
       		 <h2 class="text-title-md2 font-bold text-black dark:text-white mt-4">전자결재 메인페이지</h2>
		 </div>

	<div>

	<div class="col-span-12 rounded-sm border border-stroke bg-white p-7.5 shadow-default dark:border-strokedark dark:bg-boxdark">
		<div class="grid grid-cols-1 gap-5 sm:grid-cols-2 xl:grid-cols-4 xl:gap-0">
			<div class="flex items-center justify-center gap-2 border-b border-stroke pb-5 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
         	<div>
            	<h4 class="mb-0.5 text-xl font-bold text-black dark:text-white md:text-title-lg">
            		$4,350
        		</h4>
           	    <p class="text-sm font-medium">Unique Visitors</p>
			</div>
        	<div class="flex items-center gap-1">
				<svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
            		<path d="M8.25259 5.87281L4.22834 9.89706L3.16751 8.83623L9.00282 3.00092L14.8381 8.83623L13.7773 9.89705L9.75306 5.87281L9.75306 15.0046L8.25259 15.0046L8.25259 5.87281Z" fill="#10B981"></path>
				</svg>
           	    <span class="text-sm font-medium text-meta-3">18%</span>
       	    </div>
		</div>
        <div class="flex items-center justify-center gap-2 border-b border-stroke pb-5 dark:border-strokedark xl:border-b-0 xl:border-r xl:pb-0">
            <div>
            	<h4 class="mb-0.5 text-xl font-bold text-black dark:text-white md:text-title-lg">
                	55.9K
                </h4>
                <p class="text-sm font-medium">Total Pageviews</p>
            </div>
            <div class="flex items-center gap-1">
            	<svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
            	<path d="M8.25259 5.87281L4.22834 9.89706L3.16751 8.83623L9.00282 3.00092L14.8381 8.83623L13.7773 9.89705L9.75306 5.87281L9.75306 15.0046L8.25259 15.0046L8.25259 5.87281Z" fill="#10B981"></path>
                </svg>
                <span class="text-sm font-medium text-meta-3">25%</span>
            </div>
        </div>
        <div class="flex items-center justify-center gap-2 border-b border-stroke pb-5 dark:border-strokedark sm:border-b-0 sm:pb-0 xl:border-r">
                    <div>
                      <h4 class="mb-0.5 text-xl font-bold text-black dark:text-white md:text-title-lg">
                        54%
                      </h4>
                      <p class="text-sm font-medium">Bounce Rate</p>
                    </div>
                    <div class="flex items-center gap-1">
                      <svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M9.75302 12.1328L13.7773 8.10856L14.8381 9.16939L9.00279 15.0047L3.16748 9.16939L4.22831 8.10856L8.25256 12.1328V3.00098H9.75302V12.1328Z" fill="#F0950C"></path>
                      </svg>
                      <span class="text-sm font-medium text-meta-8">7%</span>
                    </div>
                  </div>
                  <div class="flex items-center justify-center gap-2">
                    <div>
                      <h4 class="mb-0.5 text-xl font-bold text-black dark:text-white md:text-title-lg">
                        2m 56s
                      </h4>
                      <p class="text-sm">Visit Duration</p>
                    </div>
                    <div class="flex items-center gap-1">
                      <svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M8.25259 5.87281L4.22834 9.89706L3.16751 8.83623L9.00282 3.00092L14.8381 8.83623L13.7773 9.89705L9.75306 5.87281L9.75306 15.0046L8.25259 15.0046L8.25259 5.87281Z" fill="#10B981"></path>
                      </svg>
                      <span class="text-meta-3">12%</span>
                    </div>
                  </div>
                </div>
              </div>
              
<div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
  <h4 class="mb-6 text-xl font-bold text-black dark:text-white">
    Top Channels
  </h4>

  <div class="flex flex-col">
    <div class="grid grid-cols-3 rounded-sm bg-gray-2 dark:bg-meta-4 sm:grid-cols-5">
      <div class="p-2.5 xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Source</h5>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Visitors</h5>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Revenues</h5>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Sales</h5>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Conversion</h5>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-01.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Google
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">3.5K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$5,768</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">590</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">4.8%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-02.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Twitter
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2.2K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$4,635</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">467</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">4.3%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-03.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Github
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2.1K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$4,290</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">420</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">3.7%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-04.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Vimeo
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">1.5K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$3,580</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">389</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">2.5%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-05.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Facebook
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">1.2K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$2,740</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">230</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">1.9%</p>
      </div>
    </div>
  </div>
</div>

<div class="rounded-sm border border-stroke bg-white px-5 pb-2.5 pt-6 shadow-default dark:border-strokedark dark:bg-boxdark sm:px-7.5 xl:pb-1">
  <h4 class="mb-6 text-xl font-bold text-black dark:text-white">
    Top Channels
  </h4>

  <div class="flex flex-col">
    <div class="grid grid-cols-3 rounded-sm bg-gray-2 dark:bg-meta-4 sm:grid-cols-5">
      <div class="p-2.5 xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Source</h5>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Visitors</h5>
      </div>
      <div class="p-2.5 text-center xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Revenues</h5>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Sales</h5>
      </div>
      <div class="hidden p-2.5 text-center sm:block xl:p-5">
        <h5 class="text-sm font-medium uppercase xsm:text-base">Conversion</h5>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-01.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Google
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">3.5K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$5,768</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">590</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">4.8%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-02.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Twitter
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2.2K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$4,635</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">467</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">4.3%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-03.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Github
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">2.1K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$4,290</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">420</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">3.7%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 border-b border-stroke dark:border-strokedark sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-04.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Vimeo
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">1.5K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$3,580</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">389</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">2.5%</p>
      </div>
    </div>

    <div class="grid grid-cols-3 sm:grid-cols-5">
      <div class="flex items-center gap-3 p-2.5 xl:p-5">
        <div class="flex-shrink-0">
          <img src="src/images/brand/brand-05.svg" alt="Brand">
        </div>
        <p class="hidden font-medium text-black dark:text-white sm:block">
          Facebook
        </p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-black dark:text-white">1.2K</p>
      </div>

      <div class="flex items-center justify-center p-2.5 xl:p-5">
        <p class="font-medium text-meta-3">$2,740</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-black dark:text-white">230</p>
      </div>

      <div class="hidden items-center justify-center p-2.5 sm:flex xl:p-5">
        <p class="font-medium text-meta-5">1.9%</p>
      </div>
    </div>
  </div>
</div>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.min.js">

    document.addEventListener('DOMContentLoaded', function() {
        // Initialize Flowbite components here
    });


</script>

</body>

<jsp:include page="../layout/closer.jsp"/>