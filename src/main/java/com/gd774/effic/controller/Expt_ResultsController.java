package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd774.effic.service.CalendarService;
import com.gd774.effic.service.Expt_ResultsService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value="/expt_results")
@Controller
@RequiredArgsConstructor
public class Expt_ResultsController {
 private  Expt_ResultsService expt_ResultsService;
 
 @RequestMapping("/expt-main")
 public String exptMain() {
   return "/expt_results/expt-main";
 }
 
 @RequestMapping("/results-write")
 public String resultsWrite() {
   return "/expt_results/results-write";
 }
 
 
  
}