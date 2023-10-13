package com.cms.dao.homepage;

import java.util.List;

import com.cms.dto.homepage.Branch;

public interface BranchDao {

	public List<Branch> getBranchList();
	
	public Branch getBranch(int idx);
	
	public void setBranch(Branch branch);
	
	public void modifyBranch(Branch branch);
}
