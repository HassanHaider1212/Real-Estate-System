<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Estatopedia.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log In</title>
    <link rel="stylesheet" href="style.css"/>
    <style>
        #loginBox{
            height: 98%;
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
            font-size:25px;
            padding-right:10px;
        }
        .textboxes{
            height:30px;
            border-color:#28547E;
            border-radius:5px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
            width:45%;
        }
        a{
            border:thick;
            border-color:white;
            color:black;
        }
        #loginbutton{
            height:30px;
            border-radius:5px;
            border-color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
        }

    </style>
    
</head>

<body style="justify-content:center; background-image:url(images/loginpic4.jpg); norep">
    <form id="form1" runat="server">
        <div id="loginBox" >
            <img src="images/l.png" style="margin-top:50px; width:60%;" />
            <p>
                Login ID : <asp:TextBox CssClass="textboxes" ID="mailbox" Placeholder="Mail" runat="server"></asp:TextBox><br /><br />
                Password : <asp:TextBox CssClass="textboxes" ID="passwordbox" Placeholder ="Password" TextMode="Password" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="loginbutton" text="Log In" runat="server" OnClick="loginbutton_Click" />
                <br /><br />  
                Click To  <a href="SignUp.aspx" >Sign Up</a>
            </p>
        </div>
    </form>
</body>
</html>