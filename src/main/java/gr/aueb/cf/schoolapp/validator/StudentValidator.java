package gr.aueb.cf.schoolapp.validator;

import gr.aueb.cf.schoolapp.dto.BaseStudentDTO;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class StudentValidator<T> {

    private StudentValidator() {

    }

    public static <T extends BaseStudentDTO> Map<String, String> validate(T dto) {
        Map<String, String> errors = new HashMap<>();

        if (dto.getFirstname().length() < 2 || dto.getFirstname().length() > 32) {
            errors.put("firstname", "Το όνομα πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getFirstname().matches("^.*\\s+.*$")) {
            errors.put("firstname", "Το όνομα δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getLastname().length() < 2 || dto.getLastname().length() > 32) {
            errors.put("lastname", "Το επώνυμο πρέπει να είναι 2 και 32 χαρακτήρες");
        }

        if (dto.getLastname().matches("^.*\\s+.*$")) {
            errors.put("lastname", "Το επώνυμο δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getFatherName().length() < 2 || dto.getFatherName().length() > 32) {
            errors.put("fathername", "Το Επώνυμο Πατρός πρέπει να είναι μεταξύ 2 και 32 ψηφία");
        }

        if (dto.getFatherName().matches("^.*\\s+.*$")) {
            errors.put("fathername", "Το Επώνυμο Πατρός δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getPhoneNum().length() < 8 || dto.getPhoneNum().length() > 15) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου πρέπει να είναι μεταξύ 8 και 15 ψηφία");
        }

        if (dto.getPhoneNum().matches("^.*\\s+.*$")) {
            errors.put("phoneNum", "Ο Αριθμός Τηλεφώνου δεν πρέπει να περιλαμβάνει κενά");
        }

        if (dto.getBirthDate() == null) {
            errors.put("birthDate", "Η ημερομηνία γέννησης είναι υποχρεωτική.");
        } else if (dto.getBirthDate().isBefore(LocalDate.of(1900, 1, 1))) {
            errors.put("birthDate", "Η ημερομηνία γέννησης δεν μπορεί να είναι πριν το 1900.");
        } else if (dto.getBirthDate().isAfter(LocalDate.of(2025, 1, 1))) {
            errors.put("birthDate", "Η ημερομηνία γέννησης πρέπει να είναι μεταξύ 1900 και 2024");
        }

        return errors;
    }
}

