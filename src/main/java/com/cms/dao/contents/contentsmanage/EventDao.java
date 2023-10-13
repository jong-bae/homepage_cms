package com.cms.dao.contents.contentsmanage;

import java.util.List;

import com.cms.dto.contents.contentsmanage.Event;

public interface EventDao {
	
	public List<Event> getList();

	public void setEvent(Event event);

	public Event getEvent(int docID);

	public void modifyEvent(Event event);

	public void removeEvent(int docID);
	
}