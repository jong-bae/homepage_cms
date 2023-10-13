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
						<li class="breadcrumb-item active">댓글 관리</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card card-warning card-outline">
						<div class="card-header">
							<h3 class="card-title">치료수기 댓글 대기 목록</h3>
						</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-2">
										<button type="button" class="btn btn-info" onClick="getwaitList('refresh')">새로고침</button>
									</div>
								</div>
							</form>

							<table id="waitlistTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>카테고리</th>
										<th align="left">원글</th>
										<th>이름</th>
										<th>댓글</th>
										<th>등록일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12">
					<div class="card card-success card-outline">
					<div class="card-header">
						<h3 class="card-title">댓글 목록</h3>
					</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									<label  class="col-sm-1 col-form-label float-right" style="width:30px;">카테고리:</label>
									<div class="col-sm-2">
										<select class="form-control" name="gubun" id="gubun">
											<option value="">선택해주세요</option>
											<option value="허리디스크">허리디스크</option>
											<option value="목디스크">목디스크</option>
											<option value="퇴행성디스크">퇴행성디스크</option>
											<option value="척추관협착증">척추관협착증</option>
											<option value="전방전위ㆍ분리증">전방전위ㆍ분리증</option>
											<option value="턱관절장애">턱관절장애</option>
											<option value="관절ㆍ통증">관절ㆍ통증</option>
											<option value="안면신경마비">안면신경마비</option>
											<option value="교통사고">교통사고</option>
											<option value="비만">비만</option>
											<option value="기타질환">기타질환</option>
										</select>
									</div>
									<label  class="col-sm-1 col-form-label" style="width:30px;text-align:rigth;" >병의원:</label>
									<div class="col-sm-2">
										<select class="form-control " id="cdBCODE" name="cdBCODE">
											<option value="-1">전체</option>
											<c:forEach items="${bcodeList}" var="bcode">
												<c:if test="${bcode.bCode != '10000'}">
													<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
												</c:if>
											</c:forEach>
										</select>
									</div>
									<div class="col-md-2">
										<button type="button" class="btn btn-info" onClick="getList('refresh')">검색</button>
									</div>
								</div>
							</form>

							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>카테고리</th>
										<th align="left">원글</th>
										<th>이름</th>
										<th>댓글</th>
										<th>등록일</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
<script>

	//대기리스트 조회
	var getwaitList = function(param){

		$.ajax({
	        url:'/contents/effect/csletter/replyWaitListAjax.do',
	        type:'POST',
	        dataType: "json",
	        success:function(data, textStatus){

				console.log(111111111);

	        	makeWaitListTable(data);

            	if(param == 'refresh'){
           	 		alert("갱신되었습니다.");
            	}
	        }
		});
	}


	//리스트 조회
	var getList = function(param){

		const gubun = $("select[name=gubun] option:selected").val();
		var sendData = {
			//"searchTypeList" : searchType.split(',').toString(),
			"gubun" : gubun,
			"cdBCODE" : $("#cdBCODE").val()
		}

		$.ajax({
            url:'/contents/effect/csletter/getReplyListAjax.do',
            type:'POST',
            dataType: "json",
            contentType : 'application/json',
            data: JSON.stringify(sendData),
            success:function(data){

              makeListTable(data);

              if(param == 'refresh'){
            	  alert("갱신되었습니다.");
              }
            }
		});

	}

	//대기 테이블 생성
	var makeWaitListTable =  function (data){

		var waitlist = $('#waitlistTable').DataTable({
		    destroy: true,
			order : [[ 0, "desc" ]],
			columns : [
 				{ 'data' : 'idx', 'defaultContent': '', 'width': '8%'},
				{ 'data' : 'gubun', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'subject', 'defaultContent' : '', 'width': '16%'},
				{ 'data' : 'name', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'comment', 'defaultContent' : '', 'width': '28%'},
				{ 'data' : 'regDate', 'defaultContent' : '', 'width': '8%'},
				{ 'data' : 'useYN', 'defaultContent' : '', 'width': '10%'}
			],
			data : data
		});

		$("#waitlistTable tbody").unbind("click");
		$('#waitlistTable tbody').on('click', 'tr', function() {
			var data = waitlist.row(this).data();

			//var searchType = $("#searchType").val();
			location.href = 'reply_modify.do?idx=' + data.idx + '&cdBCODE="' + $("#cdBCODE").val() + '"&searchTypeList="' + $("#searchTypeList").val() +'"';

		});

	}

	//데이터 테이블 생성
	var makeListTable =  function (data){

		var replyList = $('#listTable').DataTable({
		    destroy: true,
			order : [[ 0, "desc" ]],
			columns : [
				{ 'data' : 'idx', 'defaultContent': '', 'width': '8%'},
				{ 'data' : 'gubun', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'subject', 'defaultContent' : '', 'width': '16%'},
				{ 'data' : 'name', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'comment', 'defaultContent' : '', 'width': '28%'},
				{ 'data' : 'regDate', 'defaultContent' : '', 'width': '8%'},
				{ 'data' : 'useYN', 'defaultContent' : '', 'width': '10%'}
			],
			columnDefs : [{
				targets: [0,1,2,3,4,5,6], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');
				}
		 	}],
			data : data
		});

		$("#listTable tbody").unbind("click");
		$('#listTable tbody').on('click', 'tr', function() {

			var data = replyList.row(this).data();
			console.log( $("#cdBCODE").val() );

			location.href = 'reply_modify.do?idx=' + data.idx + '&cdBCODE="' + $("#cdBCODE").val() + '"&searchTypeList="' + $("#searchTypeList").val() +'"';

		});

	}

	$(function() {

		//대기리스트 조회
		getwaitList();

		//리스트 조회
		getList();

	});

</script>
