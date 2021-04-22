<%-- 
    Document   : home
    Created on : Jan 11, 2021, 8:53:48 PM
    Author     : Acer
--%>

<%@page import="BLL.Factory.Student"%>
<%@page import="BLL.Factory.Lecturer"%>
<%@page import="BLL.Factory.User"%>
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
            //System.out.println(name);
        %>
        <title>Home Page (<%=className%>)</title>
        
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
                  <a class="nav-link" href="Home.jsp" style="color: #FFD708 !important;">Home</a>
                </li>
                <%
                    if(isLect){
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="ErubricServlet?action=UPLOAD" >E-Rubric</a>
                    </li>

                <%
                    }
                else{
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="ErubricServlet?action=SUBJECTLIST">Subject</a>
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
         <%
            if(isLect){
        %>
            <img src="https://4.bp.blogspot.com/-1nxrrj4JJ9g/WxvJzyVNcqI/AAAAAAABMkA/IBnsYMUC8hsiF1IaMzaFd4awsYiwD0m0ACLcBGAs/s450/e-learning_smartphone_woman.png" alt="" id="side_photo" width="100%">

        <%
            }
        else{
        %>
            <img src="https://1.bp.blogspot.com/-gyrNbKV7Gws/XWS5lvlXK5I/AAAAAAABUUY/jZMoffMzu5Ix1BG6AKDaBITEIfa1cZuKgCLcBGAs/s1600/kakedasu_school1.png" alt="" id="side_photo" width="40%" style="margin-top: 5vh;margin-left: 2vw;">
            <img src="https://1.bp.blogspot.com/-AkH8XYDpseA/XWS5nXw3v4I/AAAAAAABUUs/Bbsvyt9kHcw-Jn5kkME3mTir_pb0ZnZgQCLcBGAs/s1600/kakedasu_school6.png" alt="" id="side_photo" width="40%">
        <%
        }
        %>
    </div>
    <div class="col" style="margin-top: 2vw;">
        <h3 style="padding:15px">Welcome back <%=name %></h3>
        <%
            if(isLect){
        %>
            <div class="container-fluid" >
                <div class="row" style="border: 1px solid #dee2e6;">
                    <div class="col">
                        <table class="table">
                            <tr>
                                <th style="border-top: none">Homework Given</th>
                            </tr>
                            <tr>
                                <td class="hw" onclick="dmbChart(0,150,150,125,25,values[0],colors,labels,0);">Project 1</td>
                            </tr>
                            <tr>
                                <td class="hw" onclick="dmbChart(1,150,150,125,25,values[1],colors,labels,0);">Lab 1</td>
                            </tr>
                            <tr>
                                <td class="hw" onclick="dmbChart(2,150,150,125,25,values[2],colors,labels,0);">Assignment 1</td>
                            </tr>
                            <tr>
                                <td class="hw" onclick="dmbChart(3,150,150,125,25,values[3],colors,labels,0);">Project 2</td>
                            </tr>
                            <tr>
                                <td>
                                    <button class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script';letter-spacing: 0.1vw;font-size: 1.5vw;background-color: #FFD708 !important; color: #2e2e2e !important;" onclick='window.location = "404.jsp"'>
                                        <i class="fas fa-arrow-alt-circle-right"></i> Check Submission
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col">
                        <canvas id="canvas" width=325 height=325></canvas>
                        <script>
                            var canvas=document.getElementById("canvas");
                            var ctx=canvas.getContext("2d");
                            var colors=['#13A699','#FFD708'];
                            var values=[[47,53],[50,50],[70,30],[80,25],[90,10]];
                            var labels=['Submitted','Pending'];

                            window.onload = function(){
                                dmbChart(0,150,150,125,25,values[0],colors,labels,0);
                            }
                            function dmbChart(index,cx,cy,radius,arcwidth,values,colors,labels,selectedValue){
                                for(var x=0;x<4;x++){
                                    document.getElementsByClassName("hw")[x].style.backgroundColor = "#ffffff";
                                }
                                document.getElementsByClassName("hw")[index].style.backgroundColor = "#dee2e6";
                                var tot=0;
                                var accum=0;
                                var PI=Math.PI;
                                var PI2=PI*2;
                                var offset=-PI/2;
                                ctx.lineWidth=arcwidth;
                                for(var i=0;i<values.length;i++){tot+=values[i];}
                                for(var i=0;i<values.length;i++){
                                    ctx.beginPath();
                                    ctx.arc(cx,cy,radius,
                                        offset+PI2*(accum/tot),
                                        offset+PI2*((accum+values[i])/tot)
                                    );
                                    ctx.strokeStyle=colors[i];
                                    ctx.stroke();
                                    accum+=values[i];
                                }
                                var innerRadius=radius-arcwidth-3;
                                ctx.beginPath();
                                ctx.arc(cx,cy,innerRadius,0,PI2);
                                ctx.fillStyle=colors[selectedValue];
                                ctx.fill();
                                ctx.textAlign='center';
                                ctx.textBaseline='bottom';
                                ctx.fillStyle='white';
                                ctx.font=(innerRadius)+'px verdana';
                                ctx.fillText(values[selectedValue],cx,cy+innerRadius*.9);
                                ctx.font=(innerRadius/4)+'px verdana';
                                ctx.fillText(labels[selectedValue],cx,cy-innerRadius*.25);
                            }
                        </script>
                    </div>
                     
                </div>
                <div style="margin-left: -15px;margin-right: -15px;display: flex;justify-content: space-between; ">
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708 !important; width: 24%; margin-top: 8px; color: #2e2e2e !important;"" href="ErubricServlet?action=UPLOAD">Add New Rubric</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708 !important; width: 24%; color: #2e2e2e !important;" href="404.jsp">Submission</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708!important; width: 24%; color: #2e2e2e !important;"  href="404.jsp">Performance</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script';background-color: #FFD708 !important; width: 24%;color: #2e2e2e !important;"  href="ErubricServlet?action=LOGOUT">Logout</a>
                </div>
            </div>
            
        <%
            }
        else{
        %>
             <div class="container-fluid"  >
                 <div style="border: 1px solid #dee2e6;">
                   <table class="table">
                        <tr>
                            <th style="border-top: none">Homework</th>
                            <th style="border-top: none">Subject</th>
                            <th style="border-top: none">Submission Date</th>
                        </tr>
                        <tr>
                            <td>Project 1</td>
                            <td>SCSJ-1102 PT2</td>
                            <td>30 Jan 2021 12:31 AM</td>
                        </tr>
                        <tr>
                            <td>Lab 1</td>
                            <td>SCSJ-3343 SDA</td>
                            <td>20 Jan 2021 06:21 PM</td>
                        </tr>
                        <tr>
                            <td>Assignment 1</td>
                            <td>SCSJ-3343 SDA</td>
                            <td>25 Jan 2021 12:00 AM</td>
                        </tr>
                        <tr>
                            <td>Project 2</td>
                            <td>SCSJ-3553 AI</td>
                            <td>27 Jan 2021 11:59 PM</td>
                        </tr>
                    </table>
                </div>
                <div style="display: flex;justify-content: space-around; ">
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708 !important; width: 24%; margin-top: 8px; color: #2e2e2e !important;" href="ErubricServlet?action=SUBJECTLIST">Subject List</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708 !important; width: 24%; color: #2e2e2e !important;" href="404.jsp">Submission</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script'; background-color: #FFD708!important; width: 24%; color: #2e2e2e !important;"  href="404.jsp">Performance</a>
                    <a class="btn btn-info btn-lg btn-block" style="font-family:'Kaushan Script';background-color: #FFD708 !important; width: 24%;color: #2e2e2e !important;"  href="ErubricServlet?action=LOGOUT">Logout</a>
                </div>
            </div>
        <%
        }
        %>
    </div>
        
        
        
    </body>
</html>
