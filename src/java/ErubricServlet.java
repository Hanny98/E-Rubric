/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import BLL.Factory.Lecturer;
import BLL.Factory.Student;
import BLL.Factory.User;
import BLL.Factory.UserFactory;
import BLL.Rubric;
import BLL.Subject;
import DLL.JdbcUtility;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
@WebServlet(urlPatterns = {"/UI/ErubricServlet"})
public class ErubricServlet extends HttpServlet {

     // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public void init() throws ServletException{}
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        JdbcUtility newJdbcUtility = new JdbcUtility();
        Rubric newRubric = new Rubric();
        if(action.equals("UPLOAD")){
            ArrayList<Rubric> rubricList = newRubric.getListofRubricName();
            session.setAttribute("listOfRubric", rubricList);
            RequestDispatcher rd = request.getRequestDispatcher("/UI/ChooseRubric.jsp");
            rd.forward(request, response);
        }
        else if(action.equals("LOGOUT")){
            session.invalidate();
            RequestDispatcher rd = request.getRequestDispatcher("/UI/Login.jsp");
            rd.forward(request, response);
        }
        else if(action.equals("VIEW")){
            RequestDispatcher rd = request.getRequestDispatcher("/UI/ChooseRubric.jsp");
            rd.forward(request, response);
        }
        else if(action.equals("UPDATE")){
            String rubricID = request.getParameter("ID");
            String editable = request.getParameter("edit");
            System.out.println("Rubric ID selected: "+rubricID);
            Subject newSubject = new Subject();
            ArrayList<Subject> subjectList = newSubject.getSubjectList();
            Rubric selectedRubric = newRubric.getRubricDetails(rubricID);
            for(Subject x: subjectList){
                System.out.print(x.getSubjectCode());
            }
            session.setAttribute("selectedRubric", selectedRubric);
            session.setAttribute("subjectList", subjectList);
            if(editable.equals("TRUE")){
                RequestDispatcher rd = request.getRequestDispatcher("/UI/EditRubricDetails.jsp");
                rd.forward(request, response);
            }
            else if(editable.equals("FALSE")){
                RequestDispatcher rd = request.getRequestDispatcher("/UI/UploadRubricWithNewSubjectCodeAndSubjectName.jsp");
                rd.forward(request, response);
            }
            
        }
        else if(action.equals("DELETE")){
            String rubricID = request.getParameter("ID");
            System.out.println("Rubric ID selected: "+rubricID);
            Rubric deletedRubric = new Rubric();
            deletedRubric.deleteRubric(rubricID);
            out.println("<script>");
            out.println("    alert('Delete Rubric Successfully');");
            out.println("    window.location = '/SAErubricWithUI2/UI/ErubricServlet?action=UPLOAD'");
            out.println("</script>");
        }
        else if(action.equals("SUBINSERT")){
            RequestDispatcher rd = request.getRequestDispatcher("/UI/SubjectCodeAndSubjectNameForm.jsp");
            rd.forward(request, response);
        }
        else if(action.equals("SUBJECTLIST")){
            ArrayList<Subject> subject = new ArrayList<Subject>();
            User loginUser = (User)session.getAttribute("userInfo");
            String acidID = ((Student)loginUser).getStudentID();
            Student student1 = new Student();
            Student student = (Student) student1.getUserDetails(acidID);
            Subject sub1 = new Subject();
            Subject sub2 = new Subject();
            Subject sub3 = new Subject();
            if(student.getCourse().equals("Software Engineering")){
                sub1.setSubjectCode("SCSJ-1102");
                sub1.setSubjectName("PT2");
                sub2.setSubjectCode("SCSJ-3553");
                sub2.setSubjectName("AI");
                sub3.setSubjectCode("SCSJ-3343");
                sub3.setSubjectName("SDA");
                subject.add(sub1);
                subject.add(sub2);
                subject.add(sub3);
            }
            else{
                sub1.setSubjectCode("SCSJ-3343");
                sub1.setSubjectName("SDA");
                sub2.setSubjectCode("UKQE-3001");
                sub2.setSubjectName("EXCEL");
                sub3.setSubjectCode("ULAB-3162");
                sub3.setSubjectName("ENG");
                subject.add(sub1);
                subject.add(sub2);
                subject.add(sub3);
            }
            session.setAttribute("student", student);
            session.setAttribute("subject", subject); 
            ArrayList<Rubric> rubricList = newRubric.getListofRubricName();
            String[] rubricIDList = new String[subject.size()];
            String[] rubricNameList = new String[subject.size()];
            int num = 0;
            int reverseArrayCounter = rubricList.size() - 1;
            for(Subject x: subject){
                for (int i = reverseArrayCounter; i >= 0; i--) {
                    if(x.getSubjectCode().equals(rubricList.get(i).getSubjectCode())){
                        rubricIDList[num] = rubricList.get(i).getRubricID();
                        rubricNameList[num] = rubricList.get(i).getRubricName();
                        break;
                    }
                    else{
                        rubricIDList[num] = "-";
                        rubricNameList[num] = "-";
                    }
                    
                }
                out.println(x.getSubjectCode());
                out.println(rubricIDList[num]);
                out.println(rubricNameList[num]);
                out.print("<br>");
                num++;
            }
            for(int i=0;i<rubricIDList.length;i++){
                out.println(rubricIDList[i]);
                out.println(rubricNameList[i]);
            }
            session.setAttribute("rubricIDList", rubricIDList);
            session.setAttribute("rubricNameList", rubricNameList);
            RequestDispatcher rd = request.getRequestDispatcher("/UI/ChooseSubject.jsp");
            rd.forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        JdbcUtility newJdbcUtility = new JdbcUtility();
        //Login (Check acidID & password
        if(action.equals("login")){
            String acidID = request.getParameter("AcidID");
            String password = request.getParameter("Password");
            UserFactory userFactory = new UserFactory();
            String userType = Character.toString(acidID.charAt(0));
            User newUser = userFactory.getUser(userType);
            String msg = newUser.login(acidID, password);
            System.out.println(msg);
            if(msg.equals("Failed to Login")){
                out.println("<script>");
                out.println("    alert('"+msg+"')");
                out.println("    window.location = '/SAErubricWithUI2/UI/Login.jsp'");
                out.println("</script>");
            }
            else{
                session.setAttribute("userInfo", newUser.getUserDetails(acidID));
                RequestDispatcher rd = request.getRequestDispatcher("/UI/Home.jsp");
                rd.forward(request, response);
            }
            
        }
        else if(action.equals("insert")){
           Rubric rubric = new Rubric();
           ArrayList <Rubric> rubricList = rubric.getListofRubricName(); //display a list of rubric
           int rubricCount = rubricList.size()+1;
           DecimalFormat df = new DecimalFormat("000"); 
           String newRubricID ="R"+ df.format(rubricCount);
           
            String rubricname = request.getParameter("rubricName");
            String subCode = request.getParameter("subjectCode");
            //rubric row 1
            String rating0 = request.getParameter("rating0");
            String rating1 = request.getParameter("rating1");
            String rating2 = request.getParameter("rating2");
            //rubric row 2
            String criteria0 = request.getParameter("criteria0");
            String desc0 = request.getParameter("desc0");
            String desc1= request.getParameter("desc1");
            String desc2 = request.getParameter("desc2");
            //rubric row3
            String criteria1 = request.getParameter("criteria1");
            String desc3 = request.getParameter("desc3");
            String desc4 = request.getParameter("desc4");
            String desc5 = request.getParameter("desc5");
            //rubric row4
            String criteria2 = request.getParameter("criteria2");
            String desc6 = request.getParameter("desc6");
            String desc7 = request.getParameter("desc7");
            String desc8 = request.getParameter("desc8");
           
            try {
                rubric.uploadRubric(criteria0, criteria1, criteria2, rubricname, desc0, desc1, desc2, desc3, desc4, desc5, desc6, desc7, desc8, rating0, rating1, rating2, subCode, newRubricID);
                out.println("<script>");
                out.println("    alert('Upload Rubric Successfully');");
                out.println("    window.location = '/SAErubricWithUI2/UI/ErubricServlet?action=UPLOAD'");
                out.println("</script>");
            } catch (SQLException ex) {
                out.println("<script>");
                out.println("    alert('Failed to Upload Rubric');");
                out.println("</script>");
                Logger.getLogger(ErubricServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
