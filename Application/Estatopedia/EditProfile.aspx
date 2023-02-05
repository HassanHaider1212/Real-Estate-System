<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Estatopedia.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
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
            font-size: 20px;
            padding-right: 10%;
            width: 474px;
        }
         .div1
        {
             height: 98%;
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
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:22px;
        }
    </style>
<body style="justify-content:center; background-image:url(images/img_bg_1.jpg);">
    <form id="form1" runat="server">
      <div class="div1">
             <p style="text-align:center; font-size:xx-large;"> <strong>Update Details</strong></p>
            
            <p>
        User Name: &nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="NameBox"  runat= "server"></asp:TextBox>
        <br /><br />
        Contact Number:&nbsp;&nbsp; <asp:TextBox CssClass="textboxes" ID="NumBox"    runat="server"></asp:TextBox>
        <br /><br />
        Age:&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="AgeBox" CssClass="textboxes"   runat="server"></asp:TextBox>
        <br /><br />
        Profile Description:<asp:TextBox ID="DescriptionBox" TextMode="MultiLine" CssClass="textboxes"   runat="server" Height="90px" Width="220px"></asp:TextBox>
                </p>
            <br></br><br />&nbsp;<br /> &nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="button1" ID="ApplyF" text="Apply" onclick="UpdatePageLoad" runat="server" />

        </div>
    </form>
</body>
</html>
