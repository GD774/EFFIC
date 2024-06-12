package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd774.effic.service.CalendarService;
import com.gd774.effic.service.ResultsService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value="/results")
@Controller
@RequiredArgsConstructor
public class ResultsController {
 private  ResultsService resultsService;
 
 @RequestMapping("/results-main")
 public String ResultsMain() {
   return "results/results-main";
 }

 @RequestMapping("/results-state")
 public String resultState() {
   return "results/results-state";
 }
  
 @RequestMapping("/personal-results")
 public String personalResults() {
   return "results/personal-results";
 }
 
}