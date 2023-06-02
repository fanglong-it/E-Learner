/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Account {
    private int id;
    private String username;
    private String password;
    private int status;
    private String email;
    private String phone;
    private String fullname;
    private String address;
    private String avatar;
    private Role role;
//    private Timestamp created_date;
//    private Timestamp modify_date;
//    private String password_token;

//    public String getPassword_token() {
//        return password_token;
//    }
//
//    public void setPassword_token(String password_token) {
//        this.password_token = password_token;
//    }
//  
}
