package com.cms.dto.doctor;

import com.cms.dto.common.ResponseApiCode;
import lombok.Data;

/**
 * @author : JB
 * @packageName : com.jaseng.dto.doctor
 * @fileName : DoctorApi
 * @description :
 * @since : 2023-06-27
 */

@Data
public class DoctorApi extends ResponseApiCode {

    private int doctorIdx;
    private String doctorName;
    private String doctorSabun;
    private String doctorSabunNew;
    private String useYN;

    public DoctorApi(int doctorIdx, String doctorName, String doctorSabun, String doctorSabunNew, String useYN) {
        this.doctorIdx = doctorIdx;
        this.doctorName = doctorName;
        this.doctorSabun = doctorSabun;
        this.doctorSabunNew = doctorSabunNew;
        this.useYN = useYN;
    }
}
