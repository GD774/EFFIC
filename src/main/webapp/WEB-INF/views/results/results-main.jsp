<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>

<jsp:include page="../layout/opener.jsp"/>


<style>



div#bonsa {
  font-size: 25px;
	width:450px; 
	height: 500px;
	margin-left: 50px;
	margin-top: 30px;
	background-color: #d1e0f0;
}

div#empty {
	font-size: 25px;
	width:450px; 
	height: 500px;
	margin-top: 30px;
	background-color: #d1e0f0;
}
div#chart {
	
	margin-top: 30px;
	
}

div#pie {

	margin-top: 70px;

}


div#branch-list {
	margin-top: 30px;
	margin-left: 50px;
	width: 500px;
	height: 200px;

}
table {
	border: 2px solid #4287f5; border-collapse: collapse;
}

th, td{padding: 10px 5px;}

div#box1 {
	width: 200px;
	height: 200px;
	bottom:400px;
	left: 500px;
	border: 1px;
	
}

div#Bar {
 position: absolute;
 left: 340px;
 bottom: 100px; 
 background-color: #d1e0f0;

}
a#branch-link {

	margin-bottom: 10px;
}




</style>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
document.addEventListener("DOMContentLoaded", function() {
  var options = {
    chart: {
      type: 'line'
    , width: '400px' 
    , height: '400px' 
    
    }
  	,stroke: {
  		width: 1
  	}
  	,markers: {
  		size: 1,
  		strokeColors:'#000'
  	}
    ,series: [{
      name: 'sales(만원)',
      data: [300, 400, 350, 500, 409, 600, 700, 901, 1025]
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
    chart: {
        width: 450,
        height: 450,
        type: 'pie',
    },
    labels: ['2월', '3월', '4월', '5월']
  };

  var pie = new ApexCharts(document.querySelector("#pie"), options);
  pie.render();
});
</script>

<script>
document.addEventListener("DOMContentLoaded", function() {
options = {
		  chart: {
		    type: 'bar',
		    width: '900px',
		    height: '300px'
		  },
		  plotOptions: {
		    bar: {
		      horizontal: true
		    }
		  },
		  series: [{
		    data: [{
		      x: 'category A',
		      y: 10
		    }, {
		      x: 'category B',
		      y: 18
		    }, {
		      x: 'category C',
		      y: 13
		    }]
		  }]
		}
	var Bar = new ApexCharts(document.querySelector("#Bar"), options);
	Bar.render();
});

</script>


<jsp:include page="../layout/sidebar.jsp"/>


  <div id='bonsa'>본사 종합 평균 월매출
	<div id='chart'></div>
  </div>

 	<div id='empty'>종합 최근 4달  평균 공실률
		<div id='pie'></div>  
  </div>

<div id='branch-list'>
<a id="branch-link" href="${contextPath}/results/results-state" class="inline-flex items-center justify-center rounded-full bg-primary px-10 py-4 text-center font-medium text-white hover:bg-opacity-90 lg:px-8 xl:px-10">
                    지점별 통계 보기→
                  </a>
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

<div>
	<div id='Bar'></div>
</div>
	
<script type="module">
  import { BasicTable } from "${contextPath}/js/tableBasic.js";

  var table = new BasicTable(
</script>


<jsp:include page="../layout/closer.jsp"/>