package com.fastcampus.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//1. ���� ȣ�� ������ ���α׷����� ���
@Controller
public class Hello {
	int iv = 10;	// �ν��Ͻ� ����
	static int cv = 20; // static ����
	
	// 2. URL�� �޼��� ����(����, Mapping)
	@RequestMapping("/hello")
	public void main() { // �ν��Ͻ� �޼��� - iv, cv �� �� ��� ���� : �̰ɷ� ����ϴ� ���� ����
		// static �޼���� ����ص� ������ ��
		// priviate�� ȣ���ص� ������ ��
			// Reflection API�� ����ؼ� ���� - Ŭ���� ������ ��� �ٷ� �� �ִ� ������ ��� ����
		System.out.println("Hello");
	}
	
	public static void main2() { // static �޼��� - cv�� ��� ����
		
	}
}
