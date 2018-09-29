<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="FinalProject.ShoppingCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <style type="text/css">
/*right now the colors are
body - #2A2C2D;
gamecrypt orange - #FF9859
tables - #474747;
and text is just white */

        /*changing body font and background color to the grey we like and text to white*/
        body
        {
            font-family: Calibri, sans-serif;
            background-color:#2A2C2D;
            color: white;

        }

         /*makes the table adjust correctly to the window size when the inside content has pixels*/
        table 
        {
            width: 95%;
            
        }

        tableDiv {
                   width: 95%;
                   height: auto;
        }

        /*all of this stuff with is for the shopping cart dynamic table*/
        #createDiv
        {
            display:block;
            margin: 10px;
        }


        .shoppingCartTable {
            width: 95%;
            height: auto;

        }

        .cells {
            text-align: center;
            border: 1px;
            
        }

        /*end of shopping cart dynamic table*/

        /*set's all table TD and TR to a lighter grey*/
        td, tr
        {
            background-color: #474747;
            color: white;
        }

        /*that hawt margin to make it sexy for the headings so it only had 10px margin on top*/
        h2
        {
            color:white;
            margin: 10px 0px 0px 0px;
        }

        .auto-style7 {
            text-align: center;
        }
        
        
        /*all of this stuff below is to make the Nav bar look correctly... in other words, beginning of CSS for nav bar at the top*/
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

        /*end of all of the top nav Bar CSS*/

                footer
        {
            text-align: center;
            height:auto;
        }
        
        /*container holding the check out butto & label*/
        #submitContainerDIV{
            float: right;
            width: auto;
            border: 3px solid #FF9859;
            padding: 10px;
            margin-top: 10px;
            margin-right:2.75%;
        }
        
        #submitLabelDIV{
            margin:0;
            float:right;
        }
        #submitButtonDIV{
            float:right;
            padding-right: 10px;
            display:inline-block;
        }
        #submitClearDIV{
            clear: both;
        }

        .outputLabel {
            clear: both;
            text-align: center;
            font-size: 3em;
        }

    </style>
</head>
<body>
    <!-- the logo image in the top in a div-->
 <form id="form1" runat="server">
    <div id="logoDiv" class="auto-style7">
        <asp:ImageButton ID="logoImageButton" runat="server" ImageUrl="~/contentimages/GameCryptLong.png" Width="600px" OnClick="logoImageButton_Click" />
                            </div>

<!-- the search button has to be in a form-->
        <div class="navigationHorizontalBar">
         <ul>
             <!-- 1. Landing Page
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
        <!-- end of navigation bar-->
        <h2>Shopping Cart</h2>
     <div id="tableDiv" runat="server">

     </div>
     
     <!--Container with the check out button and label-->
     <div id="submitContainerDIV">
         <div id="submitLabelDIV">
             <asp:Button ID="checkoutButton" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Check Out" Width="150px" OnClick="checkoutButton_Click"/>
         </div>
         <div id="submitButtonDIV">
             Total: <asp:Label ID="totalLabel" runat="server" style="display:inline-block"></asp:Label>
         </div>
         <div id="submitClearDIV">
             
         </div>
     </div>

     <div class="outputLabel">
         <asp:Label ID="outputLabel" runat="server" Text="Label"></asp:Label>
     </div>

    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>

    <footer> Copyright &copy; 2018 GameCrypt.com</footer>

</body>
</html>
