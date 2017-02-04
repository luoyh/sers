package com.edu.roy.wx.web;

import java.time.Instant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

@CrossOrigin
@Controller
public class MianController {
	
	@RequestMapping("/home")
	public String index(ModelMap model) {
		model.put("timestamp", Instant.now().toEpochMilli());
		
		return "index";
	}

}
