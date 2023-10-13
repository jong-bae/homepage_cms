<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-left">
						<li class="breadcrumb-item"><a href="javascript:;">Home</a></li>
						<li class="breadcrumb-item">홈페이지 관리</li>
						<li class="breadcrumb-item active">특정날짜 예외처리 (수정)</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="row">
			<div class="col-12">
				<div class="card card-info">
					<div class="card-header">
						<h3 class="card-title">특정날짜 예외처리 수정</h3>
					</div>
					<form role="form" id="modifyForm" method="post" action="modify-exception-proc.do" onsubmit="return validateForm();">
					<input type="hidden" name="idx" value='<c:out value="${data.idx }"></c:out>'>
					<input type="hidden" name="bName" id="bName" value='<c:out value="${data.bName }"></c:out>'>
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="branchOpen-all" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-10">
							    <div class="custom-control custom-checkbox" style="float:left; width:80px;">
			                          <input class="custom-control-input" type="checkbox" name="branchOpen-all" id="checkAll" value='checkAll' onclick="allCheck()">
			                          <label for="checkAll" class="custom-control-label">전체</label>
		                        </div>
								<c:forEach items="${bcodeList}" var="bcode">
									<c:if test="${bcode.bCode != '10000'}">
								    	<div class="custom-control custom-checkbox" style="float:left; width:80px;">
			                          		<input class="custom-control-input" type="checkbox" name=bCode id="<c:out value="${bcode.bCode }"></c:out>" value='<c:out value="${bcode.bCode }"></c:out>'>
			                          		<label for="<c:out value="${bcode.bCode }"></c:out>" class="custom-control-label"><c:out value="${bcode.bName }"></c:out></label>
			                        	</div>
									</c:if>
								</c:forEach>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="evtDT" class="col-sm-2 col-form-label">날짜</label>
							<div class="col-sm-2">
					 	  		<div class="input-group">
		                    		<div class="input-group-prepend">
		                      			<span class="input-group-text">
		                        			<i class="far fa-calendar-alt"></i>
		                      			</span>
		                    		</div>
		                    		<input type="text" class="form-control" name="targetDate" id="targetDate"  required="required" style="text-align:center;">
			                  	</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<input type="text" name="contents" class="form-control"  placeholder="입력한 내용이 메인화면에 노출됩니다."  id="contents" value='<c:out value="${data.contents}"></c:out>'>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">마지막 수정일</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="lastUpdateDate"  style="text-align:center;" value='<c:out value="${data.lastUpdateDate }"></c:out>' readonly>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">마지막 수정자</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="lastUpdateAdmin"  style="text-align:center;" value='<c:out value="${data.lastUpdateAdmin }"></c:out>' readonly>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-default" onClick="location.href='list.do'">취소</button>
						<button type="button" class="btn btn-warning" onClick="deleteFunc()">삭제</button>
						<button type="submit" class="btn btn-info float-right">수정</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>

<script>

//submit 하기전 유효성 검사 함수
function validateForm  (){
	
	var checkCnt = document.getElementsByName("bCode").length;
	var bName = "";
	
	var j = 0;

    for (var i=0; i<checkCnt; i++) {
        if (document.getElementsByName("bCode")[i].checked == true) {
   		
        	j++;
			
        	var bcode = document.getElementsByName("bCode")[i].value;
        	
        	<c:forEach items="${bcodeList}" var="bcode">
        	
        		var tempBCode = '${bcode.bCode}';
        		
        		if(bcode == tempBCode){
        			
        			if(j==1){
        				bName = bName + '${bcode.bName}';	
        			}else{
        				bName = bName + ', ' +'${bcode.bName}';
        			}
        			
        		}
			</c:forEach>
        }
    }

    $('#bName').val(bName);
    
    if(j == 0){
		alert("병의원을 선택하세요.");
		return false;
	}

}



var deleteFunc = function (){
	
	var result = confirm("삭제하시겠습니까?");
	
	if(result){
		location.href = "remove.do?idx=" + "${data.idx}";
	}
	
}



//전체 체크 및 해제
function allCheck(){
	
	if($('#checkAll').prop("checked")){
		$('input:checkbox[name="bCode"]').prop('checked',true);
	} else{
		$('input:checkbox[name="bCode"]').prop('checked',false);	
	}
}

$(function () {
	
	
	var branchList = "${data.bCode}";
	branchList = branchList.split(",");
	
	var result = new Array();
	<c:forEach items="${bcodeList}" var="bcode">
		var json = new Object();
		
		json.bcode = "${bcode.bCode}";
		result.push(json);	
	</c:forEach>
	
	if(result.length-1 == branchList.length){
		$('input:checkbox[id="checkAll"]').prop('checked',true);
	}
	
	for(var i=0 ; i < branchList.length ; i++){
		$('input:checkbox[id="'+branchList[i].replace(" ","")+'"]').prop('checked',true);
	}
	
	
	$('#targetDate').daterangepicker({
		locale : { format : 'YYYY-MM-DD'},
		singleDatePicker : true
	});
	
	
	$('#targetDate').val("${data.targetDate}");
	
});

</script>