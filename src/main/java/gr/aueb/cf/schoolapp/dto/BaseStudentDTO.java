package gr.aueb.cf.schoolapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public abstract class BaseStudentDTO {
    private String firstname;
    private String lastname;
    private String fatherName;
    private String phoneNum;
    private String email;
    private String street;
    private String streetNum;
    private String zipCode;
    private Integer cityId;
    private LocalDate birthDate;

    @Override
    public String toString() {
        return "BaseStudentDTO{" +
                "firstname='" + firstname + '\'' +
                ", lastname='" + lastname + '\'' +
                ", fatherName='" + fatherName + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", email='" + email + '\'' +
                ", street='" + street + '\'' +
                ", streetNum='" + streetNum + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", cityId=" + cityId +
                ", birthDate=" + birthDate +
                '}';
    }


}


