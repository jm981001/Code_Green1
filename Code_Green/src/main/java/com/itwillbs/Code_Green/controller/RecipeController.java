package com.itwillbs.Code_Green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RecipeController {
	
	@RequestMapping(value = "recipe_main", method = RequestMethod.GET)
	public String recipe_main() {
		return "recipe/recipe_main";
	}

	@RequestMapping(value = "recipe_detail", method = RequestMethod.GET)
	public String recipe_detail() {
		return "recipe/recipe_detail";
	}
	
	@RequestMapping(value = "recipe_form", method = RequestMethod.GET)
	public String recipe_form() {
		return "recipe/recipe_form";
	}
}
