using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace FinalProject
{
    public partial class SearchResults : System.Web.UI.Page
    {
        //makes these accesible in all methods/classes/eventhandlers
        List<Game> matchesList;
        List<Game> gameList;
        string searchString;

        protected void Page_Load(object sender, EventArgs e)
        {
            matchesList = new List<Game>();

            gameList = (List<Game>)Session["List"];
            searchString = (string)Session["Search"];
            userSearchInput.Text = searchString;
            //new list for items that match criteria
            //List<Game> matchesList = new List<Game>();

            for (int i = 0; i < gameList.Count; i++)
            {
                //to lower case to make everything cases insensitive
                string compare = gameList[i].Name.ToLower();
                if (compare.Contains(searchString.ToLower()))
                {
                    //adds to match list
                    matchesList.Add(gameList[i]);
                }
            }

          




            //updates output for number of results
            searchResultsOutput.Text = matchesList.Count().ToString();

            //SETTING UP THE SEARCH TABLE
            //Table searchResultsTable = new Table();
            //adds the table into the DIV and sets alignment to center
           // tableDiv.Controls.Add(searchResultsTable);
            //searchResultsTable.Attributes.Add("align", "center");

            //adds the entire table to the class shoppingCartTable
           // searchResultsTable.CssClass = "searchResultsTable";

            //this loops goes through the list from SQL database and outputs these dynamically... each product fills itself in
            for (int i = 0; i < matchesList.Count; i++)
            {
                HtmlGenericControl tmpDiv = new HtmlGenericControl("div");
                //id for each div - CSS
                tmpDiv.ID = "productDiv" + i;
                //class for all divs - CSS
                tmpDiv.Attributes["class"] = "productDivs";
                //you need a DIV staticly on the page to do this. TABLEDIV is that div... static on the display page
                tableDiv.Controls.Add(tmpDiv);

                Table tmpTable = new Table();
                //adds the table into the temporary DIV
                tmpDiv.Controls.Add(tmpTable);
                //attributes to make it align correctly
                tmpTable.Attributes.Add("align", "center");
                //adds the entire table to the class shoppingCartTable
                tmpTable.CssClass = "searchResultsTable";

                //used for the check out label, running total of all product prices
                //instantiates new Rows/Cells
                TableRow tmpRow1 = new TableRow();
                TableCell tmpNameCell = new TableCell();
                TableRow tmpRow2 = new TableRow();
                TableCell tmpImageCell = new TableCell();
                TableRow tmpRow3 = new TableRow();
                TableCell tmpPriceCell = new TableCell();
                TableRow tmpRow4 = new TableRow();
                TableCell tmpAddToCartCell = new TableCell();

                TableRow tmpDescriptionRow = new TableRow();
                TableCell tmpDescriptionCell = new TableCell();

                //for the game
                Image tmpGamePicture = new Image();

                //creates the add to cart button
                Button addToCartButton = new Button();
                //allows you to use hexidecimal colors for the property
                addToCartButton.BackColor = System.Drawing.ColorTranslator.FromHtml("#2A2C2D");
                addToCartButton.ForeColor = System.Drawing.ColorTranslator.FromHtml("White");
                
                addToCartButton.Text = "Add To Cart";

                //setting the button ID so then when the button is clicked we can reference where it was in the list and delete the correct row in SQL
                addToCartButton.ID = i.ToString();
                //dank event handler
                addToCartButton.Click += new EventHandler(addToCartButton_Click);

                //adds 4 rows to display all the info we want to display
                //rows are vertical

                //name row
                tmpTable.Rows.Add(tmpRow1);
                //picture row
                tmpTable.Rows.Add(tmpRow2);
                //description row
                tmpTable.Rows.Add(tmpDescriptionRow);
                //price row
                tmpTable.Rows.Add(tmpRow3);
                //add to cart button row
                tmpTable.Rows.Add(tmpRow4);

                //setting the class
                //tmpRow1.CssClass = "rows";
                //tmpRow2.CssClass = "rows";
                //tmpRow3.CssClass = "rows";
                //tmpRow4.CssClass = "rows";
                //tmpDescriptionRow.CssClass = "rows";

                //adds each cell to the each row
                //cells are horizontal
                tmpRow1.Cells.Add(tmpNameCell);
                tmpRow2.Cells.Add(tmpImageCell);
                tmpDescriptionRow.Cells.Add(tmpDescriptionCell);
                tmpRow3.Cells.Add(tmpPriceCell);
                tmpRow4.Cells.Add(tmpAddToCartCell);

                //makes the tmp image the correct image for the game and the right width/height
                //matches the landing page
                tmpGamePicture.Width = 243;
                tmpGamePicture.Height = 337;

                //makes the image show up
                tmpGamePicture.ImageUrl = matchesList[i].ImgPath;

                //puts content from the SQL database into the actual cells
                tmpNameCell.Text = matchesList[i].Name;
                tmpImageCell.Controls.Add(tmpGamePicture);
                tmpDescriptionCell.Text = matchesList[i].Description.ToString();
                tmpPriceCell.Text = matchesList[i].Price.ToString("C");
                tmpAddToCartCell.Controls.Add(addToCartButton);


                //adds them all to the CSS class cells
                tmpNameCell.CssClass = "nameCell";
                tmpImageCell.CssClass = "cells";
                tmpDescriptionCell.CssClass = "descriptionCell";
                tmpPriceCell.CssClass = "priceCell";
                tmpAddToCartCell.CssClass = "cells";
            }

         

        }

        protected void addToCartButton_Click(object sender, EventArgs e)
        {



            //makes the button pressed the sender of the event, so the ID I set in the for loop persists
            Button button = sender as Button;

            //gets the ID of the item in the matchesList from the button ID that is set
            string addToCartButtonID = button.ID;
            //used to find the correct position/item in the matchesList
            int matchesListItemPosition = Convert.ToInt32(addToCartButtonID);


            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM shoppingcart;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            //this adds what was selected on the search results into the shopping cart.
            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + matchesList[matchesListItemPosition].Name.ToString() + "','"
                + matchesList[matchesListItemPosition].Price.ToString() + "','" + matchesList[matchesListItemPosition].ImgPath.ToString() + "','" + matchesList[matchesListItemPosition].Description.ToString() + "','"
                + matchesList[matchesListItemPosition].Platform.ToString() + "','" + matchesList[matchesListItemPosition].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();

            //reader.Close();
            Globals.conn.Close();

            //refreshes the page to update SQL records
            Response.Redirect(Request.RawUrl);
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