/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
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
public class Lesson implements Serializable{
    private int id;
    private String lessonName;
    private int status;
    private String description;
    private String videoUrl;
    private int courseId;
}
