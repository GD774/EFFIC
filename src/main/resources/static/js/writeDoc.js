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

   $('#tempSave, #approvalRequest').click(function() {
       var docState;

	    // 클릭된 버튼의 value 값을 기준으로 docState 설정
	    if ($(this).attr('id') === 'tempSave') {
	        docState = 3;
	    } else if ($(this).attr('id') === 'approvalRequest') {
	        docState = 0;
	        return;
	    }

        var formData = new FormData();
        $("#dynamic_table tbody tr").each(function(index) {
            formData.append('items[' + index + '].itemName', $(this).find("[name='itemName']").val());
            formData.append('items[' + index + '].itemStandard', $(this).find("[name='itemStandard']").val());
            formData.append('items[' + index + '].quantity', $(this).find("[name='itemQuan']").val());
            formData.append('items[' + index + '].unitPrice', $(this).find("[name='itemCost']").val());
            formData.append('items[' + index + '].amount', $(this).find("[name='amount']").val());
            formData.append('items[' + index + '].remarks', $(this).find("[name='remarks']").val());
        });
        
            formData.append('title', $('#title').val());
    				formData.append('urgent', $('#emergency').is(':checked') ? '1' : '0');

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
    });


    
		   // 결재 요청 버튼 
		$('#approvalRequest').click(function() {
		    if (confirm('결재 요청을 하시겠습니까?')) {
		        alert('결재 요청이 완료되었습니다.');
		       
		    } else {
		        alert('결재 요청이 취소되었습니다.');
		        return false;
		    }
		});
		
		
		// 임시 저장 버튼 
    $('#tempSave').click(function() {
	    if (confirm('문서를 임시저장함에 보관하시겠습니까?')) {
						alert('작성 중인 문서가 임시저장함에 보관되었습니다.')
	        window.location.href = 'main'; // 메인 페이지로 이동
	    } else {
				return false;
			}
    });
    
    // 작성취소 버튼
    $('#cancelWriting').click(function() {
	    if (confirm('작성을 취소하시겠습니까? 작성 중이던 문서는 저장되지 않습니다.')) {
						alert('작성을 취소하였습니다.')
	        window.location.href = 'main'; // 메인 페이지로 이동
	    } else {
				return;
			}
    });

		
		





    // jstree 초기화를 위한 데이터 설정
    var data = [
        { "id": "R", "parent": "#", "text": "EFFIC", "icon": "glyphicon glyphicon-home" },
        { "id": "S2", "parent": "R", "text": "지점", "icon": "glyphicon glyphicon-home" },
        { "id": "S21", "parent": "S2", "text": "광안리지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S22", "parent": "S2", "text": "용산지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S23", "parent": "S2", "text": "마포지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S24", "parent": "S2", "text": "상봉지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S25", "parent": "S2", "text": "수원지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S26", "parent": "S2", "text": "구로지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S27", "parent": "S2", "text": "홍대지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S28", "parent": "S2", "text": "전주지점", "icon": "glyphicon glyphicon-picture" },
        { "id": "S1", "parent": "R", "text": "본사", "icon": "glyphicon glyphicon-home" },
        { "id": "S11", "parent": "S1", "text": "총무팀", "icon": "glyphicon glyphicon-picture" },
        { "id": "S12", "parent": "S1", "text": "경영팀", "icon": "glyphicon glyphicon-picture" },
        { "id": "S13", "parent": "S1", "text": "인사팀", "icon": "glyphicon glyphicon-picture" },
        {
            "id": "tester1",
            "parent": "S11",
            "text": "안성기",
            "data": {
                "value": "tester1"
            }
        },
        {
            "id": "tester2",
            "parent": "S11",
            "text": "신해철",
            "data": {
                "value": "tester2"
            }
        },
        {
            "id": "tester3",
            "parent": "S11",
            "text": "신혜선",
            "data": {
                "value": "tester3"
            }
        },
        {
            "id": "tester4",
            "parent": "S11",
            "text": "구혜선",
            "data": {
                "value": "tester4"
            }
        },
        {
            "id": "testser",
            "parent": "S11",
            "text": "박소담",
            "data": {
                "value": "testser"
            }
        },
        {
            "id": "tester6",
            "parent": "S12",
            "text": "조준영",
            "data": {
                "value": "tester6"
            }
        },
        {
            "id": "tester7",
            "parent": "S12",
            "text": "남민우",
            "data": {
                "value": "tester7"
            }
        },
        {
            "id": "tester8",
            "parent": "S12",
            "text": "박화평",
            "data": {
                "value": "tester8"
            }
        },
        {
            "id": "tester9",
            "parent": "S12",
            "text": "전지현",
            "data": {
                "value": "tester9"
            }
        },
        {
            "id": "tester10",
            "parent": "S12",
            "text": "김지은",
            "data": {
                "value": "tester10"
            }
        },
        {
            "id": "tester11",
            "parent": "S13",
            "text": "주윤발",
            "data": {
                "value": "tester11"
            }
        },
        {
            "id": "tester12",
            "parent": "S13",
            "text": "고길동",
            "data": {
                "value": "tester12"
            }
        },
        {
            "id": "tester13",
            "parent": "S13",
            "text": "나무늬",
            "data": {
                "value": "tester13"
            }
        },
        {
            "id": "tester14",
            "parent": "S13",
            "text": "양희은",
            "data": {
                "value": "tester14"
            }
        },
        {
            "id": "tester15",
            "parent": "S13",
            "text": "신성우",
            "data": {
                "value": "tester15"
            }
        }
    ];


    $('#jstree').jstree({
        'core': {
            themes: {
                dots: false, // 이 부분이 연결선을 비활성화합니다.
            },
            'data': data
        }
    });



    
			    // jstree에서 노드 선택 시 이벤트 처리
			$('#jstree').on("select_node.jstree", function(e, data) {
			    if (data.node.children.length === 0) {
			        var selectedEmpId = data.node.data.value; // 선택된 사람의 직원 ID 가져오기
			        var selectedEmpName = data.node.text; // 선택된 사람의 이름 가져오기
			        addApprover(selectedEmpId, selectedEmpName); // 결재선 테이블에 직원 ID와 이름 추가
			    }
			});
			
			// 결재선 테이블에 직원 ID와 이름 추가하는 함수
			function addApprover(empId, name) {
			    $('#approverInput').val(empId); // hidden input에 직원 ID 설정
			    $('#approverName').val(name); // readonly input에 직원 이름 설정
			}
    
    // 닫기 버튼 클릭 시 선택된 사람 초기화
    $('#btn-close').click(function() {
        // 선택된 사람 초기화 관련 로직 추가
    });
    });