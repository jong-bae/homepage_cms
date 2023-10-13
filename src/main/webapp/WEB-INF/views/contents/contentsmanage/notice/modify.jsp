<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
						<li class="breadcrumb-item">콘텐츠 관리</li>
						<li class="breadcrumb-item active">공지사항 관리(수정)</li>
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
						<h3 class="card-title">공지사항 수정</h3>
					</div>
					<!-- form start -->
					<form role="form" id="modifyForm" method="post" action="modify-proc.do" onsubmit="validateForm();">
						<input type="hidden" name="bidx" value='<c:out value="${data.bidx }"></c:out>'>
						<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="BranchOpen-all" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-10">
							    <div class="custom-control custom-checkbox" style="float:left; width:80px;">
			                          <input class="custom-control-input" type="checkbox" name="BranchOpen-all" id="checkAll" value='checkAll' onclick="allCheck()">
			                          <label for="checkAll" class="custom-control-label">전체</label>
		                        </div>
								<c:forEach items="${bcodeList}" var="bcode">
								    <div class="custom-control custom-checkbox" style="float:left; width:80px;">
			                          <input class="custom-control-input" type="checkbox" name="branchOpen" id="<c:out value="${bcode.bCode }"></c:out>" value='<c:out value="${bcode.bCode }"></c:out>'>
			                          <label for="<c:out value="${bcode.bCode }"></c:out>" class="custom-control-label"><c:out value="${bcode.bName }"></c:out></label>
			                        </div>
								</c:forEach>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="strSubject" class="form-control" id="strSubject" placeholder="제목" required="required" value='<c:out value="${data.strSubject }"></c:out>' >
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">상태</label>
							<div class="col-sm-1">
								<div class="custom-control custom-radio" style="margin-top:5px;">
		                          <input class="custom-control-input" type="radio"  id="bitDelete0" value="0" name="bitDelete">
		                          <label for="bitDelete0" class="custom-control-label">노출</label>
		                        </div>
							</div>
							<div class="col-sm-1">
								<div class="custom-control custom-radio" style="margin-top:5px;">
		                          <input class="custom-control-input" type="radio"  id="bitDelete1"  value="1" name="bitDelete">
		                          <label for="bitDelete1" class="custom-control-label">미노출</label>
		                        </div>
							</div>
							<div class="col-sm-1">
								<div class="custom-control custom-radio" style="margin-top:5px;">
		                          <input class="custom-control-input" type="radio"  id="bitDelete2"  value="2" name="bitDelete">
		                          <label for="bitDelete2" class="custom-control-label">채용공고</label>
		                        </div>
							</div>
						</div>
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="strContent" id="strContent" rows="15" cols="163" class="form-control">${data.strContent }</textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="dateRegdate" class="col-sm-2 col-form-label">등록일</label>
							<div class="col-sm-3">
					 	  		<div class="input-group">
		                    		<div class="input-group-prepend">
		                      			<span class="input-group-text">
		                        			<i class="far fa-calendar-alt"></i>
		                      			</span>
		                    		</div>
		                    		<input type="text" class="form-control" name="dateRegdate" id="dateRegdate" placeholder="등록일" value='<c:out value="${data.dateRegdate }"></c:out>' style="text-align:center;">
			                  	</div>
							</div>
						</div>
						
								
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">조회수</label>
							<div class="col-sm-10">
								<input type="text" name="intRead" class="form-control" id="intRead" value='<c:out value="${data.intRead }"></c:out>' readonly>
							</div>
						</div>
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-info">수정</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
						</div>
						<div class="btn-group float-right">
							<button type="button" class="btn btn-outline-danger" onClick="deleteFunc()">삭제</button>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	//전체 체크 및 해제
	function allCheck(){
		
		if($('#checkAll').prop("checked")){
			$('input:checkbox[name="branchOpen"]').prop('checked',true);
		} else{
			$('input:checkbox[name="branchOpen"]').prop('checked',false);	
		}
	}


	//submit 하기전 유효성 검사 함수
	function validateForm(){
		
		var checkCnt = document.getElementsByName("branchOpen").length;
		 
		var j = 0;
	
	    for (var i=0; i<checkCnt; i++) {
	        if (document.getElementsByName("branchOpen")[i].checked == true) {
	   			j++;
	        }
	    }
	   
	    
	    if(j == 0){
			alert("병의원을 선택하세요.");
		    return false;
		}
	
	}

	var deleteFunc = function (){
		
		var result = confirm("삭제하시겠습니까?");
		
		if(result){
			location.href = "remove.do?idx=" + "${data.bidx}";
		}
		
	}

	$(function() {
		
		$('input:radio[name="bitDelete"]:radio[value="${data.bitDelete}"]').prop('checked', true); 
		
		var branchOpenList = "${data.branchOpen}";
		branchOpenList = branchOpenList.split(",");
		
		var result = new Array();
		<c:forEach items="${bcodeList}" var="bcode">
			var json = new Object();
			
			json.bcode = "${bcode.bCode}";
			result.push(json);	
		</c:forEach>
		
		if(result.length == branchOpenList.length){
			$('input:checkbox[id="checkAll"]').prop('checked',true);
		}
		
		for(var i=0 ; i < branchOpenList.length ; i++){
			$('input:checkbox[id="'+branchOpenList[i].replace(" ","")+'"]').prop('checked',true);
		}
		
		//CK에디터 호출
		CKEDITOR.replace('strContent',{height:'380'});
		CKEDITOR.config.allowedContent = true;
		
		$('#dateRegdate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});
	});
</script>