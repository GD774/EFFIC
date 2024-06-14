package com.gd774.effic.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd774.effic.dto.CalendarDto;
import com.gd774.effic.service.CalendarService;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    private final CalendarService calendarService;

    @Autowired
    public CalendarController(CalendarService calendarService) {
        this.calendarService = calendarService;
    }

    @GetMapping("")
    public String calendarMain() {
        return "calendar/calendar"; // JSP 경로
    }

    @GetMapping("/events")
    @ResponseBody
    public List<CalendarDto> getAllEvents() {
        return calendarService.getAllEvents();
    }

    @PostMapping("/create")
    @ResponseBody
    public Map<String, Object> createEvent(@RequestBody CalendarDto calendarDto) {
        Map<String, Object> response = new HashMap<>();
        System.out.println("Received CalendarDto: " + calendarDto); // 디버깅용 로그
        
        if (calendarDto.getTitle() == null || calendarDto.getTitle().trim().isEmpty()) {
            response.put("status", "error");
            response.put("message", "제목은 필수 입력 사항입니다.");
            return response;
        }

        try {
            if (calendarDto.getScheduleId() == 0) {
                calendarService.createEvent(calendarDto);
                response.put("status", "success");
                response.put("message", "Event created successfully");
                System.out.println("성공적으로 보냄");
            } else {
                calendarService.updateEvent(calendarDto);
                response.put("status", "success");
                response.put("message", "Event updated successfully");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "An error occurred: " + e.getMessage());
        }

        return response;
    }
    
    @PostMapping("/update")
    public ResponseEntity<Map<String, Object>> updateEvent(@RequestBody CalendarDto calendarDto) {
        Map<String, Object> response = new HashMap<>();
        try {
            calendarService.updateEvent(calendarDto);
            response.put("status", "success");
            response.put("message", "Event updated successfully");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "An error occurred: " + e.getMessage());
        }
        return ResponseEntity.ok(response);
    }
    
    
    

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteEvent(@RequestBody CalendarDto calendarDto) {
        Map<String, Object> response = new HashMap<>();
        try {
            calendarService.deleteEvent(calendarDto.getScheduleId());
            response.put("status", "success");
            response.put("message", "일정 삭제 성공");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "An error occurred: " + e.getMessage());
        }
        return response;
    }
}
