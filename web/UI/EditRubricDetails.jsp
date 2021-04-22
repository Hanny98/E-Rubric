<%-- 
    Document   : updateRubric
    Created on : Jan 12, 2021, 5:24:32 AM
    Author     : Acer
--%>

<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.User"%>
<%@page import="BLL.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="BLL.Rubric"  %>

<%
           User loginUser = (User)session.getAttribute("userInfo");
            String name = "";
            String className = loginUser.getClass().getSimpleName().toString();
            boolean isLect = false;
            if(loginUser instanceof Lecturer){
                name =((Lecturer)loginUser).getName();
                isLect = true;
            }
            else if(loginUser instanceof Student){
                name = ((Student)loginUser).getName();
                isLect = false;
            }
            
           Rubric rubric= (Rubric) session.getAttribute("selectedRubric");
           ArrayList<Subject> subject = (ArrayList<Subject>) session.getAttribute("subjectList");
   
            String rubricname = rubric.getRubricName();
            String RubricID = rubric.getRubricID();
            //rubric row 1
            String rating0 = rubric.getRurbicPerformanceRating0();
            String rating1 = rubric.getRurbicPerformanceRating1();
            String rating2 = rubric.getRurbicPerformanceRating2();
            //rubric row 2
            String criteria0 = rubric.getRubricCriteria0();
            String desc0 = rubric.getRurbicPerformanceDesc0();
            String desc1= rubric.getRurbicPerformanceDesc1();
            String desc2 = rubric.getRurbicPerformanceDesc2();
            //rubric row3
            String criteria1 = rubric.getRubricCriteria1();
            String desc3 = rubric.getRurbicPerformanceDesc3();
            String desc4 = rubric.getRurbicPerformanceDesc4();
            String desc5 = rubric.getRurbicPerformanceDesc5();
            //rubric row4
            String criteria2 = rubric.getRubricCriteria2();
            String desc6 = rubric.getRurbicPerformanceDesc6();
            String desc7 = rubric.getRurbicPerformanceDesc7();
            String desc8 = rubric.getRurbicPerformanceDesc8();
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Rubric </title>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Kaushan Script' rel='stylesheet'>
        <link rel="icon" href="https://iptcgpacalculator.herokuapp.com/static/images/utmLogo.png" type="image/jpg" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Suez One' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Covered By Your Grace' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Bebas Neue' rel='stylesheet'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="index.css">
        <style>
            input{
                border: none;
                border-bottom: 2px solid #dee2e6 !important;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md" >
          <h1 class="navbar-brand" href="home.html">UTM E-Rubric</h1>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fa fa-ellipsis-v"></i>
          </button>
            <div class="collapse navbar-collapse" id="main_nav">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="Home.jsp">Home</a>
                </li>
                <%
                    if(isLect){
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="ErubricServlet?action=UPLOAD" style="color: #FFD708 !important;">E-Rubric</a>
                    </li>

                <%
                    }
                else{
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="ErubricServlet?action=SUBJECTLIST" style="color: #FFD708 !important;">Subject</a>
                    </li>
                <%
                    }
                %>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="404.jsp">Submission</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="404.jsp">Performance Report</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="ErubricServlet?action=LOGOUT">Sign Out</a>
                  </li>
                </ul>
            </div>
        </nav>
        <div class="container-fluid">
            <h1>Template Rubric Selected: </h1>
            <form action="ErubricServlet" method="POST">
                <input type="hidden" value="insert" name="action">
                <label>Rubric Name:
                <input name="rubricName" type="text" required/>
                </label>
                <br />
                <br /> 
                <label>Subject Code:
                    <select name="subjectCode" required="true">
                        <%
                            for(Subject x: subject){
                        %>
                        <option value="<%=x.getSubjectCode() %>"><%=x.getSubjectCode()+" ("+ x.getSubjectName()+")" %></option>
                        <%
                            }
                        %>
                    </select>
                </label>
                <br />
                <br /> 
                <table class="table table-bordered">
                <tbody>
                    <tr>
                        <td></td>
                         <td><input type="text" name="rating0" value="<%=rating0%>"></td>
                         <td><input type="text" name="rating1" value="<%=rating1%>"></td>  
                         <td><input type="text" name="rating2" value="<%=rating2%>"></td>  
                    </tr>
                    <tr>
                        <td><input type="text" name="criteria0" value="<%=criteria0%>"></td>
                        <td><textarea name="desc0" style="width:20rem;height:5rem;">"<%=desc0%>"</textarea></td>
                        <td><textarea name="desc1" style="width:20rem;height:5rem;">"<%=desc1%>"</textarea></td>
                        <td><textarea name="desc2" style="width:20rem;height:5rem;">"<%=desc2%>"</textarea></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="criteria1" value="<%=criteria1%>"></td>
                         <td><textarea name="desc3" style="width:20rem;height:5rem;">"<%=desc3%>"</textarea></td>
                        <td><textarea name="desc4" style="width:20rem;height:5rem;">"<%=desc4%>"</textarea></td>
                        <td><textarea name="desc5" style="width:20rem;height:5rem;">"<%=desc5%>"</textarea></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="criteria2" value="<%=criteria2%>"></td>
                         <td><textarea name="desc6" style="width:20rem;height:5rem;">"<%=desc6%>"</textarea></td>
                        <td><textarea name="desc7" style="width:20rem;height:5rem;">"<%=desc7%>"</textarea></td>
                        <td><textarea name="desc8" style="width:20rem;height:5rem;">"<%=desc8%>"</textarea></td>  
                    </tr>       
                </tbody>           
            </table>
                    <button type="submit">Update Rubric</button>
            </form>
        </div>
         
    </body>
</html>

