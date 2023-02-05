<%@ Page Title="" Language="C#" MasterPageFile="~/myMaster.Master" AutoEventWireup="true" CodeBehind="_Properties.aspx.cs" Inherits="Estatopedia._Properties" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="message" runat="server">
    </div>

    <html>
<head >
    <title>Apply Filter</title>
    <link rel="stylesheet" href="style.css"/>
    <style>
        p{
            font-family:'Microsoft JhengHei';
            color:white;
            font:bold;
            font-size:20px;
            padding-right:10px;
        }
        .textboxes{
             height:30px;
            border-color:#28547E;
            border-radius:5px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
            width : 130px;
            }

        .textboxes1{ 
             border-color:#28547E;
            border-radius:5px;
            background-color:#28547E;
            color:white;
            font-family:'Microsoft JhengHei';
            font-size:22px;
            border-style:none;
        }
        .button1{
             height:30px;
            border-radius:5px;
            color:#28547E;
            border-color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
        }
         .button2{
            height:30px;
            width:100px;
            margin-left: 28%;
            margin-bottom:400%;
            border-color:#28547E;
            border-radius:10px;
            color:#28547E;
            font-family:'Microsoft JhengHei';
            font-size:18px;
            box-shadow: 2px 4px Yellow;    
        }
        .div1
        {
            height: 100%;
            /*margin-right: 65%;*/     
            width:35%;
            background-color: #28547E;
            padding-left:10px;
            float:left;
        }
    </style>
   
</head>

<body>
        
        <div class="div1">          
            
                <p style="text-align:center; font-size:xx-large;"> <strong>Apply Filter(s)</strong></p>
            <p>
            <strong>Price:</strong>   &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:TextBox CssClass="textboxes" ID="Pricebox_min" runat="server" placeholder="min"></asp:TextBox> &nbsp <asp:TextBox CssClass="textboxes" ID="Pricebox_max" runat="server" placeholder="max"></asp:TextBox>
            <br /><br />
            <strong>Area:</strong>     &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:TextBox CssClass="textboxes" ID="Areabox_min" runat="server" placeholder="min"></asp:TextBox> &nbsp <asp:TextBox CssClass="textboxes" ID="Areabox_max" runat="server" placeholder="max"></asp:TextBox>
            <br /><br />
            <strong>Bedrooms:</strong> &nbsp&nbsp&nbsp <asp:TextBox CssClass="textboxes" ID="_bedrooms" runat="server"></asp:TextBox>
            <br /><br />
            <strong>Bathrooms:</strong>&nbsp&nbsp&nbsp <asp:TextBox CssClass="textboxes" ID="_bathrooms" runat="server"></asp:TextBox>
            <br /><br />          
            <strong>Storeys:</strong>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp     <asp:TextBox CssClass="textboxes" ID="_storeys" runat="server"></asp:TextBox>
            <br /><br /> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="button1" ID="Search" text="Apply Filters" runat="server" OnClick="Search_Button_Click" />
            <br /><br />
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="button1" ID="Reset" text="Reset" runat="server" OnClick="Reset_Button_Click" />
            </p>
            <br></br>
        </div>
    
    <div >
        &nbsp&nbsp&nbsp<asp:DropDownList ID="sortingList" CssClass="textboxes1" runat="server" Width="387px" >
            <asp:ListItem Text ="Select" Value ="0"></asp:ListItem>
            <asp:ListItem Text ="Price: High to Low" Value ="1"></asp:ListItem>
            <asp:ListItem Text ="Price: Low to High" Value ="2"></asp:ListItem>
            <asp:ListItem Text ="Popularity" Value ="3"></asp:ListItem>
        </asp:DropDownList>&nbsp&nbsp<asp:Button ID="SortButton" CssClass="button1" Text="Sort" runat="server" OnClick="SortButton_Click"/>
        </br></br>
           &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes1" ID="SearchBar" PlaceHolder ="Search" runat="server" Width="351px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="Search1" CssClass="button1" Text="Search" runat="server" OnClick="Search1_Click"/>
        </br></br>
       &nbsp&nbsp&nbsp<asp:TextBox CssClass="textboxes1" ID="FavId" PlaceHolder ="Listing Id" runat="server" Width="208px"></asp:TextBox>&nbsp&nbsp<asp:Button ID="FavButton" CssClass="button1" Text="Add To Favourites" runat="server" OnClick="FavButton_Click" />
     </br></br>
        <asp:GridView ID="ItemGrid" style ="background-color:antiquewhite; text-align:center "  runat="server" Width="495px">
        </asp:GridView>
        </div>
      
</body>
</html>
</asp:Content>
