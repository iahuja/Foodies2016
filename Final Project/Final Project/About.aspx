<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Final_Project.About" MasterPageFile="~/Master.Master" %>


<asp:Content ContentPlaceHolderId="title" runat="server">
   About
    </asp:Content>

<asp:Content ContentPlaceHolderId="nav" runat="server">

<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="default.aspx"><b>Home</b></a></li>
        <li class="active"> <a href="#"><b>About</b></a></li>
           
        <li><a href="Partners.aspx"><b>Partners</b></a></li>
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