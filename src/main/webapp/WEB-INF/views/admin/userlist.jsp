<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar.jsp"/>

<main class="w-full">
  <div class="mx-auto max-w-screen-2xl p-4 md:p-6 2xl:p-10">
	<!-- ====== Table Section Start -->
    <div class="flex flex-col gap-10">
	  <!-- Breadcrumb Start -->
      <div
        class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between"
        >
        <h2 class="text-title-md2 font-bold text-black dark:text-white">
		  사원 전체 목록
        </h2>

        <nav>
          <ol class="flex items-center gap-2">
            <li>
              <a class="font-medium" href="index.html">관리자 /</a>
            </li>
            <li class="font-medium text-primary">사원 관리</li>
          </ol>
        </nav>
      </div>
      <!-- Breadcrumb End -->

              <!-- ====== Table Four Start -->
      <div
		x-data="{ registerwindow: false }"
		class="overflow-hidden rounded-[10px]">
  <div class="max-w-full overflow-x-auto">
    <div class="min-w-[1170px]">
      <!-- table header start -->
      <div
        class="grid grid-cols-12 bg-[#F9FAFB] px-5 py-4 dark:bg-meta-4 lg:px-7.5 2xl:px-11"
      >
        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">사원 번호</h5>
        </div>

        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">이름</h5>
        </div>

        <div class="col-span-3">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">소속 부서</h5>
        </div>

        <div class="col-span-2">
          <h5 class="font-medium text-[#637381] dark:text-bodydark">직위</h5>
        </div>

		<div class="col-span-1">
		  <button
			@click.prevent="registerwindow = true"
			class="float-right text-primary">사원 등록</button>
        </div>
      </div>
      <!-- table header end -->
	  <div
		x-show="registerwindow"
		@click.outside="registerwindow = false"
        class="rounded-sm border border-stroke bg-white shadow-default dark:border-strokedark dark:bg-boxdark"
        >
        <div
          class="border-b border-stroke px-6.5 py-4 dark:border-strokedark"
          >
          <h3 class="font-medium text-black dark:text-white">
			사원 등록
          </h3>
        </div>
        <form action="${contextPath}/admin/addUser" method="POST">
          <div class="grid grid-cols-12 p-6.5">
            <div class="col-span-3 px-3 mb-4.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                사원 번호
              </label>
              <input
                type="text"
				name="empId"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                />
            </div>

            <div class="col-span-3 px-3 mb-4.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                이름
              </label>
              <input
                type="text"
				name="name"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                />
            </div>

            <div class="col-span-3 px-3 mb-4.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                비밀번호
              </label>
              <input
                type="password"
				name="pw"
                autocomplete="password"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                />
            </div>

            <div class="col-span-3 px-3 mb-5.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                재확인
              </label>
              <input
                type="password"
                autocomplete="re-enter-password"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                />
            </div>

			<div class="col-span-3 px-3 mb-4.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                성별
              </label>
              <select
                type="text"
				name="genderId"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                >
				<option value="">선택</option>
			  </select>
            </div>

			<div class="col-span-3 px-3 mb-5.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                부서
              </label>
              <input
                type="text"
				name="depId"
                autocomplete="re-enter-password"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                />
            </div>

			<div class="col-span-3 px-3 mb-5.5">
              <label
                class="mb-3 block text-sm font-medium text-black dark:text-white"
                >
                직위
              </label>
			  <select
				id="positions"
                type="text"
				name="posId"
                class="w-full rounded border-[1.5px] border-stroke bg-transparent px-5 py-3 font-normal text-black outline-none transition focus:border-primary active:border-primary disabled:cursor-default disabled:bg-whiter dark:border-form-strokedark dark:bg-form-input dark:text-white dark:focus:border-primary"
                >
				<option value="">선택</option>
			  </select>
            </div>
		  </div>

		  <div class="grid grid-cols-12">
			<div class="col-span-3"></div><div class="col-span-3"></div>
			<div class="col-span-3 p-3">
			  <button
				@click.prevent="registerwindow = false"
				class="flex w-full justify-center rounded border border-black p-3 font-medium text-black"
				>
				취소
              </button>
			</div>
			<div class="col-span-3 p-3">
              <button
				@click="registerwindow = false"
				class="col-span-3 flex w-full justify-center rounded bg-primary px-3 p-3 font-medium text-gray hover:bg-opacity-90"
				>
				등록
              </button>
			</div>
		  </div>
        </form>
      </div>

      <!-- table body start -->
      <div id="datatable" class="bg-white dark:bg-boxdark">
        <!-- table row item -->
      </div>
      <!-- table body end -->
    </div>
  </div>
</div>

              <!-- ====== Table Four End -->

	</div>
  </div>
</main>

<script>

  const tablerow = (user) => {
	  var row = `<div
          href="${contextPath}/admin/userinfo/` + user.empId + `"
          class="grid grid-cols-12 border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
        >`;
	  row += `<div class="col-span-3">
            <p class="text-[#637381] dark:text-bodydark">` + user.empId + `</p>
          </div>`;
	  row += `<div class="col-span-3">
            <p class="text-[#637381] dark:text-bodydark">
              ` + user.name + `
            </p>
          </div>`;
	  row += `<div class="col-span-3">
            <p class="text-[#637381] dark:text-bodydark">
              ` + (user.dept ? user.dept.name : "미발령") + `
            </p>
          </div>`;
	  row += `<div class="col-span-2">
            <p class="text-[#637381] dark:text-bodydark">` + (user.pos ? user.pos.name : "미정") + `</p>
          </div>`;
	  row += `<div class="col-span-1">
              <button empid="` + user.empId + `" class="deleteuser float-right text-primary">삭제</button>
          </div>`;
	  row += `</div>`;
	  return row;
  };

  const getTableData = () => {
	  $.ajax({
		  url: "${contextPath}/admin/getUsers",
		  success: (data) => {
			  var rows = "";
			  for (var user of data) {
				  rows += tablerow(user);
			  }
			  $("#datatable").append(rows);
			  deluserListener();
		  },
		  error: (jqXHR) => {
			  alert("getTableData\n\n" + jqXHR.responseText);
		  }
	  })
  };

  getTableData();

  const adduserListener = () => {
	  document.getElementById("register").addEventListener('click', () => {
		  var user = {
			  "empId": empId,
			  "name": name,
			  "dept": {
				  "name": dept_name
			  },
			  "pos": {
				  "name": pos_name
			  }
		  }
		  $("").prepend(tablerow(user));
	  });
  };

  const deluserListener = () => {
	  var els = document.getElementsByClassName("deleteuser");
	  for (var el of els) {
		  el.addEventListener("click", (evt) => {
			  var empId = evt.currentTarget.getAttribute("empid");
			  console.log(JSON.stringify(empId));
			  $.ajax({
				  url: "${contextPath}/admin/delUser",
				  method: "POST",
				  data: "empId=" + empId
				  // error: (jqXHR) => {}
			  });
			  document.location.reload();
		  });
	  }
  };

</script>

<jsp:include page="../layout/closer.jsp"/>
