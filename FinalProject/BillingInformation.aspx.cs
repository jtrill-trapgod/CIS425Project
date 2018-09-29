using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class BillingInformation : System.Web.UI.Page
    {

        //user defined search string
        string searchString;
        //main list of games to be pulled from SQL
        List<Game> gameList;


        protected void Page_Load(object sender, EventArgs e)
        {
            //UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;


            //opens connection, queries all games
            Globals.conn.Open();
            gameList = new List<Game>();


            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            var reader = cmd.ExecuteReader();

            //reads every row, makes new object, adds to list
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
                gameList.Add(tmpGame);

            }

            Globals.conn.Close();



            //END OF SEARCH BUTTON FUNCTIONALITY

        }

        // goes to homepage when logo is clicked
        protected void logoImageButton_Click(object sender, ImageClickEventArgs e) => Response.Redirect("LandingPage.aspx");

        protected void submitOrderButton_Click(object sender, EventArgs e)
        {
            //if (Page.IsValid)
            //{
                // creates a customer to hold all the customer information
                // including the shopping cart list originally passed from the Shopping Cart page
                Customer customer = new Customer();
                List<Game> cart = Session["cart"] as List<Game>;
                if (cart != null)
                {
                    customer.ShoppingCart = cart;
                }

                //This shouldn't be necessary since it checks if they have something in the cart on the shopping cart page

                //else
                //{
                // do something here to tell them to buy something first?
                //}

                //these deletes everything from the shopping cart.
                Globals.conn.Open();
                string query = "SELECT * FROM shoppingcart;";
                var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
                //var reader = cmd.ExecuteReader();

                cmd.CommandText = "delete from shoppingcart;";
                cmd.ExecuteNonQuery();
                //reader.Close();
                Globals.conn.Close();

                customer.FirstName = bilFNameTextBox.Text;
                customer.LastName = bilLNameTextBox.Text;
                customer.EmailAddress = emailTextBox.Text;
                customer.Address = addressTextBox.Text;
                customer.AddressL2 = address2TextBox.Text;
                customer.City = cityTextBox.Text;
                customer.Zip = zipTextBox.Text;
                customer.State = stateTextbox.Text;
                customer.Country = countryTextBox.Text;
                customer.CcInfo = ccInfoTextBox.Text;
                customer.Cvv = cvvTextBox.Text;
                customer.CcExp = expDateTextBox.Text;
                // pass the entire Customer object which now contains their cart info too
                // for use on confirmation page
                Session["c"] = customer;
                Response.Redirect("ConfirmationPage.aspx");
            //}
        }

        protected void cancelOrderButton_Click(object sender, EventArgs e)
        {
            Globals.conn.Open();
            string query = "SELECT * FROM shoppingcart;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "delete from shoppingcart;";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();

            Response.Redirect("Cancellation.aspx");
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //serializes data to be able to pass to another page
            searchString = searchTextBox.Text;
            Session["Search"] = searchString;
            Session["List"] = gameList;
            Response.Redirect("SearchResults.aspx");
        }

        protected void expDateTextBox_TextChanged(object sender, EventArgs e)
        {
        }
    }
}