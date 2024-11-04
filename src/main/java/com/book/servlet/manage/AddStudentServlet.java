package com.book.servlet.manage;

import com.book.service.BookService;
import com.book.service.impl.BookServiceImpl;
import com.book.utils.ThymeleafUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.thymeleaf.context.Context;

import java.io.IOException;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {

    BookService service;
    @Override
    public void init() throws ServletException {
        service = new BookServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ThymeleafUtil.process("add-student.html", new Context(), resp.getWriter());
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sid = Integer.parseInt(req.getParameter("sid"));
        String name = req.getParameter("name");
        String sex = req.getParameter("sex");
        int grade = Integer.parseInt(req.getParameter("grade"));
        String password = req.getParameter("sid");
        service.addStudent(sid, name, sex, grade, password);
        resp.sendRedirect("students");
    }
}
