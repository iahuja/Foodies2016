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
      font-size: 20px;
      color: #111;
  }
  .container {
      padding-top:100px;
  }

  .carousel-inner img { 
      width: 100%; /* Set width to 100% */
      margin: auto;
  }
  .carousel-caption h3 {
      color: #fff !important;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; /* Hide the carousel text when the screen is less than 600 pixels wide */
    }
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

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage"><svg 
 width="120.000000pt" height="100.000000pt" viewBox="0 0 246.000000 315.000000"
 preserveAspectRatio="xMidYMid meet">
<g transform="translate(0.000000,315.00000) scale(0.100000,-0.100000)"
fill="#91B0FA" stroke="blue"><path d="M990 3136 c0 -9 -17 -16 -52 -21 -112 -15 -218 -56 -368 -144 -164
-96 -309 -245 -413 -423 -38 -65 -51 -93 -89 -188 -81 -202 -81 -645 0 -855
20 -54 79 -173 102 -210 11 -16 23 -37 27 -45 31 -68 294 -331 329 -330 5 0
29 18 53 38 l43 38 -85 62 c-194 141 -338 346 -411 587 -39 131 -46 177 -46
315 0 175 21 277 93 450 58 138 135 251 258 371 159 157 347 252 615 313 93
21 267 21 324 1 23 -8 58 -15 77 -15 18 0 50 -7 70 -15 19 -8 48 -15 64 -15
15 0 31 -4 34 -10 3 -5 17 -10 31 -10 14 0 22 4 19 10 -3 6 -17 10 -30 10 -12
0 -25 7 -29 15 -3 8 -16 15 -28 15 -13 1 -34 7 -48 15 -14 8 -42 14 -62 15
-46 0 -68 8 -68 26 0 12 -36 14 -205 14 -169 0 -205 -2 -205 -14z"/>
<path d="M1120 2974 c-125 -29 -191 -52 -250 -85 -8 -5 -26 -14 -39 -20 -42
-17 -154 -105 -212 -166 -59 -61 -120 -148 -159 -223 -12 -25 -27 -54 -32 -64
-6 -11 -14 -31 -19 -45 -4 -14 -19 -57 -34 -96 -32 -85 -42 -246 -26 -395 15
-140 33 -202 100 -340 53 -111 194 -247 311 -301 19 -9 47 -22 62 -29 25 -12
30 -10 65 20 45 40 47 50 13 66 -14 7 -45 22 -70 33 -47 23 -81 42 -90 51 -3
3 -24 20 -48 39 -23 18 -62 58 -85 89 -62 83 -137 274 -137 351 0 18 -16 64
-34 103 -50 101 -62 168 -41 224 20 52 57 84 96 84 23 0 30 5 34 28 6 26 63
147 88 186 42 65 187 215 232 239 79 42 177 87 189 87 7 0 30 7 49 15 47 20
269 30 367 17 74 -10 146 -27 185 -43 108 -44 137 -57 180 -83 153 -92 267
-199 342 -321 19 -31 78 -156 92 -195 63 -175 65 -365 5 -550 -8 -25 -14 -51
-14 -58 0 -23 -92 -204 -136 -269 -59 -86 -181 -211 -248 -253 -30 -19 -55
-40 -56 -46 0 -11 88 -94 100 -94 13 0 86 58 157 124 91 86 188 215 247 331
46 90 52 104 87 225 21 74 27 306 8 341 -7 15 -7 24 1 33 6 8 11 49 11 92 1
290 -243 625 -576 792 -96 48 -165 72 -290 103 -78 19 -347 21 -425 3z"/>
<path d="M1827 2198 c-13 -13 -87 -82 -163 -155 -77 -72 -160 -149 -186 -170
-50 -40 -56 -55 -37 -97 23 -49 -5 -106 -100 -207 -47 -51 -92 -97 -100 -103
-7 -6 -37 -34 -65 -62 -28 -29 -71 -68 -96 -89 -25 -20 -72 -62 -105 -94 -33
-31 -116 -105 -185 -165 -69 -60 -129 -114 -135 -120 -10 -11 -33 -31 -147
-130 -63 -53 -101 -126 -96 -179 3 -27 7 -32 33 -35 17 -2 51 6 77 18 45 19
59 33 143 135 53 64 166 196 185 215 8 8 62 69 120 135 58 65 112 126 120 135
8 8 32 37 54 63 21 26 45 47 53 47 14 0 71 -56 212 -207 35 -37 93 -100 130
-138 79 -84 159 -172 186 -206 114 -140 159 -173 232 -167 31 2 39 7 41 27 2
13 -4 43 -13 66 -18 48 -51 81 -424 421 -29 27 -83 78 -120 114 -36 36 -90 86
-119 112 -28 25 -52 50 -52 56 0 8 47 56 165 169 38 36 82 53 142 53 l61 0 64
63 c59 58 270 277 312 326 15 16 17 24 8 33 -9 9 -51 -27 -177 -152 -124 -123
-168 -161 -176 -153 -9 9 28 54 149 180 108 112 158 171 151 178 -6 6 -64 -45
-174 -155 -90 -91 -170 -165 -176 -165 -36 0 -6 41 136 181 100 100 155 162
153 173 -3 11 -52 -31 -161 -139 -141 -138 -197 -182 -197 -152 0 5 74 84 165
176 147 147 177 186 145 186 -5 0 -20 -10 -33 -22z"/>
<path d="M467 2182 c-21 -23 -21 -44 -1 -102 42 -124 141 -266 280 -404 94
-93 203 -186 217 -186 3 0 26 -13 50 -30 25 -16 52 -30 60 -30 9 0 19 -4 22
-10 19 -31 116 32 98 64 -28 49 -681 716 -702 716 -4 0 -15 -8 -24 -18z"/>
<path d="M1330 2164 c-109 -34 -186 -88 -238 -167 -23 -37 -27 -52 -27 -122 0
-75 2 -83 36 -136 53 -80 153 -148 195 -132 27 10 14 28 -36 52 -59 28 -104
76 -131 138 -23 54 -23 74 -3 133 26 75 91 131 191 163 69 23 127 21 193 -4
88 -33 92 -34 106 -14 8 11 14 24 14 30 0 24 -153 76 -220 74 -19 -1 -55 -7
-80 -15z"/>
<path d="M1790 1699 c-15 -17 -31 -48 -35 -68 -25 -138 -95 -245 -201 -307
-50 -30 -54 -41 -20 -73 32 -30 60 -23 119 27 99 85 151 180 178 329 24 133
15 153 -41 92z"/>
<path d="M1142 1188 c-23 -22 -42 -45 -42 -50 0 -4 45 -8 100 -8 77 0 100 3
100 13 0 22 -81 87 -107 87 -5 0 -28 -19 -51 -42z"/>
<path d="M1480 875 c-54 -20 -210 -45 -280 -45 -64 0 -213 22 -284 43 -38 11
-39 10 -77 -31 -22 -23 -39 -47 -39 -54 0 -13 56 -31 196 -62 98 -22 350 -22
442 0 150 35 192 47 192 57 0 14 -93 107 -105 106 -5 -1 -26 -7 -45 -14z"/>
</g>
</svg></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav ">
            <li style="align-content:center"><b>Foodies</b></li>
            </ul>
      <ul class="nav navbar-nav navbar-right">
        
        <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#">Login
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Email</a></li>
            <li class="g-signin2" data-onsuccess="onSignIn"><a href="#">Gmail</a></li>
            <li onclick="Login()"><a href="#">Facebook</a></li> 
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

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
        <img src="Images/one.jpg" alt="New York" width="1200" height="400">
        <div class="carousel-caption">
          <h2>DineIN</h2>
            <fb:login-button scope="public_profile,email" onlogin="Login();"></fb:login-button>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>

      <div class="item">
        <img src="Images/two.jpg" alt="Chicago" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Pizza</h2>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="Images/thre.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Sushi</h2>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/four.jpg" alt="Los Angeles" width="1200" height="100">
        <div class="carousel-caption">
          <h2>Japan</h2>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/five.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>Food</h2>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/six.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>food</h2>
          <p>Foodies is teh best place to search any food product</p>
        </div>      
      </div>

        <div class="item">
        <img src="Images/seven.jpg" alt="Los Angeles" width="1200" height="400">
        <div class="carousel-caption">
          <h2>food</h2>
          <p>Foodies is teh best place to search any food product</p>
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
  <h3>Foodies</h3>
  <p><em>We love food!</em></p>
  <p>Foodies is teh best place to search any food product</p>
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
