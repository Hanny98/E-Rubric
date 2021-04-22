<%-- 
    Document   : SubjectCodeAndSubjectNameForm
    Created on : Jan 12, 2021, 8:18:05 PM
    Author     : Acer
--%>

<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.User"%>
<%@page import="BLL.Rubric"%>
<%@page import="BLL.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <title>Upload Rubric (Subject Code and Subject Name)</title>
        
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
    
    <body>
        <nav class="navbar navbar-expand-md" >
          <h1 class="navbar-brand" href="Home.jsp">UTM E-Rubric</h1>
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
            <div class="row">
                <div class="col">
                    <img src="https://1.bp.blogspot.com/-0xg1nXstFC4/Wb8gnzrZHtI/AAAAAAABGy8/V0Oatuo0cNAp_jQiBXMBImoelJdCQIFAQCLcBGAs/s400/sekihi_takuhon.png" style="margin-left: 5vw;"alt="" id="side_photo" width="80%">
                </div>
                <div class="col" style="border: 2px solid #dee2e6;margin-top: 1vh; margin-right: 1vw;">
                     <form action="ErubricServlet" method="POST" style="margin-top: 10vh;">
                        <input type="hidden" value="insert" name="action">
                        <h1 style="text-align: center;">Upload New Rubric</h1>
                        <br /><br />
                        <label><b>Rubric Name</b></label><br>
                        <input class="form-control" name="rubricName" type="text" required/>
                        <br />
                        <label><b>Subject code</b></label><br>
                        <select name="subjectCode" required="true" class="form-control">
                                <%
                                    for(Subject x: subject){
                                %>
                                <option value="<%=x.getSubjectCode() %>"><%=x.getSubjectCode()+" ("+ x.getSubjectName()+")" %></option>
                                <%
                                    }
                                %>
                            </select>
                        <br />
                        <br /> 
                        <input type="hidden" name="rating0" value="<%=rating0%>">
                        <input type="hidden" name="rating1" value="<%=rating1%>"> 
                        <input type="hidden" name="rating2" value="<%=rating2%>">

                        <input type="hidden" name="criteria0" value="<%=criteria0%>">
                        <input type="hidden" name="desc0" value="<%=desc0%>">
                        <input type="hidden" name="desc1" value="<%=desc1%>">
                        <input type="hidden" name="desc2" value="<%=desc2%>">

                        <input type="hidden" name="criteria1" value="<%=criteria1%>">
                        <input type="hidden" name="desc3" value="<%=desc3%>">
                        <input type="hidden" name="desc4" value="<%=desc4%>">
                        <input type="hidden" name="desc5" value="<%=desc5%>">

                        <input type="hidden" name="criteria2" value="<%=criteria2%>">
                        <input type="hidden" name="desc6" value="<%=desc6%>">
                        <input type="hidden" name="desc7" value="<%=desc7%>">
                        <input type="hidden" name="desc8" value="<%=desc8%>">

                        <button type="submit" class="btn btn-primary btn-lg btn-block">Upload Rubric</button>

                    <form>
                </div>
            </div>
        </div>
        <div class="col" style="margin-top: 2vw;"></div>
       
        
    </body>
</html>
