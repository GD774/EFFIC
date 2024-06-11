package com.gd774.effic.dto;

import com.gd774.effic.dto.UserDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AttendeeDto {
  private RoomReserveDto reserveId;
  private UserDto attendee;
}
