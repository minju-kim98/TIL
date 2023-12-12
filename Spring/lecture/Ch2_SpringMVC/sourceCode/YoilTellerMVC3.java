package com.fastcampus.ch2;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@Controller
public class YoilTellerMVC3 {
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex) {
		ex.printStackTrace();
		return "yoilError";
	}
	
    @RequestMapping("/getYoilMVC3") // http://localhost:8080/ch2/getYoilMVC3?year=2021&month=10&day=1

    public String main(@ModelAttribute Mydate date, Model model) throws IOException {
    
    	if(!isValid(date))
    		return "yoilError";
        
        return "yoil2";
    }

	private @ModelAttribute("yoil") char getYoil(Mydate date) {
		return getYoil(date.getYear(), date.getMonth(), date.getDay());
	}

	private boolean isValid(Mydate date) {
		return isValid(date.getYear(), date.getMonth(), date.getDay());
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
        return " 일월화수목금토".charAt(dayOfWeek);   // 일요일:1, 월요일:2, ... 
	}
}