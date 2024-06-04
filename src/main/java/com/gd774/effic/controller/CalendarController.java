package com.gd774.effic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gd774.effic.service.CalendarService;

import lombok.RequiredArgsConstructor;

@RequestMapping(value="/calendar")
@Controller
@RequiredArgsConstructor
public class CalendarController {
 private final CalendarService calendarService;
 
 @RequestMapping("")
 public String calendarMain() {
   return "calendar/calendar";
 }
 
  
}