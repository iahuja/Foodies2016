<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RestaurantMenu.aspx.cs" Inherits="Final_Project.RestaurantMenu" MasterPageFile="~/Master.Master"  %>

<asp:Content ContentPlaceHolderId="head" runat="server">

    <link rel="stylesheet" href="scripts/animate.css"/>
    <script src="scripts/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>
             <style>
      #image:hover {
        -webkit-transform:scale(1.2);
        transform:scale(1.2);
                     }

        #image {
    -webkit-transition: all 0.7s ease;
    transition: all 0.7s ease;
     height: 200px;
      width:100%;
    overflow: hidden;
  border:1px solid #021a40;
}
   
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderId="nav" runat="server">
<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="default.aspx"><b>Home</b></a></li>
        <li><a href="about.aspx"><b>About</b></a></li>
           

        <li class="active"><a href="Partners.aspx"><b>Partners</b></a></li>
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



<asp:Content runat="server" ContentPlaceHolderID="main">
<div class="jumbotron" style="background-image:url(images/start-screen.jpg);height:250px;">
  <div class="container text-center">
    <div class="wow  rotateInDownLeft" data-wow-duration="1.2s" data-wow-delay=".5s">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif; color:whitesmoke;"><%=restaurantName %></h1> 
    </div>
               
  </div>
   
</div>
    <div class="container-fluid bg-3 text-center">
  <h1><%=restaurantName %> Menu:</h1><br>
     
     <!-- this code is looping through the list and displayng dynamic data
         -->
    <%
        for (int i = 0; i < menu.Count; i++)
        {
            if ( i%4==0)
            {
                Response.Write("<div class="+'"'+"row"+'"'+">");
            }
            Response.Write("<div class=" + '"' + "col-sm-3 restaurantsImage" + '"' + " id=" + '"' + "" + i + "" + '"' + " ><h4>" + menu[i].Dish +":$"+menu[i].Price + "</h4>");
            Response.Write(" <img  src="+'"'+"Images/Dishes/"+menu[i].Image+'"'+" class="+'"'+"img-responsive"+'"'+" style='width:100%' runtat="+'"'+"server"+'"'+" value="+'"'+menu[i].Dish+'"'+" id='image'></div>");
            Response.Write("<input type="+'"'+"hidden"+'"'+" id="+'"'+"hidden"+i+'"'+"value="+'"'+""+menu[i].Dish+"|"+menu[i].Price +'"'+" />");


            if (i>0 && i%4==3)
            {

                Response.Write("</div><br/>");

            }
        }
         %>
    </div>
    </asp:Content>