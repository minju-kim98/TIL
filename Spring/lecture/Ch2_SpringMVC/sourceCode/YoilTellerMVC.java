package com.fastcampus.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
public class YoilTellerMVC {
    @RequestMapping("/getYoilMVC") // http://localhost:8080/ch2/getYoilMVC?year=2021&month=10&day=1
    //    public static void main(String[] args) {
//    public void main(HttpServletRequest request, HttpServletResponse response) throws IOException {
    public String main(int year, int month, int day, Model model) throws IOException {
    
//        // 1. 입력
    	
    	// 유효성 검사
    	if(!isValid(year, month, day))
    		return "yoilError";
    		
        // 2. 처리
        char yoil = getYoil(year, month, day);
        
        model.addAttribute("year", year);
        model.addAttribute("month", month);
        model.addAttribute("day", day);
        model.addAttribute("yoil", yoil);
        
        
        return "yoil"; // /WEB-INF/views/yoil.jsp

//        // 3. 출력 - 별도의 jsp 파일로 빼놓기
//        // src > main > webapp > WEB-INF > views
    }

	private boolean isValid(int year, int month, int day) {
		// TODO Auto-generated method stub
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
        return " 일월화수목금토".charAt(dayOfWeek);   // 일요일:1, 월요일:2, ... 
	}
}