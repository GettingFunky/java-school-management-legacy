package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import lombok.Setter;

import java.time.LocalDate;

@AllArgsConstructor
@Getter
@Setter

public class StudentUpdateDTO extends BaseStudentDTO{
    private Integer id;

    public StudentUpdateDTO() {
    }

    public StudentUpdateDTO(String firstname, String lastname, String fatherName, String phoneNum,
                            String email, String street, String streetNum, String zipCode,
                            Integer cityId, LocalDate birthDate, Integer id) {
        super(firstname, lastname, fatherName, phoneNum, email, street, streetNum, zipCode, cityId, birthDate);
        this.id = id;
    }

    @Override
    public String toString() {
        return "StudentUpdateDTO{" +
                "id=" + id +
                '}' + super.toString();
    }
}
