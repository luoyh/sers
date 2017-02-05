package com.edu.roy.wx.web;

import java.time.Instant;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.http.ResponseEntity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.PrintWriter;
import java.io.IOException;
import org.springframework.web.bind.annotation.PathVariable;

@CrossOrigin
@Controller
public class MianController {

	private static Logger log = LoggerFactory.getLogger(MianController.class);
	
	@RequestMapping("/home")
	public String index(ModelMap model) {
		System.out.println("hello world!!!");
		model.put("timestamp", Instant.now().toEpochMilli());
		
		return "index";
	}

	@RequestMapping("/{path}/go")
	public String g(@PathVariable("path") String path) {
		log.info("go path {}", path);
		return path.replaceAll("\\.", "/");
	}

	@RequestMapping(value = "/man")
	public void man(@RequestBody(required = false) String body,
									String echostr, 
									String signature,
									String timestamp,
									String nonce,
									HttpServletRequest request, HttpServletResponse response) {
		log.info("{},{},{},{},{},{}",request.getMethod(), body, echostr, signature, timestamp, nonce);
		if ("GET".equalsIgnoreCase(request.getMethod())) {
			try (PrintWriter writer = response.getWriter()) {
				writer.print(echostr);
			} catch(IOException ex) {}
		} else {
		}
	}

}
