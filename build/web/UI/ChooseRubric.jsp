<%-- 
    Document   : viewListOfRubric
    Created on : Jan 11, 2021, 10:28:45 PM
    Author     : Acer
--%>
<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.User"%>
<%@page import="BLL.Iterator.ListOfRubric"%>
<%@page import="BLL.Iterator.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="BLL.Rubric"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>View Rubric Page</title>
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
            ArrayList<Rubric> newRubric = (ArrayList<Rubric>)session.getAttribute("listOfRubric");
            String[] listOfItems = new String[newRubric.size()];
            String[] rubricIDList = new String[newRubric.size()];
            int index = 0;
            
            for(Rubric x: newRubric){
                listOfItems[index] = x.getRubricName();
                rubricIDList[index] = x.getRubricID();
                index++;
                //System.out.print(x.getRubricName());
            }
            ListOfRubric listofRubric = new ListOfRubric(listOfItems);           
        %>
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
            <h1>View Rubric Interface</h1>
            <table class="table" >
                <tr>
                    <th>Rubric Name</th>
                    <th>Edit and Upload Rubric</th>
                    <th>Upload the Rubric</th>
                    <th>Delete the Rubric</th>
                </tr>
           <%   
               int num=0;
               for(Iterator iter = listofRubric.getIterator(); iter.hasNext();){
                    String nama = (String)iter.next();

            %>
            <tr>
                <td><%=nama%></td>
                <td style="padding-left: 4rem"><a href="ErubricServlet?action=UPDATE&edit=TRUE&ID=<%= rubricIDList[num]%>">Select</a></td>
                <td style="padding-left: 4rem"><a href="ErubricServlet?action=UPDATE&edit=FALSE&ID=<%= rubricIDList[num]%>">View</a></td>
                <td style="padding-left: 4rem"><a href="ErubricServlet?action=DELETE&ID=<%= rubricIDList[num]%>">Delete</a></td>
            </tr>
            <%
                num++;
                } 
            %>
           </table>
        </div>
        
    </body>
</html>
