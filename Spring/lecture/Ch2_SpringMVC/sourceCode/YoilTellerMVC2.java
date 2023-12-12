package com.fastcampus.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
public class YoilTellerMVC2 {
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex) {
		ex.printStackTrace();
		return "yoilError";
	}
	
    @RequestMapping("/getYoilMVC2") // http://localhost:8080/ch2/getYoilMVC2?year=2021&month=10&day=1
    public ModelAndView main(@RequestParam(required=true) int year, 
    				@RequestParam(required=true) int month, 
    				@RequestParam(required=true)int day) throws IOException {
    	//1. ModelAndView�� �����ϰ�, �⺻ �並 ����
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("yoilError");
    	
    	//2. ��ȿ�� �˻�
    	if(!isValid(year, month, day))
    		return mv;
    	
    	//3. �۾�
        char yoil = getYoil(year, month, day);
        
        //4. ModelAndView�� �۾��� ����� ����
        mv.addObject("year", year);
        mv.addObject("month", month);
        mv.addObject("day", day);
        mv.addObject("yoil", yoil);
        
        //5. �۾� ����� ������ ���� �̸��� ����
        mv.setViewName("yoil");
        
        //6. ModelAndView�� ��ȯ
        return mv; 
    }

	private boolean isValid(int year, int month, int day) {
		try {
			SimpleDateFormat  dateFormat = new  SimpleDateFormat("yyyy-MM-dd");
	
	        dateFormat.setLenient(false);
	        dateFormat.parse(year + "-" + month + "-" + day);
	        return  true;
	
		} catch (ParseException  e){
			return  false;
	    }
	}
	

	private char getYoil(int year, int month, int day) {
		Calendar cal = Calendar.getInstance();
        cal.set(year, month - 1, day);

        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        return " �Ͽ�ȭ�������".charAt(dayOfWeek);   // �Ͽ���:1, ������:2, ... 
	}
}