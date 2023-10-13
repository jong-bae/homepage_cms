package com.cms.common.excel;

import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.AbstractView;

public abstract class AbstractPOIExcelView extends AbstractView {

	private static final String CONTENT_TYPE_XLSX = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
//	private static final String CONTENT_TYPE_XLS = "application/vnd.ms-excel";

	@Override
	protected boolean generatesDownloadContent() {
		return true;
	}

	@Override
	protected final void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 
		Workbook workbook = createWorkbook();

//		if (workbook instanceof XSSFWorkbook) {
			setContentType(CONTENT_TYPE_XLSX);
//		} else {
//			setContentType(CONTENT_TYPE_XLS);
//		}

		buildExcelDocument(model, workbook, request, response);

		// Set the content type.
		response.setContentType(getContentType());

		// Flush byte array to servlet output stream.
		ServletOutputStream out = response.getOutputStream();
		out.flush();
		workbook.write(out);
		out.flush();

	}

	protected abstract Workbook createWorkbook();

	protected abstract void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response);

	
}
