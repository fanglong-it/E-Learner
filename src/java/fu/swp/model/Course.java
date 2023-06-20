/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author DW
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Course implements Serializable {

    private int id;
    private String courseName;
    private int status;
    private String image;
    private String description;
    private Date createDate;
    private Account account;
    private List<Account> teachers;
}
