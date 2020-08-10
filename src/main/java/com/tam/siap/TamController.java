package com.tam.siap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class TamController {

	@GetMapping("/tams")
	public String greeting() {
		return "tams";
	}

//	@PostMapping("/login")
//	public String loginSubmit(@ModelAttribute Login greeting) {
//		return "result";
//	}

}