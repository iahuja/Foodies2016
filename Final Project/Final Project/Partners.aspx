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
           
        <li class="active"><a href="#"><b>Partners</b></a></li>
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
                  
        <style>
#searchdiv{
  width: 50%;
  margin:auto;
  -webkit-transition: width .35s ease-in-out;
  transition: width .35s ease-in-out;
}
 
       </style>
  </div>
   
</div>

        
    <div class="wow bounceInUp" data-wow-duration="1s">
     
 <div class="container-fluid bg-3 text-center">
  <h1>Trending</h1><br>
     
     <!-- this code is looping through the list and displayng dynamic data
         -->
    <%
        for (int i = 0; i < restaurant.Count; i++)
        {
            if ( i%4==0)
            {
                Response.Write("<div class="+'"'+"row"+'"'+">");
            }
            Response.Write("<div class="+'"'+"col-sm-3 restaurantsImage"+'"'+" id="+'"'+""+i+""+'"'+" ><h4>"+restaurant[i]+i+"</h4>");
            Response.Write(" <img  src="+'"'+"http://placehold.it/150x80?text=IMAGE"+'"'+" class="+'"'+"img-responsive"+'"'+" style='width:100%' runtat="+'"'+"server"+'"'+" value="+'"'+restaurant[i]+'"'+"onClick="+'"'+"EditDiv(this)"+'"'+ "></div>");
            
           
            if (i>0 && i%4==3)
            {

                Response.Write("</div><br/>");

            }
        }
         %>
    </div> </div>

    <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 id="modaltitle" class="modal-title">Restaurant Name</h4>
      </div>
      <div class="modal-body" id="modalBody">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
 </asp:Content>
