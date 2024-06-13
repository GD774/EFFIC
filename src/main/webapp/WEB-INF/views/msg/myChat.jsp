<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>초우간단 채팅</title>
<style>
	#id_chatwin {
		width:300px;
		height:300px;
		background-color:white;
		border:1px solid pink;
		color:black;
	}
</style>
</head>
<body>
	<h1>간단히 억지롱 대화라도 할깡</h1>
	<p>Employee ID: ${user.empId}</p>
	<div>
		<div id="id_chatwin"></div>
		<button type="button" id="id_message"></button> 
		<input type="button" id="id_send" value="떤쏭"> 
		<input type="button" id="id_exit" value="나갈령">
	</div>
</body>
<script>

       
		let webSocket; // 페이지 바뀌면 변수가 사라진다는 사실에 주목할 필요가 있음
		var empId = "${user.empId}";
		console.log(empId);
		const c_chatWin = document.querySelector("#id_chatwin");
		const c_message = document.querySelector("#id_message");		
		const c_send = document.querySelector("#id_send");
		const c_exit = document.querySelector("#id_exit");

		
		// 이 send 가 글 작성과 함께, 동시에 작동해야 한다....!
		// 그래야 메시지 DB에 인서트 -> send 되면서 게시글이 들어간 직후 chatHandler에 따라서 mapper가 새로운 레코드들을 긁어서 가져온다.
		c_send.addEventListener("click", ()=>{
			send();
		});
		// 연결 끊깅
		c_exit.addEventListener("click", function () {
			disconnect();
		});

		//연결
		connect();
		function connect() {
			//webSocket = new WebSocket("ws://localhost:8080/ws-chat");
			webSocket = new WebSocket("ws://localhost:8080/msg"); // End Point
			//이벤트에 이벤트핸들러 뜽록 
			webSocket.onopen = fOpen; // 소켓 접속되면 짜똥 실행할 함수(fOpen)
			webSocket.onmessage = fMessage; // 써버에서 메쎄징 오면  짜똥 실행할 함수(fMessage) 
		}

		//연결 시
		function fOpen() {
			webSocket.send(empId);
		} 
		function send() {  // 써버로 메쎄찡 떤쏭하는 함수
			let msg = c_message.value;
			webSocket.send(empId);
			c_message.value = "";
		}
		function fMessage() {
			let data = event.data;
			c_message.innerHTML = data;
		}
		function disconnect() { //써버와 인연 끊는 함쑹
			webSocket.close();
		}
</script>
</body>
</html>