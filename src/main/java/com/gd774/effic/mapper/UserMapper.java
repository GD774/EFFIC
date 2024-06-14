package com.gd774.effic.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd774.effic.dto.UserDto;

@Mapper
/**
 * UserMapper
 */
public interface UserMapper {
	public UserDto getUserByIdAndPw(String empId, String pw);
}
