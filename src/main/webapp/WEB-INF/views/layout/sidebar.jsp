<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<style>

#logoimage {
	margin-left: 50px;
	margin-top: 50px;
	width: 75px;
	height: 75px;

}

</style>

<!-- ===== Sidebar Start ===== -->
<aside
  :class="sidebarToggle ? 'translate-x-0' : '-translate-x-full'"
  class="absolute left-0 top-0 z-9999 flex h-screen w-72.5 flex-col overflow-y-hidden bg-black duration-300 ease-linear dark:bg-boxdark lg:static lg:translate-x-0"
  @click.outside="sidebarToggle = false"
  >
  <!-- SIDEBAR HEADER -->
  <div class="flex items-center justify-between gap-2 px-6 py-5.5 lg:py-6.5">
	<a href="${contextPath}/">
      <img id="logoimage" src="${contextPath}/image/logo-white.svg" alt="Logo" />
	</a>

	<button
      class="block lg:hidden"
      @click.stop="sidebarToggle = !sidebarToggle"
      >
      <svg
		class="fill-current"
		width="20"
		height="18"
		viewBox="0 0 20 18"
		fill="none"
		xmlns="http://www.w3.org/2000/svg"
		>
		<path
          d="M19 8.175H2.98748L9.36248 1.6875C9.69998 1.35 9.69998 0.825 9.36248 0.4875C9.02498 0.15 8.49998 0.15 8.16248 0.4875L0.399976 8.3625C0.0624756 8.7 0.0624756 9.225 0.399976 9.5625L8.16248 17.4375C8.31248 17.5875 8.53748 17.7 8.76248 17.7C8.98748 17.7 9.17498 17.625 9.36248 17.475C9.69998 17.1375 9.69998 16.6125 9.36248 16.275L3.02498 9.8625H19C19.45 9.8625 19.825 9.4875 19.825 9.0375C19.825 8.55 19.45 8.175 19 8.175Z"
          fill=""
          />
      </svg>
	</button>
  </div>
  <!-- SIDEBAR HEADER -->

  <div
	class="no-scrollbar flex flex-col overflow-y-auto duration-300 ease-linear"
	>
	<!-- Sidebar Menu -->
	<nav
      class="mt-5 px-4 py-4 lg:mt-9 lg:px-6"
      x-data="{selected: $persist('Dashboard')}"
      >
      <!-- Menu Group -->
      <div>
		<h3 class="mb-4 ml-4 text-sm font-medium text-bodydark2">주요 기능</h3>

		<ul class="mb-6 flex flex-col gap-1.5">

          <!-- Menu Item Approv -->
          <li>
            <a
              class="group relative flex items-center gap-2.5 rounded-sm px-4 py-2 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="#"
              @click.prevent="selected = ((selected === 'Approv' || selected === 'byIndv' || selected === 'byDep') ? '' : 'Approv')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Approv') || (page === 'formElements' || page === 'formLayout') }"
            >
              <svg
                class="fill-current"
                width="18"
                height="18"
                viewBox="0 0 18 18"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M1.43425 7.5093H2.278C2.44675 7.5093 2.55925 7.3968 2.58737 7.31243L2.98112 6.32805H5.90612L6.27175 7.31243C6.328 7.48118 6.46862 7.5093 6.58112 7.5093H7.453C7.76237 7.48118 7.87487 7.25618 7.76237 7.03118L5.428 1.4343C5.37175 1.26555 5.3155 1.23743 5.14675 1.23743H3.88112C3.76862 1.23743 3.59987 1.29368 3.57175 1.4343L1.153 7.08743C1.0405 7.2843 1.20925 7.5093 1.43425 7.5093ZM4.47175 2.98118L5.3155 5.17493H3.59987L4.47175 2.98118Z"
                  fill=""
                />
                <path
                  d="M10.1249 2.5031H16.8749C17.2124 2.5031 17.5218 2.22185 17.5218 1.85623C17.5218 1.4906 17.2405 1.20935 16.8749 1.20935H10.1249C9.7874 1.20935 9.47803 1.4906 9.47803 1.85623C9.47803 2.22185 9.75928 2.5031 10.1249 2.5031Z"
                  fill=""
                />
                <path
                  d="M16.8749 6.21558H10.1249C9.7874 6.21558 9.47803 6.49683 9.47803 6.86245C9.47803 7.22808 9.75928 7.50933 10.1249 7.50933H16.8749C17.2124 7.50933 17.5218 7.22808 17.5218 6.86245C17.5218 6.49683 17.2124 6.21558 16.8749 6.21558Z"
                  fill=""
                />
                <path
                  d="M16.875 11.1656H1.77187C1.43438 11.1656 1.125 11.4469 1.125 11.8125C1.125 12.1781 1.40625 12.4594 1.77187 12.4594H16.875C17.2125 12.4594 17.5219 12.1781 17.5219 11.8125C17.5219 11.4469 17.2125 11.1656 16.875 11.1656Z"
                  fill=""
                />
                <path
                  d="M16.875 16.1156H1.77187C1.43438 16.1156 1.125 16.3969 1.125 16.7625C1.125 17.1281 1.40625 17.4094 1.77187 17.4094H16.875C17.2125 17.4094 17.5219 17.1281 17.5219 16.7625C17.5219 16.3969 17.2125 16.1156 16.875 16.1156Z"
                  fill="white"
                />
              </svg>

              전자결재

              <svg
                class="absolute right-4 top-1/2 -translate-y-1/2 fill-current"
                :class="{ 'rotate-180': (selected === 'Approv') }"
                width="20"
                height="20"
                viewBox="0 0 20 20"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z"
                  fill=""
                />
              </svg>
            </a>

            <!-- Dropdown Menu Start -->
            <div
              class="translate transform overflow-hidden"
              :class="(selected === 'Approv' || selected === 'byIndv' || selected === 'byDep') ? 'block' :'hidden'"
            >
              <ul class="mb-5.5 mt-4 flex flex-col gap-2.5 pl-6">
                <li>
                  <a
                    class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                    href="${contextPath}/approval/main"
                    :class="page === 'formElements' && '!text-white'"
                  >메인</a>
                </li>
                <li>
                  <a
                    class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                    href="#"
                    @click.prevent="selected = (selected === 'byIndv' ? 'Approv' : 'byIndv')"
                    :class="page === 'formLayout' && '!text-white'"
                  >개인
                    <svg class="absolute right-4 top-1/2 -translate-y-1/2 fill-current" :class="{ 'rotate-180': (selected === 'byIndv') }" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z" fill=""></path>
                  </svg>                    
                </a>

                  <ul class="mb-5.5 mt-4 flex flex-col gap-2.5 pl-6"
                    :class="(selected === 'byIndv') ? 'block' :'hidden'">
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/myDocList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >기안문서함</a>
                    </li>
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/temporaryList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >임시저장함</a>
                    </li>
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/myRefList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >참조문서함</a>
                    </li>
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/myAppDocList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >결재문서함</a>
                    </li>
                  </ul>
                </li>
                <li>
                  <a
                    class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                    href="#"
                    @click.prevent="selected = (selected === 'byDep' ? 'Approv' : 'byDep')"
                    :class="page === 'formLayout' && '!text-white'"
                  >부서
                  <svg class="absolute right-4 top-1/2 -translate-y-1/2 fill-current" :class="{ 'rotate-180': (selected === 'byDep') }" width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z" fill=""></path>
                  </svg>    
                  </a>

                  <ul class="mb-5.5 mt-4 flex flex-col gap-2.5 pl-6"
                    :class="(selected === 'byDep') ? 'block' :'hidden'">
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/depDocList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >기안완료함</a>
                    </li>
                    <li>
                      <a
                        class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
                        href="${contextPath}/approval/depRefList.page"
                        :class="page === 'formElements' && '!text-white'"
                      >참조문서함</a>
                    </li>
                  </ul>
                </li>
              </ul>
            </div>
            <!-- Dropdown Menu End -->
          </li>
          <!-- Menu Item Approv -->

		  <!-- Menu Item Calendar -->
          <li>
			<a
              class="group relative flex items-center gap-2.5 rounded-sm px-4 py-2 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="${contextPath}/calendar"
              @click="selected = (selected === 'Calendar' ? '':'Calendar')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Calendar') && (page === 'calendar') }"
              :class="page === 'calendar' && 'bg-graydark'"
              >
			  <svg
                class="fill-current"
                width="18"
                height="18"
                viewBox="0 0 18 18"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M15.7499 2.9812H14.2874V2.36245C14.2874 2.02495 14.0062 1.71558 13.6405 1.71558C13.2749 1.71558 12.9937 1.99683 12.9937 2.36245V2.9812H4.97803V2.36245C4.97803 2.02495 4.69678 1.71558 4.33115 1.71558C3.96553 1.71558 3.68428 1.99683 3.68428 2.36245V2.9812H2.2499C1.29365 2.9812 0.478027 3.7687 0.478027 4.75308V14.5406C0.478027 15.4968 1.26553 16.3125 2.2499 16.3125H15.7499C16.7062 16.3125 17.5218 15.525 17.5218 14.5406V4.72495C17.5218 3.7687 16.7062 2.9812 15.7499 2.9812ZM1.77178 8.21245H4.1624V10.9968H1.77178V8.21245ZM5.42803 8.21245H8.38115V10.9968H5.42803V8.21245ZM8.38115 12.2625V15.0187H5.42803V12.2625H8.38115ZM9.64678 12.2625H12.5999V15.0187H9.64678V12.2625ZM9.64678 10.9968V8.21245H12.5999V10.9968H9.64678ZM13.8374 8.21245H16.228V10.9968H13.8374V8.21245ZM2.2499 4.24683H3.7124V4.83745C3.7124 5.17495 3.99365 5.48433 4.35928 5.48433C4.7249 5.48433 5.00615 5.20308 5.00615 4.83745V4.24683H13.0499V4.83745C13.0499 5.17495 13.3312 5.48433 13.6968 5.48433C14.0624 5.48433 14.3437 5.20308 14.3437 4.83745V4.24683H15.7499C16.0312 4.24683 16.2562 4.47183 16.2562 4.75308V6.94683H1.77178V4.75308C1.77178 4.47183 1.96865 4.24683 2.2499 4.24683ZM1.77178 14.5125V12.2343H4.1624V14.9906H2.2499C1.96865 15.0187 1.77178 14.7937 1.77178 14.5125ZM15.7499 15.0187H13.8374V12.2625H16.228V14.5406C16.2562 14.7937 16.0312 15.0187 15.7499 15.0187Z"
                  fill=""
                />
              </svg>

              일정관리
			</a>
          </li>
          <!-- Menu Item Calendar -->

		  <!-- Menu Item Reservation -->
          <li>
			<a
              class="group relative flex items-center gap-2.5 rounded-sm py-2 px-4 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="#"
              @click="selected = (selected === 'Reservation' ? '':'Reservation')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Reservation') && (page === 'reservation') }"
              >
              <svg
				class="fill-current"
				width="18"
				height="19"
				viewBox="0 0 18 19"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
				>
				<g clip-path="url(#clip0_130_9756)">
                  <path
					d="M15.7501 0.55835H2.2501C1.29385 0.55835 0.506348 1.34585 0.506348 2.3021V15.8021C0.506348 16.7584 1.29385 17.574 2.27822 17.574H15.7782C16.7345 17.574 17.5501 16.7865 17.5501 15.8021V2.3021C17.522 1.34585 16.7063 0.55835 15.7501 0.55835ZM6.69385 10.599V6.4646H11.3063V10.5709H6.69385V10.599ZM11.3063 11.8646V16.3083H6.69385V11.8646H11.3063ZM1.77197 6.4646H5.45635V10.5709H1.77197V6.4646ZM12.572 6.4646H16.2563V10.5709H12.572V6.4646ZM2.2501 1.82397H15.7501C16.0313 1.82397 16.2563 2.04897 16.2563 2.33022V5.2271H1.77197V2.3021C1.77197 2.02085 1.96885 1.82397 2.2501 1.82397ZM1.77197 15.8021V11.8646H5.45635V16.3083H2.2501C1.96885 16.3083 1.77197 16.0834 1.77197 15.8021ZM15.7501 16.3083H12.572V11.8646H16.2563V15.8021C16.2563 16.0834 16.0313 16.3083 15.7501 16.3083Z"
					fill=""
					/>
				</g>
				<defs>
                  <clipPath id="clip0_130_9756">
					<rect
                      width="18"
                      height="18"
                      fill="white"
                      transform="translate(0 0.052124)"
                      />
                  </clipPath>
				</defs>
              </svg>

              예약
			  <svg
				class="absolute right-4 top-1/2 -translate-y-1/2 fill-current"
				:class="{ 'rotate-180': (selected === 'Reservation') }"
				width="20"
				height="20"
				viewBox="0 0 20 20"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
				>
				<path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z"
                  fill=""
                  />
              </svg>
			</a>
			<div
              class="translate transform overflow-hidden"
              :class="(selected === 'Reservation') ? 'block' :'hidden'"
              >
              <ul class="mb-5.5 mt-4 flex flex-col gap-2.5 pl-6">
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="../reservation/roomstatus"
					:class="page === 'roomstatus' && '!text-white'"
					>회의실 예약</a
					>
				</li>
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="../reservation/facilitystatus"
					:class="page === 'facilitystatus' && '!text-white'"
					>공용물품 대여</a
					>
				</li>
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="../reservation/reservemanage"
					:class="page === 'reservemanage' && '!text-white'"
					>회의실 관리</a
					 >
				</li>
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="../reservation/facilitymanage"
					:class="page === 'facilitymanage' && '!text-white'"
					>물품 관리</a
					>
				</li>
              </ul>
			</div>
          </li>
          <!-- Menu Item Reservation -->

		  <!-- Menu Item Messages -->
          <li>
            <a
              class="group relative flex items-center gap-2.5 rounded-sm px-4 py-2 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="#"
