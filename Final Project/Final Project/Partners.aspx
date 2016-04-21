<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Partners.aspx.cs" Inherits="Final_Project.Partners" MasterPageFile="~/Master.Master"  %>
<asp:Content ContentPlaceHolderId="title" runat="server">
    Foodies-Partners
    </asp:Content>

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
 
    <script type="text/javascript">
function EditDiv(s){
var id = $(s).attr("value");
__doPostBack(id,id);
}
</script>

    
        
         
     

   

    <script type="text/javascript">
       
        // method to handle events on scrooling 
        var $w = $(window).scroll(function () {
            if ($w.scrollTop() < 180) {
                 $('#voice2').css({ "border-bottom": "2px solid blue" });

                //this method will autohide the navbar on scrolling down
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

<asp:Content ContentPlaceHolderId="main" runat="server">
 
<div class="jumbotron" style="background-image:url(images/start-screen.jpg);height:250px;">
  <div class="container text-center">
    <div class="wow  rotateInDownLeft" data-wow-duration="1.2s" data-wow-delay=".5s">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif; color:whitesmoke;">Partners</h1> 
    </div>
               
  </div>
   
</div>
    
           <form id="s" runat="server"> 
<asp:TextBox  runat="server"  style="display:none" 
    autopostback="true" placeholder="Search Food"></asp:TextBox>
                     </form>


        
    <div class="wow bounceInUp" data-wow-duration="1s">
     
 <div class="container-fluid bg-3 text-center">
  <h1>We Are Together Two Serve You Better</h1><br>
     
     <!-- this code is looping through the list and displayng dynamic data
         -->
    <%
        for (int i = 0; i < restaurant.Count; i++)
        {
            if ( i%4==0)
            {
                Response.Write("<div class="+'"'+"row"+'"'+">");
            }
            Response.Write("<div class="+'"'+"col-sm-3 restaurantsImage"+'"'+" id="+'"'+""+i+""+'"'+" ><h4>"+restaurant[i]+"</h4>");
            Response.Write(" <img id='image' src="+'"'+"Images/Restaurants/"+restaurantImage[i]+'"'+" class="+'"'+"img-responsive"+'"'+" style='width:100%' runtat="+'"'+"server"+'"'+" value="+'"'+restaurant[i]+'"'+"onClick="+'"'+"EditDiv(this)"+'"'+ "></div>");
            
           
            if (i>0 && i%4==3)
            {

                Response.Write("</div><br/>");

            }
        }
         %>
    </div> </div>


 </asp:Content>
