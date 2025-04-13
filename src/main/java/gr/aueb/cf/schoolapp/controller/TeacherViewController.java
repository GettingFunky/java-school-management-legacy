package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.CityDAOImpl;
import gr.aueb.cf.schoolapp.dao.ICityDAO;
import gr.aueb.cf.schoolapp.dao.ITeacherDAO;
import gr.aueb.cf.schoolapp.dao.TeacherDAOImpl;
import gr.aueb.cf.schoolapp.dto.TeacherReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.TeacherDAOException;
import gr.aueb.cf.schoolapp.exceptions.TeacherNotFoundException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.CityServiceImpl;
import gr.aueb.cf.schoolapp.service.ICityService;
import gr.aueb.cf.schoolapp.service.ITeacherService;
import gr.aueb.cf.schoolapp.service.TeacherServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/school-app/teachers/show")
public class TeacherViewController extends HttpServlet {

    ITeacherDAO teacherDAO = new TeacherDAOImpl();
    ITeacherService teacherService = new TeacherServiceImpl(teacherDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);
    String message = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            TeacherReadOnlyDTO teacher = teacherService.getTeacherById(id);
            List<City> cities = cityService.getAllCities();

            req.setAttribute("teacher", teacher);
            req.setAttribute("cities", cities);

            req.getRequestDispatcher("/WEB-INF/jsp/teacher-view2.jsp").forward(req, resp);
        } catch (TeacherDAOException | TeacherNotFoundException | SQLException e) {
            message = e.getMessage();
            req.setAttribute("message", message);
            req.getRequestDispatcher("/WEB-INF/jsp/teachers3.jsp").forward(req, resp);
        }
    }
}
