$(document).ready(function() {
    // 문서가 준비되면 실행되는 함수

    var docStatus = 2; // 문서 상태 값 (예시로 2로 설정)

    if (docStatus === 2) {
        $(".approved").show(); // 결재선 이미지를 보이도록 설정
    } else {
        $(".approved").hide(); // 결재선 이미지를 숨기도록 설정
    }

    // 추가 버튼 이벤트 처리
    $("#plus").on("click", function() {
        var table = $("#dynamic_table tbody");
        var rowCount = table.find("tr").length; // 현재 행 개수 확인

        var maxRows = 17; // 최대 허용 행 개수

        if (rowCount < maxRows) { // 최대 행 개수보다 적은 경우에만 추가
            // 새로운 행 생성
            var newRow = $('<tr>' +
                '<td><input type="text" class="ipt_editor"></td>' +
                '<td><input type="text" class="ipt_editor"></td>' +
                '<td><input type="text" class="ipt_editor ipt_editor_currency amount-input"></td>' +
                '<td><input type="text" class="ipt_editor ipt_editor_currency price-input"></td>' +
                '<td style="text-align: right;"><span class="amount-label"></span></td>' +
                '<td><input type="text" class="ipt_editor"></td>' +
                '</tr>');

            table.find("tr:nth-last-child(3)").before(newRow); // 합계 행과 기타 행 사이에 삽입

            // 수량과 단가 입력 이벤트 리스너 추가
            newRow.find(".amount-input, .price-input").on("input", calculateAmount);

            // 추가 후 행 개수 다시 확인
            rowCount = table.find("tr").length;

            // 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(rowCount);
        }
    });

    // 삭제 버튼 이벤트 처리
    $("#minus").on("click", function() {
        var rowCount = $("#dynamic_table tbody tr").length;

        if (rowCount > 8) { // 기본 행과 합계/기타 행을 제외한 경우에만 삭제 가능
            $("#dynamic_table tbody tr:nth-last-child(3)").remove(); // 마지막 행 삭제

            // 삭제 후 행 개수 다시 확인
            rowCount = $("#dynamic_table tbody tr").length;

            // 삭제 후 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(rowCount);
        }
    });

    // 금액을 계산하고 표시하는 함수
    function calculateAmount() {
        var row = $(this).closest("tr"); // 현재 입력 필드가 포함된 행 선택
        var quantity = parseFloat(row.find(".amount-input").val()); // 수량
        var unitPrice = parseFloat(row.find(".price-input").val()); // 단가
        var amountLabel = row.find(".amount-label"); // 금액 표시 Span

        // 수량과 단가가 숫자로 변환 가능한지 확인
        if (!isNaN(quantity) && !isNaN(unitPrice)) {
            var amount = quantity * unitPrice; // 수량 * 단가 계산
            amountLabel.text(amount.toLocaleString('en-US')); // 계산된 금액을 화면에 표시
        } else {
            amountLabel.text(''); // 수량 혹은 단가가 입력되지 않았을 경우 금액을 비움
        }
    }

    // 삭제 버튼 활성화 여부를 설정하는 함수
    function toggleDeleteButton(rowCount) {
        var minusButton = $("#minus");
        if (rowCount > 5) { // 추가된 행이 있을 때 삭제 버튼 활성화
            minusButton.prop("disabled", false);
        } else { // 추가된 행이 없을 때 삭제 버튼 비활성화
            minusButton.prop("disabled", true);
        }
    }

    // 수량과 단가 입력 필드에서 숫자만 입력하도록 제한
    $("#dynamic_table").on("input", ".amount-input, .price-input", function(event) {
        allowNumbersOnly(event); // 숫자만 입력하도록 제한하는 함수 호출
        calculateAmount(); // 계산 함수 호출
    });

    // 숫자만 입력하도록 제한하는 함수
    function allowNumbersOnly(event) {
        var input = event.target;
        // 입력된 값에서 숫자와 소수점을 제외한 모든 문자를 제거
        input.value = input.value.replace(/[^0-9.]/g, '');

        // 소수점이 여러 개인 경우 첫 번째 소수점만 남기고 나머지는 제거
        var decimalIndex = input.value.indexOf('.');
        if (decimalIndex !== -1) {
            input.value = input.value.slice(0, decimalIndex + 1) + input.value.slice(decimalIndex + 1).replace(/\./g, '');
        }
    }

    // 긴급 체크박스 이벤트 처리
    $("#emergency").on("change", function() {
        var urgentImage = $("#urgent");
        if (this.checked) {
            urgentImage.show(); // 체크되면 이미지 보이기
        } else {
            urgentImage.hide(); // 체크 해제되면 이미지 숨기기
        }
    });
});