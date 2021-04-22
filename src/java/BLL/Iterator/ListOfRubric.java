/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BLL.Iterator;

import BLL.Rubric;
import java.util.Vector;

/**
 *
 * @author Acer
 */
public class ListOfRubric implements Container{
    public String[] listofRubric;
    
    public ListOfRubric(String[] x){
        this.listofRubric = x;
    }
    @Override
    public Iterator getIterator() {
        return new RubricIterator();
    }
    
    private class RubricIterator implements Iterator{
        int index;

        @Override
        public boolean hasNext() {
            if(index < listofRubric.length){
                return true;
            }
            return false;
        }

        @Override
        public Object next() {
            if(this.hasNext()){
                return listofRubric[index++]; 
            }
            return null;
        }
        
    }
    
   
    
}
