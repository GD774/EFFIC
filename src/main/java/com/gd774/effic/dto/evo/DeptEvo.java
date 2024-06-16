package com.gd774.effic.dto.evo;

import com.gd774.effic.mapper.ObjectMapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class DeptEvo {
	private String code, name;
	private int level;
	private DeptEvo parent;
}
