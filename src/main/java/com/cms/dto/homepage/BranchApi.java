package com.cms.dto.homepage;

import com.cms.dto.common.ResponseApiCode;
import lombok.Data;

/**
 * @author : JB
 * @packageName : com.jaseng.dto.homepage
 * @fileName : BranchApi
 * @description :
 * @since : 2023-06-27
 */
@Data
public class BranchApi extends ResponseApiCode {
    private String branchCode;
    private String branchName;
    private String branchAddress;
    private String branchEngName;
    private String branchDomain;
    private String hospitalType;
    private String imgCI;
    private int orderSeq;
    private String statusYN;


    public BranchApi(String branchCode, String branchName, String branchAddress, String branchEngName,
                     String branchDomain, String hospitalType, String imgCI, int orderSeq, String statusYN) {
        this.branchCode = branchCode;
        this.branchName = branchName;
        this.branchAddress = branchAddress;
        this.branchEngName = branchEngName;
        this.branchDomain = branchDomain;
        this.hospitalType = hospitalType;
        this.imgCI = imgCI;
        this.orderSeq = orderSeq;
        this.statusYN = statusYN;
    }
}
