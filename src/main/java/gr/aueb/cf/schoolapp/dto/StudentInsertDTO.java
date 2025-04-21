package gr.aueb.cf.schoolapp.dto;

import java.time.LocalDate;

public class StudentInsertDTO extends BaseStudentDTO {

    public StudentInsertDTO() {
    }

    public StudentInsertDTO(String firstname, String lastname, String fatherName, String phoneNum, String email,
                            String street, String streetNum, String zipCode, Integer cityId, LocalDate birthDate) {
        super(firstname, lastname, fatherName, phoneNum, email, street, streetNum, zipCode, cityId, birthDate);
    }
}
