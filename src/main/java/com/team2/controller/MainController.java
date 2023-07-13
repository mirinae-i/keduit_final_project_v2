package com.team2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
@Slf4j
public class MainController {
	
	@GetMapping("/info/AED")
	public void AED() {
		log.info("AED!!!");

	}
	
	@GetMapping("/info/ash")
	public void ash() {
		log.info("ash!!!");

	}

	@GetMapping("/info/cold_wave")
	public void cold_wave() {
		log.info("coldwave!!!");

	}

	@GetMapping("/info/collapse_building")
	public void collapse_building() {
		log.info("collapse_building!!!");

	}

	@GetMapping("/info/CPR")
	public void CPR() {
		log.info("CPR!!!");

	}

	@GetMapping("/info/DP")
	public void DP() {
		log.info("DP!!!");

	}
	@GetMapping("/info/drought")
	public void drought() {
		log.info("drought!!!");

	}

	
	@GetMapping("/info/earthquake")
	public void earthquake() {
		log.info("earthquake!!!");

	}

	@GetMapping("/info/EP")
	public void EP() {
		log.info("EP!!!");

	}

	@GetMapping("/info/fire")
	public void fire() {
		log.info("fire!!!");

	}

	@GetMapping("/info/fire_hydrant")
	public void fire_hydrant() {
		log.info("fire_hydrant!!!");

	}
	
	@GetMapping("/info/first_aid")
	public void first_aid() {
		log.info("first_aid!!!");

	}
	@GetMapping("/info/heat_wave")
	public void heat_wave() {
		log.info("heat_wave!!!");

	}
	@GetMapping("/info/heavy_snow")
	public void heavy_snow() {
		log.info("heavy_snow");

	}
	@GetMapping("/info/infectious_diseases")
	public void infectious_diseases() {
		log.info("infectious_disease!!!");
		
	
	}
	
	@GetMapping("/info/landslide")
	public void landslide() {
		log.info("landslide!!!");
		

	}
	
	@GetMapping("/info/lightning")
	public void lightning() {
		log.info("lightning!!!");
		

	}
	@GetMapping("/info/subway_accident")
	public void subway_accident() {
		log.info("subway_accident!!!");
		

	}
	

	@GetMapping("/info/terrorism")
	public void terrorism() {
		log.info("terrorism!!!");
		

	}
	

	@GetMapping("/info/typhoon_heavyRain")
	public void typhoon_heavyRain() {
		log.info("typhoon_heavyRain!!!");
		

	}
	

	@GetMapping("/info/yellow_sand")
	public void yellow_sand() {
		log.info("yellow_sand!!!");
		

	}
	
	@GetMapping("/info/fire_extinguisher")
	public void fire_extinguisher() {
		log.info("fire_extinguisher!!!");
		

	}

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
