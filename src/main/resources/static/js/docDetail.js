document.addEventListener("DOMContentLoaded", function() {
    var urgentValue = document.getElementById('urgentValue').value; // hidden input에서 urgent 값 가져오기

    // urgent 값에 따라 이미지 보이기/숨기기 처리
    if (urgentValue === '1') {
        document.getElementById('urgents').style.display = 'inline'; // 이미지 보이기
    } else {
        document.getElementById('urgents').style.display = 'none'; // 이미지 숨기기
    }
});

function toggleApprovalImages(appState) {
    var images = document.querySelectorAll('.approveds');
    images.forEach(function(image) {
        if (appState === 2) {
            image.style.display = 'inline';  // 이미지를 보이게 함
        } else {
            image.style.display = 'none';  // 이미지를 숨김
        }
    });
}

// 예제 DOCSTATE 값
var APPSTATE = 1;  // DOCSTATE 값을 2 또는 다른 값으로 설정
toggleApprovalImages(APPSTATE);