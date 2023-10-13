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
						<li class="breadcrumb-item active">댓글 수정</li>
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
						<h3 class="card-title">댓글 수정</h3>
					</div>
					<!-- form start -->
					<form role="form" id="modifyForm" name="modifyForm" method="post" action="reply-modify-proc.do" onsubmit="validateForm();">
						<input type="hidden" name="idx"  value='<c:out value="${data.idx}"></c:out>'>
						<input type="hidden" name="searchTypeList" id="searchTypeList"  value='<c:out value="${data.searchTypeList}"></c:out>'>
						<input type="hidden" name="intThread" value='<c:out value="${data.intThread}"></c:out>'>
						<input type="hidden" name="intIndex" value='<c:out value="${data.intIndex}"></c:out>'>
						<input type="hidden" name="cdBCODE" id = "cdBCODE" value='<c:out value="${data.cdBCODE}"></c:out>'>
						<div class="card-body">
						<!-- form start -->
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">질환명</label>
							<div class="col-sm-3">
								<select class="form-control" name="gubun" id="gubun" disabled="disabled">
									<option value="허리디스크" <c:if test='${data.gubun eq "허리디스크"}'> selected</c:if>>허리디스크</option>
									<option value="목디스크" <c:if test='${data.gubun eq "목디스크"}'> selected</c:if>>목디스크</option>
									<option value="퇴행성디스크" <c:if test='${data.gubun eq "퇴행성디스크"}'> selected</c:if>>퇴행성디스크</option>
									<option value="척추관협착증" <c:if test='${data.gubun eq "척추관협착증"}'> selected</c:if>>척추관협착증</option>
									<option value="전방전위ㆍ분리증" <c:if test='${data.gubun eq "전방전위ㆍ분리증"}'> selected</c:if>>전방전위ㆍ분리증</option>
									<option value="턱관절장애" <c:if test='${data.gubun eq "턱관절장애"}'> selected</c:if>>턱관절장애</option>
									<option value="관절ㆍ통증" <c:if test='${data.gubun eq "관절ㆍ통증"}'> selected</c:if>>관절ㆍ통증</option>
									<option value="안면신경마비" <c:if test='${data.gubun eq "안면신경마비"}'> selected</c:if>>안면신경마비</option>
									<option value="교통사고" <c:if test='${data.gubun eq "교통사고"}'> selected</c:if>>교통사고</option>
									<option value="비만" <c:if test='${data.gubun eq "비만"}'> selected</c:if>>비만</option>
									<option value="기타질환" <c:if test='${data.gubun eq "기타질환"}'> selected</c:if>>기타질환</option>
								</select>
							</div>
						</div>
						
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">원글</label>
							<div class="col-sm-10">
								<input type="text" name="subject" class="form-control" id="subject" required="required" value='<c:out value="${data.subject }"></c:out>' readonly="readonly">
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-10">
								<input type="text" name="name" class="form-control" id="name" required="required" value='<c:out value="${data.name }"></c:out>' readonly="readonly">
							</div>
						</div>
							
						<div class="form-group row">
							<label for="strContent" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="comment" id="comment" rows="15" cols="163" class="form-control" readonly="readonly">${data.comment }</textarea>
							</div>
						</div>

						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">등록일</label>
							<div class="col-sm-3">
								<input type="text" name="regDate" class="form-control" id="regDate" value='<c:out value="${data.regDate }"></c:out>' readonly>
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">노출상태</label>
							<div class="col-sm-3">
								<select class="form-control" name="useYN" id="useYN">
									<option value="Y" <c:if test='${data.useYN eq "Y"}'> selected</c:if>>노출</option>
									<option value="N" <c:if test='${data.useYN eq "N"}'> selected</c:if>>미노출</option>
									
								</select>
							</div>
						</div>
				
		
					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-default" onClick="goList()">리스트</button>
						<button type="submit" class="btn btn-info float-right">수정</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<div class="row" style="display:none;">
			<div class="col-12">
				<div class="card card-warning">
					<div class="card-header">
						<h3 class="card-title">관련 댓글(동일원글의 댓글)</h3>
					</div>
					<div class="card-body">
						<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
							<thead>
								<tr class="text-center">
									<th>번호</th>
									<th align="left">댓글</th>
									<th>이름</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</section>
</div>
<script>
	
	
	//리스트 이동
	var goList = function(){
		
		console.log( $("#cdBCODE").val());
		
		location.href = 'reply_list.do?searchTypeList=' + $("#searchTypeList").val() + "&cdBCODE="+ $("#cdBCODE").val();
		
	}

	//관련 댓글 리스트 조회
	var getReplyList = function(param){
		
		var sendData = {
				"intBoardID" : ${data.intBoardID},
				"intIndex" : ${data.intIndex},
				"intThread" :  ${data.intThread}
		}
			
		
		$.ajax({
	        url:'/contents/effect/csletter/replyListAjax.do',
            type:'POST',
            dataType: "json",
            contentType : 'application/json',
            data: JSON.stringify(sendData),
	        success:function(data, textStatus){
	        	
	        	console.log(data);
	            	
	        	var list = $('#listTable').DataTable({
	    		    destroy: true,
	    			order : [[ 0, "desc" ]],
	    			columns : [
	    				{ 'data' : 'idx', 'defaultContent': '', 'width': '15%'},
	    				{ 'data' : 'comment', 'defaultContent' : '', 'width': '50%'},
	    				{ 'data' : 'name', 'defaultContent': '', 'width': '20%'},
	    				{ 'data' : 'useYN', 'defaultContent' : '', 'width': '15%'}
	    			],
	    			columnDefs : [{
	    				targets: [0,1,2,3], // your case first column
	    				createdCell : function (td, cellData, rowData, row, col){
	    					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
	    				}
	    		 	}],
	    			data : data
	    		});
	    		
	    		$("#listTable tbody").unbind("click");
	    		$('#listTable tbody').on('click', 'tr', function() {
	    			var data = list.row(this).data();

	    			//var searchType = $("#searchType").val();
	    			//localhost:8080/contents/contentsmanage/csletter/
	    								  
	    			
	    			location.href = 'reply_modify.do?idx=' + data.idx + '&cdBCODE=' + $("#cdBCODE").val() + '&searchTypeList=' + $("#searchTypeList").val();
	    			
	    					
	    		});
            	
	        }
		});
	}

	$(function() {
		
		//CK에디터 호출
		CKEDITOR.replace('strContent',{height:'250'});
		CKEDITOR.config.allowedContent = true;
		
		//getReplyList();

	});
</script>