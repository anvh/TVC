using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ImagesLibrary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getImageList()
    {
        DirectoryInfo d = new DirectoryInfo(Server.MapPath("~\\images\\albums\\"));
        string result = @"'";
        foreach (DirectoryInfo d_1 in d.GetDirectories())
        {
            foreach (FileInfo f in d_1.GetFiles()) 
            {
                result += "Images/" + d.Name + "/" + d_1.Name + "/" + f.Name + ",";
            }
            result += "#";
        }
        result += @"'";
        //string result = @"'img/slide-1.jpg, img/slide-2.jpg, img/slide-3.jpg, img/slide-4.jpg#img/slide-5.jpg,img/slide-6.jpg,img/slide-7.jpg,img/slide-2.jpg'";
        //string result = "'Thumbnails/1.jpg, img/slide-2.jpg'";

        return result;

    }
    public string[] defaultAlbum()
    {
        string[] arrImg1 = new string[4];
        arrImg1[0] = "images/albums/slide-1.jpg";
        arrImg1[1] = "images/albums/slide-2.jpg";
        arrImg1[2] = "images/albums/slide-3.jpg";
        arrImg1[3] = "images/albums/slide-4.jpg";
        return arrImg1;
    }
}