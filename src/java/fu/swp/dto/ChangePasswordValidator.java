/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package fu.swp.dto;

/**
 *
 * @author DW
 */
public class ChangePasswordValidator {

    private String password;
    private String newPassword;
    private String rePassword;

    public ChangePasswordValidator() {
    }

    
    public ChangePasswordValidator(String password, String newPassword, String rePassword) {
        this.password = password;
        this.newPassword = newPassword;
        this.rePassword = rePassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

}
