package com.gd774.effic.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gd774.effic.dto.ResultsDto;

import jakarta.servlet.http.HttpServletRequest;

@Service
public interface ResultsService {

  List<ResultsDto> getAllResults(HttpServletRequest request); 
  
  
}
