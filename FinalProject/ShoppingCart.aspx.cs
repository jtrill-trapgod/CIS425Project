using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//below allows you to make a div on the fly
using System.Web.UI.HtmlControls;

namespace FinalProject
{
    public partial class ShoppingCart : System.Web.UI.Page
    {

        //games have id, name, price, imgPath in SQL

        List<Game> shoppingCartList;

        List<Game> gameList;
        string searchString;

        protected void Page_Load(object sender, EventArgs e)
        {

            //opens connection, queries all games
            Globals.conn.Open();
            gameList = new List<Game>();


            string querySearchButton = "SELECT * FROM games;";
            var cmdSearchButton = new MySql.Data.MySqlClient.MySqlCommand(querySearchButton, Globals.conn);
            var readerSearchButton = cmdSearchButton.ExecuteReader();

            //reads every row, makes new object, adds to list
            while (readerSearchButton.Read())
            {
                Game tmpGame = new Game();
                tmpGame.Id = readerSearchButton["ID"].ToString();
                tmpGame.Name = readerSearchButton["Title"].ToString();
                tmpGame.Price = Convert.ToDouble(readerSearchButton["Price"]);
                tmpGame.ImgPath = readerSearchButton["ImagePath"].ToString();
                tmpGame.Description = readerSearchButton["Description"].ToString();
                tmpGame.Platform = readerSearchButton["Platform"].ToString();
                tmpGame.Genre = readerSearchButton["Genre"].ToString();
                gameList.Add(tmpGame);

            }
            readerSearchButton.Close();
            Globals.conn.Close();



            //END OF SEARCH BUTTON FUNCTIONALITY












            Globals.conn.Open();
            shoppingCartList = new List<Game>();

            outputLabel.Visible = false;



            string query = "SELECT * FROM shoppingcart;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            var reader = cmd.ExecuteReader();

            //reads every row, makes new object, adds to list for the shopping cart rows
            while (reader.Read())
            {
                Game tmpGame = new Game();
                tmpGame.Id = reader["ID"].ToString();
                tmpGame.Name = reader["Title"].ToString();
                tmpGame.Price = Convert.ToDouble(reader["Price"]);
                tmpGame.ImgPath = reader["ImagePath"].ToString();
                tmpGame.Description = reader["Description"].ToString();
                tmpGame.Platform = reader["Platform"].ToString();
                tmpGame.Genre = reader["Genre"].ToString();
                shoppingCartList.Add(tmpGame);

            }


            //creating the static title/heading table
            Table shoppingCartTable = new Table();
            TableRow titleRow = new TableRow();
            TableCell nameCell = new TableCell();
            TableCell imageCell = new TableCell();
            TableCell priceCell = new TableCell();
            TableCell quantityCell = new TableCell();
            TableCell removeCell = new TableCell();
            //adds the table into the DIV and sets alignment to center
            tableDiv.Controls.Add(shoppingCartTable);
            shoppingCartTable.Attributes.Add("align", "center");

            //adds the entire table to the class shoppingCartTable
            shoppingCartTable.CssClass = "shoppingCartTable";

            //adds a row
            shoppingCartTable.Rows.Add(titleRow);
            titleRow.CssClass = "rows";

            //adds each cell to the row
            titleRow.Cells.Add(nameCell);
            titleRow.Cells.Add(imageCell);
            titleRow.Cells.Add(priceCell);
            titleRow.Cells.Add(quantityCell);
            titleRow.Cells.Add(removeCell);

            //puts text in the actual cells
            nameCell.Text = "Product Name";
            imageCell.Text = "Product Image";
            priceCell.Text = "Price";
            quantityCell.Text = "Quantity";
            removeCell.Text = "Remove From Cart";

            //adds them all to the CSS class cells
            nameCell.CssClass = "cells";
            priceCell.CssClass = "cells";
            imageCell.CssClass = "cells";
            quantityCell.CssClass = "cells";
            removeCell.CssClass = "cells";

            //used for grand total on the checkout grand total row
            double grandTotal = 0;

            //this loops goes through the list from SQL database and outputs these dynamically... each product fills itself in
            for (int i = 0; i < shoppingCartList.Count; i++)
            {
                //used for the check out label, running total of all product prices
                grandTotal += shoppingCartList[i].Price;
                //instantiates new Rows/Cells
                TableRow tmpRow = new TableRow();
                TableCell tmpNameCell = new TableCell();
                TableCell tmpImageCell = new TableCell();
                TableCell tmpPriceCell = new TableCell();
                TableCell tmpQuantityCell = new TableCell();
                TableCell tmpRemoveCell = new TableCell();
                Image tmpGamePicture = new Image();

                //creates the button and the eventhandler allows us to code removeButton_Click event for this button
                Button removeButton = new Button();
                removeButton.Text = "Remove From Cart";

                //allows you to use hexidecimal colors for the property
                removeButton.BackColor = System.Drawing.ColorTranslator.FromHtml("#2A2C2D");
                removeButton.ForeColor = System.Drawing.ColorTranslator.FromHtml("White");

                //setting the button ID so then when the button is clicked we can reference where it was in the list and delete the correct row in SQL
                removeButton.ID = i.ToString();
                removeButton.Click += new EventHandler(removeButton_Click);

                //adds a row to the Table
                shoppingCartTable.Rows.Add(tmpRow);
                tmpRow.CssClass = "rows";

                //adds each cell to the row
                tmpRow.Cells.Add(tmpNameCell);
                tmpRow.Cells.Add(tmpImageCell);
                tmpRow.Cells.Add(tmpPriceCell);
                tmpRow.Cells.Add(tmpQuantityCell);
                tmpRow.Cells.Add(tmpRemoveCell);

                //makes the tmp image the correct image for the game and the right width/height
                tmpGamePicture.Width = 60;
                tmpGamePicture.Height = 82;

                tmpGamePicture.ImageUrl = shoppingCartList[i].ImgPath;

                //puts text in the actual content of Cells
                tmpNameCell.Text = shoppingCartList[i].Name;
                tmpImageCell.Controls.Add(tmpGamePicture);
                tmpPriceCell.Text = shoppingCartList[i].Price.ToString("C");
                tmpQuantityCell.Text = "1";
                tmpRemoveCell.Controls.Add(removeButton);

                //adds them all to the CSS class cells
                tmpNameCell.CssClass = "cells";
                tmpImageCell.CssClass = "cells";
                tmpPriceCell.CssClass = "cells";
                tmpQuantityCell.CssClass = "cells";
                tmpRemoveCell.CssClass = "cells";
            }


            totalLabel.Text = grandTotal.ToString("C");

            //                      DO NOT DELETE ------- DO NOTE DELETE ------- DO NOT DELETE --------------
            //ALL OF THIS CODE IS JUST A TEST to make SEPARATE tables DONT DELETE--------------------------------------------------------
            //DONT DELETE THIS BELOW DONT DELETE, I WILL USE THIS LATER, DON'T DELETE!!!!!!!!!!!!!!!!!!!!
            //this creates a div... you need using System.Web.UI.HtmlControls;... this is making a div inside the Table Div that is originally blank
            //HtmlGenericControl createDiv = new HtmlGenericControl("DIV");
            //createDiv.ID = "createDiv";
            //createDiv.InnerHtml = "I'm a div, this is just placeholder text, but Joe is testing stuff WHAT UP!!!!";
            //tableDiv.Controls.Add(createDiv);
            //end of DIV creation

            //Table testTable = new Table();
            //TableRow testRow = new TableRow();
            //TableCell testCell = new TableCell();
            //adds the table into the DIV and sets alignment to center
            //createDiv.Controls.Add(testTable);
            //testTable.Attributes.Add("align", "center");

            //adds the entire table to the class shoppingCartTable
            //testTable.CssClass = "shoppingCartTable";

            //adds a row
            //testTable.Rows.Add(testRow);
            //testRow.CssClass = "rows";
            //testRow.Cells.Add(testCell);
            //testCell.Text = "TESTESTESTESTESTES";
            //ALL OF THIS CODE IS JUST A TEST to make SEPARATE tables DONT DELETE----------------------------------------------------
            //DONT DELETE THIS BELOW DONT DELETE, I WILL USE THIS LATER, DON'T DELETE!!!!!!!!!!!!!!!!!!!!
            //ALL OF THIS CODE IS JUST A TEST to make SEPARATE tables DONT DELETE---------------------------------------------------------------
            //DONT DELETE THIS BELOW DONT DELETE, I WILL USE THIS LATER, DON'T DELETE!!!!!!!!!!!!!!!!!!!!



            Globals.conn.Close();
        }

