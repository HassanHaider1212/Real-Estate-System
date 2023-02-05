<%@ Page Title="" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Estatopedia.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .box {
            height:30px;
            border-color:#28547E;
            border-radius:10px;
            box-shadow: 2px 4px red;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:70%;
            width:50%;
        }

        .gridview {
            text-align: right;
            vertical-align: text-top
        }
        p {
            font-family: 'Microsoft JhengHei';
            color: white;
            font:bold;
            font-size: 20px;
            padding-right: 10%;
        }
         .div1
        {
             height: 100%;
            /*margin-right: 65%;*/        
            background-color: #28547E;
            padding-left:10px;
            float:left;

        }
         .button1
         {
                     height:30px;
            border-radius:5px;
            border-color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
        }
        .textboxes
        {
            border-color:#28547E;
            border-radius:5px;
            background-color:#28547E;
            color:white;
            font-family:'Microsoft JhengHei';
            font-size:22px;
            border-style:none;
        }
    </style>
    
    
  <body>
  
     <%-- <asp:GridView ID="ItemGrid" runat="server"  AllowPaging="true" style=" width:250px; color:brown;">
    </asp:GridView>--%>
        <div class="div1" >
             <p style="text-align:center; font-size:xx-large;"> <strong>User Details</strong></p>
            
            <p>
        User Name: &nbsp&nbsp&nbsp <asp:TextBox CssClass="textboxes" ID="NameBox" ReadOnly="true" runat= "server"></asp:TextBox>
        <br /><br />
        E-Mail Address: <asp:TextBox CssClass="textboxes" ID="MailBox" ReadOnly="true"  runat="server"></asp:TextBox>
        <br /><br />
        Contact Number: <asp:TextBox CssClass="textboxes" ID="NumBox"  ReadOnly="true"  runat="server"></asp:TextBox>
        <br /><br />
        Age:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:TextBox ID="AgeBox" CssClass="textboxes" ReadOnly="true"  runat="server"></asp:TextBox>
        <br /><br />
        CNIC: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="CNICBox" CssClass="textboxes" ReadOnly="true"  runat="server"></asp:TextBox>
        <br /><br />
        Gender: <asp:TextBox ID="Gender" CssClass="textboxes" ReadOnly="true"  runat="server"></asp:TextBox>
        <br /><br />
        Profile Description:<asp:TextBox ID="DescriptionBox" TextMode="MultiLine" CssClass="textboxes" ReadOnly="true"  runat="server" Height="90px" Width="220px"></asp:TextBox>
                </p>
            <br></br><br /><br /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="button1" ID="UpdateP" text="Update Profile" runat="server" OnClick="UpdatePageLoad" Width="129px" />
         

        </div>

    <div >
        &nbsp&nbsp&nbsp<asp:Button ID="AddListings" CssClass="button1" Text="Add New Listings" runat="server" OnClick="AddListings_Click"  />
        <br/>
        <br/>
        &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes" ID="DeleteID" PlaceHolder ="Listing Id" runat="server" Width="200px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="DeleteLButton" CssClass="button1" Text="Delete" runat="server" OnClick="DeleteLButton_Click" /><br />
        &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes" ID="SoldID" PlaceHolder ="Listing Id" runat="server" Width="200px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="SoldButton" CssClass="button1" Text="Mark As Sold" runat="server" OnClick="SoldButton_Click" />
     
          </br></br>
        &nbsp&nbsp&nbsp<strong>Listings</strong><br />
        &nbsp&nbsp&nbsp<asp:GridView ID="ListingView" style =" background-color:antiquewhite; text-align:center " runat="server" Width="495px">
        </asp:GridView>
         <br /> <br />
         &nbsp&nbsp&nbsp<strong>Tenants</strong><br />
        &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes" ID="TMailBox" PlaceHolder ="Tenant Mail" runat="server" Width="200px"></asp:TextBox>
        &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes" ID="ListIDBox" PlaceHolder ="Listing Id" runat="server" Width="200px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="AddTenant" CssClass="button1" Text="Add a Tenant" runat="server" OnClick="TenantButton_Click" /><br />
     
        &nbsp&nbsp&nbsp<asp:GridView ID="TenantView" style =" background-color:antiquewhite; text-align:center " runat="server" Width="495px">
        </asp:GridView>
        </div>

    </body>
</asp:Content>