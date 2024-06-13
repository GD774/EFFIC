
//웹소켓을 위한 추가 부분

let webSocket; // 페이지 바뀌면 변수 사라짐



//연결
connect();
function connect() {
	webSocket = new WebSocket("ws://localhost:8080/msg"); //notifi 핸들러에서 앤드포인트 설정
	//이벤트핸들러 등록
	webSocket.onopen = fOpen; 
	webSocket.onmessage = fMessage; 

}






//연결 시
function fOpen() {
	webSocket.send(empId);
} 
function send() {  // 서버로 메세지 전송 send() 
	webSocket.send(empId);
}
function fMessage() {
	console.log(event.data);
	countMark.value = event.data;
}

function fnSendList(recipient){
	webSocket.send(recipient);
}

function disconnect() { //서버와 연결해제.
	webSocket.close();
}


document.addEventListener('DOMContentLoaded', () => {
        if(recipient) {
        fnSendList(recipient);
	}
});


   


