package gr.aueb.cf.schoolapp.dto;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Setter
@Getter
public class StudentReadOnlyDTO extends BaseStudentDTO {
    private Integer id;
    private String uuid;

    public StudentReadOnlyDTO() {}

    public StudentReadOnlyDTO(String firstname, String lastname, String fatherName, String phoneNum,
                              String email, String street, String streetNum, String zipCode,
                              Integer cityId, LocalDate birthDate, Integer id, String uuid) {
        super(firstname, lastname, fatherName, phoneNum, email, street, streetNum, zipCode, cityId, birthDate);
        this.id = id;
        this.uuid = uuid;
    }

    @Override
    public String toString() {
        return "StudentReadOnlyDTO{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                '}';
    }
}
