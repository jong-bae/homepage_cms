package com.cms.dao.contents.academy;

import java.util.List;

import com.cms.dto.contents.academy.EducationFile;

public interface LibraryDao {

	public List<EducationFile> getLibraryList();
	
	public void setLibrary(EducationFile param);
	
	public void setLibraryFile(EducationFile param);
	
	public EducationFile getLibraryOne(int idx);
	
	public void modifyLibrary(EducationFile param);
	
	public void removeLibrary(int idx);
	
	public void removeLibraryFile(int idx);
	
	public List<EducationFile> getLibraryFileList(int idx);
}
