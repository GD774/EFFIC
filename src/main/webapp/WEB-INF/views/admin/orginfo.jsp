<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>
<jsp:include page="../layout/sidebar-admin.jsp"/>

<!-- ===== Content Area Start ===== -->
<div
  class="relative flex flex-1 flex-col"
  >
  <div x-data="
			   {
			   openTab1: 1,
			   openTab2: 1,
			   activeClasses: 'bg-primary text-white',
			   inactiveClasses: 'bg-gray dark:bg-meta-4 text-black dark:text-white',
			   }
			   "
	   class="flex overflow-y-hidden">
	<div id="org-window" x-show="openTab2 !== 3" class="w-4/12 mx-auto max-w-screen-2xl pt-6 pl-6 pb-6 pr-3">
	  <div class="sticky w-full flex flex-wrap justify-between dark:border-strokedark">
		<div class="mb-3 flex gap-3">
		  <a
			id="tabDep"
			href="#"
			@click.prevent="openTab1 = 1;
							$('#tabEmpList').empty(); $('#tabEmpList').append('부서 생성');"
			:class="openTab1 === 1 ? activeClasses : inactiveClasses"
			class="rounded-md px-4 py-3 text-sm font-medium hover:bg-primary hover:text-white dark:hover:bg-primary md:text-base lg:px-6"
			>
			부서
		  </a>
		  <a
			id="tabPos"
			href="#"
			@click.prevent="openTab1 = 2;
							$('#tabEmpList').empty(); $('#tabEmpList').append('직위 생성');"
			:class="openTab1 === 2 ? activeClasses : inactiveClasses"
			class="rounded-md px-4 py-3 text-sm font-medium hover:bg-primary hover:text-white dark:hover:bg-primary md:text-base lg:px-6"
			>
			직위
		  </a>
		</div>
	  </div>
	  <div id="dep-chart" x-show="openTab1 == 1" class="w-full h-full overflow-y-scroll">
		<div>
		  <div class="bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
		  </div>
		</div>
	  </div>
	  <div id="pos-chart" x-show="openTab1 == 2" class="w-full h-full overflow-y-scroll">
		<div>
		  <div class="bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
		  </div>
		</div>
	  </div>
	</div>

    <!-- ===== Header End ===== -->

	<!-- ===== Main Content Start ===== -->
    <main class="flex flex-col gap-10 w-full h-full overflow-y-scroll">
	  <div
		class="mb-14 w-full pt-6 pl-3 pb-6 pr-6"
		>
		<div
		  class="flex flex-wrap justify-between dark:border-strokedark"
		  >
		  <div
			class="mb-3 flex gap-3">
			<a
			  id="tabBasicInfo"
			  href="#"
			  @click.prevent="openTab2 = 1"
			  :class="openTab2 === 1 ? activeClasses : inactiveClasses"
			  class="rounded-md px-4 py-3 text-sm font-medium hover:bg-primary hover:text-white dark:hover:bg-primary md:text-base lg:px-6"
			  >
			  기본 정보
			</a>
			<a
			  id="tabEmpList"
			  href="#"
			  @click.prevent="openTab2 = 2;"
			  :class="openTab2 === 2 ? activeClasses : inactiveClasses"
			  class="rounded-md px-4 py-3 text-sm font-medium hover:bg-primary hover:text-white dark:hover:bg-primary md:text-base lg:px-6"
			  >
			  부서 생성
			</a>
		  </div>
		</div>
		<div class="font-medium leading-relaxed">
		  <div class="max-w-full overflow-x-auto mx-auto max-w-screen-2xl">
			<div id="depInfo" x-show="openTab1 === 1 && openTab2 === 1" class="h-screen bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
			</div>
			<div id="posInfo" x-show="openTab1 === 2 && openTab2 === 1" class="h-screen bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
			</div>
		  </div>
		</div>
		<div class="font-medium leading-relaxed">
		  <div class="max-w-full overflow-x-auto mx-auto max-w-screen-2xl">
			<div class="min-w-[1170px]">
			  <div id="depMake" x-show="openTab1 === 1 && openTab2 === 2" class="h-screen bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
			  </div>
			</div>
		  </div>
		</div>
		<div class="font-medium leading-relaxed">
		  <div class="max-w-full overflow-x-auto mx-auto max-w-screen-2xl">
			<div class="min-w-[1170px]">
			  <div id="posMake" x-show="openTab1 === 2 && openTab2 === 2" class="h-screen bg-white dark:bd-boxdark rounded-t-[10px] gap-4 p-4">
			  </div>
			</div>
		  </div>
		</div>
	  </div>
	</main>
    <!-- ===== Main Content End ===== -->

  </div>
</div>
<!-- ===== Content Area End ===== -->

