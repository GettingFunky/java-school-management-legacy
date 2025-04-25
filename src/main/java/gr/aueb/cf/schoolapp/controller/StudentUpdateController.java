package gr.aueb.cf.schoolapp.controller;

import gr.aueb.cf.schoolapp.dao.*;
import gr.aueb.cf.schoolapp.dto.*;
import gr.aueb.cf.schoolapp.exceptions.*;
import gr.aueb.cf.schoolapp.model.City;
import gr.aueb.cf.schoolapp.model.Student;
import gr.aueb.cf.schoolapp.model.Teacher;
import gr.aueb.cf.schoolapp.service.*;
import gr.aueb.cf.schoolapp.validator.StudentValidator;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet("/school-app/student/update")
public class StudentUpdateController extends HttpServlet {

    IStudentDAO studentDAO = new StudentDAOImpl();
    IStudentService studentService = new StudentServiceImpl(studentDAO);
    ICityDAO cityDAO = new CityDAOImpl();
    ICityService cityService = new CityServiceImpl(cityDAO);
    StudentUpdateDTO updateDTO;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<City> cities = null;
        Integer id = Integer.parseInt(req.getParameter("id").trim());
        try {
            cities = cityService.getAllCities();
            StudentReadOnlyDTO studentReadOnlyDTO = studentService.getStudentById(id);

// Create the correct DTO for the form
            StudentUpdateDTO dto = new StudentUpdateDTO();
            dto.setId(studentReadOnlyDTO.getId());
            dto.setFirstname(studentReadOnlyDTO.getFirstname());
            dto.setLastname(studentReadOnlyDTO.getLastname());
            dto.setFatherName(studentReadOnlyDTO.getFatherName());
            dto.setPhoneNum(studentReadOnlyDTO.getPhoneNum());
            dto.setEmail(studentReadOnlyDTO.getEmail());
            dto.setStreet(studentReadOnlyDTO.getStreet());
            dto.setStreetNum(studentReadOnlyDTO.getStreetNum());
            dto.setZipCode(studentReadOnlyDTO.getZipCode());
            dto.setCityId(studentReadOnlyDTO.getCityId());

// Προσοχή εδώ: μετατροπή LocalDate → String (ISO format)
            if (studentReadOnlyDTO.getBirthDate() != null) {
                dto.setBirthDate(LocalDate.parse(studentReadOnlyDTO.getBirthDate().toString()));
            }

            req.setAttribute("cities", cities);

            if (req.getSession().getAttribute("updateDTO") != null) {
                req.setAttribute("updateDTO", req.getSession().getAttribute("updateDTO"));
                req.getSession().removeAttribute("updateDTO");
            } else {
                req.setAttribute("updateDTO", dto); // <- Σωστό αντικείμενο
            }

            req.getRequestDispatcher("/WEB-INF/jsp/student-update.jsp").forward(req, resp);
        } catch (SQLException | StudentDAOException | StudentNotFoundException e) {
            String errorMessage = e.getMessage();
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/jsp/student-update.jsp")
                    .forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Map<String, String> errors;
        String firstnameMessage;
        String lastnameMessage;
        String fathernameMessage;
        String phoneNumMessage;
        String emailMessage;
        String streetMessage;
        String streetNumMessage;
        String zipcodeMessage;
        String cityIdMessage;
        LocalDate birthDateMessage;
        String errorMessage;
        Student student;

        // Data binding

        String idStr = (req.getParameter("id") != null) ? req.getParameter("id").trim() : "";
        Integer id = Integer.parseInt(idStr);
        String firstname = (req.getParameter("firstname") != null) ? req.getParameter("firstname").trim() : "";
        String lastname = (req.getParameter("lastname") != null) ? req.getParameter("lastname").trim() : "";
        String fathername = (req.getParameter("fathername") != null) ? req.getParameter("fathername").trim() : "";
        String phoneNum = (req.getParameter("phoneNum") != null) ? req.getParameter("phoneNum").trim() : "";
        String email = (req.getParameter("email") != null) ? req.getParameter("email").trim() : "";
        String street = (req.getParameter("street") != null) ? req.getParameter("street").trim() : "";
        String streetNum = (req.getParameter("streetNum") != null) ? req.getParameter("streetNum").trim() : "";
        String zipcode = (req.getParameter("zipcode") != null) ? req.getParameter("zipcode").trim() : "";
        Integer cityId = (req.getParameter("cityId") != null) ? Integer.parseInt(req.getParameter("cityId").trim()) : 0;
        String birthDateStr = (req.getParameter("birthDate") != null) ? req.getParameter("birthDate").trim() : "";
        LocalDate birthDate = null;
        if (!birthDateStr.isEmpty()) {
            birthDate = LocalDate.parse(birthDateStr);
        }
        updateDTO = new StudentUpdateDTO(firstname, lastname, fathername, phoneNum,
                email, street, streetNum, zipcode, cityId, birthDate, id);


        try {
            // Validate dto
            errors = StudentValidator.validate(updateDTO);
            String role = (String) req.getSession().getAttribute("role");
            if (!"ADMIN".equals(role)) {
                resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Απαγορεύεται η πρόσβαση.");
                return;
            }

            if (!errors.isEmpty()) {
                firstnameMessage = errors.getOrDefault("firstname", "");
                lastnameMessage = errors.getOrDefault("lastname", "");
                fathernameMessage = errors.getOrDefault("fathername", "");
                phoneNumMessage = errors.getOrDefault("phoneNum", "");
                // more ...

                req.getSession().setAttribute("firstnameMessage", firstnameMessage);
                req.getSession().setAttribute("lastnameMessage", lastnameMessage);

                req.getSession().setAttribute("fathernameMessage", fathernameMessage);
                req.getSession().setAttribute("phoneNumMessage", phoneNumMessage);
                req.getSession().setAttribute("updateDTO", updateDTO);
//                req.getRequestDispatcher("/WEB-INF/jsp/teacher-update.jsp")
//                        .forward(req, resp);
                resp.sendRedirect(req.getContextPath() + "/school-app/students/update?id=" + id);
                return;
            }

            // Call the service

            StudentReadOnlyDTO readOnlyDTO = studentService.updateStudent(id, updateDTO);
            HttpSession session = req.getSession(false);
            session.setAttribute("studentInfo", readOnlyDTO);
            // PRG Pattern
            resp.sendRedirect(req.getContextPath() + "/school-app/student-updated");
        } catch (StudentDAOException | StudentAlreadyExistsException | StudentNotFoundException e) {
            errorMessage = e.getMessage();
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("/WEB-INF/jsp/student-insert.jsp")
                    .forward(req, resp);
        }

//        Integer id = Integer.parseInt(req.getParameter("id").trim());
//        String firstname = req.getParameter("firstname").trim();
//        String lastname = req.getParameter("lastname").trim();
//
//        TeacherUpdateDTO updateDTO = new TeacherUpdateDTO(id, firstname, lastname);
//        Map<String, String> errors;
//        String firstnameMessage;
//        String lastnameMessage;
//        String errorMessage;
//        Teacher teacher;
//
//        try {
//            // Validate dto
//            errors = TeacherValidator.validate(updateDTO);
//
//            if (!errors.isEmpty()) {
//                firstnameMessage = errors.getOrDefault("firstname", "");
//                lastnameMessage = errors.getOrDefault("lastname", "");
//
//                req.setAttribute("firstnameMessage", firstnameMessage);
//                req.setAttribute("lastnameMessage", lastnameMessage);
//                req.setAttribute("updateDTO", updateDTO);
//                req.getRequestDispatcher("/WEB-INF/jsp/teacher-update.jsp")
//                        .forward(req, resp);
//                return;
//            }
//
//            // Call the service
//            teacher = teacherService.updateTeacher(updateDTO);
//            TeacherReadOnlyDTO readOnlyDTO = mapToReadOnlyDTO(teacher);
//            req.setAttribute("teacherInfo", readOnlyDTO);
//            req.getRequestDispatcher("/WEB-INF/jsp/teacher-updated.jsp")
//                    .forward(req, resp);
//        } catch (TeacherNotFoundException | TeacherDAOException e) {
//            errorMessage = e.getMessage();
//            req.setAttribute("errorMessage", errorMessage);
//            req.getRequestDispatcher("/WEB-INF/jsp/teacher-update.jsp")
//                    .forward(req, resp);
//        }
    }

//    private TeacherReadOnlyDTO mapToReadOnlyDTO(Teacher teacher) {
//        return new TeacherReadOnlyDTO(teacher.getId(), teacher.getFirstname(), teacher.getLastname());
//    }
}
