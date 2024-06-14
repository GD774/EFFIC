package com.gd774.effic.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.gd774.effic.dto.CalendarDto;
import com.gd774.effic.mapper.CalendarMapper;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

    private final CalendarMapper calendarMapper;

    @Override
    public List<CalendarDto> getAllEvents() {
        return calendarMapper.selectAllSchedules();
    }

    @Override
    public int createEvent(CalendarDto calendarDto) {
      System.out.println("서비스 통과");
        if (calendarDto.getTitle() == null || calendarDto.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("제목은 필수 입력 사항입니다.");
        }
        return calendarMapper.insertSchedule(calendarDto);
    }

    @Override
    public int updateEvent(CalendarDto calendarDto) {
        if (calendarDto.getTitle() == null || calendarDto.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("제목은 필수 입력 사항입니다.");
        }
        return calendarMapper.updateSchedule(calendarDto);
    }

    @Override
    public int deleteEvent(int scheduleId) {
        return calendarMapper.deleteSchedule(scheduleId);
    }
}
