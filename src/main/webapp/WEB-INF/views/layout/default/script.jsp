<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables js -->
	<script src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<!-- select2 js -->
	<script src="${pageContext.request.contextPath}/resources/plugins/select2/js/select2.full.min.js"></script>
	<!-- toastr js -->
	<script src="${pageContext.request.contextPath}/resources/plugins/toastr/toastr.min.js"></script>
	<!-- daterangepicker js -->
	<script src="${pageContext.request.contextPath}/resources/plugins/moment/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/yearpicker/yearpicker.js"></script>
	<!-- custom-file-input js -->
	<script src="${pageContext.request.contextPath}/resources/plugins/bs-custom-file-input/bs-custom-file-input.min.js"></script>
	<!-- overlayScrollbars -->
	<script src="${pageContext.request.contextPath}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
	<!-- END PLUGINS -->
	
	<!-- START CUSTOMS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom/utils.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/custom/validations.js"></script>
	<!-- END CUSTOMS -->
	
	<script>
		$(function() {
			//Initialize Select2 Elements
			$('.select2').select2();
		});
		
		$.extend(true, $.fn.dataTable.defaults, {
			language : { 'loadingRecords' : 'Loading...',
						'processing' : 'Loading...',
						'paginate' : {
						'next' : '다음',
						'previous' : '이전'
						}
					}
		});
	</script>
