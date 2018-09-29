<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancellation.aspx.cs" Inherits="FinalProject.Cancellation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cancellation Page</title>
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


        /*centers the H1 text... since the page width is already set - Joe W*/
        h1
        {
            background-color:#474747;
            margin: auto;
            width:60%;
            text-align: center;
        }


        
        /*-BEGIN NAVBAR - all of this stuff below is to make the Nav bar look correctly... in other words, beginning of CSS for nav bar at the top*/
        .navigationHorizontalBar ul
        {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: #474747;
        width: 100%;
        height: auto;
        
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
        color: #FF9859;
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

                footer
        {
            text-align: center;
            height:auto;
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
        <br />
        <br />
        <h1>Your order has been cancelled and your cart has been emptied.</h1>

        <footer> Copyright &copy; 2018 GameCrypt.com</footer>

    </form>
</body>
</html>
