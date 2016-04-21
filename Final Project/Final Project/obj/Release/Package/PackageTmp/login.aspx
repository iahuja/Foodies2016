<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Final_Project.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Foodies Login</title>
  <meta charset="utf-8">
    <link rel="shortcut icon" href="Images/logo-icon.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>



      <script>
         
             
         
     window.fbAsyncInit = function () {
         FB.init({
             appId: '573858946116959', // Set YOUR APP ID
             channelUrl: '//' + window.location.hostname + '/channel',// Channel File
             status: true, // check login status
             cookie: true, // enable cookies to allow the server to access the session
             xfbml: true  // parse XFBML
         });

         
           window.onload = FB.Event.subscribe('auth.authResponseChange', function (response) {
             if (response.status === 'connected') {
                 
                 window.location.href = "default.aspx";
                // window.location.href = "http://ishant.azurewebsites.net/index.aspx";
             }
             else if (response.status === 'not_authorized') {
                 document.getElementById("message").innerHTML += "<br>Failed to Connect";

                 //FAILED
             } else {
                 document.getElementById("message").innerHTML += "<br>Logged Out";

                 //UNKNOWN ERROR
             }
         }); 

     };

     function Login() {

         FB.login(function (response) {
             if (response.authResponse) {
                 getUserInfo();
             } else {
                 console.log('User cancelled login or did not fully authorize.');
             }
         }, { scope: 'email' });

     }
     // Load the SDK asynchronously
     (function (d) {
         var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
         if (d.getElementById(id)) { return; }
         js = d.createElement('script'); js.id = id; js.async = true;
         js.src = "//connect.facebook.net/en_US/all.js";
         ref.parentNode.insertBefore(js, ref);
     }(document));

</script>
  
   
    
    
    <style>

.navbar-inverse { background-color: #FCFDFF}
.navbar-inverse .navbar-nav>.active>a:hover,.navbar-inverse .navbar-nav>li>a:hover, .navbar-inverse .navbar-nav>li>a:focus { background-color: #7D86FF}
.navbar-inverse .navbar-nav>.active>a,.navbar-inverse .navbar-nav>.open>a,.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:hover,.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse .navbar-nav>.open>a:focus { background-color: #7D86FF}
.navbar-inverse { background-image: none; }
.dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus { background-image: none; }
.navbar-inverse { border-color: #FCFDFF}
.navbar-inverse .navbar-brand { color: #444499}
.navbar-inverse .navbar-brand:hover { color: #21213B}
.navbar-inverse .navbar-nav>li>a { color: #000000}
.navbar-inverse .navbar-nav>li>a:hover, .navbar-inverse .navbar-nav>li>a:focus { color: #FFFFFF}
.navbar-inverse .navbar-nav>.active>a,.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse .navbar-nav>.open>a:focus { color: #FFFFFF}
.navbar-inverse .navbar-nav>.active>a:hover, .navbar-inverse .navbar-nav>.active>a:focus { color: #FFFFFF}
.dropdown-menu>li>a { color: #333333}
.dropdown-menu>li>a:hover, .dropdown-menu>li>a:focus { color: #FFFFFF}
.navbar-inverse .navbar-nav>.dropdown>a .caret { border-top-color: #999999}
.navbar-inverse .navbar-nav>.dropdown>a:hover .caret { border-top-color: #FFFFFF}
.navbar-inverse .navbar-nav>.dropdown>a .caret { border-bottom-color: #999999}
.navbar-inverse .navbar-nav>.dropdown>a:hover .caret { border-bottom-color: #FFFFFF}
  body {
      font: 400 15px/1.8 Lato, sans-serif;
      color: #777;
  }
  h3, h4 {
      margin: 10px 0 30px 0;
      letter-spacing: 10px;      
      font-size: 40px;
      color: #111;
  }
  .container {
      padding-top:100px;
  }

  .carousel-inner img { 
      width: 100%; /* Set width to 100% */
      height:60%;
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  
  
  .bg-1 {
      background: #2d2d30;
      color: #bdbdbd;
  }
  .bg-1 h3 {color: #fff;}
  .bg-1 p {font-style: italic;}
  .list-group-item:first-child {
      border-top-right-radius: 0;
      border-top-left-radius: 0;
  }
  .list-group-item:last-child {
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail p {
      margin-top: 15px;
      color: #555;
  }
  .btn {
      padding: 10px 20px;
      background-color: #333;
      color: #f1f1f1;
      border-radius: 0;
      transition: .2s;
  }
  .btn:hover, .btn:focus {
      border: 1px solid #333;
      background-color: #fff;
      color: #000;
  }
  .modal-header, h4, .close {
      background-color: #333;
      color: #fff !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-header, .modal-body {
      padding: 40px 50px;
  }
  .nav-tabs li a {
      color: #777;
  }
 
  .navbar {
      font-family: Montserrat, sans-serif;
      margin-bottom: 0;
      border: 0;
      font-size: 11px !important;
      letter-spacing: 4px;
     
  }

  .dropdown-menu li a {
      color: #000 !important;
  }
  .dropdown-menu li a:hover {
      background-color: blue !important;
  }
  footer {
      background-color: #2d2d30;
      color: #f5f5f5;
      padding: 32px;
  }
  footer a {
      color: #f5f5f5;
  }
  footer a:hover {
      color: #777;
      text-decoration: none;
  }  
  .form-control {
      border-radius: 0;
  }
  textarea {
      resize: none;
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">


<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
        <li data-target="#myCarousel" data-slide-to="4"></li>
        <li data-target="#myCarousel" data-slide-to="5"></li>
        <li data-target="#myCarousel" data-slide-to="6"></li>
        <li data-target="#myCarousel" data-slide-to="7"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="Images/four.jpg" alt="New York" width="1200" height="400">
        <div class="carousel-caption"> 
          <h2>Hungry</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Find best price and tasty food @ Foodies</p>
        </div>      
      </div>

      <div class="item">
        <img src="Images/two.jpg" alt="Chicago" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Partner</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Join In As a Partner Today</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="Images/thre.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Sushi</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Find the best Sushi Place in City</p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/seven.jpg" alt="Los Angeles" width="1200" height="100">
        <div class="carousel-caption">
          <h2>Tasty Food</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Lokking For Home Cooked Food </p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/five.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Food</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Review The Food You Like </p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/six.jpg" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Food Heaven</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Login and Dive into the heaven of food</p>
        </div>      
      </div>

        

       
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3><em>We love foodies!</em></h3>
  <p>Best Place To Search Food In The City</p>
  <br>
</div>



<!-- Footer -->
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a><br><br>
  <p>Foodies</p> 
</footer>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top
    }, 900, function(){
   
      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });
  });
})
</script>

</body>
</html>
