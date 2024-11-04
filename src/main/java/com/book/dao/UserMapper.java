package com.book.dao;

import com.book.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {

    @Select("select * from admin where username = #{username} and password = #{password}")
    User getUser(@Param("username") String username, @Param("password") String password);

    @Select("select * from admin where username = #{username}")
    User getUserByUsername(@Param("username") String username);

    @Select("SELECT COALESCE(MAX(id), 0) FROM admin")
    Integer getMaxId();

    @Insert("insert into admin (id, username, password, nickname) values (#{id}, #{username}, #{password}, #{nickname})")
    void insertUser(User user);
}