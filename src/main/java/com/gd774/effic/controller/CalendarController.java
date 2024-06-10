package com.gd774.effic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gd774.effic.dto.CalendarDto;
import com.gd774.effic.service.CalendarService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    private final CalendarService calendarService;

    @Autowired
    public CalendarController(CalendarService calendarService) {
        this.calendarService = calendarService;
    }

    @GetMapping
    public String calendarMain() {
        return "calendar/calendar"; // JSP 경로
    }

    @GetMapping("/events")
    public List<CalendarDto> getAllEvents() {
        return calendarService.getAllEvents();
    }

    @PostMapping("/create")
    public ResponseEntity<String> createEvent(CalendarDto calendarDto) {
        if (calendarDto.getTitle() == null || calendarDto.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("제목은 필수 입력 사항입니다.");
        }
        if (calendarDto.getScheduleId() == 0) {
            calendarService.createEvent(calendarDto);
        } else {
            calendarService.updateEvent(calendarDto);
        }
        return ResponseEntity.ok("Event saved successfully");
    }

    @PostMapping("/delete")
    public ResponseEntity<String> deleteEvent(CalendarDto calendarDto) {
        calendarService.deleteEvent(calendarDto.getScheduleId());
        return ResponseEntity.ok("일정 등록 성공");
    }
}
