package com.cms.service.contents.contentsmanager;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.cms.common.util.FileUpload;
import com.cms.dao.contents.contentsmanage.EventDao;
import com.cms.dto.contents.contentsmanage.Event;

@Service
public class EventService {
	
	@Value("#{prop['file.upload.url.path']}") private String uploadPath;
	@Value("#{prop['file.upload.system.path']}") private String systemPath;
	@Value("#{prop['file.upload.path.event']}") private String subPath;
	@Autowired private EventDao eventDao;
	

	public List<Event> getList() {
		
		List<Event> result = new ArrayList<Event>();
		
		result = eventDao.getList();
		
		for(int i=0; i<result.size(); i++) {
			Event temp = result.get(i);
			temp.setImgPath("/Upload/BOSUpfiles/EVENT_THUMB/"+temp.getEvtImgUrl());
			result.set(i, temp);
		}
		
		return result;
	}


	/**
	 * 
	 * @name setEvent
	 * @description 이벤트 등록
	 * @param event
	 * @param multipartReq
	 * @author KimJaehyung
	 * @since 2020. 11. 12.
	 */
	@Transactional
	public void setEvent(Event event, MultipartRequest multipartReq) {
		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile evtImgUrl = multipartReq.getFile("evtImgUrl_file");
		
		if((!evtImgUrl.isEmpty()) && (evtImgUrl != null)) {
			event.setEvtImgUrl(evtImgUrl.getOriginalFilename());
		}
		
		eventDao.setEvent(event);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+"BOSUpfiles"+File.separator+"EVENT_THUMB");
			}
		}
	}

	/**
	 * 
	 * @name getEvent
	 * @description 이벤트 상세 조회
	 * @param docID
	 * @return
	 * @author KimJaehyung
	 * @since 2020. 11. 16.
	 */
	public Event getEvent(int docID) {
		Event event = eventDao.getEvent(docID);
		event.setImgPath("/Upload/BOSUpfiles/EVENT_THUMB/"+event.getEvtImgUrl());
		return event;
	}


	/**
	 * 
	 * @name modifyEvent
	 * @description 이벤트 수정
	 * @param event
	 * @param multipartReq
	 * @author KimJaehyung
	 * @since 2020. 11. 17.
	 */
	@Transactional
	public void modifyEvent(Event event , MultipartRequest multipartReq) {

		Iterator<String> fileNames = multipartReq.getFileNames();
		MultipartFile evtImgUrl = multipartReq.getFile("evtImgUrl_file");
		
		if((!evtImgUrl.isEmpty()) && (evtImgUrl != null)) {
			event.setEvtImgUrl(evtImgUrl.getOriginalFilename());
		}
		
		eventDao.modifyEvent(event);
		
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile file = multipartReq.getFile(fileName);
			
			if(!file.isEmpty()) {
				FileUpload.fileUpload(file, systemPath+File.separator+"BOSUpfiles"+File.separator+"EVENT_THUMB");
			}
		}
		
	}


	public void removeEvent(int docID) {
		eventDao.removeEvent(docID);
	}
	
	
}