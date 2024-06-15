$(document).ready(function() {
    // 긴급 체크박스 이벤트 처리
    $("#emergency").on("change", function() {
        var urgentImage = $("#urgents");
        if (this.checked) {
            urgentImage.show(); // 체크되면 이미지 보이기
        } else {
            urgentImage.hide(); // 체크 해제되면 이미지 숨기기
        }
    });

    // 페이지 로드 시 기존 행에 대해 초기 계산 함수 호출
    calculateAmountForExistingRows();

    // 추가 버튼 클릭 시
    $("#plus").on("click", function() {
        var table = $("#dynamic_table tbody");
        var rowCount = table.find("tr").length;
        var maxRows = 17;

        if (rowCount < maxRows) {
            var newRow = $('<tr>' +
                '<td><input type="text" class="ipt_editor" name="itemName"></td>' +
                '<td><input type="text" class="ipt_editor" name="itemStandard"></td>' +
                '<td><input type="text" class="ipt_editor ipt_editor_currency quan-input" name="itemQuan"></td>' +
                '<td><input type="text" class="ipt_editor ipt_editor_currency price-input" name="itemCost"></td>' +
                '<td style="text-align: right;"><input type="text" class="ipt_editor_currency amount-input" name="amount" readonly style="width: 100%;"></td>' +
                '<td><input type="text" class="ipt_editor" name="remarks"></td>' +
                '</tr>');

            table.find("tr:nth-last-child(2)").before(newRow);

            // 수량과 단가 입력 이벤트 리스너 추가
            newRow.find(".quan-input, .price-input").on("input", function(event) {
                allowNumbersOnly(event);
                calculateAmount.call(newRow); // 수정된 부분: 새로 추가된 행에 대한 금액 계산
            });

            // 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(table.find("tr").length);

            // 모든 행에 대한 금액 및 합계 계산
            updateTotals();

            // 숨겨진 필드에 총합 업데이트
            updateHiddenFields();

            // 새로 추가된 데이터를 서버로 전송
            sendFormDataToServer();
        }
    });

    // 삭제 버튼 클릭 시
    $("#minus").on("click", function() {
        var rowCount = $("#dynamic_table tbody tr").length;

        if (rowCount > 8) {
            $("#dynamic_table tbody tr:nth-last-child(3)").remove();

            // 삭제 후 삭제 버튼 활성화 여부 설정
            toggleDeleteButton($("#dynamic_table tbody tr").length);

            // 모든 행에 대한 금액 및 합계 계산
            updateTotals();

            // 숨겨진 필드에 총합 업데이트
            updateHiddenFields();

            // 삭제된 데이터를 서버로 전송
            sendFormDataToServer();
        }
    });

    // 금액을 계산하고 표시하는 함수
    function calculateAmount() {
        var row = $(this).closest("tr");
        var quantity = parseFloat(row.find(".quan-input").val());
        var unitPrice = parseFloat(row.find(".price-input").val());
        var amountInput = row.find(".amount-input");

        if (!isNaN(quantity) && !isNaN(unitPrice)) {
            var amount = quantity * unitPrice;
            amountInput.val(amount.toLocaleString('en-US'));
        } else {
            amountInput.val('');
        }

        // 모든 행에 대한 금액 및 합계 계산
        updateTotals();

        // 숨겨진 필드에 총합 업데이트
        updateHiddenFields();
    }

    // 삭제 버튼 활성화 여부를 설정하는 함수
    function toggleDeleteButton(rowCount) {
        var minusButton = $("#minus");
        if (rowCount > 5) {
            minusButton.prop("disabled", false);
        } else {
            minusButton.prop("disabled", true);
        }
    }

    // 모든 기존 행에 대해 금액 계산 함수 호출
    function calculateAmountForExistingRows() {
        $("#dynamic_table tbody tr").each(function() {
            calculateAmount.call(this); // 각 행에 대해 계산 함수 호출
        });
    }

    // 총합 계산 및 업데이트 함수
    function updateTotals() {
        var totalQuantity = 0;
        var totalPrice = 0;
        var totalCur = 0;

        $("#dynamic_table tbody tr").each(function() {
            var quantity = parseFloat($(this).find(".quan-input").val()) || 0;
            var unitPrice = parseFloat($(this).find(".price-input").val()) || 0;
            var amount = quantity * unitPrice;

            totalQuantity += quantity;
            totalPrice += unitPrice;
            totalCur += amount;
        });

        // 합계 행에 총합 업데이트
        $(".total-quantity").text(totalQuantity.toLocaleString('en-US'));
        $(".total-price").text(totalPrice.toLocaleString('en-US'));
        $(".total-cur").text(totalCur.toLocaleString('en-US'));
    }

    // 숨겨진 필드에 총합 업데이트하는 함수
    function updateHiddenFields() {
        $("#hiddenTotalQuantity").val($(".total-quantity").text());
        $("#hiddenTotalPrice").val($(".total-price").text());
        $("#hiddenTotalCurrency").val($(".total-cur").text());
    }

    // 수량과 단가 입력 필드에서 숫자만 입력하도록 제한
    $("#dynamic_table").on("input", ".quan-input, .price-input", function(event) {
        allowNumbersOnly(event);
        calculateAmountForExistingRows(); // 모든 행에 대한 금액 계산
    });

    // 숫자만 입력하도록 제한하는 함수
    function allowNumbersOnly(event) {
        var input = event.target;
        input.value = input.value.replace(/[^0-9.]/g, '');
        var decimalIndex = input.value.indexOf('.');
        if (decimalIndex !== -1) {
            input.value = input.value.slice(0, decimalIndex + 1) + input.value.slice(decimalIndex + 1).replace(/\./g, '');
        }
    }

    // 서버로 데이터 전송 함수
    function sendFormDataToServer() {
        var formData = new FormData();
        
        // 모든 행의 데이터를 FormData에 추가
        $("#dynamic_table tbody tr").each(function(index) {
            formData.append('items[' + index + '].itemName', $(this).find("[name='itemName']").val());
            formData.append('items[' + index + '].itemStandard', $(this).find("[name='itemStandard']").val());
            formData.append('items[' + index + '].quantity', $(this).find("[name='itemQuan']").val());
            formData.append('items[' + index + '].unitPrice', $(this).find("[name='itemCost']").val());
            formData.append('items[' + index + '].amount', $(this).find("[name='amount']").val()); 
            formData.append('items[' + index + '].remarks', $(this).find("[name='remarks']").val());
            formData.append('items[' + index + '].other', $(this).find("[name='other']").val());
        });
        // AJAX를 이용하여 서버로 데이터 전송
        $.ajax({
            url: '/approval/register.do',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log('데이터 전송 성공');
                // 추가적인 로직 구현 가능
            },
            error: function(xhr, status, error) {
                console.error('데이터 전송 실패');
                // 오류 처리 로직 추가 가능
            }
        });
    }


});