        protected void removeButton_Click(object sender, EventArgs e)
        {
            //makes the button pressed the sender of the event, so the ID I set in the for loop persists
            Button button = sender as Button;

            string removeButtonID = button.ID;
            int itemPositionInListToBeRemoved = Convert.ToInt32(removeButtonID);

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM shoppingcart;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            //shoppingCartList[removeButton.ID].Id
           // test = Convert.ToInt32(shoppingCartList[Convert.ToInt32()].Id);
            cmd.CommandText = "DELETE FROM shoppingcart where id=('" + shoppingCartList[itemPositionInListToBeRemoved].Id + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();

            //refreshes the page to update SQL records
            Response.Redirect(Request.RawUrl);
        }

        // goes to homepage when logo is clicked
        protected void logoImageButton_Click(object sender, ImageClickEventArgs e) => Response.Redirect("LandingPage.aspx");

        protected void cartGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void checkoutButton_Click(object sender, EventArgs e)
        {
            //just code if you care about this, but it shouldn't matter for the presentation
            if (shoppingCartList.Count == 0)
            {
                
                outputLabel.Text = "You need to have an item in your cart to check out.";
                outputLabel.Visible = true;
            }
            else
            {
                // saves the cart to be passed to billing information
                Session["cart"] = shoppingCartList;
                Response.Redirect("BillingInformation.aspx");

            }
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //serializes data to be able to pass to another page
            searchString = searchTextBox.Text;
            Session["Search"] = searchString;
            Session["List"] = gameList;
            Response.Redirect("SearchResults.aspx");
        }
    }
}