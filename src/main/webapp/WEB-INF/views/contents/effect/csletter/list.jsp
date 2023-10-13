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
						<li class="breadcrumb-item active">환자가 직접 쓴 치료 수기 관리</li>
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
							<h3 class="card-title">치료수기 대기 목록</h3>
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
										<th align="left">제목</th>
										<th>이름</th>
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
						<h3 class="card-title">치료수기 목록</h3>
					</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-4">
										<div class="input-group">
				                    		<div class="input-group-prepend">
				                      			<span class="input-group-text">
				                        			<i class="far fa-calendar-alt"></i>
				                      			</span>
				                    		</div>
				                    		<input type="text" class="form-control" name="startDate" id="startDate" placeholder="시작날짜" required="required" style="text-align:center;">
		           	                		<div class="input-group-prepend">
				                      			<span class="input-group-text">~</span>
				                    		</div>
			                    			<input type="text" class="form-control" name="endDate" id="endDate" placeholder="종료날짜" required="required" style="text-align:center;">
			                  			</div>
									</div>
							
									<div class="col-sm-2">
										<select class="form-control" name="gubun" id="gubun">
											<option value="" >카테고리 전체</option>
											<option value="허리디스크">허리디스크</option>
											<option value="목디스크">목디스크</option>
											<option value="퇴행성디스크">퇴행성디스크</option>
											<option value="척추관협착증">척추관협착증</option>
											<option value="전방전위ㆍ분리증">전방전위ㆍ분리증</option>
											<option value="턱관절장애">턱관절장애</option>
											<option value="관절ㆍ통증">관절ㆍ통증</option>
											<option value="안면신경마비">안면신경마비</option>
											<option value="비만">비만</option>
											<option value="교통사고">교통사고</option>
											<option value="기타질환">기타질환</option>
										</select>
									</div>
									<div class="col-sm-2">
										<select class="form-control " id="cdBCODE" name="cdBCODE">
											<option value="-1">병의원 전체</option>
											<c:forEach items="${bcodeList}" var="bcode">
											<c:if test="${bcode.bCode != '10000'}">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
											</c:if>
											</c:forEach>
										</select>
									</div>

									<div class="col-md-3">
										<button type="button" class="btn btn-info" onClick="getList('refresh')">검색</button>
										<button type="button" class="btn btn-default" id="btn-excelDown">엑셀다운로드</button>
									</div>
								</div>

							</form>
							
							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>병의원</th>
										<th>카테고리</th>
										<th>모바일구분</th>
										<th align="left">제목</th>
										<th>내용</th>
										<th>담당의</th>
										<th>이름</th>
										<th>등록일</th>
										<th>베스<br>트글</th>
										<th>건의<br>합니다<br>(이동)</th>
										<th>노출<br>상태</th>
										<th>사용<br>여부</th>
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
	let getwaitList = function(param){
		
		$.ajax({
	        url:'/contents/effect/csletter/waitlistAjax.do',
	        type:'POST',
	        dataType: "json",
	        success:function(data, textStatus){

	        	makeWaitListTable(data);
            	
            	if(param == 'refresh'){
           	 		alert("갱신되었습니다.");
            	}
	        }
		});
	}

	//엑셀다운로드 배열필드
	let sheet_js = "";
	let results = "";

	//리스트 조회
	let getList = function(param){

		let gubun_str = $("#gubun option:selected").val();
		let start_date = $("#startDate").val();
		let end_date = $("#endDate").val();
		let cdBCODE = $("select[name=cdBCODE] option:selected").val();

		let sendData = {
			"gubun" : gubun_str,
			"startDate" : start_date,
			"endDate" : end_date,
			"cdBCODE" : cdBCODE
		}

		$.ajax({
            url:'/contents/effect/csletter/listAjax.do',
            type:'POST',
            dataType: "json",
            contentType : 'application/json',
            data: JSON.stringify(sendData),
            success:function(data){

				//table 생성
				makeListTable(data);

			  	//json 가공 엑셀다운로드 전용
				let results = data.map(function(item) {
					return { 	'번호': item.idx, '병의원': item.bcode_name,
								'제목': item.subject, '담당의': item.doctor_name,
								'이름': item.writer_name, '등록일': item.regdate,
								'베스트글': item.best_yn, '노출상태': item.use_status,
								'사용여부': item.use_yn, '내용': item.content
							};
				});

				//json sheetjs 처리
				sheet_js = XLSX.utils.json_to_sheet(results);
              
				if(param == 'refresh'){
				  alert("갱신되었습니다.");
				}
            }
		});
		
	}

	//대기 테이블 생성
	let makeWaitListTable =  function (data){
		let waitlist = $('#waitlistTable').DataTable({
		    destroy: true,
			order : [[ 0, "desc" ]],
			columns : [
				{ 'data' : 'idx', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'gubun', 'defaultContent': '', 'width': '10%'},
				{ 'data' : 'subject', 'defaultContent' : '', 'width': '40%' },
				{ 'data' : 'writer_name', 'defaultContent' : '', 'width': '10%'},
				{ 'data' : 'regdate', 'defaultContent' : '', 'width': '10%'},
				{ 'data' : 'use_status', 'defaultContent' : '', 'width': '10%'}
			],
			columnDefs : [{
				targets: [0,1,2,3,4,5], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
				}
		 	}],
			data : data
		});
		
		$("#waitlistTable tbody").unbind("click");
		$('#waitlistTable tbody').on('click', 'tr', function() {
			var data = waitlist.row(this).data();

			location.href = 'modify.do?idx='+data.idx+'&startDate='+$("#startDate").val()+'&endDate='+$("#endDate").val();
					
		});
		
	}

	//데이터 테이블 생성
	let makeListTable =  function (data){
		let csletterlist = $('#listTable').DataTable({
		    destroy: true,
			order : [[ 0, "desc" ]],
			columns : [
				{ 'data' : 'idx', 'defaultContent': '', 'width': '8%'	},
				{ 'data' : 'bcode_name', 'defaultContent': '', 'width': '8%'	},
				{ 'data' : 'gubun', 'defaultContent': '', 'width': '14%'},
				{ 'data' : 'mobile_yn', 'defaultContent' : '', 'width': '8%' },
				{ 'data' : 'subject', 'defaultContent' : '', 'width': '20%' },
				{ 'data' : 'content', 'visible': false },
				{ 'data' : 'doctor_name', 'defaultContent' : '', 'width': '12%' },
				{ 'data' : 'writer_name', 'defaultContent' : '', 'width': '10%'},
				{ 'data' : 'regdate', 'defaultContent' : '', 'width': '10%'},
				{ 'data' : 'best_yn', 'defaultContent' : '', 'width': '5%'},
				{ 'data' : 'suggest_yn', 'defaultContent' : '', 'width': '5%'},
				{ 'data' : 'use_status', 'defaultContent' : '', 'width': '5%'},
				{ 'data' : 'use_yn', 'defaultContent' : '', 'width': '5%'}
			],
			columnDefs : [{
				targets: [0,1,2,3,4,5,6,7,8,9], // your case first column
				createdCell : function (td, cellData, rowData, row, col){
					$(td).attr("style", 'vertical-align: middle;text-align: center;');	
				}
		 	}],
			data : data
		});
		
		$("#listTable tbody").unbind("click");
		$('#listTable tbody').on('click', 'tr', function() {
			
			var data = csletterlist.row(this).data();

			location.href = 'modify.do?idx='+data.idx+'&startDate='+$("#startDate").val()+'&endDate='+$("#endDate").val();

		});

	}

	function getFormatDate(date){
		
		var year = date.getFullYear();
		var month = (1+date.getMonth());
		month = month >10 ? month : '0'+month;
		var day = date.getDate();
		day = day >= 10 ? day : '0' + day;
		
		return year+'-'+month+'-'+day;
	}
	
	$(function() {
		
		$('#startDate, #endDate').daterangepicker({
			locale : { format : 'YYYY-MM-DD'},
			singleDatePicker : true
		});

		//날짜 처리 함수
		const date = new Date().addMonth(-3);
		const year = date.getFullYear();
		const month = ('0' + (date.getMonth() + 1)).slice(-2);
		const day = ('0' + date.getDate()).slice(-2);
		const dateStr = year+'-'+month+'-'+day;

		//시작날짜 초기세팅
		$("#startDate").val(dateStr);

		//대기리스트 조회
		getwaitList();
		
		//치료수기 리스트 조회
		getList();
		
	});

	//엑셀 다운로드 sheetjs 참조
	$('#btn-excelDown').click(function() {

		let wb = XLSX.utils.book_new();
		XLSX.utils.book_append_sheet(wb, sheet_js, "Sheet1");

		//엑셀 파일생성
		XLSX.writeFile(wb, ('치료수기_다운로드.xlsx'));

	});

	//일자별 증감
	Date.prototype.addDays = function (days) {
		let date = this;
		return new Date(date.setDate(date.getDate() + days));
	};

	//월별 증감
	Date.prototype.addMonth = function (month) {
		let date = this;
		return new Date(date.setMonth(date.getMonth() + month));
	};

	//년도별 증감
	Date.prototype.addYear = function (year) {
		let date = this;
		return new Date(date.setFullYear(date.getFullYear() + year));
	};
	
</script>
