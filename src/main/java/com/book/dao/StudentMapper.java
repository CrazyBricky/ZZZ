package com.book.dao;

import com.book.entity.Student;
import com.book.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StudentMapper {
    @Select("select * from student")
    List<Student> getStudentList();

    @Select("SELECT * FROM student WHERE name = #{username} AND password = #{password}")
    User getStudent(@Param("username") String username, @Param("password") String password);

    @Insert("insert into student (sid, name, sex, grade, password) values (#{sid}, #{name}, #{sex}, #{grade}, #{password})")
    void addStudent(@Param("sid") int sid,@Param("name") String name,@Param("sex") String sex,@Param("grade") int grade, @Param("password") String password);
}
