/**
 * 
 * JB-Park Validations
 * 2021. 02. 09
 */

// 필수입력값 처리 - text
function formValidation_empty(elementID) {
	var val = $("#" + elementID).val();
	if(val == '' || val == null) {
		alert('필수값이 입력되지 않았습니다.');
		$("#" + elementID).focus();
		return false;
	} else {
		return true;
	}
}

// 필수입력값 처리 - checkbox
function formValidation_check(elementClass) {
	var checkedCnt = $("." + elementClass + ":checked").length;
	if(checkedCnt <= 0) {
		alert('체크박스를 한개 이상 선택하세요.');
		return false;
	} else {
		return true;
	}
}

// 필수입력값 처리 - radio
function formValidation_radio(elementClass) {
	var checkedCnt = $("." + elementClass + ":checked").length;
	if(checkedCnt <= 0) {
		alert('라디오박스 값을 선택하세요.');
		return false;
	} else {
		return true;
	}
}

// 체크처리 함수( 처리데이터배열형태, 클래스 )	
// 참고페이지: /view/homepage/main/mobile/modify.jsp
function ListChecked(val_arr, classname){
	
	let virtualList = "";
	let classnameLen = $("."+classname+"").length;
	virtualList = val_arr.split(",");
	
	if( virtualList.length > 0 ) {			
		for(let i=0; i<classnameLen; i++ ) {						
			for(let j=0; j<virtualList.length; j++) {				
				if( $("."+classname+"").eq(i).val() == virtualList[j] ){					
					$("."+classname+"").eq(i).prop("checked", true)					
				}															
			}											
		}													
	}
	
}