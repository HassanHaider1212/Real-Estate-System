<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddLisitings.aspx.cs" Inherits="Estatopedia.AddLisitings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="style.css"/>
    <style>
        #loginBox{
            border-style: none;
            border-color: inherit;
            border-width: 5px;
height: 170%;
            width: 30%;
            margin-left:0px;
            background-color:#28547E;
            text-align:center;
            position: absolute;
            top: 18px;
            left: 10px;
        }
        p{
            font-family:'Microsoft JhengHei';
            color:white;
            font:bold;
            font-size:20px;
            padding-right:10px;
        }
        .textboxes{
            height:26px;
            border-color:#28547E;
            border-radius:5px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:16px;
            width:40%;
        }
        a{
            border:thick;
            border-color:white;
            color:black;
        }
        #signupbutton{
            height:26px;
            border-radius:5px;
            border-color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:15px;
        }
        #DescriptionBox{
            height:50px;
            border-color:#28547E;
            border-radius:5px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
            width:40%;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div id="loginBox" >
            <strong>LISTING DETAILS</strong>
                 <p>
         Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox1" runat="server"></asp:TextBox>
        <br />      
         City :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Location :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox3" runat="server"></asp:TextBox>
        <br />
        Size :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        Storyes :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox7" runat="server"></asp:TextBox>
        <br />
        BedRooms:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox8" runat="server"></asp:TextBox>
        <br />
        BathRooms:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox9" runat="server"></asp:TextBox>
        <br />
        Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="TextBox10" runat="server"></asp:TextBox>
        <br />
        Purpose: <asp:RadioButton ID="RentButton" GroupName="Purp" runat="server" /> Rent&nbsp;&nbsp; &nbsp&nbsp; <asp:RadioButton ID="SaleButton" GroupName="Purp" runat="server" /> Sale
        <br />
        Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RadioButton ID="CommButton" GroupName="Typ" runat="server" /> Commercial &nbsp <asp:RadioButton ID="ResButton" GroupName="Typ" runat="server" /> Resedential<br />
         Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="DescriptionBox" TextMode="MultiLine" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="AddListingsButton" Text="Add Listings" runat="server" OnClick="AddListingsButton_Click" />
        <br /><br />
            </p>
        </div>
        </div>
    </form>
</body>
</html>
