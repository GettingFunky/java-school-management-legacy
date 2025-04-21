package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
public class TeacherReadOnlyDTO extends BaseTeacherDTO {
    private Integer id;
    private String uuid;

    public TeacherReadOnlyDTO() {

    }

    public TeacherReadOnlyDTO(Integer id, String uuid, String firstname, String lastname, String vat,
                              String fatherName, String phoneNum, String email, String street,
                              String streetNum, String zipCode, Integer cityId) {
        super(firstname, lastname, vat, fatherName, phoneNum, email, street, streetNum, zipCode, cityId);
        this.id = id;
        this.uuid = uuid;
    }

    @Override
    public String toString() {
        return "TeacherReadOnlyDTO{" +
                "id=" + id +
                ", uuid='" + uuid + '\'' +
                '}';
    }
}
