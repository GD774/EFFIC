package com.gd774.effic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.CalendarDto;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class CalendarServiceImpl implements CalendarService {

  @Override
  public List<CalendarDto> getAllEvents(HttpServletRequest request) {
 
    return null;
  }

  @Override
  public int createEvent(HttpServletRequest request) {
   
    return 0;
  }

  @Override
  public int updateEvent(HttpServletRequest request) {
  
    return 0;
  }

  @Override
  public int deleteEvent(HttpServletRequest request) {
    
    return 0;
  }

}