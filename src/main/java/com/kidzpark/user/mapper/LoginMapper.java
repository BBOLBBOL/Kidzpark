package com.kidzpark.user.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.kidzpark.user.domain.UserVo;

@Mapper
public interface LoginMapper {

	int idCheck(String u_id);

	int NCheck(String u_nickname);

	int ECheck(String u_email);

	void insertJoin1(HashMap<String, Object> map);

	void insertJoin2(HashMap<String, Object> map);

	UserVo login(UserVo vo);

	void updatePw(UserVo vo);

	int pCheck(String u_phone);

    void updateUser(UserVo vo);

	void updateGrade(UserVo loginVo);

	
}
