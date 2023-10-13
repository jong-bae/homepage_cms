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
						<li class="breadcrumb-item active">환자가 직접 쓴 치료 수기</li>
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
						<h3 class="card-title">치료 수기 수정</h3>
					</div>
					<!-- form start -->
					<form role="form" id="modifyForm" name="modifyForm" method="post" action="modify-proc.do" onsubmit="validateForm();">
						<input type="hidden" name="idx"  value='<c:out value="${data.idx }"></c:out>'>
						<input type="hidden" name="startDate" id="startDate" value='<c:out value="${data.startDate }"></c:out>'>
						<input type="hidden" name="endDate" id="endDate" value='<c:out value="${data.endDate }"></c:out>'>
						<div class="card-body">
						<!-- form start -->
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">제목</label>
							<div class="col-sm-10">
								<input type="text" name="subject" class="form-control" id="subject" placeholder="제목" required="required" value='<c:out value="${data.subject }"></c:out>' >
							</div>
						</div>
							
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">이름</label>
							<div class="col-sm-3">
								<input type="text" name="writer_name" class="form-control" id="writer_name" placeholder="이름" required="required" value='<c:out value="${data.writer_name }"></c:out>' >
							</div>
							<div class="col-sm-3">( ${data.writer_id} )
								<input type="hidden" name="writer_id" value="${data.writer_id}" />
							</div>
						</div>
							
						<div class="form-group row">
							<label for="gubun" class="col-sm-2 col-form-label">질환명</label>
								<div class="col-sm-3">
									<select class="form-control" name="gubun" id="gubun">
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
							<label for="cd_bcode" class="col-sm-2 col-form-label">내원 병의원</label>
							<div class="col-sm-3">
								<select class="form-control " id="cd_bcode" name="cd_bcode" disabled="disabled">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<c:if test="${bcode.bCode != '10000'}">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:if>
									</c:forEach>
								</select>
								<script>
										$('#cd_bcode').val('${data.cd_bcode}');
								</script>
							</div>
						</div>
						
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">의료진</label>
							<div class="col-sm-3">
								<input type="text" name="doctor_name" class="form-control" id="doctor_name" placeholder="의료진이름" required="required" value='<c:out value="${data.doctor_name }"></c:out>' readOnly>
							</div>
						</div>

						<div class="form-group row">
							<label for="content" class="col-sm-2 col-form-label">내용</label>
							<div class="col-sm-10">
								<textarea name="content" id="content" rows="15" cols="163" class="form-control">${data.content }</textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="regdate" class="col-sm-2 col-form-label">등록일</label>
							<div class="col-sm-3">
								<input type="text" name="regdate" class="form-control" id="regdate" value='<c:out value="${data.regdate }"></c:out>' readonly>
							</div>
						</div>
						
						
						<div class="form-group row">
							<label for="best_yn" class="col-sm-2 col-form-label">베스트 후기</label>
							<div class="col-sm-3">
								<select class="form-control" name="best_yn" id="best_yn">
									<option value="Y" <c:if test='${data.best_yn eq "Y"}'> selected</c:if>>Y</option>
									<option value="N" <c:if test='${data.best_yn eq "N"}'> selected</c:if>>N</option>
								</select>
							</div>
								
						</div>
				
				
						<div class="form-group row">
							<label for="use_status" class="col-sm-2 col-form-label">노출상태</label>
							<div class="col-sm-3">
								<select class="form-control" name="use_status" id="use_status">
									<option value="대기" <c:if test='${data.use_status eq "대기"}'> selected</c:if>>대기</option>
									<option value="공개" <c:if test='${data.use_status eq "공개"}'> selected</c:if>>공개</option>
									<option value="비공개" <c:if test='${data.use_status eq "비공개"}'> selected</c:if>>비공개</option>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="use_yn" class="col-sm-2 col-form-label">사용여부</label>
							<div class="col-sm-3">
								<select class="form-control" name="use_yn" id="use_yn">
									<option value="Y" <c:if test='${data.use_yn eq "Y"}'> selected</c:if>>Y</option>
									<option value="N" <c:if test='${data.use_yn eq "N"}'> selected</c:if>>N</option>
								</select>
							</div>
						</div>

					</div>
					<div class="card-footer">
						<button type="button" class="btn btn-default" onClick="goList()">리스트</button>
						<button type="button" class="btn btn-danger" onClick="goSuggest()">건의합니다 이동</button>
						<button type="submit" class="btn btn-info float-right">수정</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		
		
		<div class="row">
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

	//건의합니다 이동
	var goSuggest = function(){
		
		if(confirm("건의합니다로 이동하시겠습니까?")==true){
			var form = document.modifyForm;
			form.action = "suggest-proc.do";
			form.submit();	
		}else{
			return;
		}
	}
	
	
	//리스트 이동
	var goList = function(){
		
		location.href = 'list.do?startDate=' + $("#startDate").val() + '&endDate=' +  $("#endDate").val() + '&gubun=' + $("#gubun").val();
		
	}

	//관련 댓글 리스트 조회
	var getReplyList = function(param){
		
		var sendData = {
				"idx" : ${data.idx}
		}
		console.log(sendData);
		
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
	    				{ 'data' : 'comment', 'defaultContent' : '', 'width': '50%'
	    					,'render' : function(data, type, row, meta) {
	    						
	    						if(data.length != 0){
	    							return data.substring(0,30);
	    						}else{
	    							return data;
	    						}
	    					}
	    				},
	    				{ 'data' : 'name', 'defaultContent': '', 'width': '20%'},
	    				{ 'data' : 'useYN', 'defaultContent' : '', 'width': '15%'}
	    			],
	    			data : data
	    		});
	    		
	    		$("#listTable tbody").unbind("click");
	    		$('#listTable tbody').on('click', 'tr', function() {
	    			var data = list.row(this).data();

	    			//var searchType = $("#searchType").val();
	    			//http://localhost:8080/contents/contentsmanage/csletter/
	    								  
	    			
	    			location.href = '/contents/effect/csletter/reply_modify.do?idx=' + data.idx +'&cdBCODE=10000';
	    					
	    		});
            	
	        }
		});
	}

	$(function() {
		
		//CK에디터 호출
		CKEDITOR.replace('content',{height:'250'});
		CKEDITOR.config.allowedContent = true;
		
		getReplyList();

	});
</script>