/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
import java.sql.Date;
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
public class Notification implements Serializable{
    private int id;
    private String content;
    private Account account;
    private Date dateCreate;
}
