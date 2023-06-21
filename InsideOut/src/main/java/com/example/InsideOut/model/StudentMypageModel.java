package com.example.InsideOut.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("student")
public class StudentMypageModel {
	
		private int booking_No;
	    private String student_No;
	    private int counsel_TypeNo;
	    private String counsel_Request_Content;
	    private String booking_Dt;
	    private String booking_Time;
	    private String confirm_Dt;
	    private String confirm_Time;
	    private String staff_No;
	    
	    private String student_name;
	    private String staff_name;
	    
	    private String cd;
	    private String cd_nm;
	}



