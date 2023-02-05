<%@ Page Title="" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Estatopedia.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
  .div1
        {
            height: 80%;
            /*margin-right: 65%;*/     
            width:35%;
            background-color: #28547E;
            padding-left:10px;
            float:left;
        }
    p{
            font-family:'Microsoft JhengHei';
            color:white;
            font:bold;
            font-size:20px;
            padding-right:10px;
        }
    </style>
 <h3 style="text-align:center; font-size:xx-large; color:black"><strong>Contact Information</strong></h3>

 <div style="float:right; width:65%; ">
 <asp:Image ID="Image1" runat="server" ImageUrl="images/contact.jpg" /> 
    </div>

 <div class="div1" >
  <div id="fh5co-contact">
   <div class="container">
    <div class="row">
     <div class="col-md-8 col-md-offset-2 text-center heading-section animate-box">
      
      <p><strong>WE WANT TO HEAR FROM YOU</strong></p>
     </div>
    </div>
    <form action="#">
     <div class="row animate-box">
      <div class="col-md-6">
       <h3 class="section-title" style="text-align:center; color:white">Our Address</h3>
       
       <ul class="contact-info" style="text-align:left; color:white">
        <li><i class="icon-location-pin"></i>852-B Milaad St, Block B Faisal Town, Lahore, Punjab 54770</li>
        <li><i class="icon-phone2"></i>0300-4658265</li>
        <li><i class="icon-mail"></i><a href="https://accounts.google.com/AccountChooser/signinchooser?service=mail&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&flowName=GlifWebSignIn&flowEntry=AccountChooser" style="text-align:left; color:white">l201011@lhr.nu.edu.pk</a></li>
        <li><i class="icon-mail"></i><a href="https://accounts.google.com/AccountChooser/signinchooser?service=mail&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&flowName=GlifWebSignIn&flowEntry=AccountChooser" style="text-align:left; color:white">l201005@lhr.nu.edu.pk</a></li>
        <li><i class="icon-mail"></i><a href="https://accounts.google.com/AccountChooser/signinchooser?service=mail&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&flowName=GlifWebSignIn&flowEntry=AccountChooser" style="text-align:left; color:white">l201152@lhr.nu.edu.pk</a></li>
        <li><i class="icon-mail"></i><a href="https://accounts.google.com/AccountChooser/signinchooser?service=mail&continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&flowName=GlifWebSignIn&flowEntry=AccountChooser" style="text-align:left; color:white">l200925@lhr.nu.edu.pk</a></li>
        
           <li><i class="icon-globe2"></i><a href="#" style="text-align:left; color:white">www.yoursite.com</a></li>
       </ul>
      </div>
      <div class="col-md-6">
      
      </div>
     </div>
    </form>
   </div>
  </div>
  </div>
  
</asp:Content>
