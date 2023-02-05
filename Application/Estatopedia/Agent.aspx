<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Agent.aspx.cs" Inherits="Estatopedia.Agent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head runat="server">--%>
    <%--<title></title>--%>
    <script type="text/javascript">
        function abc() {
            //com_box PRICE
            //lIST 1 drop down
            // textbox 2 shows output

            // debugger;
            var Con = 0;

            //documet.getElementById("TextBox2").innerhtml = x;
            document.getElementById("TextBox2").value = x;
            //  x = document.getElementById("com_box").value; //x=5000

            if ((document.getElementById("list1").value) == "R") {

                //alert("Please select the medium")
                Con = 0.01;

            }
            else if ((document.getElementById("list1").value) == "C") {
                Con = 0.02;

            }
            else if ((document.getElementById("list1").value) == "Select") {

                alert("Please select the medium")
                Con = 0;
            }

            var x = document.getElementById("TextBox1").value;
            x = Con * x;
            document.getElementById("TextBox2").value = x;

        }


    </script>
<%--</head>--%>
<style>
   
 .buttonCss {
            height:30px;
            border-color: #28547E;
            color: #28547E;
            font-family: 'Microsoft JhengHei';
            font-size: 18px;
            width: 100px;
            margin-left: 35%;
            margin-top: 25%;

 }
 .buttonCss1 {
            height:30px;
            border-color: #28547E;
            color: #28547E;
            font-family: 'Microsoft JhengHei';
            font-size: 18px;
            width: 30%;
            margin-left: 20%;
            margin-top: 25%;

 }
 p {
            font-family: 'Microsoft JhengHei';
            color: white;
            font: bold;
            font-size: 20px;
            padding-right: 10px;

 }
 .box{
             height:30px;
            border-color:#28547E;
            border-radius:5px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
            width : 130px;
            }
 .div1 {
            height: 700px;
            margin-right: 800px;
            background-color: #28547E;
            padding-left: 10px;

 }
 body {
    background-image:url("images/Comission.jpg");
    background-repeat:no-repeat;
    background-attachment:fixed;
}

</style>

    <body>
   <%-- <body style="background-image: url('Desktop/CC.png');" >

    <link rel="stylesheet" type="text/css" href="styles.css" />--%>
       <%-- <asp:Image ID="Image1" runat="server" ImageUrl="images/CC.jpg" />--%>

    <form id="form1" runat="server">
        <div class="div1"">
            <p style="text-align:center; font-size:xx-large;"> <strong>Comission Calculator</strong></p>
            <p style="text-align: left">
                Select Property Type: 
        <asp:DropDownList ID="list1" CssClass="buttonCss1" runat="server">
            <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
             <asp:ListItem Text="Residential" Value="R"></asp:ListItem>
             <asp:ListItem Text="Commercial" Value="C"></asp:ListItem>
        </asp:DropDownList>
            </p>

            <p style="text-align: left">
             Enter  Price in Pkr of your Property : &nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:TextBox ID="TextBox1" CssClass="box" runat="server">
                </asp:TextBox>
            </p>

            <asp:Button ID="Button2" OnClientClick="javascript:abc()" CssClass="buttonCss" runat="server" Text="GO" />

            <p style="text-align: left">
             Calculated Comission: &nbsp&nbsp&nbsp&nbsp&nbsp
                 <asp:TextBox ID="TextBox2" CssClass="box" runat="server">
                 </asp:TextBox>

                <asp:Button ID="Button1" OnClick="goback" CssClass="buttonCss" runat="server" Text="GO BACK" />
            </p>
        </div>
    </form>
</body>
</html>