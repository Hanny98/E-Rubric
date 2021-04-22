<%-- 
    Document   : index
    Created on : Jan 10, 2021, 4:01:52 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="https://iptcgpacalculator.herokuapp.com/static/images/utmLogo.png" type="image/jpg" sizes="16x16">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href='https://fonts.googleapis.com/css?family=Suez One' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Covered By Your Grace' rel='stylesheet'>
        <link href='https://fonts.googleapis.com/css?family=Bebas Neue' rel='stylesheet'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="UI/general.css">
        <title>UTM E-rubric System</title>
        <style media="screen">
          body{
            background-color: #f5f5f5;
            height:100vh;
            margin: 0;
            padding: 0;
          }
          .card{
            width: 0vw;
            padding: 2vw;
            overflow: hidden;
          }
          
          .card-title{
            text-align: center;
          }
          .card label{
            font-weight: bolder;
          }

        </style>
    </head>
    <body>
        <div class="container-fluid h-100">
        <div class="row justify-content-center align-items-center h-100">
        <div class="col d-flex align-items-center justify-content-center">
            <div class="card" style="width: 30rem">
               <img class="card-img-top" src="https://4.bp.blogspot.com/-vPKOo-Jkxyc/UUF0rA3R_5I/AAAAAAAADR8/n4o2FDGh004/s640/logo+utm+fakulti.png" alt="Card image cap">
               
               <h3 class="card-title">E-Rubric System</h3>
              <form action="ErubricServlet" name="loginform" method="POST">
                  <input type="hidden" name="action" value="login">
                  <div class="form-group">
                    <label for="AcidID">Acid ID</label>
                      <input class="form-control form-control-lg" name="AcidID" placeholder="AcidID" type="text" required/>
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                      <input class="form-control form-control-lg" name="Password" placeholder="Password" type="password">
                  </div>
                  <div class="form-group">
                      <input class="btn btn-info btn-lg btn-block submit" name="Submit" type="submit" value="Submit">
                  </div>
              </form>
            </div>
        </div>
    </div>
</div>
    </body>
</html>
