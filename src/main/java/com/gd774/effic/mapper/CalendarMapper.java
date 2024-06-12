package com.gd774.effic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.CalendarDto;

@Mapper
public interface CalendarMapper {
    List<CalendarDto> selectAllSchedules();
    // @Insert("INSERT INTO schedule (title, start_dt, end_dt, contents, doc_state, all_day) VALUES (#{title}, #{startDt}, #{endDt}, #{contents}, #{docState}, #{allDay})")
    int insertSchedule(CalendarDto calendarDto);
    int updateSchedule(CalendarDto calendarDto);
    int deleteSchedule(int scheduleId);
}
