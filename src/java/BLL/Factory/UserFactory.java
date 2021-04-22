/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL.Factory;

/**
 *
 * @author Acer
 */
public class UserFactory {
    public User getUser(String userType){
        if(userType == null){
            return null;
        }
        if(userType.equalsIgnoreCase("S")){
            return new Student();
        }
        else if(userType.equalsIgnoreCase("L")){
            return new Lecturer();
        }
        return null;
    }
}
