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
public interface User {
    String login(String x,String y);
    User getUserDetails(String x);   
}
