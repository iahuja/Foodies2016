<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="Final_Project.Review"  MasterPageFile="~/Master.Master" %>

<asp:Content ContentPlaceHolderId="title" runat="server">
    Foodies-Review
    </asp:Content>

<asp:Content ContentPlaceHolderId="head" runat="server">

    <link rel="stylesheet" href="scripts/animate.css"/>
    <script src="scripts/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
</asp:Content>
    




<asp:Content ContentPlaceHolderId="nav" runat="server">
    
    
<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="default.aspx"><b>Home</b></a></li>
        <li><a href="Partners.aspx"><b>Partners</b></a></li>
        <li class="active"><a href="#"><b>Review</b></a></li>
          <li><a href="about.aspx"><b>About</b></a></li>
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
    <div class="wow fadeIn">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif; color:whitesmoke;">Reviews</h1> 
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
 <div class="wow  fadeIn searchdiv col-sm-3" style="float:left" >
<asp:DropDownList id="dropdownRestaurant" CssClass="form-control input-lg" runat="server"  style="text-align:center" 
    autopostback="True" />    
</div>

 <div class="wow  fadeIn searchdiv col-sm-3" >
<asp:DropDownList id="locationDropdown" CssClass="form-control input-lg" runat="server"  style="text-align:center" 
    autopostback="true" />    
 </div>

 <div class="wow  fadeIn searchdiv col-sm-3"  style="float:right">
<asp:DropDownList id="dishDropdown" CssClass="form-control input-lg" runat="server"  style="text-align:center" 
    autopostback="true" />    
 </div>

               </form> 

  </div>
   
</div>

        
    <div class="wow bounceInUp" data-wow-duration="1s">
     
  </div>

 </asp:Content>

