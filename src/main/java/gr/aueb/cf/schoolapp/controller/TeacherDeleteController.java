package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.ITeacherDAO;
import gr.aueb.cf.schoolapp.dao.TeacherDAOImpl;
import gr.aueb.cf.schoolapp.exceptions.TeacherDAOException;
import gr.aueb.cf.schoolapp.service.ITeacherService;
import gr.aueb.cf.schoolapp.service.TeacherServiceImpl;
import gr.aueb.cf.schoolapp.exceptions.TeacherNotFoundException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/school-app/teachers/delete")
public class TeacherDeleteController extends HttpServlet {

    ITeacherDAO teacherDAO = new TeacherDAOImpl();
    ITeacherService teacherService = new TeacherServiceImpl(teacherDAO);
    String message = "";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String role = (String) req.getSession().getAttribute("role");
        if (!"ADMIN".equals(role)) {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Απαγορεύεται η πρόσβαση.");
            return;
        }

        try {
            teacherService.deleteTeacher(id);
            req.setAttribute("id", id);
            req.getRequestDispatcher("/WEB-INF/jsp/teacher-deleted.jsp").forward(req, resp);
        } catch (TeacherDAOException | TeacherNotFoundException e) {
            message = e.getMessage();
            req.setAttribute("message", message);
            req.getRequestDispatcher("/WEB-INF/jsp/teachers3.jsp").forward(req, resp);
        }
    }
}
