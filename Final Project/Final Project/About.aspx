<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Final_Project.About" MasterPageFile="~/Master.Master" %>


<asp:Content ContentPlaceHolderId="title" runat="server">
   About
    </asp:Content>

<asp:Content ContentPlaceHolderId="nav" runat="server">

<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li ><a href="index.aspx"><b>Home</b></a></li>
        <li class="active"> <a href="#"><b>About</b></a></li>
           
        <li><a href="#"><b>Gallery</b></a></li>
        <li><a href="#"><b>Contact</b></a></li>
      </ul>
       <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
          <a class="dropdown-toggle glyphicon glyphicon-user" data-toggle="dropdown" href="#"> <span id="client"></span>
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li onclick="Logout()"><a href="#">Logout</a></li> 
          </ul>
        </li>

      </ul>
    </div>
 </asp:Content>