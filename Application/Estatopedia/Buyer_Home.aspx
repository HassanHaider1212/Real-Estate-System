<%@ Page Title="" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="Home2.aspx.cs" Inherits="Estatopedia.Home2" %>
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
            width:46%;
        }

        .gridview {
            text-align: right;
            vertical-align: text-top
        }
        p 
        {
            font-family:'Microsoft JhengHei';
            color:white;
            font:bold;
            font-size:20px;
            padding-right:10px;
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
        <div class="div1">
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
        &nbsp&nbsp&nbsp<strong>Delete Favourites</strong><br />
        &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes" ID="DeleteID" PlaceHolder ="Listing Id" runat="server" Width="200px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="DeleteLButton" CssClass="button1" Text="Delete" OnClick="DeleteLButton_Click" runat="server"  />
          </br></br>
        &nbsp&nbsp&nbsp<strong>Favourites</strong><br />
        &nbsp&nbsp&nbsp<asp:GridView ID="GridView1" style =" background-color:antiquewhite; text-align:center " runat="server" Width="495px">
        </asp:GridView>
        </div>
</asp:Content>