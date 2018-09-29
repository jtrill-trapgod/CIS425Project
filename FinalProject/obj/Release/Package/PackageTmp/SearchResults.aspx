<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="FinalProject.SearchResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Results</title>
    <style>
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
            margin:auto;
            text-align: center;
        }

        /*centers the stuff auto makes it fill the page width*/
        .leftSearchResultsCell, .middleSearchResultsCell, .rightSearchResultsCell
        {
            width: auto;
            height: auto;
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

        .searchResultsTable {
            width: 95%;
            height: auto;

        }

                /*dynamic table styling... for the search results*/
        .productDivs
        {
            max-width:33%;
            /*lets the 3 div's go in a line and then it runs out of width and goes to the next line*/
            display: inline-block;
        }

        .cells button 
        {
            background-color: #2A2C2D;
            color:white;
            border:white;
        }
        .cells {
            width:33%;
            text-align: center;
            border: 1px;
             height:auto;
            
        }

        .nameCell{
            border: 1px;
            height:auto;
            width: 33%;
            text-align: center;
            font-size: x-large;
            color: #ffffbf;
        }

        .priceCell{
            font-size: large;
            font-weight: bold;
            color: #ffffbf;
            width:33%;
            text-align: center;
            border: 1px;
            height:auto;
        }

        .descriptionCell
        {   
            width:33%;
            text-align: center;
            border: 1px;
            height:40px;
        }

        
    </style>
</head>
<body>
<!-- the logo image div is right here-->
<form id="form1" runat="server">
    <div id="logoDiv" class="auto-style1">
        <asp:ImageButton ID="logoImageButton" runat="server" ImageUrl="~/contentimages/GameCryptLong.png" Width="600px" />
                            </div>

<!-- the search button has to be in a form ALSO BEGINNING OF TOP NAV BAR-->
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

<h2>We found &quot;<asp:Label ID="searchResultsOutput" runat="server" Text="Label For # Of Search Results"></asp:Label>&quot; results matching&nbsp; &quot;<asp:Label ID="userSearchInput" runat="server" Text="User Search Input"></asp:Label>&quot;</h2>
     <div id="tableDiv" runat="server">

     </div>


    </form>
    <footer> Copyright &copy; 2018 GameCrypt.com</footer>

    </body>
</html>
