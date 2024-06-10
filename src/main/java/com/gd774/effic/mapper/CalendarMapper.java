package com.gd774.effic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CalendarDto;

@Mapper
public interface CalendarMapper {
    List<CalendarDto> selectAllSchedules();
    int insertSchedule(CalendarDto calendarDto);
    int updateSchedule(CalendarDto calendarDto);
    int deleteSchedule(int scheduleId);
}
