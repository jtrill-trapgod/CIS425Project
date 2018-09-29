<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="FinalProject.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>GameCrypt</title>
    <style type="text/css">

/*right now the colors are
body - #2A2C2D;
tables - #474747;
gamecrypt orange - #FF9859
and text is just white*/

        /*changing body font and background color to #2A2C2D we like and text to white*/

        body
        {
            align-content:center;
            font-family: Calibri, sans-serif;
            background-color:#2A2C2D;
            color: white;
        }

         /*makes the table adjust correctly to the window size when the inside content has pixels*/
        table 
        {
            width: 95%;
        }


        /*set's all table TD and TR to #474747 which is a light grey*/
        td, tr
        {
            background-color: #474747;
            color: white;
        }

        /*that hyawt margin to make it sexy for the headings so it only had 10px margin on top*/
        h2
        {
            color:white;
            margin: 10px 0px 0px 0px;
        }

        /*makes all of the tables auto-size from 533.33px to auto now*/
        .leftTableCell, .middleTableCell, .rightTableCell
        {
            width:33%;
            max-width: 33%;
            height:auto;
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

        .auto-style1 {
            text-align: center;
        }

        footer
        {
            text-align: center;
            height:auto;
            width:auto;
        }


        .auto-style2 {
            margin-left: 0px;
        }

    </style>
</head>
<body>
   <!-- the logo image div is right here-->
  
    <form id="form1" runat="server">

    <div id="logoDiv" class="auto-style1">
        <asp:ImageButton ID="logoImageButton" runat="server" ImageUrl="~/contentimages/GameCryptLong.png" Width="600px" OnClick="logoImageButton_Click" />
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
            <li id="searchItem"> <asp:TextBox ID="searchTextBox" runat="server" Height="20px" Width="250" CssClass="auto-style2"></asp:TextBox><asp:Button ID="searchButton" runat="server" Text="Search" Height="25px" Width="60px" OnClick="searchButton_Click" /></li>
         </ul>
&nbsp;</div>
        <!-- end of navigation bar-->


    <h2>New Releases</h2>
    <table id="newReleasesTable" align="center">
        <tr>
            <td class="leftTableCell">
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="Label2" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftTableCell">
                <asp:Image ID="Image1" runat="server" Height="337px" Width="243px" />
            </td>

            <td class="middleTableCell">
                <asp:Image ID="Image2" runat="server" Height="337px" Width="243px" />
            </td>
            <td class="rightTableCell">
                <asp:Image ID="Image3" runat="server" Height="337px" Width="243px" />
            </td>
        </tr>

        <tr>
            <td class="leftTableCell">
                <asp:Label ID="newRel1DescLabel" runat="server">newRel1DescLabel</asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="newRel2DescLabel" runat="server">newRel2DescLabel</asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="newRel3DescLabel" runat="server">newRel3DescLabel</asp:Label>
            </td>
        </tr>

        <tr>
            <td class="leftTableCell">
                <asp:Label ID="newRel1GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">newRel1GameLabel</asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="newRel2GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">newRel2GameLabel</asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="newRel3GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">newRel3GameLabel</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftTableCell">
                <asp:Button ID="newRelCart1Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="newRelCart1Button_Click" />
            </td>
            <td class="middleTableCell">
                <asp:Button ID="newRelCart2Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="newRelCart2Button_Click" />
            </td>
            <td class="rightTableCell">
                <asp:Button ID="newRelCart3Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="newRelCart3Button_Click" />
            </td>
        </tr>
    </table>
    <p>
        &nbsp;</p>
    <h2>Best Sellers</h2>
    <table id="bestSellersTable" align="center">
        <tr>
            <td class="leftTableCell">
                <asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="Label6" runat="server" Text="Label" Font-Bold="False" Font-Size="X-Large" ForeColor="#FFFFBF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftTableCell">
                <asp:Image ID="Image4" runat="server" Height="337px" Width="243px" />
            </td>
            <td class="middleTableCell">
                <asp:Image ID="Image5" runat="server" Height="337px" Width="243px" />
            </td>
            <td class="rightTableCell">
                <asp:Image ID="Image6" runat="server" Height="337px" Width="243px" />
            </td>
        </tr>

        <tr>
            <td class="leftTableCell">
                <asp:Label ID="bestSel1DescLabel" runat="server">bestSel1DescLabel</asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="bestSel2DescLabel" runat="server">bestSel2DescLabel</asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="bestSel3DescLabel" runat="server">bestSel3DescLabel</asp:Label>
            </td>
        </tr>


        <tr>
            <td class="leftTableCell">
                <asp:Label ID="bestSel1GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">bestSel1GameLabel</asp:Label>
            </td>
            <td class="middleTableCell">
                <asp:Label ID="bestSel2GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">bestSel2GameLabel</asp:Label>
            </td>
            <td class="rightTableCell">
                <asp:Label ID="bestSel3GameLabel" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FFFFBF">bestSel3GameLabel</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="leftTableCell">
                <asp:Button ID="bestSelCart1Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="bestSelCart1Button_Click" />
            </td>
            <td class="middleTableCell">
                <asp:Button ID="bestSelCart2Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="bestSelCart2Button_Click" />
            </td>
            <td class="rightTableCell">
                <asp:Button ID="bestSelCart3Button" runat="server" BackColor="#2A2C2D" ForeColor="White" Text="Add To Cart" Width="150px" OnClick="bestSelCart3Button_Click" />
            </td>
        </tr>

    </table>

    <footer> 
    </footer>

    </form>
&nbsp;<footer> Copyright &copy; 2018 GameCrypt.com</footer>

    </body>
</html>
