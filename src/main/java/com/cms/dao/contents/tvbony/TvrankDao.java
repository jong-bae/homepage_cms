package com.cms.dao.contents.tvbony;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cms.dto.contents.tvbony.Tvbony;

public interface TvrankDao {

	public List<Tvbony> getTvcodeList();
	
	public void setOrder(@Param("idx") int idx, @Param("key") int key);
}
