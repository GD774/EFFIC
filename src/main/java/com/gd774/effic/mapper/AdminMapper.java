package com.gd774.effic.mapper;

import java.util.ArrayList;

import com.gd774.effic.dto.evo.CommCodeEvo;
import com.gd774.effic.dto.evo.DeptEvo;
import com.gd774.effic.dto.evo.UserEvo;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {
	public ArrayList<UserEvo> selectUsers();
	public ArrayList<DeptEvo> selectDepts();
	public ArrayList<CommCodeEvo> selectCommCodes(String discriminator);
	public int insertUser(UserEvo user);
	public int insertDept(DeptEvo user);
	public int insertCommCode(CommCodeEvo commcode);
	public int deleteUser(String empId);
	public int deleteDep(String code);
	public int deleteComm(String code, String catCode);
}
