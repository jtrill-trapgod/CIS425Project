<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutGameCrypt.aspx.cs" Inherits="FinalProject.AboutGameCrypt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About GameCrypt</title>
    <style>
/*right now the colors are
body - #2A2C2D;
tables - #474747;
gamecrypt orange - #FF9859
and text is just white */
        /*changing body font and background color to the grey we like and text to white*/
        body
        {
            align-content:center;
            font-family: Calibri, sans-serif;
            background-color: #2A2C2D;
            color: white;
        }

        /*set's all table TD and TR to a lighter grey*/
        td, tr
        {
            background-color: #474747;
            color: white;
        }
        
        /*for header 1 thank you text on Confirmation Page - Joe W*/
        #aboutGameCrypt
        {
            background-color: #474747;
            margin: auto;
            width:50%;
            text-align: center;
        }

        /*that hawt margin to make it sexy for the headings so it only had 10px margin on top*/
        h2
        {
            color:#8181c1;
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
        #aboutContainer
        {
            margin: auto;
            width:50%;
            text-align: left;
        }
        header
        {
        background-color: #2A2C2D;
        }
        .auto-style1 {
            text-align: center;
        }

        footer
        {
            text-align: center;
            height:auto;
        }

        #footerDIV
        {
            clear: both;
            position: absolute;
            right: 0;
            left: 0;
            bottom: 15px;
        }
        </style>
</head>
<body>
    <header>

        <!-- the logo image div is right here-->
        <form id="form1" runat="server">

        <div id="logoDiv" class="auto-style1">
        <asp:ImageButton ID="logoImageButton" runat="server" ImageUrl="~/contentimages/GameCryptLong.png" Width="600px" OnClick="logoImageButton_Click"/>
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
                    <li id="searchItem"> <asp:TextBox ID="searchTextBox" runat="server" Height="20px" Width="250" CssClass="auto-style2"></asp:TextBox><asp:Button ID="searchButton" runat="server" Text="Search" Height="25px" Width="60px" OnClick="searchButton_Click" /></li>
                </ul>
            </div>
        </form>
     </header>
            <!-- beginning of crap underneath the NAVBAR - Joe -->
        <br />
        <br />
        <div id="aboutContainer">
            <h1 id="aboutGameCrypt">About <span class="gamecrypt">GAMECRYPT</span>!</h1>


            <h2>Who Are We?</h2>
                    <div>
                        GameCrypt was founded in 2018 when Joe Wilson, Tyler Thomas, Shawn Fisher, and Chris Miller met at Arizona State University. 
                        During an intense night trying to learn how to use Tyler&#39;s private GIT server they decided to found Game Crypt for real, not just to complete their project. Their basic ASP.NET website caught the attention of Silicon Valley VC firms for reasons still unknown to the founders. After their Series C they began to scale their platform and, strangely, websites like Apple and Amazon followed suit, using tables for literally everything...</div>

            <h2>What Is Our Mission?</h2>
                    <div>
                        GameCrypt seeks to serve our core demographic of gamers by offering the simplest, least expensive, cleanest, and quickest way to purchase game keys online.</div>
        </div>
    <div id="footerDIV">
    <footer> Copyright &copy; 2018 GameCrypt.com</footer>
    </div>
 </body>
</html>
