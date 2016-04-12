<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Final_Project.HomePage" MasterPageFile="~/Master.Master" %>

<asp:Content ContentPlaceHolderId="title" runat="server">
    Foodies-Home
    </asp:Content>

<asp:Content ContentPlaceHolderId="head" runat="server">

    <link rel="stylesheet" href="scripts/animate.css"/>
    <script src="scripts/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>

       <style>

          
        img:hover {
        -webkit-transform:scale(1.2);
        transform:scale(1.2);
                     }
        img {
    -webkit-transition: all 0.7s ease;
    transition: all 0.7s ease;
                }
    
    </style>
 


   

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
 
<div class="jumbotron" style="background-image:url(images/start-screen.jpg);height:250px;">
  <div class="container text-center">
    <div class="wow  rotateInDownLeft" data-wow-duration="1.2s" data-wow-delay=".5s">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif; color:whitesmoke;">Foodies</h1> 
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