@click="selected = (selected === 'Messages' ? '':'Messages')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Messages') && (page === 'Messages') }"
            >
              <svg
                class="fill-current"
                width="18"
                height="19"
                viewBox="0 0 18 19"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <path
                  d="M15.7499 2.75208H2.2499C1.29365 2.75208 0.478027 3.53957 0.478027 4.52395V13.6364C0.478027 14.5927 1.26553 15.4083 2.2499 15.4083H15.7499C16.7062 15.4083 17.5218 14.6208 17.5218 13.6364V4.49583C17.5218 3.53958 16.7062 2.75208 15.7499 2.75208ZM15.7499 4.0177C15.778 4.0177 15.8062 4.0177 15.8343 4.0177L8.9999 8.4052L2.16553 4.0177C2.19365 4.0177 2.22178 4.0177 2.2499 4.0177H15.7499ZM15.7499 14.0865H2.2499C1.96865 14.0865 1.74365 13.8615 1.74365 13.5802V5.2552L8.3249 9.47395C8.52178 9.61457 8.74678 9.67083 8.97178 9.67083C9.19678 9.67083 9.42178 9.61457 9.61865 9.47395L16.1999 5.2552V13.6083C16.2562 13.8896 16.0312 14.0865 15.7499 14.0865Z"
                  fill=""
                />

              </svg>

              메세지

              <input type="text" id="message-count"
                class="w-10 text-center absolute right-14 top-1/2 -translate-y-1/2 rounded bg-primary px-2.5 py-1 text-xs font-medium text-white" readonly
                />
			  <svg
				class="absolute right-4 top-1/2 -translate-y-1/2 fill-current"
				:class="{ 'rotate-180': (selected === 'Chart') }"
				width="20"
				height="20"
				viewBox="0 0 20 20"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
				>
				<path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z"
                  fill=""
                  />
              </svg>
            </a>

			<!-- Dropdown Menu Start -->
			<div
              class="translate transform overflow-hidden"
              :class="(selected === 'Messages') ? 'block' :'hidden'"
              >
              <ul class="mb-3 mt-4 flex flex-col gap-2 pl-6">
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/write.page"
					:class="page === 'alerts' && '!text-white'"
					>메세지 쓰기</a
								  >
				</li>

				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/toMe.page"
					:class="page === 'buttons' && '!text-white'"
					>내게 쓴 메세지</a

								  >
				</li>
				
				
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/inboxList.page"
					:class="page === 'buttons' && '!text-white'"
					>받은 메세지</a>
				</li>
				
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/sentList.page"
					:class="page === 'buttons' && '!text-white'"
					>보낸 메세지</a
								  >
				</li>
				
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/impList.page"
					:class="page === 'buttons' && '!text-white'"
					>중요 메세지</a
								  >
				</li>
				
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/msg/bin.page"
					:class="page === 'buttons' && '!text-white'"
					>휴지통</a
								  >
				</li>
				
				
              </ul>
			</div>
			<!-- Dropdown Menu End -->
          </li>
          <!-- Menu Item Messages -->

		  <!-- Menu Item Chart -->
          <li>
			<a
              class="group relative flex items-center gap-2.5 rounded-sm px-4 py-2 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="#"
              @click="selected = (selected === 'Chart' ? '':'Chart')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Chart') && (page === 'chart') }"
              >
			  <svg
				class="fill-current"
				width="18"
				height="19"
				viewBox="0 0 18 19"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
				>
				<g clip-path="url(#clip0_130_9801)">
                  <path
					d="M10.8563 0.55835C10.5188 0.55835 10.2095 0.8396 10.2095 1.20522V6.83022C10.2095 7.16773 10.4907 7.4771 10.8563 7.4771H16.8751C17.0438 7.4771 17.2126 7.39272 17.3251 7.28022C17.4376 7.1396 17.4938 6.97085 17.4938 6.8021C17.2688 3.28647 14.3438 0.55835 10.8563 0.55835ZM11.4751 6.15522V1.8521C13.8095 2.13335 15.6938 3.8771 16.1438 6.18335H11.4751V6.15522Z"
					fill=""
					/>
                  <path
					d="M15.3845 8.7427H9.1126V2.69582C9.1126 2.35832 8.83135 2.07707 8.49385 2.07707C8.40947 2.07707 8.3251 2.07707 8.24072 2.07707C3.96572 2.04895 0.506348 5.53645 0.506348 9.81145C0.506348 14.0864 3.99385 17.5739 8.26885 17.5739C12.5438 17.5739 16.0313 14.0864 16.0313 9.81145C16.0313 9.6427 16.0313 9.47395 16.0032 9.33332C16.0032 8.99582 15.722 8.7427 15.3845 8.7427ZM8.26885 16.3083C4.66885 16.3083 1.77197 13.4114 1.77197 9.81145C1.77197 6.3802 4.47197 3.53957 7.8751 3.3427V9.36145C7.8751 9.69895 8.15635 10.0083 8.52197 10.0083H14.7938C14.6813 13.4958 11.7845 16.3083 8.26885 16.3083Z"
					fill=""
					/>
				</g>
				<defs>
                  <clipPath id="clip0_130_9801">
					<rect
                      width="18"
                      height="18"
                      fill="white"
                      transform="translate(0 0.052124)"
                      />
                  </clipPath>
				</defs>
              </svg>

              실적
			  <svg
				class="absolute right-4 top-1/2 -translate-y-1/2 fill-current"
				:class="{ 'rotate-180': (selected === 'Chart') }"
				width="20"
				height="20"
				viewBox="0 0 20 20"
				fill="none"
				xmlns="http://www.w3.org/2000/svg"
				>
				<path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M4.41107 6.9107C4.73651 6.58527 5.26414 6.58527 5.58958 6.9107L10.0003 11.3214L14.4111 6.91071C14.7365 6.58527 15.2641 6.58527 15.5896 6.91071C15.915 7.23614 15.915 7.76378 15.5896 8.08922L10.5896 13.0892C10.2641 13.4147 9.73651 13.4147 9.41107 13.0892L4.41107 8.08922C4.08563 7.76378 4.08563 7.23614 4.41107 6.9107Z"
                  fill=""
                  />
              </svg>
			</a>
			<div
              class="translate transform overflow-hidden"
              :class="(selected === 'Chart') ? 'block' :'hidden'"
              >
              <ul class="mb-5.5 mt-4 flex flex-col gap-2.5 pl-6">
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/results/results-main"
					:class="page === 'formElements' && '!text-white'"
					>지점 실적</a
								  >
				</li>
				<li>
                  <a
					class="group relative flex items-center gap-2.5 rounded-md px-4 font-medium text-bodydark2 duration-300 ease-in-out hover:text-white"
					href="${contextPath}/expt_results/expt-main"
					:class="page === 'formLayout' && '!text-white'"
					>예상 실적</a
								  >
				</li>
              </ul>
			</div>
          </li>
          <!-- Menu Item Chart -->

		  <!-- Menu Item Organization -->
          <li>
			<a
              class="group relative flex items-center gap-2.5 rounded-sm px-4 py-2 font-medium text-bodydark1 duration-300 ease-in-out hover:bg-graydark dark:hover:bg-meta-4"
              href="organization.html"
              @click="selected = (selected === 'Organization' ? '':'Organization')"
              :class="{ 'bg-graydark dark:bg-meta-4': (selected === 'Organization') && (page === 'organization') }"
              :class="page === 'organization' && 'bg-graydark'"
              >
			  <svg
                class="fill-current"
                width="18"
                height="19"
                viewBox="0 0 18 19"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <g clip-path="url(#clip0_130_9807)">
                  <path
                    d="M15.7501 0.55835H2.2501C1.29385 0.55835 0.506348 1.34585 0.506348 2.3021V7.53335C0.506348 8.4896 1.29385 9.2771 2.2501 9.2771H15.7501C16.7063 9.2771 17.4938 8.4896 17.4938 7.53335V2.3021C17.4938 1.34585 16.7063 0.55835 15.7501 0.55835ZM16.2563 7.53335C16.2563 7.8146 16.0313 8.0396 15.7501 8.0396H2.2501C1.96885 8.0396 1.74385 7.8146 1.74385 7.53335V2.3021C1.74385 2.02085 1.96885 1.79585 2.2501 1.79585H15.7501C16.0313 1.79585 16.2563 2.02085 16.2563 2.3021V7.53335Z"
                    fill=""
                  />
                  <path
                    d="M6.13135 10.9646H2.2501C1.29385 10.9646 0.506348 11.7521 0.506348 12.7083V15.8021C0.506348 16.7583 1.29385 17.5458 2.2501 17.5458H6.13135C7.0876 17.5458 7.8751 16.7583 7.8751 15.8021V12.7083C7.90322 11.7521 7.11572 10.9646 6.13135 10.9646ZM6.6376 15.8021C6.6376 16.0833 6.4126 16.3083 6.13135 16.3083H2.2501C1.96885 16.3083 1.74385 16.0833 1.74385 15.8021V12.7083C1.74385 12.4271 1.96885 12.2021 2.2501 12.2021H6.13135C6.4126 12.2021 6.6376 12.4271 6.6376 12.7083V15.8021Z"
                    fill=""
                  />
                  <path
                    d="M15.75 10.9646H11.8688C10.9125 10.9646 10.125 11.7521 10.125 12.7083V15.8021C10.125 16.7583 10.9125 17.5458 11.8688 17.5458H15.75C16.7063 17.5458 17.4938 16.7583 17.4938 15.8021V12.7083C17.4938 11.7521 16.7063 10.9646 15.75 10.9646ZM16.2562 15.8021C16.2562 16.0833 16.0312 16.3083 15.75 16.3083H11.8688C11.5875 16.3083 11.3625 16.0833 11.3625 15.8021V12.7083C11.3625 12.4271 11.5875 12.2021 11.8688 12.2021H15.75C16.0312 12.2021 16.2562 12.4271 16.2562 12.7083V15.8021Z"
                    fill=""
                  />
                </g>
                <defs>
                  <clipPath id="clip0_130_9807">
                    <rect
                      width="18"
                      height="18"
                      fill="white"
                      transform="translate(0 0.052124)"
                    />
                  </clipPath>
                </defs>
              </svg>

              조직도
			</a>
          </li>
          <!-- Menu Item Organization -->

		</ul>
      </div>

	</nav>
	<!-- Sidebar Menu -->
  </div>
</aside>

  <script type="text/javascript">
    var empId = "${user.empId}";
    var countMark = document.getElementById("message-count");
    countMark.value = "0";
  </script>
  <script src="${contextPath}/js/message.js?dt=<%=System.currentTimeMillis()%>"></script>


<!-- ===== Sidebar End ===== -->
