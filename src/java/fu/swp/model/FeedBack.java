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
public class FeedBack implements Serializable{
    private int id;
    private int star;
    private String content;
    private Date date;
    private int userId;
}


