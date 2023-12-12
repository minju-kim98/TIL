package com.fastcampus.ch2;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RegisterController {
	// @RequestMapping("/register/add")
//	@GetMapping("/register/add")
//	public String register() {
//		return "registerForm";
//	}
	// -> WEB-INF > spring > appServlet > servlet-context.xml 25번째 줄로 대체
	
	// @RequestMapping("/register/save", method=RequestMethod.POST) // GET 방식으로 회원가입을 못하게
	@PostMapping("/register/save") // spring 4.3부터 지원
	public String save(User user, Model m) throws Exception {
		// 1. 유효성 검사
		if(!isValid(user)) {
			
			String msg = URLEncoder.encode("id를 잘못입력하셨습니다.", "utf-8");
			
			// return "redirect:/register/add?msg="+msg;  // URL Rewriting
			m.addAttribute("msg", msg);
			return "redirect:/register/add";
		}
		
		
		// 2. DB에 신규 회원 정보 저장
		return "registerInfo";
	}

	private boolean isValid(User user) {
		return true;
	}
}