<script type="module">

  // import { orgChart } from "${contextPath}/js/orgChart.js";
  // import { BasicTable } from "${contextPath}/js/tableBasic.js";

  const organize = (users, depts) => {
	  var tree = [];
	  for (var d of depts) {
		  var node = { id: id,
					   text: d.name,
					   code: d.code,
					   parent: d.parent,
					   children: []};
		  tree.push(node);
		  if (!d.parent)
			  continue;
		  for (var n of tree)
			  if (d.parent.code === n.code) {
				  n.children.push(node);
				  break;
			  }
	  }
	  tree.push({ id: id,
				  text: "가발령",
				  code: null,
				  children: []});

	  for (var u of users) {
		  var node = { id: id,
					   text: u.name,
					   empId: u.empId};
		  var flag = false;
		  for (var n of tree)
			  if (u.dept && (u.dept.code === n.code)) {
				  n.children.push(node);
				  flag = true;
				  break;
			  }
		  if (!flag)
			  tree[tree.length - 1].children.push(node);
	  }

	  for (var ind in tree)
		  if (tree[ind].parent)
			  delete tree[ind];
		  else
			  delete tree[ind].parent;

	  return tree;
  };

  const renderDepChart = () => {
	  $.ajax({
		  url: "${contextPath}/admin/getDepData",
		  method: "GET",
		  success: (data) => {
			  var users = data["users"];
			  var depts = data["depts"];

			  var depChart = $("#dep-chart > div > div");
			  depChart.jstree({ 'core': {
				  'data': organize(users, depts)
			  }});
			  depChart.on("changed.jstree", (evt, data) => {
				  var name = data.instance.get_node(data.selected[0]).name;
				  var code = data.instance.get_node(data.selected[0]).code;
				  $("#parentDepName").attr("value", name);
				  $("#parentDep").attr("code", code);
			  });
		  },
		  error: (jqXHR) => {}
	  });
  };

  const renderPosChart = () => {
	  $.ajax({
		  url: "{contextPath}/admin/getPosData",
		  method: "GET",
		  success: (data) => {
			  var posChart = $("#pos-chart > div > div");
			  posChart.empty();
			  var posTable = `
<div class="overflow-hidden rounded-[10px]">
  <div class="max-w-full overflow-x-auto">
    <div>
      <!-- table body start -->
      <div class="bg-white dark:bg-boxdark">`;
			  for (var pos of data) {
				  posTable += `<!-- table row item -->
        <div
          code="` + pos.code + `" class="poschart border-t border-[#EEEEEE] px-5 py-4 dark:border-strokedark lg:px-7.5 2xl:px-11"
        >
          <div>
            <p class="text-[#637381] dark:text-bodydark">` + pos.name + `</p>
          </div>
        </div>`;
			  }
			  posTable += `</div>
      <!-- table body end -->
    </div>
  </div>
</div>`;
			  posChart.append(posTable);
		  },
		  error: (jqXHR) => {}
	  });
  };

  // const listenPosChart = () => {
  // 	  var els = document.getElementsByClassName("poschart");
  // 	  for (var e of els) {
  // 		  e.addEventListener("click", (evt) => {
  // 			  var el = evt.currentTarget;
  // 			  $("#parentPosName").attr("value", el.children[0].children[0].textContent);
  // 			  $("#parentPos").attr("code", el.getAttribute("code"));
  // 		  });
  // 	  }
  // }

  const renderMainTable = (element, data, option=null) => {
	  var content = '';
	  if (option) {
		  content += `<form action="` + option["action"] + `" method="` + option["method"] + `">`;
	  }
	  for (var ind in data) {
		  var d = data[ind];
		  if (d[0]) {
			  content += `<div class="grid grid-cols-12 p-4 border-b border-[#EEEEEE]">
				      <div class="col-span-2"><p class="text-[#637381] dark:text-bodydark">`;
			  content += d[0];
			  content += `</p></div>`
		  }
		  if (!option) {
			  content += `<div class="col-auto"><p class="text-[#637381] dark:text-bodydark">`;
			  content += d[1];
			  content += `</p></div></div>`;
		  }
		  else {
			  content += `<input name="` + d[1] + `" ` +
				         `class="col-auto border border-[#0000FF]"` +
				         option["input"][ind] + `>`;
			  if (d[0])
				  content += `</div>`;
		  }
	  }
	  if (option) {
		  content += `<div class="grid grid-cols-12">
				      <div class="col-span-2">
            <button
			  class="rounded-md px-4 py-3 text-sm font-medium hover:bg-primary hover:text-white dark:hover:bg-primary md:text-base lg:px-6"
			  >
			  생성
			</button>
</div></div></form>`;
	  }
	  element.empty();
	  element.append(content);
  };

  const renderDepInfo = () => {
	  $.ajax({
		  url: "${contextPath}/admin/getDepInfo",
		  method: "GET",
		  success: (resData) => {
			  var data = [["부서명", resData[0]],
						  ["코드", resData[1]],
						  ["사원수", resData[2]]];
			  renderMainTable($("#depInfo"), data);
		  },
		  error: (jqXHR) => {
			  alert(jqXHR);
		  }
	  });
  };

  const renderPosInfo = () => {
	  $.ajax({
		  url: "${contextPath}/admin/getPosInfo",
		  method: "GET",
		  success: (resData) => {
			  var data = [["직위명", resData[0]],
						  ["코드", resData[1]],
						  ["사원수", resData[2]]];
			  renderMainTable($("#posInfo"), data);
		  },
		  error: (jqXHR) => {
			  alert(jqXHR);
		  }
	  });
  };

  const renderDepMake = () => {
	  renderMainTable($("#depMake"),
					  [["부서명", "name"],["코드", "code"],["상위 부서", ""],[null,"parent"]],
					  {"action": "${contextPath}/admin/addDep",
					   "method": "POST",
					   "input": { 0: "", 1: "",
								  2:"id=\"parentDepName\" disabled",
								  3:"id=\"parentDep\" hidden"}});
  };

  const renderPosMake = () => {
	  renderMainTable($("#posMake"),
					  [["직위명", "name"],["코드", "code"]],
					  {"action": "${contextPath}/admin/addPos",
					   "method": "POST",
					   "input": { 0: "", 1: ""}});
  };

  renderDepChart();
  renderPosChart();
  renderDepInfo();
  renderPosInfo();
  renderDepMake();
  renderPosMake();

</script>

<jsp:include page="../layout/closer.jsp"/>
