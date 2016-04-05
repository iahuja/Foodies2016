<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Final_Project.HomePage" MasterPageFile="~/Master.Master" %>

<asp:Content ContentPlaceHolderId="title" runat="server">
    Foodies-Home
    </asp:Content>

<asp:Content ContentPlaceHolderId="head" runat="server">

    <link rel="stylesheet" href="scripts/animate.css"/>
    <script src="scripts/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>

   
 

    <script>
  window.fbAsyncInit = function () {
         FB.init({
             appId: '573858946116959', // Set YOUR APP ID
             channelUrl: '//' + window.location.hostname + '/channel',// Channel File
             status: true, // check login status
             cookie: true, // enable cookies to allow the server to access the session
             xfbml: true  // parse XFBML
         });

         function getUserInfo() {
             FB.api('/me', function (response) {

                 document.getElementById("client").innerHTML = response.name.trim();
                 
             });
         }


         FB.getLoginStatus(function (response) {
             if (response.status === 'connected') {
                 // the user is logged in and has authenticated your
                 // app, and response.authResponse supplies
                 // the user's ID, a valid access token, a signed
                 // request, and the time the access token 
                 // and signed request each expire
                
                 getUserInfo();
                 getPhoto();
                 var uid = response.authResponse.userID;
                 var accessToken = response.authResponse.accessToken;
             } else if (response.status === 'not_authorized') {
                 // the user is logged in to Facebook, 
                 // but has not authenticated your app
                  window.location.href = "Default";
             } else {
                 window.location.href = "Default.aspx";
                // window.location.href = "http://ishant.azurewebsites.net/Default.aspx";
             }
         });


         FB.Event.subscribe('auth.authResponseChange', function (response) {
             if (response.status === 'connected') {
                 
             }
             else if (response.status === 'not_authorized') {
                
             } else {
                 
             }
         });

     };


     function getPhoto() {
         FB.api('/me/picture?type=normal', function (response) {

       
             document.getElementById("my").src = response.data.url;

         });

     }
     function Logout() {

         FB.logout(function () { window.location.href = "Default.aspx"; });
        
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

   

    <script type="text/javascript">
       
        // method to handle events on scrooling 
        var $w = $(window).scroll(function () {
            if ($w.scrollTop() < 180) {
                 $('#voice2').css({ "border-bottom": "2px solid blue" });

                //this method will autohide the navbar on scrooling down
                $(".navbar").autoHidingNavbar();
                 
            } else {
              
                $('#voice2').css({ "border-bottom": "2px solid #f4f5f8" });
            }
        });

        // onclick method will scroll to top when you click on the logo 
        function getToTop()
        {
            $('body,html').animate({
                scrollTop: 0
            }, 800);

        }

       
    </script>
    

</asp:Content>
    




<asp:Content ContentPlaceHolderId="nav" runat="server">
<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><b>Home</b></a></li>
        <li><a href="about.aspx"><b>About</b></a></li>
           
        <li><a href="#"><b>Gallery</b></a></li>
        <li><a href="#"><b>Contact</b></a></li>
      </ul>
       <ul class="nav navbar-nav navbar-right wow bounceInRight" data-wow-duration="1s" data-wow-delay="2.5s" >
           <li>
          <img id="my" src="http://placehold.it/150x80?text=IMAGE"  style="border-radius:50%; height:40px; padding-top:10px; " class="img-responsive"  alt="Image">
          </li>
            <li class="dropdown">
           <a class="dropdown-toggle glyphicon " data-toggle="dropdown" href="#"> 
               <span id="client" style="font-family:'Comic Sans MS', cursive, sans-serif;" ></span>
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li onclick="Logout()"><a href="#">Logout</a></li> 
              
          </ul>
        </li>

      </ul>
    </div>
 </asp:Content>

<asp:Content ContentPlaceHolderId="main" runat="server">
 
<div class="jumbotron">
  <div class="container text-center">
    <div class="wow  rotateInDownLeft" data-wow-duration="1.2s" data-wow-delay=".5s">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif;">Foodies</h1> 
    </div>
                  
        <style>
#searchdiv{
  width: 50%;
  margin:auto;
  -webkit-transition: width .35s ease-in-out;
  transition: width .35s ease-in-out;
}
 
       </style>
      
           <form id="s" runat="server"> 
 <div id="searchdiv" class="wow  fadeIn" data-wow-duration="1s" data-wow-delay="1.5s" >
<asp:TextBox id="search" CssClass="form-control input-lg" runat="server"  style="text-align:center" 
    autopostback="true" placeholder="Search Food"></asp:TextBox>
     
 </div>
               </form>

  </div>
   
</div>

        
    <div class="wow bounceInUp" data-wow-duration="1s">
<div class="container-fluid bg-3 text-center">   
  <h3>Trending</h3><br>
  <div class="row">
    <div id="voice2" class="col-sm-3">
      <p>Some text..</p>
      <img  src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

<div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div  class="col-sm-3">
      <p">Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br>

    <div class="container-fluid bg-3 text-center">    
  <div class="row">
    <div  class="col-sm-3">
      <p">Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3"> 
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
    <div class="col-sm-3">
      <p>Some text..</p>
      <img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
    </div>
  </div>
</div><br><br>
</div>
 </asp:Content>

