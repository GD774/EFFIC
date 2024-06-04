package com.gd774.effic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CalendarDto;

@Mapper
public interface CalendarMapper {
  
  List<CalendarDto> getAllEvents(int userId);
  int createEvent(CalendarDto calendarDto);
  int updateEvent(CalendarDto calendarDto);
  int deleteEvent(int scheduleId);
  
}