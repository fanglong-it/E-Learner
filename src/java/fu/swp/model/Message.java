/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.model;

import java.io.Serializable;
import java.util.Date;
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
public class Message implements Serializable {

    private int id;
    private String content;
    private String resourcePathFile;
    private Account account;
    private int groupId;
    private Date dateSended;
}
