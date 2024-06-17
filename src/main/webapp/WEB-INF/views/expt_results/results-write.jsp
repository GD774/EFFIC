<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="<%=request.getContextPath()%>"/>
<c:set var="dt" value="<%=System.currentTimeMillis()%>"/>



<jsp:include page="../layout/opener.jsp"/>

<style>

/* styles.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    
}

.container {
    background-color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
    width: 1500px;
    height: 800px;
}

h1 {
    color: #333;
    font-size: 24px;
}

h2 {
    color: #666;
    font-size: 18px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

th {
    background-color: #f9f9f9;
}

input[type="number"] {
    width: 100%;
    padding: 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
    text-align: center;
}

.buttons {
    display: flex;
    justify-content: space-between;
}

button {
    padding: 10px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

#submitButton {
    background-color: #007bff;
    color: white;
}

#cancelButton {
    background-color: #ff4d4d;
    color: white;
}

</style>







<jsp:include page="../layout/sidebar.jsp"/>

 <title>실적 수정</title>
    <link rel="stylesheet" href="styles.css">
    
    
      <div class="container">
        <h1>1호점 실적 수정</h1>
        <h2>2023년</h2>

        <table id="inputTable">
            <thead>
                <tr>
                    <th>월</th>
                    <th>1월</th>
                    <th>2월</th>
                    <th>3월</th>
                    <th>4월</th>
                    <th>5월</th>
                    <th>6월</th>
                    <th>7월</th>
                    <th>8월</th>
                    <th>9월</th>
                    <th>10월</th>
                    <th>11월</th>
                    <th>12월</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>총매출</td>
                    <td><input type="number" value="1700"></td>
                    <td><input type="number" value="1800"></td>
                    <td><input type="number" value="1600"></td>
                    <td><input type="number" value="1500"></td>
                    <td><input type="number" value="2000"></td>
                    <td><input type="number" value="2200"></td>
                    <td><input type="number" value="2100"></td>
                    <td><input type="number" value="2200"></td>
                    <td><input type="number" value="1900"></td>
                    <td><input type="number" value="2300"></td>
                    <td><input type="number" value="2400"></td>
                    <td><input type="number" value="1800"></td>
                </tr>
                <tr>
                    <td>순매출</td>
                    <td><input type="number" value="800"></td>
                    <td><input type="number" value="500"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="800"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="500"></td>
                    <td><input type="number" value="400"></td>
                    <td><input type="number" value="1000"></td>
                </tr>
                <tr>
                    <td>사무실수</td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="16"></td>
                    <td><input type="number" value="18"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="20"></td>
                    <td><input type="number" value="16"></td>
                    <td><input type="number" value="16"></td>
                </tr>
                <tr>
                    <td>공실수</td>
                    <td><input type="number" value="5"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="2"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="10"></td>
                    <td><input type="number" value="3"></td>
                    <td><input type="number" value="5"></td>
                    <td><input type="number" value="6"></td>
                    <td><input type="number" value="7"></td>
                    <td><input type="number" value="8"></td>
                    <td><input type="number" value="0"></td>
                </tr>
            </tbody>
        </table>

        <table id="expectedTable">
            <thead>
                <tr>
                    <th>월</th>
                    <th>1월</th>
                    <th>2월</th>
                    <th>3월</th>
                    <th>4월</th>
                    <th>5월</th>
                    <th>6월</th>
                    <th>7월</th>
                    <th>8월</th>
                    <th>9월</th>
                    <th>10월</th>
                    <th>11월</th>
                    <th>12월</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>예상총매출</td>
                    <td><input type="number" value="1700"></td>
                    <td><input type="number" value="1800"></td>
                    <td><input type="number" value="1600"></td>
                    <td><input type="number" value="1500"></td>
                    <td><input type="number" value="2000"></td>
                    <td><input type="number" value="2200"></td>
                    <td><input type="number" value="2100"></td>
                    <td><input type="number" value="2200"></td>
                    <td><input type="number" value="1900"></td>
                    <td><input type="number" value="2300"></td>
                    <td><input type="number" value="2400"></td>
                    <td><input type="number" value="1800"></td>
                </tr>
                <tr>
                    <td>예상순매출</td>
                    <td><input type="number" value="800"></td>
                    <td><input type="number" value="500"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="800"></td>
                    <td><input type="number" value="700"></td>
                    <td><input type="number" value="600"></td>
                    <td><input type="number" value="500"></td>
                    <td><input type="number" value="400"></td>
                    <td><input type="number" value="1000"></td>
                </tr>
                <tr>
                    <td>예상공실수</td>
                    <td><input type="number" value="1"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="2"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="4"></td>
                    <td><input type="number" value="10"></td>
                    <td><input type="number" value="3"></td>
                    <td><input type="number" value="5"></td>
                    <td><input type="number" value="6"></td>
                    <td><input type="number" value="7"></td>
                    <td><input type="number" value="8"></td>
                    <td><input type="number" value="0"></td>
                </tr>
            </tbody>
        </table>

        <div class="buttons">
            <button id="submitButton">수정완료</button>
            <button id="cancelButton">취소</button>
        </div>
    </div>






    <script src="script.js"></script>


<script>

//script.js
document.getElementById('submitButton').addEventListener('click', function() {
    // Get input values
    const inputTable = document.getElementById('inputTable');
    const expectedTable = document.getElementById('expectedTable');
    const inputValues = [];
    const expectedValues = [];

    for (let i = 1; i < inputTable.rows.length; i++) {
        const row = inputTable.rows[i];
        const rowData = [];
        for (let j = 1; j < row.cells.length; j++) {
            rowData.push(row.cells[j].querySelector('input').value);
        }
        inputValues.push(rowData);
    }

    for (let i = 1; i < expectedTable.rows.length; i++) {
        const row = expectedTable.rows[i];
        const rowData = [];
        for (let j = 1; j < row.cells.length; j++) {
            rowData.push(row.cells[j].querySelector('input').value);
        }
        expectedValues.push(rowData);
    }

    console.log('Input Table Data:', inputValues);
    console.log('Expected Table Data:', expectedValues);

    // You can send these values to a server or use them as needed
    // Example:
    // fetch('your-api-endpoint', {
    //     method: 'POST',
    //     body: JSON.stringify({ inputValues, expectedValues }),
    //     headers: { 'Content-Type': 'application/json' }
    // });
});

document.getElementById('cancelButton').addEventListener('click', function() {
    console.log('Edit cancelled');
    history.back();
    
});



</script>





<jsp:include page="../layout/closer.jsp"/>
