package com.example.InsideOut.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;

import com.example.InsideOut.dao.UserRepository;
import com.example.InsideOut.model.DeptBean;
import com.example.InsideOut.model.LoginRequestDto;
import com.example.InsideOut.model.MemberBean;
import com.example.InsideOut.model.StaffBean;
import com.example.InsideOut.model.StudentBean;
import com.example.InsideOut.service.MemberServiceImpl;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	private final MemberServiceImpl memberService;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping({"/",""})
	public String sssss() {
		return "member/loginForm";
	}
	
	@GetMapping("/joinSelect")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	@GetMapping("/joinForm")
	public String joinForm(Model model, String mem_type) {
		model.addAttribute("mem_type", mem_type);
		
		return "member/joinForm";
	}
	
	@PostMapping("/join")
	public String join(MemberBean member, String mem_type, DeptBean dept, StudentBean stu, StaffBean sta) {
		System.out.println("join");
		member.setPassword(bCryptPasswordEncoder.encode(member.getPassword()));
		memberService.memInsert(member);
		
		if(mem_type.equals("0100")) {
			member.setRole("ROLE_STUDENT");
			memberService.stuInsert(stu);
			
		}else if(mem_type.equals("0200")){
			member.setRole("ROLE_STAFF");
			memberService.staInsert(sta);
		}
		
		memberService.deptInsert(dept);
		
		System.out.println("member: "+member);
		
		return "member/loginForm";
	}

	
}
