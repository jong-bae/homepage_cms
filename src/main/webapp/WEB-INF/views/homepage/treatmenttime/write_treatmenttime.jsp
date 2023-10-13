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
						<li class="breadcrumb-item active">병의원 별 진료시간 (등록)</li>
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
						<h3 class="card-title">병의원 별 진료시간 등록</h3>
					</div>
					<form role="form" id="writeForm" method="post" action="write-proc.do" onsubmit="return validateForm();">
					<div class="card-body">
						<!-- form start -->
						<div class="form-group row">
							<label for="sel-bcode" class="col-sm-2 col-form-label">병의원</label>
							<div class="col-sm-4">
								<select class="form-control select2" id="sel-bcode" name="bCode">
									<option value="">병의원선택</option>
									<c:forEach items="${bcodeList }" var="bcode">
										<c:if test="${bcode.bCode != '10000'}">
											<option value='<c:out value="${bcode.bCode }"></c:out>'><c:out value="${bcode.bName }"></c:out></option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label1" >월</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="monStart" id="timeStart1"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="monEnd" id="timeEnd1" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label2">화</label>
							
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="tueStart" id="timeStart2"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="tueEnd" id="timeEnd2" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label3">수</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="wedStart" id="timeStart3" placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="wedEnd" id="timeEnd3" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label4">목</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="thuStart" id="timeStart4" placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="thuEnd" id="timeEnd4" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label5">금</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="friStart"  id="timeStart5"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="friEnd"  id="timeEnd5"  placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label6">토</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="satStart" id="timeStart6"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="satEnd" id="timeEnd6" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label7">일</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="sunStart" id="timeStart7"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="sunEnd" id="timeEnd7" placeholder="18:00"  style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label8">공휴일</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="holidayStart" id="timeStart8"  placeholder="09:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="holidayEnd" id="timeEnd8" placeholder="18:00" style="text-align:center;">
								</div>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label" id="label9">점심</label>
							<div class="col-sm-4">
								<div class="input-group">
								<input type="text" class="form-control" name="lunchStart" id="timeStart9"  placeholder="13:00"  style="text-align:center;">
           	                		<div class="input-group-prepend">
		                      			<span class="input-group-text">~</span>
		                    		</div>
                    			<input type="text" class="form-control" name="lunchEnd" id="timeEnd9" placeholder="14:00" style="text-align:center;">
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="title" class="col-sm-2 col-form-label">휴진</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="closedList" placeholder="일요일,추석,설날"  style="text-align:center;">
							</div>
						</div>
						
						
					</div>
					<div class="card-footer">
						<div class="btn-group float-left">
							<button type="submit" class="btn btn-outline-primary">등록</button>
							<button type="button" class="btn btn-outline-secondary" onClick="location.href='list.do'">취소</button>
						</div>
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
	
	
	var time_pattern = /^(0[0-9]|1[0-9]|2[0-3]):([0-5][0-9])$/; 
	var blank_pattern = /^\s+|\s+$/g;
	
	var selBcode = $('#sel-bcode').val();
	
	if(selBcode.replace(blank_pattern, '') == ""){
		alert("병의원을 선택하세요.");
		return;
	}

	
	for (var i=1; i<10 ; i++){

		var timeStart = $('#timeStart'+i).val();
		var timeEnd = $('#timeEnd'+i).val();
		
		if(timeStart.replace(blank_pattern, '') != ""){
			if(!time_pattern.test(timeStart)){
				alert($('#label'+i).text()+"의 "+ "시작시간값이 형식에 맞지 않습니다. 예)10:00");
				return false;
			}
		}
	
		
		if(timeEnd.replace(blank_pattern, '') != ""){
			if(!time_pattern.test(timeEnd)){
				alert($('#label'+i).text()+"의 "+ "종료시간값이 형식에 맞지 않습니다. 예)10:00")
				return false;
			}
		}
		
	}
	
	$.ajax({
        url:'/homepage/treatmenttime/write-proc.do',
        type:'POST',
        data: $('#writeForm').serialize(),
        dataType: "json",
        success:function(data){
          
          if(data==0){
        	  location.href="list.do"
          }else{
        	  alert("해당 병의원은 이미 등록되어있습니다.");
          }
        }
	});

}

$(function() {

	//CK에디터 호출

});

</script>