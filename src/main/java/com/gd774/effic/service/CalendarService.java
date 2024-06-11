package com.gd774.effic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.CalendarDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface CalendarService {
  List<CalendarDto> getAllEvents();
  int createEvent(CalendarDto calendarDto);
  int updateEvent(CalendarDto calendarDto);
  int deleteEvent(int scheduleId);
}
