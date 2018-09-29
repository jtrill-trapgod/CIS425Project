using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{




    public partial class ConfirmationPage : System.Web.UI.Page
    {

        //user defined search string
        string searchString;
        //main list of games to be pulled from SQL
        List<Game> gameList;


        double subtotal;
        static double taxRate = .07;
        DateTime dt;
        // hardcoded random number for sales order number
        int orderNum;

        protected void Page_Load(object sender, EventArgs e)
        {
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




            // gets today's date
            dt = DateTime.Today;
            // gets a 6 digit random number
            Random r = new Random();
            orderNum = r.Next(100000);
            // takes the customer object out of session state
            Customer c = Session["c"] as Customer;

            if (c != null)
            {
                dateLabel.Text = dt.ToShortDateString();
                orderNumLabel.Text = orderNum.ToString("D6");
                customerFullNameLabel.Text = c.FirstName + " " + c.LastName;
                addresLine1Label.Text = c.Address;
                addressLine2Label.Text = c.AddressL2;
                cityStateZipLabel.Text = c.City + " " + c.State + " " + c.Zip;
                emailLabel.Text = c.EmailAddress;


                foreach (Game g in c.ShoppingCart)
                {
                    System.Threading.Thread.Sleep(1000);
                    productsPurchasedLabel.Text += g.Name + " Key: " + g.Key + "<br/>";
                    subtotal += g.Price;
                }

                //label/tax calculations
                subTotalLabel.Text = "Subtotal: " + subtotal.ToString("C");
                taxLabel.Text = "Tax: " + (subtotal * taxRate).ToString("C");
                totalAmountLabel.Text = "Total: " + (subtotal * (1 + taxRate)).ToString("C");
            }
            else
            {
                //possibly handle some error here?
            }
        }

        // goes to homepage when logo is clicked
        protected void logoImageButton_Click(object sender, ImageClickEventArgs e) => Response.Redirect("LandingPage.aspx");

        protected void conShopButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
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