package com.gd774.effic.mapper;

import java.util.ArrayList;

import com.gd774.effic.dto.UserDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	public ArrayList<UserDto> getUserList();
	public int insertUser(UserDto user);
}
