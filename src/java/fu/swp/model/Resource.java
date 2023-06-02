/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
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
public class Resource implements Serializable{
    private int id;
    private String resourceName;
    private String description;
    private String resourcePath;
    private Lesson lesson;
}
