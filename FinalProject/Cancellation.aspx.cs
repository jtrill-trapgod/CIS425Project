using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Cancellation : System.Web.UI.Page
    {   //user defined search string
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
    }
}