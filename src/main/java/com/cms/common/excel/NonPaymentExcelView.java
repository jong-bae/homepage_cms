package com.cms.common.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.cms.dto.contents.contentsmanage.NonPayment;

public class NonPaymentExcelView extends AbstractPOIExcelView {

	@Override
	protected Workbook createWorkbook() {
		return new XSSFWorkbook();
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) {
		
		List<NonPayment> nonpayList = (List<NonPayment>)model.get("nonpayList");
		
		Sheet sheet = workbook.createSheet("sheet1");
		Row row = null;
		Cell cell = null;
		
		int rowCount = 0;
		int cellCount = 0;
		
		row = sheet.createRow(rowCount++);
		
		cell = row.createCell(cellCount++);
		cell.setCellValue("대분류/중분류");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("분류");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("항목명칭");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("항목코드");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("구분");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("비용");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("최저비용");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("최고비용");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("치료재료대\n포함여부\n(Y/N)");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("약제비\n포함여부\n(Y/N)");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("특이사항");
		cell.setCellStyle(headerStyle(workbook));
		cell = row.createCell(cellCount++);
		cell.setCellValue("최종수정일");
		cell.setCellStyle(headerStyle(workbook));
		
		for(NonPayment data : nonpayList) {
			row = sheet.createRow(rowCount++);
			cellCount = 0;
			row.createCell(cellCount++).setCellValue(data.getCode());
			row.createCell(cellCount++).setCellValue(data.getCodeName());
			row.createCell(cellCount++).setCellValue(data.getItemName());
			row.createCell(cellCount++).setCellValue(data.getItemCode());
			row.createCell(cellCount++).setCellValue(data.getItemDivision());
			row.createCell(cellCount++).setCellValue(data.getCost());
			row.createCell(cellCount++).setCellValue(data.getMinCost());
			row.createCell(cellCount++).setCellValue(data.getMaxCost());
			row.createCell(cellCount++).setCellValue(data.getMaterialYN());
			row.createCell(cellCount++).setCellValue(data.getDrugYN());
			row.createCell(cellCount++).setCellValue(data.getEtc());
			row.createCell(cellCount++).setCellValue(data.getUpdateDate());
		}
		
	}
	
	private CellStyle headerStyle(Workbook workbook) {
		CellStyle style = workbook.createCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		style.setVerticalAlignment(VerticalAlignment.CENTER);
		style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.getIndex());
		style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		style.setFont(headerFontStyle(workbook));
		
		return style;
	}
	
	private Font headerFontStyle(Workbook workbook) {
		Font headerFont = workbook.createFont();
		headerFont.setColor(IndexedColors.WHITE.getIndex());
		headerFont.setBold(true);
		
		return headerFont;
	}

}
