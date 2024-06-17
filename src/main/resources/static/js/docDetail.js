document.addEventListener("DOMContentLoaded", function() {
    var urgentValue = document.getElementById('urgentValue').value; // hidden input에서 urgent 값 가져오기

    // urgent 값에 따라 이미지 보이기/숨기기 처리
    if (urgentValue === '1') {
        document.getElementById('urgents').style.display = 'inline'; // 이미지 보이기
    } else {
        document.getElementById('urgents').style.display = 'none'; // 이미지 숨기기
    }
});