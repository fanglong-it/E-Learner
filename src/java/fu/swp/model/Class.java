/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author DW
 */
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Class implements Serializable{
    private int id;
    private String className;
    private int maxStudent;
    private Account account;
    private Date dateCreate;
    private String image;
    private int status;
    private Course course;
}
