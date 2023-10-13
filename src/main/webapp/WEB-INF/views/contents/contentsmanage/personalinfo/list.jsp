<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						<li class="breadcrumb-item active">개인정보처리방침 관리</li>
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
					<div class="card card-primary card-outline">
						<div class="card-header">
								<h3 class="card-title">개인정보처리방침 목록</h3>
						</div>
						<div class="card-body">
							<form class="form-horizontal">
								<div class="form-group row">
									<div class="col-md-2">
										<button type="button" class="btn btn-info" onClick="getList('refresh')">새로고침</button>
									</div>
									<div class="col-md-10">
										<button type="button" class="btn btn-sm btn-outline-primary float-right"
											onClick="location.href='write.do'">등록</button>
									</div>
								</div>
							</form>
							
							<table id="listTable" class="table table-bordered table-hover" style="cursor:pointer" width="100%">
								<thead>
									<tr class="text-center">
										<th>번호</th>
										<th>분원</th>
										<th>제목</th>
										<th>버전</th>
										<th>사용유무</th>
										<th>등록일</th>
									</tr>
								</thead>
								<tbody></tbody>
							</table>
						</div>
						<div class="card-footer">
							<button type="button" class="btn btn-outline-primary float-right"
								onClick="location.href='write.do'">등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>
<script>

	//리스트 조회
	var getList = function(param){
		
		$.ajax({
            url:'/contents/contentsmanage/personalinfo/listAjax.do',
            type:'POST',
            dataType: "json",
            success:function(data){
                  //console.log(data); 
                  makeListTable(data);
                  if(param == 'refresh'){
                	  alert("갱신되었습니다.");
                  }
                
            }
		});
		
	}

	//데이터 테이블 생성
	var makeListTable =  function (data){

		var list = $('#listTable').DataTable({
		    destroy: true,
			order : [[ 0, "desc" ]],
			stateSave: true,
			stateDuration: -1,
			columns : [
				{ 'data' : 'idx', 'defaultContent': '', 'width': '15%'	},
				{ 'data' : 'bname', 'defaultContent' : '', 'width': '15%' },
				{ 'data' : 'title', 'defaultContent' : '', 'width': '20%' },
				{ 'data' : 'version', 'defaultContent' : '', 'width': '15%',
					render: function (data, type, row, meta) {
						return "Ver." + data;
					}
				},
				{ 'data' : 'useYN', 'defaultContent' : '', 'width': '15%' },
				{ 'data' : 'insertdate', 'defaultContent' : '', 'width': '20%' }
			],
			columnDefs : [
				{   'targets' : '_all', 'className' : 'text-center' 	}
			],
			data : data
		});
		
		$('#listTable tbody').on('click', 'tr', function() {
			var data = list.row(this).data();
			location.href = "modify.do?idx=" + data.idx;
		});
		
	}
	
	$(function() {
		
		//리스트 조회
		getList();
	});
	
</script>