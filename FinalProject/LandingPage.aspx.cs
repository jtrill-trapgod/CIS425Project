using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public static class Globals		// Global variables section
    {
        public static string dbConnectionString = "server=cis425.wpcarey.asu.edu;uid=tthoma29;pwd=lookHOUSE37;database=groupa07;";

        public static MySql.Data.MySqlClient.MySqlConnection conn = new MySql.Data.MySqlClient.MySqlConnection(dbConnectionString);
        public static int cartCount;
    }

    public partial class LandingPage : System.Web.UI.Page
    {
        //user defined search string
        string searchString;
        //main list of games to be pulled from SQL
        List<Game> gameList;


        protected void Page_Load(object sender, EventArgs e)
        {
            //opens connection, queries all games
            Globals.conn.Open();
            gameList = new List<Game>();


            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            var reader = cmd.ExecuteReader();

            //reads every row, makes new object, adds to list
            while(reader.Read())
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
            //the following updates all labels and images from objects created
            //by the sql query. Index numbers are hard coded but this can all be
            //automated in some way. Especially for our search function.

            Image1.ImageUrl = gameList[0].ImgPath;
            Image2.ImageUrl = gameList[1].ImgPath;
            Image3.ImageUrl = gameList[2].ImgPath;
            Image4.ImageUrl = gameList[3].ImgPath;
            Image5.ImageUrl = gameList[4].ImgPath;
            Image6.ImageUrl = gameList[5].ImgPath;

            //price labels for new releases
            newRel1GameLabel.Text = gameList[0].Price.ToString("C");
            newRel2GameLabel.Text = gameList[1].Price.ToString("C");
            newRel3GameLabel.Text = gameList[2].Price.ToString("C");

            //description labels for new releases
            newRel1DescLabel.Text = gameList[0].Description.ToString();
            newRel2DescLabel.Text = gameList[1].Description.ToString();
            newRel3DescLabel.Text = gameList[2].Description.ToString();

            //price labels for best sellers
            bestSel1GameLabel.Text = gameList[3].Price.ToString("C");
            bestSel2GameLabel.Text = gameList[4].Price.ToString("C");
            bestSel3GameLabel.Text = gameList[5].Price.ToString("C");

            //description labels for best sellers
            bestSel1DescLabel.Text = gameList[3].Description.ToString();
            bestSel2DescLabel.Text = gameList[4].Description.ToString();
            bestSel3DescLabel.Text = gameList[5].Description.ToString();

            //title labels
            Label1.Text = gameList[0].Name;
            Label2.Text = gameList[1].Name;
            Label3.Text = gameList[2].Name;
            Label4.Text = gameList[3].Name;
            Label5.Text = gameList[4].Name;
            Label6.Text = gameList[5].Name;
            
            Globals.conn.Close();
            

        }

        // goes to homepage when logo is clicked
        protected void logoImageButton_Click(object sender, ImageClickEventArgs e) => Response.Redirect("LandingPage.aspx");

        protected void searchButton_Click(object sender, EventArgs e)
        {
            //serializes data to be able to pass to another page
            searchString = searchTextBox.Text;
            Session["Search"] = searchString;
            Session["List"] = gameList;
            Response.Redirect("SearchResults.aspx");
        }

        // START - add to cart button handlers
        // top left
        protected void newRelCart1Button_Click(object sender, EventArgs e)
        {

            Session["Id"] = gameList[0].Id;
            Session["Name"] = gameList[0].Name;
            Session["ImgPath"] = gameList[0].ImgPath;
            Session["Price"] = gameList[0].Price.ToString();
            Session["Quantity"] = "1";
            //Globals.cartCount++;
            //Response.Redirect("ShoppingCart.aspx");

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[0].Name.ToString() + "','" 
                + gameList[0].Price.ToString() + "','" + gameList[0].ImgPath.ToString() + "','" + gameList[0].Description.ToString() + "','"
                + gameList[0].Platform.ToString() + "','" + gameList[0].Genre.ToString() +  "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();
        }
        // top middle
        protected void newRelCart2Button_Click(object sender, EventArgs e)
        {
            Session["Id"] = gameList[1].Id;
            Session["Name"] = gameList[1].Name;
            Session["ImgPath"] = gameList[1].ImgPath;
            Session["Price"] = gameList[1].Price.ToString();
            Session["Quantity"] = "1";
            Globals.cartCount++;

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[1].Name.ToString() + "','"
                + gameList[1].Price.ToString() + "','" + gameList[1].ImgPath.ToString() + "','" + gameList[1].Description.ToString() + "','"
                + gameList[1].Platform.ToString() + "','" + gameList[1].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();
        }
        // top right
        protected void newRelCart3Button_Click(object sender, EventArgs e)
        {
            Session["Id"] = gameList[2].Id;
            Session["Name"] = gameList[2].Name;
            Session["ImgPath"] = gameList[2].ImgPath;
            Session["Price"] = gameList[2].Price.ToString();
            Session["Quantity"] = "1";
            Globals.cartCount++;

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[2].Name.ToString() + "','"
                + gameList[2].Price.ToString() + "','" + gameList[2].ImgPath.ToString() + "','" + gameList[2].Description.ToString() + "','"
                + gameList[2].Platform.ToString() + "','" + gameList[2].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();
        }
        // bottom left
        protected void bestSelCart1Button_Click(object sender, EventArgs e)
        {
            Session["Id"] = gameList[3].Id;
            Session["Name"] = gameList[3].Name;
            Session["ImgPath"] = gameList[3].ImgPath;
            Session["Price"] = gameList[3].Price.ToString();
            Session["Quantity"] = "1";
            Globals.cartCount++;

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[3].Name.ToString() + "','"
                + gameList[3].Price.ToString() + "','" + gameList[3].ImgPath.ToString() + "','" + gameList[3].Description.ToString() + "','"
                + gameList[3].Platform.ToString() + "','" + gameList[3].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();
        }
        // bottom middle
        protected void bestSelCart2Button_Click(object sender, EventArgs e)
        {
            Session["Id"] = gameList[4].Id;
            Session["Name"] = gameList[4].Name;
            Session["ImgPath"] = gameList[4].ImgPath;
            Session["Price"] = gameList[4].Price.ToString();
            Session["Quantity"] = "1";
            Globals.cartCount++;

            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[4].Name.ToString() + "','"
                + gameList[4].Price.ToString() + "','" + gameList[4].ImgPath.ToString() + "','" + gameList[4].Description.ToString() + "','"
                + gameList[4].Platform.ToString() + "','" + gameList[4].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();


        }
        // bottom right
        protected void bestSelCart3Button_Click(object sender, EventArgs e)
        {
            Session["Id"] = gameList[5].Id;
            Session["Name"] = gameList[5].Name;
            Session["ImgPath"] = gameList[5].ImgPath;
            Session["Price"] = gameList[5].Price.ToString();
            Session["Quantity"] = "1";
            Globals.cartCount++;


            //adding it to the shopping cart DB when add to cart is clicked.
            Globals.conn.Open();
            string query = "SELECT * FROM games;";
            var cmd = new MySql.Data.MySqlClient.MySqlCommand(query, Globals.conn);
            //var reader = cmd.ExecuteReader();

            cmd.CommandText = "Insert into shoppingcart (title, price, imagepath, description, platform, genre) value ('" + gameList[5].Name.ToString() + "','"
                + gameList[5].Price.ToString() + "','" + gameList[5].ImgPath.ToString() + "','" + gameList[5].Description.ToString() + "','"
                + gameList[5].Platform.ToString() + "','" + gameList[5].Genre.ToString() + "')";
            cmd.ExecuteNonQuery();
            //reader.Close();
            Globals.conn.Close();

        }

        
    }
}