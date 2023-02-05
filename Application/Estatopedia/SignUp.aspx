<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Estatopedia.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <link rel="stylesheet" href="style.css"/>
    <style>
        #loginBox{
            height: 140%;
            width: 30%;
            border: 5px;
            margin-left:0px;
            background-color:#28547E;
            text-align:center;
            position: absolute;
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

<body style="justify-content:center; background-image:url(images/loginpic4.jpg); norep">
    <form id="form2" runat="server">
        <div id="loginBox" >
            <img src="images/l.png" style="margin-top:50px; width:60%;" />
        <p>
        User Name: <asp:TextBox CssClass="textboxes" ID="NameBox" runat="server"></asp:TextBox>
        <br /><br />
        E-Mail Address: <asp:TextBox CssClass="textboxes" ID="MailBox" runat="server"></asp:TextBox>
        <br /><br />
        Password: <asp:TextBox CssClass="textboxes" ID="PassBox" TextMode="Password" runat="server"></asp:TextBox>
        <br /><br />
        Contact Number: <asp:TextBox ID="NumBox" CssClass="textboxes" runat="server"></asp:TextBox>
        <br /><br />
        Age: <asp:TextBox ID="AgeBox" CssClass="textboxes" runat="server"></asp:TextBox>
        <br /><br />
        CNIC: <asp:TextBox ID="CNICBox" CssClass="textboxes" runat="server"></asp:TextBox>
        <br /><br />
        User Type: <asp:RadioButton ID="SellerButton" GroupName="UserType" runat="server" /> Seller &nbsp <asp:RadioButton ID="BuyerButton" GroupName="UserType" runat="server" /> Buyer
        <br /><br />
        Gender: <asp:RadioButton ID="MaleButton" GroupName="Gender" runat="server" /> Male &nbsp <asp:RadioButton ID="FemaleButton" GroupName="Gender" runat="server" /> Female
        <br /><br />
        Profile Description: <asp:TextBox ID="DescriptionBox" TextMode="MultiLine" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="signupbutton" Text="Create Account" runat="server" OnClick="signupbutton_Click" />
        <br /><br />
            Click To  <a href="Login.aspx" >Log In</a> if you Already Have an Account.
            </p>
        </div>

        
    </form>
</body>
</html>

