package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.*;
import gr.aueb.cf.schoolapp.dto.StudentReadOnlyDTO;
import gr.aueb.cf.schoolapp.exceptions.StudentDAOException;
import gr.aueb.cf.schoolapp.exceptions.StudentNotFoundException;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.service.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/school-app/students/show")
public class StudentViewController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);
    String message = "";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));

        try {
            StudentReadOnlyDTO student = studentService.getStudentById(id);
            List<City> cities = cityService.getAllCities();

            req.setAttribute("student", student);
            req.setAttribute("cities", cities);

            req.getRequestDispatcher("/WEB-INF/jsp/student-view.jsp").forward(req, resp);
        } catch (StudentDAOException | StudentNotFoundException | SQLException e) {
            message = e.getMessage();
            req.setAttribute("message", message);
            req.getRequestDispatcher("/WEB-INF/jsp/students.jsp").forward(req, resp);
        }
    }
}

