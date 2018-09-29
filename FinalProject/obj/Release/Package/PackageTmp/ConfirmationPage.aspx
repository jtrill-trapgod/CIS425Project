<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmationPage.aspx.cs" Inherits="FinalProject.ConfirmationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation Page</title>
    <style>
/*right now the colors are
body - #2A2C2D;
tables - #474747;
gamecrypt orange - #FF9859
and text is just white */

        /*changing body font and background color to the grey we like and text to white*/
        body
        {
            font-family: Calibri, sans-serif;
            background-color:#2A2C2D;
            color: white;
        }
        /* to give the content left padding - chris*/
        body #container{
            padding-left: 25px;
        }

        /*set's all table TD and TR to a lighter grey*/
        td, tr
        {
            background-color: #474747;
            color: white;
        }
        
        /*for header 1 thank you text on Confirmation Page - Joe W*/
        #thankyou
        {
            background-color: #474747;
            margin: auto;
            width:50%;
            max-width:75%;
            text-align: center;
        }

        /*that hawt margin to make it sexy for the headings so it only had 10px margin on top*/
        h2
        {
            color:#FF9859;
            margin: 10px 0px 0px 0px;
        }
       
        /*used for coloring just the GameCrypt word with a SPAN - Joe W*/
        .gamecrypt
        {
            color:#FF9859;
        }

        
        /*-BEGIN NAVBAR - all of this stuff below is to make the Nav bar look correctly... in other words, beginning of CSS for nav bar at the top*/
        .navigationHorizontalBar ul
        {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #474747;
        width: auto;
        height: 47px;
        
        }        
        .navigationHorizontalBar li
        {
        float: left; 
        }
        .navigationHorizontalBar li a
        {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;

        }

        /*when the cursor is over the navbar panel/item this makes it change color*/
        li a:hover 
        {
        background-color: #111;
        color:#FF9859;
        }

        /*part of navigation bar for the search on the right side*/
        #searchItem
        {
            float:right;
            height: auto;
            padding: 10px;
        }
    /*end of nav bar code - Joe W*/
        .auto-style1 {
            text-align: center;
        }
    /* content */

            footer
        {
            text-align: center;
            height:auto;
            width:auto;
        }
        </style>
</head>
<body>


    <!-- the logo image div is right here-->
    <form id="form1" runat="server">
    <div id="logoDiv" class="auto-style1">
        <asp:ImageButton ID="logoImageButton" runat="server" ImageUrl="~/contentimages/GameCryptLong.png" Width="600px" OnClick="logoImageButton_Click" />
                            </div>

        <div class="navigationHorizontalBar">  
         <ul>
             <!-- 
                 list of the current pages i think we will make?
                 1. Landing Page
                 2. Search Products Page
                 3. Shopping Cart Page
                 4. Billing Info Page
                 5. Purchase Confirmation Page
                 6. Cancellation Page
                 7. Contact Page?
                 8. About Page?
                 -->
            <li><a href="./landingpage.aspx">Home</a></li>
            <li><a href="./shoppingcart.aspx">Shopping Cart</a></li>
            <li><a href="./AboutGameCrypt.aspx">About</a></li>
            <li id="searchItem"> <asp:TextBox ID="searchTextBox" runat="server" Height="20px" Width="250px"></asp:TextBox><asp:Button ID="searchButton" runat="server" Text="Search" Height="25px" Width="60px" OnClick="searchButton_Click" /></li>
        </ul>
    </div>

        <!-- beginning of crap underneath the NAVBAR - Joe -->
<div id="container"> <!-- shoppingContainer Div for margin - Chris-->
<br />
<br />
<h1 id="thankyou">Thank you for shopping at <span class="gamecrypt">GAMECRYPT</span>!
</h1>


<h2>Order Summary</h2>
        <div>
            Sales Order Number: 
            <asp:Label ID="orderNumLabel" runat="server" Text="Label"></asp:Label>
            <br />
            Sales Order Date:
            <asp:Label ID="dateLabel" runat="server" Text="Label"></asp:Label>
    </div>

<h2>Billing Information</h2>
        <div>
            <br />
            <asp:Label ID="customerFullNameLabel" runat="server" Text="Customer Full Name Label"></asp:Label>
            <br />
            <asp:Label ID="addresLine1Label" runat="server" Text="Address Line 1 Label"></asp:Label>
            <br />
            <asp:Label ID="addressLine2Label" runat="server" Text="Address Line 2 Label"></asp:Label>
            <br />
            <asp:Label ID="cityStateZipLabel" runat="server" Text="City, State Zip Label"></asp:Label>
            <br />
        </div>

<h2>Email Delivery Information</h2>
        <div>
            Your Game Product Key(s) Will Be Delivered To:
            <asp:Label ID="emailLabel" runat="server" Text="Email Label"></asp:Label>
        </div>

<h2>Purchased Products</h2>
        <div>
            <asp:Label ID="productsPurchasedLabel" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Label ID="subTotalLabel" runat="server" Text="Subtotal Label"></asp:Label>
            <br />
            <asp:Label ID="taxLabel" runat="server" Text="Tax Label"></asp:Label>
            <br />
            <asp:Label ID="totalAmountLabel" runat="server" Text="Total Amount Label"></asp:Label>
            <br />
            <br />
                <asp:Button ID="conShopButton" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Keep Shopping" Width="200px" OnClick="conShopButton_Click"/>
            </div>




    </div> <!-- end container Div-->

        <footer> Copyright &copy; 2018 GameCrypt.com</footer>
    </form>
</body>
</html>
