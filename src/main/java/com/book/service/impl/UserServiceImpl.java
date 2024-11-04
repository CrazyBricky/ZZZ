package com.book.service.impl;

import com.book.dao.StudentMapper;
import com.book.dao.UserMapper;
import com.book.entity.User;
import com.book.service.UserService;
import com.book.utils.MybatisUtil;
import jakarta.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;

public class UserServiceImpl implements UserService {

    @Override
    public boolean auth(String username, String password, String role, HttpSession session) {
        try (SqlSession sqlSession = MybatisUtil.getSession()){
            if ("admin".equals(role)) {
                UserMapper adminMapper = sqlSession.getMapper(UserMapper.class);
                User admin = adminMapper.getUser(username, password);
                if (admin == null) return false;
                session.setAttribute("user", admin);
            } else {
                StudentMapper studentMapper = sqlSession.getMapper(StudentMapper.class);
                User student = studentMapper.getStudent(username, password);
                if (student == null) return false;
                session.setAttribute("user", student);
            }
            return true;
        }
    }

}
