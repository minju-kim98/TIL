package com.fastcampus.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//1. 원격 호출 가능한 프로그램으로 등록
@Controller
public class Hello {
	int iv = 10;	// 인스턴스 변수
	static int cv = 20; // static 변수
	
	// 2. URL과 메서드 연결(매핑, Mapping)
	@RequestMapping("/hello")
	public void main() { // 인스턴스 메서드 - iv, cv 둘 다 사용 가능 : 이걸로 사용하는 것이 좋음
		// static 메서드로 사용해도 가능은 함
		// priviate로 호출해도 가능은 함
			// Reflection API를 사용해서 가능 - 클래스 정보를 얻고 다룰 수 있는 강력한 기능 제공
		System.out.println("Hello");
	}
	
	public static void main2() { // static 메서드 - cv만 사용 가능
		
	}
}
