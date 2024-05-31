package com.gd774.effic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.CalendarDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface CalendarService {
  List<CalendarDto> getAllEvents(HttpServletRequest request);
  int createEvent(HttpServletRequest request);
  int updateEvent(HttpServletRequest request);
  int deleteEvent(HttpServletRequest request);
}