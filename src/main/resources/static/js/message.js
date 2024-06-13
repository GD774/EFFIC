
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
	webSocket = new WebSocket("ws://localhost:8080/msg"); //notifi 핸들러에서 앤드포인트 설정
	//이벤트핸들러 등록
	webSocket.onopen = fOpen; 
	webSocket.onmessage = fMessage; 
}

//연결 시
function fOpen(event) {
	webSocket.send(empId);
} 
function send(event) {  // 서버로 메세지 전송 send() 
	webSocket.send(empId);
}
function fMessage() {
	console.log(event.data);
	countMark.value = event.data;
}
function disconnect() { //서버와 연결해제.
	webSocket.close();
}




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

