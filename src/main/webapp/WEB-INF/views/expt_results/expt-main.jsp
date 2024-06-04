<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>


<style>

div#bonsa {
	border: 1px solid gray;
	width:400px; 
	height: 300px;
	margin-left: 50px;
	margin-top: 50px;
}

div#empty {
border: 1px solid gray;
	width:400px; 
	height: 300px;
	margin-left: 50px;
	margin-top: 50px;
}

div#branch-list {
	margin-top: 50px;
	margin-left: 50px;
	width: 500px;
	height: 200px;
	position: float;


}
table {
	border: 2px solid; border-collapse: collapse;
}

th, td{padding: 10px 5px;}


</style>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
  var options = {
    chart: {
      type: 'line'
    }
  	,stroke: {
  		width: 1
  	}
  	,markers: {
  		size: 1,
  		strokeColors:'#000'
  	}
    ,series: [{
      name: 'sales',
      data: [30, 40, 35, 50, 49, 60, 70, 91, 125]
    }]
    ,xaxis: {
      categories: ['Sep','Oct','Nov','Dec','Jan', 'Feb', 'Mar', 'Apr', "May"]
    }
  };

  var chart = new ApexCharts(document.querySelector("#chart"), options);
  chart.render();
});
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
  var options = {
		  
    series: [44, 55, 13, 33],
    labels: ['Apple', 'Mango', 'Orange', 'Watermelon']
				  

  };

  var chart = new ApexCharts(document.querySelector("#Pie"), options);
  chart.render();
});
</script>


<jsp:include page="../layout/sidebar.jsp"/>

  <div id='bonsa'>본사 연매출
	<div id='chart'></div>
  </div>

  <div id='empty'>주요지점 공실률
	<div id='Pie'></div>  
  </div>

<div id='branch-list'>
<a href='${contextPath}/results/results-state'>지점별 통계 보기></a>
	<table>
		<tr>
			<th>지점 이름</th>
			<th>호실 수</th>
			<th>전월 매출</th>
		</tr>
		<tr>
			<td>1호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>2호점</td>
			<td>16</td>
			<td>+10%</td>
		</tr>
		<tr>
			<td>3호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>4호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>5호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>6호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>7호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>8호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>9호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
		<tr>
			<td>10호점</td>
			<td>10</td>
			<td>+84%</td>
		</tr>
	
	</table>
</div>
	



<jsp:include page="../layout/closer.jsp"/>