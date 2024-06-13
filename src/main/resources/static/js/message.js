
//웹소켓을 위한 추가 부분

let webSocket; // 페이지 바뀌면 변수 사라짐
//var empId = "${user.empId}";
console.log(empId);
const c_chatWin = document.querySelector("#id_chatwin");
const c_message = document.querySelector("#id_message");		
const c_send = document.querySelector("#id_send");
const c_exit = document.querySelector("#id_exit");


//연결
connect();
function connect() {
	//webSocket = new WebSocket("ws://localhost:8080/ws-chat");
	webSocket = new WebSocket("ws://localhost:8080/msg"); // End Point
	//이벤트핸들러 등록
	webSocket.onopen = fOpen; // 소켓 접속시 실행
	webSocket.onmessage = fMessage; // 서버에서 메세지 받을 때 실행
}

//연결 시
function fOpen(event) {
	webSocket.send(empId);
} 
function send(event) {  // 서버로 메세지 전송 send(). 
	webSocket.send(empId);
}
function fMessage() {
	console.log(event.data);
	countMark.value = event.data;
}
function disconnect() { //서버와 연결해제.
	webSocket.close();
}

// 이 send 가 글 작성과 함께, 동시에 작동해야 한다....!
// 그래야 메시지 DB에 인서트 -> send 되면서 게시글이 들어간 직후 chatHandler에 따라서 mapper가 새로운 레코드들을 긁어서 가져온다.
// 그리고 받은메세지 상세페이지 들어갈때도 돌아야함....


// write.page의 작성 버튼들을 클릭할때 메세지 보냄
   $(document).ready(function() {
       $(document).on('click', '.socket', function() {
       	send();
       });
   });



c_send.addEventListener("click", ()=>{
	send();
});
// 연결 끊기
c_exit.addEventListener("click", function () {
	disconnect();
});

