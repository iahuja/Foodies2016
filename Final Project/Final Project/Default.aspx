<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Final_Project.HomePage" MasterPageFile="~/Master.Master" %>

<asp:Content ContentPlaceHolderId="title" runat="server">
    Foodies-Home
    </asp:Content>

<asp:Content ContentPlaceHolderId="head" runat="server">

    <link rel="stylesheet" href="scripts/toast.css"/>
    <script src="scripts/toaster.js"></script>

    <link rel="stylesheet" href="scripts/animate.css"/>
    <script src="scripts/wow.min.js"></script>
              <script>
              new WOW().init();
              </script>

       <style>
           table {
    border-collapse: collapse;
    width: 60%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

           body {
    background-color: whitesmoke;

}
          
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
function passData(s){
var id = $(s).attr("value");
__doPostBack(id,id);
}
</script>


    <!-- This script is tracking user click and displaying information on the BootStrap modal -->
    <script>
        
      $(document).ready(function () {
          $(".restaurantsImage").click(function () {
              var hidden = "hidden" + this.id;
              var value = document.getElementById(hidden).value;
              var info = value.split("|");
              setModalContent(info);
              $("#myModal").modal();
              getSessionUserInfo();
          });
           
          <%

        string check = (string)Session["ReviewAdded"];

        if (check == "true")
        {
            Response.Write("toast();");
        }

        Session["ReviewAdded"] = "false";
         %>
        

          function toast()
          {
               

              Command: toastr["success"]("Thanks For The Review", "Awesome")

              toastr.options = {
                  "closeButton": true,
                  "debug": false,
                  "newestOnTop": false,
                  "progressBar": true,
                  "positionClass": "toast-top-center",
                  "preventDuplicates": false,
                  "showDuration": "300",
                  "hideDuration": "1000",
                  "timeOut": "5000",
                  "extendedTimeOut": "1000",
                  "showEasing": "swing",
                  "hideEasing": "linear",
                  "showMethod": "fadeIn",
                  "hideMethod": "fadeOut"
              }
              }
          


      });
       
     function setModalContent(info)
     {
         document.getElementById("modalDish").innerHTML = info[0];
         document.getElementById("modaltitle").innerHTML = info[1];
         document.getElementById("modalAddress").innerHTML = info[2];
         document.getElementById("modalContact").innerHTML = info[3];
         document.getElementById("modalPrice").innerHTML = info[4];
         document.getElementById("reviewButton").value = info[5];
         document.getElementById("<%= R_IDForReview.ClientID %>").value=info[5];
         document.getElementById("<%= D_IDForReview.ClientID %>").value = info[6];
     }
        
     $(document).ready(function () {
         $(".restaurantsImage").click(function () {
             var hidden = "reviews" + this.id;
             document.getElementById("modalReview").innerHTML = "<h5>No Reviews Yet</h5><h6>Be The First One To Add</h6>";
             var value = document.getElementById(hidden).value;
            
             var info = value.split("^");
             if (info.length > 2) {
                 document.getElementById("badge").innerHTML = info.length / 3;
                 setModalreviews(info);
                 $("#myModal").modal();
             }
            
             
         })
     });;


       

     function setModalreviews(info) {

         var list="";
         for (var key in info)
         {
             if(key%3==0)
             {
                 list += "<tr>";
                 list += "<td><img id='imaeg' src="+'"'+info[key]+'"'+" style='border-radius:50%; height:80px; padding-top:10px; ' class='img-responsive'  alt='Image'/></td>";
             }
             else
             {
             list += "<td>" + info[key] + "</td>";
              }

            if (key > 0 && key % 3 == 2)
            {
                list += "</tr>";
            }
           
         }
     
        document.getElementById("modalReview").innerHTML = list;
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
        function getSessionUserInfo()
        {

            document.getElementById("<%= SessionUserImage.ClientID %>").value = document.getElementById("my").src;
            document.getElementById("<%= SessionUserName.ClientID %>").value = document.getElementsByClassName(".client").value;
        }
    </script>
    

</asp:Content>
    




<asp:Content ContentPlaceHolderId="nav" runat="server">
    
    
<div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><b>Home</b></a></li>
        <li><a href="about.aspx"><b>About</b></a></li>
           
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

<asp:Content ContentPlaceHolderId="main" runat="server">
 <form id="s" runat="server"> 
     <asp:HiddenField ID="SessionUserName"  value="sessionUsername" runat="server" />
      <asp:HiddenField ID="SessionUserImage"  value="sessionUsername" runat="server" />
     <asp:HiddenField ID="R_IDForReview"  value="R_IDForReview" runat="server" />
      <asp:HiddenField ID="D_IDForReview"  value="D_IDForReview" runat="server" />
      

<div class="jumbotron" style="background-image:url(images/start-screen.jpg);height:250px;">
  <div class="container text-center">
    <div class="wow fadeIn">
        <h1 id="logo" style="font-family:'Comic Sans MS', cursive, sans-serif; color:whitesmoke;">Foodies</h1> 
    </div>
                  
        <style>
#searchdiv{
  width: 50%;
  margin:auto;
  -webkit-transition: width .35s ease-in-out;
  transition: width .35s ease-in-out;
}
 .restaurantsImage { 
   position: relative; 

}


       </style>
      
           
 <div id="searchdiv" class="wow  fadeIn" >
<asp:TextBox id="search" CssClass="form-control input-lg" runat="server"  style="text-align:center" 
    autopostback="true" placeholder="Search Food"></asp:TextBox>
      
 </div>
               

  </div>
   
</div>

        
    <div class="wow bounceInUp" data-wow-duration="1s">
     
 <div class="container-fluid bg-3 text-center">
  <h1><%=Session["searchRecord"]%></h1><br>

     <!-- this code is looping through the list and displayng dynamic data
         -->
    <%
        for (int i = 0; i < restaurant.Count; i++)
        {
            if ( i%4==0)
            {
                Response.Write("<div class="+'"'+"row"+'"'+">");
            }
           
            Response.Write("<div class="+'"'+"col-sm-3 restaurantsImage"+'"'+" id="+'"'+""+i+""+'"'+" ><h4 id='imagetext'>"+restaurant[i].dish+"</h4>");
            Response.Write(" <img id='image' src="+'"'+"Images/Dishes/"+restaurant[i].image+'"'+" class="+'"'+"img-responsive"+'"'+" style='width:100%' runtat="+'"'+"server"+'"'+"></div>");
            Response.Write("<input type="+'"'+"hidden"+'"'+" id="+'"'+"hidden"+i+'"'+"value="+'"'+restaurant[i].dish+"|"+
                restaurant[i].restaurant+"|"+restaurant[i].location +"|"+restaurant[i].contact+
                "|"+restaurant[i].Price+"|"+restaurant[i].restauranID+"|"+restaurant[i].dishID+'"'+" />");

            int co = 0;
            co= restaurant[i].revList.Count;
            if (co > 0)
            {
               
                Response.Write("<input type=" + '"' + "hidden" + '"' + " id=" + '"' + "reviews" + i + '"' + "value=" + '"');

           
            for (int k=0; k < co;k++ )
            {

                if (k != co)
                {
                    if (k != 0)
                    {
                        Response.Write("^");
                    }
                    Response.Write(restaurant[i].revList[k]);
                }

            }

            Response.Write('"'+" />");
             }


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
      <div class="modal-body">
          <h6><span id="modalDish"></span> $<span id="modalPrice"></span></h6>
          <h6>Restaurant Location:</h6>
       <div id="modalAddress"><p>Address</p></div>
          <h6>Contact: <span id="modalContact"></span></h6>
            <button type="button" class="btn btn-primary" id="reviewButton" data-toggle="collapse" data-target="#review" value="">Review(s) <span id="badge" class="badge">0</span></button>
                  <div id="review" class="collapse">
                      <div class="scroll"> <table id="modalReview"></table> </div>
                      <label for="comment">Review:</label>
                      
                      <asp:TextBox class="form-control" TextMode="multiline" ID="reviewText"
                          runat="server" Rows="2"></asp:TextBox>
                      <br/>
                      
      <asp:Button runat="server" Text="Add Review" class="btn btn-primary"
          id="AddReview" value="value" data-toggle="collapse" data-target="#review" OnClick="ReviewClicked"  />
                </div>
                            
                     
           </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

      <style>
          div.scroll {
    width: auto;
     height: 200px;
    overflow-y: scroll;
}
          #modalReview{
              text-align:center;
              align-content:center;
          }

      </style>

  </div>
</div>
       </form>
 </asp:Content>

