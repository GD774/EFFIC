package com.gd774.effic.mapper;

import com.gd774.effic.dto.UserDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
/**
 * UserMapper
 */
public interface UserMapper {
	public UserDto getUserByIdAndPw(String eid, String pw);
}
