$(document).ready(function() {
    // 긴급 체크박스 이벤트 처리
    $("#emergency").on("change", function() {
        var urgentImage = $("#urgents");
        var hiddenInput = $("#urgent");
        if (this.checked) {
            urgentImage.show(); // 체크되면 이미지 보이기
            hiddenInput.val("1"); // 체크되면 hidden input의 값 1로 설정
        } else {
            urgentImage.hide(); // 체크 해제되면 이미지 숨기기
            hiddenInput.val("0"); // 체크 해제되면 hidden input의 값 0으로 설정
        }
    });

    // 페이지 로드 시 기존 행에 대해 초기 계산 함수 호출
    calculateAmountForExistingRows();

    // 추가 버튼 클릭 시
    $("#plus").on("click", function() {
        addNewRow();
    });

    // 삭제 버튼 클릭 시
    $("#minus").on("click", function() {
        deleteLastRow();
    });

    // 수량과 단가 입력 필드에서 숫자만 입력하도록 제한
    $("#dynamic_table").on("input", ".quan-input, .price-input", function(event) {
        allowNumbersOnly(event);
        calculateAmountForExistingRows(); // 모든 행에 대한 금액 계산
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

    // 추가 버튼 클릭 시 새로운 행 추가
    function addNewRow() {
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
                calculateAmount.call(newRow); // 새로 추가된 행에 대한 금액 계산
            });

            // 삭제 버튼 활성화 여부 설정
            toggleDeleteButton(table.find("tr").length);

            // 모든 행에 대한 금액 및 합계 계산
            updateTotals();

            // 숨겨진 필드에 총합 업데이트
            updateHiddenFields();
        }
    }

    // 삭제 버튼 클릭 시 마지막 행 삭제
    function deleteLastRow() {
        var rowCount = $("#dynamic_table tbody tr").length;

        if (rowCount > 8) {
            $("#dynamic_table tbody tr:nth-last-child(3)").remove();

            // 삭제 후 삭제 버튼 활성화 여부 설정
            toggleDeleteButton($("#dynamic_table tbody tr").length);

            // 모든 행에 대한 금액 및 합계 계산
            updateTotals();

            // 숨겨진 필드에 총합 업데이트
            updateHiddenFields();
        }
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

    // 수량과 단가 입력 필드에서 숫자만 입력하도록 제한
    function allowNumbersOnly(event) {
        var input = event.target;
        input.value = input.value.replace(/[^0-9.]/g, '');
        var decimalIndex = input.value.indexOf('.');
        if (decimalIndex !== -1) {
            input.value = input.value.slice(0, decimalIndex + 1) + input.value.slice(decimalIndex + 1).replace(/\./g, '');
        }
    }

    function submitData(docState) {
        var formData = new FormData();
        $("#dynamic_table tbody tr").each(function(index) {
            formData.append('items[' + index + '].itemName', $(this).find("[name='itemName']").val());
            formData.append('items[' + index + '].itemStandard', $(this).find("[name='itemStandard']").val());
            formData.append('items[' + index + '].quantity', $(this).find("[name='itemQuan']").val());
            formData.append('items[' + index + '].unitPrice', $(this).find("[name='itemCost']").val());
            formData.append('items[' + index + '].amount', $(this).find("[name='amount']").val());
            formData.append('items[' + index + '].remarks', $(this).find("[name='remarks']").val());
        });

        $.ajax({
            url: '/approval/register.do',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                console.log('문서 제출 데이터 전송 성공');
                // 문서 제출 성공 시 처리 로직 추가
                saveDocumentState(docState); // 서버에 문서 상태 전송
                $("#submitMessage").text("문서가 성공적으로 제출되었습니다.").show().fadeOut(2000);
            },
            error: function(err) {
                console.error('문서 제출 데이터 전송 실패', err);
                // 실패 시 처리 로직 추가
            }
        });
    }

    // 결재 요청 버튼 클릭 시
    $('#approvalRequest').click(function() {
        if (confirm('결재 요청을 하시겠습니까?')) {
            submitData(0);
            alert('결재 요청이 완료되었습니다.');
        } else {
            alert('결재 요청이 취소되었습니다.');
        }
    });

    // 임시 저장 버튼 클릭 시
    $('#tempSave').click(function() {
        if (confirm('문서를 임시저장함에 보관하시겠습니까?')) {
            submitData(3);
            alert('작성 중인 문서가 임시저장함에 보관되었습니다.');
            window.location.href = 'main'; // 메인 페이지로 이동
        } else {
            alert('임시 저장이 취소되었습니다.');
        }
    });

    // 작성취소 버튼 클릭 시
    $('#cancelWriting').click(function() {
        if (confirm('작성 중인 문서를 취소하시겠습니까?')) {
            alert('작성 중인 문서가 취소되었습니다.');
            window.location.href = 'main'; // 메인 페이지로 이동
        } else {
            alert('취소가 취소되었습니다.');
        }
    });

    // jstree 초기화를 위한 데이터 설정
    var data = [
        { "id": "R", "parent": "#", "text": "EFFIC", "icon": "glyphicon glyphicon-home" },        
        { "id": "S2", "parent": "R", "text": "본사", "icon": "glyphicon glyphicon-tasks" },        
        { "id": "S51", "parent": "S2", "text": "기획팀", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S52", "parent": "S2", "text": "사업지원팀", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S53", "parent": "S2", "text": "관리팀", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S54", "parent": "S2", "text": "영업팀", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S3", "parent": "R", "text": "자재창고", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S4", "parent": "R", "text": "경기1", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S5", "parent": "R", "text": "경기2", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S6", "parent": "R", "text": "경기3", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S7", "parent": "R", "text": "충청", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S8", "parent": "R", "text": "호남", "icon": "glyphicon glyphicon-tasks" },
        { "id": "S9", "parent": "R", "text": "부산", "icon": "glyphicon glyphicon-tasks" }
    ];

    // jstree 초기화
    $('#jstree_demo').jstree({
        'core': {
            'data': data
        },
        "plugins": ["wholerow"]
    });

    // jstree에서 노드 선택 시 이벤트 처리
    $('#jstree_demo').on("changed.jstree", function (e, data) {
        if (data.selected.length) {
            var selectedNode = data.instance.get_node(data.selected[0]);
            alert('선택된 부서: ' + selectedNode.text);
        }
    });

    // 결재라인의 개인 추가를 위한 jstree 초기화
    $('#jstree_demo_person').jstree({
        'core': {
            'data': [
                { "id": "R", "parent": "#", "text": "회사", "icon": "glyphicon glyphicon-home" },
                { "id": "P1", "parent": "R", "text": "김철수", "icon": "glyphicon glyphicon-user" },
                { "id": "P2", "parent": "R", "text": "이영희", "icon": "glyphicon glyphicon-user" },
                { "id": "P3", "parent": "R", "text": "박영수", "icon": "glyphicon glyphicon-user" },
                { "id": "P4", "parent": "R", "text": "최민수", "icon": "glyphicon glyphicon-user" }
            ]
        },
        "plugins": ["wholerow"]
    });

    // jstree_person에서 노드 선택 시 이벤트 처리
    $('#jstree_demo_person').on("changed.jstree", function (e, data) {
        if (data.selected.length) {
            var selectedNode = data.instance.get_node(data.selected[0]);
            alert('선택된 개인: ' + selectedNode.text);
        }
    });
});