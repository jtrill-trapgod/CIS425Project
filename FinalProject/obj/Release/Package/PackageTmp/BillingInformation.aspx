<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInformation.aspx.cs" Inherits="FinalProject.BillingInformation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing Information</title>
    <style type="text/css">

/*right now the colors are
body - #2A2C2D;
tables - #474747;
gamecrypt orange - #FF9859
and text is just white*/

        /*changing body font and background color to the grey we like*/
        body
        {
            font-family: Calibri, sans-serif;
            background-color:#2A2C2D;
            color: white;
        }


        /*that hyawt margin to make it sexy for the headings so it only had 10px margin on top*/
        h2
        {
            color:white;
            margin: 10px 0px 0px 0px;
        }

        td, tr
        {
            background-color: #474747;
            color: white;
        }
        
        /*it's the left side and right side of the two tables on the page set to 500px to look sexy - Joe W*/
        .leftBillingTable, .rightBillingTable, .leftPaymentTable, .rightPaymentTable
        {
            width: 500px;
        }

        .container{
            margin-right: 2.5%;
            margin-left: 2.5%;
            align-content: center;
        }

        .innerContainerA{
            margin-right: 2.5%;
            margin-left: 2.5%;
            align-content: center;
        }

        .innerContainerB{
            margin-right: 2.5%;
            margin-left: 2.5%;
            align-content: center;
        }

        /*all of this stuff below is to make the Nav bar look correctly... in other words, beginning of CSS for nav bar at the top------------*/
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

        /*end of all of the top nav Bar CSS-------------------*/

        #cancelOrderButton
        {
            margin-left: 100px;
        }
        .auto-style1 {
            text-align: center;
        }

                footer
        {
            text-align: center;
            height:auto;
        }
        .auto-style2 {
            width: 157px;
        }
        .auto-style3 {
            width: 523px;
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
            <li id="searchItem"> <asp:TextBox ID="searchTextBox" runat="server" Height="20px" Width="250px"></asp:TextBox><asp:Button ID="searchButton" runat="server" Text="Search" Height="25px" Width="60px" CausesValidation="False" UseSubmitBehavior="False" OnClick="searchButton_Click" /></li>
        </ul>
    </div>
    <div class="container">
        <h2>Billing Information</h2>
<div class="innerContainerA">
<div class="billingInfoTable">

    <table class="billingInfoTable">
        <tr>
            <td class="leftBillingTable">First Name:<br />
                <asp:TextBox ID="bilFNameTextBox" runat="server" Width="250px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="fNameValid" runat="server" ControlToValidate="bilFNameTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="rightBillingTable">Last Name:<br />
                <asp:TextBox ID="bilLNameTextBox" runat="server" Width="250px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="lNameValid" runat="server" ControlToValidate="bilLNameTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="leftBillingTable">Email Address:<br />
                <asp:TextBox ID="emailTextBox" runat="server" Width="250px" TextMode="Email"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="emailValid" runat="server" ControlToValidate="emailTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Email Address is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="rightBillingTable">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Email invalid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="leftBillingTable">Confirm Email Address:<br />
                <asp:TextBox ID="confirmEmailTextBox" runat="server" Width="250px" TextMode="Email"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="emailConfirmValid" runat="server" ControlToValidate="confirmEmailTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Confirm Email Address is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="rightBillingTable">
                <asp:CompareValidator ID="emailFormatValidator" runat="server" ControlToCompare="emailTextBox" ControlToValidate="confirmEmailTextBox" ErrorMessage="Email addresses must match" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="leftBillingTable">Address:<br />
                <asp:TextBox ID="addressTextBox" runat="server" Width="250px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="addressValid" runat="server" ControlToValidate="addressTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Address is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                Address Line 2 (Optional):<br />
                <asp:TextBox ID="address2TextBox" runat="server" Width="250px"></asp:TextBox>
            </td>
            <td class="rightBillingTable">&nbsp;</td>
        </tr>
        <tr>
            <td class="leftBillingTable">City:<br />
                <asp:TextBox ID="cityTextBox" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="cityValid" runat="server" ControlToValidate="cityTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="City is required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td class="rightBillingTable">State/Province:<br />
                <asp:TextBox ID="stateTextbox" runat="server" Width="200px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="stateValid" runat="server" ControlToValidate="stateTextbox" CssClass="validator" Display="Dynamic" ErrorMessage="State/Province is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="leftBillingTable">Zip/Postal Code:<br />
                <asp:TextBox ID="zipTextBox" runat="server" MaxLength="5"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="zipValid" runat="server" ControlToValidate="zipTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Zip/Postal Code is required" ForeColor="Red"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="zipFormatValidator" runat="server" ControlToValidate="zipTextBox" ErrorMessage="Invalid zip code" ForeColor="Red" ValidationExpression="^(?:\d{5})$"></asp:RegularExpressionValidator>
            </td>
            <td class="rightBillingTable">Country:<br />
                <asp:TextBox ID="countryTextBox" runat="server" Width="200px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="countryValid" runat="server" ControlToValidate="countryTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Country is required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
    </table>

    </div>
</div> <!-- end innerContainerA -->
<h2>Payment Information</h2>
<div class="innerContainerB">
        <div>

            <table class="creditCardTable">
                <tr>
                    <td class="auto-style2">Credit Card Number:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="ccInfoTextBox" runat="server" Width="300px" MaxLength="16"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="ccValid" runat="server" ControlToValidate="ccInfoTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Credit Card Number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="ccFormatValidator" runat="server" ControlToValidate="ccInfoTextBox" ErrorMessage="Invalid credit card number" ForeColor="Red" ValidationExpression="^(?:\d{16}|\d{19})$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">CVV/Security Code:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="cvvTextBox" runat="server" MaxLength="3"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="cvvValid" runat="server" ControlToValidate="cvvTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="CVV/Security Code is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="cvvFormatValidator" runat="server" ControlToValidate="cvvTextBox" ErrorMessage="Invalid CVV code" ForeColor="Red" ValidationExpression="^(?:\d{3}|\d{4})$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Expiration Date:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="expDateTextBox" runat="server" TextMode="Date" OnTextChanged="expDateTextBox_TextChanged"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="expDateValid" runat="server" ControlToValidate="expDateTextBox" CssClass="validator" Display="Dynamic" ErrorMessage="Expiration Date is required" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;</td>
                </tr>
            </table>

        </div>


    <br />
    <asp:Button class="buttons" ID="submitOrderButton" runat="server" Text="Submit Order" OnClick="submitOrderButton_Click" BackColor="#2A2C2D" ForeColor="White" />
    <asp:Button class="buttons" ID="cancelOrderButton" runat="server" Text="Cancel Order" BackColor="#2A2C2D" ForeColor="White" OnClick="cancelOrderButton_Click" CausesValidation="False" UseSubmitBehavior="False" />
    </div> <!-- end innerContainerB-->
    </div> <!-- end container DIV -->
    </form>

    <footer> Copyright &copy; 2018 GameCrypt.com</footer>


</body>
</html>

