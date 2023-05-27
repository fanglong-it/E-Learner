/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString

public class RegistrationBuilder {
    private int regisId;
    private String regisDate;
    private boolean status;
    private Subject subject;
    private int subjectId;
    private PricePackage pricePackage;
    private int pricePackageId;
    private Account account;
    private int accountId;
    int year;
}
