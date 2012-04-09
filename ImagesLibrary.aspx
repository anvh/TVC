<%@ Page Language="C#" AutoEventWireup="false" CodeFile="ImagesLibrary.aspx.cs" Inherits="ImagesLibrary" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.Collections.Generic" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
     <link rel="shortcut icon" href="favicon.ico" />

    <title>Thư viện ảnh</title>

    <link rel="stylesheet" href="Styles/global.css" type="text/css"/>
    <link rel="stylesheet" href="Styles/images-library.css" type="text/css"/>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Main.css" rel="stylesheet" type="text/css" />
    <link href="Styles/style.css" rel="stylesheet" type="text/css" media="all" />

    <script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.betterTooltip.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/slides.min.jquery.js"></script>
    <script type="text/javascript" src="Scripts/crawler.js"></script>


    <script type="text/javascript">
        $(function () {
            $('#slides').slides({
                preload: true,
                preloadImage: 'images/albums/loading.gif',
                play: 5000,
                pause: 2500,
                hoverPause: true,
                animationStart: function (current) {
                    $('.caption').animate({
                        bottom: -35
                    }, 100);
                },
                animationComplete: function (current) {
                    $('.caption').animate({
                        bottom: 0
                    }, 200);
                },
                slidesLoaded: function () {
                    $('.caption').animate({
                        bottom: 0
                    }, 200);
                }
            });
        });
    </script>
    <style type="text/css">
        .style1
        {
            height: 199px;
        }
    </style>

    <script type="text/javascript">
        var switchTo5x = true;
    </script>
    <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
    <script type="text/javascript">        stLight.options({ publisher: "cbd4bc38-0fa7-4790-9919-d6fb3f4f429a" }); </script>
</head>
<body>
<form id="form1" runat="server">
<table width="80%" border="0" align="center" cellspacing="0" cellpadding="0" style="background-color: #e9e6d3">
    <!-- Menu ------------------------------------------------------------------------------------------------------------>
    <tr valign="top">
                <td align="left">
                    <div style="background-image: url(Images/left_menu.png); height:71px;width:91px;margin-left:-90px;margin-top:26px"></div>
                </td>
                <td width="100%">
                    <div class="menu">
                        <table align="center" cellpadding="0" cellspacing="0" border="0" style="padding-top: 20px">
                            <tr>
                                <td>
                                    <a id="default" href="Default.aspx" target="_blank" class='menu_i'>Trang Chủ</a>
                                </td>
                                <td width="60px" align="center">
                                    &nbsp;
                                </td>
                                <td>
                                    <a id="service" href="Services.aspx" target="_blank" class='menu_i'>Dịch Vụ</a>
                                </td>
                                <td width="60px" align="center">
                                    &nbsp;
                                </td>
                                <td>
                                    <a id="list" href="List.aspx" target="_blank" class='menu_i'>Tin Tức</a>
                                </td>
                                <td width="60px" align="center">
                                    &nbsp;
                                </td>
                                <td>
                                    <a id="image_library" href="ImagesLibrary.aspx" target="_blank" class='menu_i'>Thư Viện</a>
                                </td>
                                <td width="60px" align="center">
                                    &nbsp;
                                </td>
                                <td>
                                    <a id="contact" href="Contact.aspx" target="_blank" class='menu_i'>Liên Hệ</a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td align="right" width="1px">
                    <div style="background-image: url(Images/right_menu.png); height:71px;width:91px;margin-right:-90px;margin-top:26px"></div>
                </td>
            </tr>
    <!-- Logo ----------------------------------------------------------------------------------------------------------->
    <tr>
                <td align="center" colspan="3" class="style1">
                    <div style="margin-bottom: 50px; margin-top: 50px">
                        <a href="Default.aspx" target="_blank">
                            <img src="Images/Logo.png" alt="logo" width="550" />
                        </a>
                    </div>
                </td>
            </tr>
            <!-- -->
    <tr>
        <td></td>
        <td>
            <div id="container">
                <div id="example">
                    <img src="images/albums/new-ribbon.png" width="112" height="112" alt="New Ribbon" id="ribbon" />
                    <div id='slide_show'>
                        <div id="slides">
                            <div class="slides_container" id="abc">
                                <%
                                    String[] currentAlbum = defaultAlbum();
                                    foreach (String item in currentAlbum)
                                    {
                                %>
                                <div class="slide">
                                    <img src="<%= item %>" width="570" height="270" alt="Slide 1" />
                                </div>
                                <%
                                    }	
                                %>
                            </div>
                            <a href="#" class="prev">
                                <img src="images/albums/arrow-prev.png" width="24" height="43" alt="Arrow Prev" /></a>
                            <a href="#" class="next">
                                <img src="images/albums/arrow-next.png" width="24" height="43" alt="Arrow Next" /></a>
                        </div>
                    </div>
                    <img src="images/albums/example-frame.png" width="739" height="341" alt="Example Frame"
                        id="frame">
                </div>
            </div>
            <!-- albums list ---------------------------------------------------------------------------------------->
            <div class="marquee" id="mycrawler" style="padding-left:110px;">
                <table width="80%" align="center">
                    <tr>
                        <% 
                            string strAlbums = getImageList();
                            string[] arrAlbums = strAlbums.Split('#');
                            string[] album;
                            album = arrAlbums[0].Split('\'')[1].Split(',');
                            %>
                                <td>
                                    <div class="album_border" id="0" onclick="getAlbumByID(this.id);">
                                        <img src="<%= album[0] %>" width="175px" height="108px" />
                                    </div>
                                </td>
                                <td width="100px"></td>
                            <%
                            for (int i = 1; i < arrAlbums.Length - 1; i++)
                            {

                                album = arrAlbums[i].Split(',');
                                %>
                                    <td>
                                        <div class="album_border" id="<%= i %>" onclick="getAlbumByID(this.id);">
                                            <img src="<%= album[0] %>" width="175px" height="108px" />
                                        </div>
                                    </td>
                                    <td width="100px"></td>
                                <%
                            }
                    
                        %>
                        
                    </tr>
                </table>
            </div>
        </td>
        <td></td>
    </tr>
</table>
	
    <!-- Footer ----------------------------------------------------------------------------------------------------------->
        <table width="100%" border="0" align="center" cellspacing="0" cellpadding="0">
            <tr align="center">
                <td colspan="3" height="7" bgcolor="black">
                </td>
            </tr>
            <tr>
                <td>
                    <div class="footer_bg_left_bottom"></div>
                </td>
                <td align="center" colspan="0" bgcolor="#88250e" height="50">
                    <div class="footer">
                        <span style="color: #000000; font-weight: bold">CÔNG TY TNHH TM - DV XÂY DỰNG VẬN TẢI
                            THIÊN VIỆT</span><br />
                            <span class="footer_hr"></span>
                        Z11 Quốc lộ 1A, Khu phố 2, P. Trung Mỹ Tây, Quận 12, Tp. Hồ Chí Minh, Việt Nam.<br />
                        <span class="footer_label">ĐT:</span> (+84) 8 - 66 847 867 - <span class="footer_label">
                            Fax:</span> (+84) 8 - 6250 1912<br />
                        <span class="footer_label">Email:</span> phongkinhdoanh@vanchuyenhang.com.vn &nbsp;&nbsp;&nbsp;<span
                            style="color: #000000; font-weight: bold">Hotline:</span> 0976 585 121 - 0933
                        397 204<br />
                        <span class="footer_label">Website:</span> <a href="vanchuyenhang.com.vn" target="_blank">
                            vanchuyenhang.com.vn</a> - <a href="www.vanchuyenhanghoa.com.vn" target="_blank">www.vanchuyenhanghoa.com.vn</a><br />
                        <br />
                        <span style="color: #000000; font-size: 9px">Bản quyền © 2012 thuộc TVC Transportation</span>
                    </div>
                    <div class="designer">
                        <a href="#"><i>Designed by: AnVH - LamPV</i></a>
                    </div>
                    
                    
                </td>
                <td>
                    <div class="footer_bg_right_bottom"></div>
                </td>
            </tr>
            <tr>
                <td width="1%">
                    <div class="footer_bg_left"></div>
                </td>
                <td width="98%" align="center">
                    <div class="footer_bg"></div>
                </td>
                <td>
                    <div class="footer_bg_right"></div>
                </td>
            </tr>
            
        </table>
        <!-- side banner ----------------------------------------------------------------------------------------->
        <div class='banner_side' id='banner_side'>
        <div class="addthis_toolbox addthis_default_style addthis_32x32_style" style='text-align:center;'>
               <table cellspacing="0" cellpadding="0" border="0" width='100%'>
                    <tr align='center' height='36px'>
                        <td nowrap="nowrap" valign="top" align='center'>
                            <div style='text-align:center; width='100%''>
                               <!-- AddThis Button BEGIN -->
                                <a class="addthis_button_preferred_1"></a>
                            </div>
                            <br/>
                        </td>
                    </tr>
                    
                    <tr align='center' height='36px'> 
                        <td nowrap="nowrap" valign="top" align='center'>
                           <!-- AddThis Button BEGIN -->
                            <div style='text-align:center; width='100%''>
                                <a class="addthis_button_preferred_2"></a>
                            </div>
                             </br>
                        </td>
                    </tr>
                    <tr align='center' height='36px'>
                        <td nowrap="nowrap" valign="top" align='center'>
                             <div style='text-align:center; width='100%''>
                                <!-- AddThis Button BEGIN -->
                                <a class="addthis_button_compact"></a>
                            </div>
                            </br>
                        </td>
                    </tr>
                    <tr>
                    <td>
                        <hr/>
                        <script type="text/javascript" src="http://download.skype.com/share/skypebuttons/js/skypeCheck.js"></script>
                        <a href="skype:thienvietcompany?call" target="_blank">
                            <img src="http://download.skype.com/share/skypebuttons/buttons/call_blue_transparent_34x34.png" style="border: none;" width="34" height="34" alt="Skype Me™!" />
                        </a>
                        <!-- <a href="mailto:?subject=">
                            <img height="27" border="0" width="27" src="images/mail.gif"/>
                        </a>
                        -->
                        
                    </td>
                  </tr>
                  <tr>
                    <td>
                        <a href='ymsgr:sendIM?nangsantruong_199' target="_blank">
                            <img alt='' height="20" border="0" width="20" border=0 src='http://opi.yahoo.com/online?u=nangsantruong_199&m=g&t=5' /> 
                        </a>
                    </td>
                  </tr>
                </table>
            </div>
        </div>
        
        <script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=ra-4f6ec4fe1d4c7b05"></script>
        <!-- AddThis Button END -->
    </form>
    <!-- script functions --------------------------------------------------------------------->
    <script type="text/javascript">

        $(document).ready(function () {
            setFocusCurrentPage();
            MainContentW = 1000;
            LeftBannerW = 125;
            RightBannerW = 125;
            LeftAdjust = 5;
            RightAdjust = 5;
            TopAdjust = $(window).height() / 2 - 90;
            
            function FloatTopDiv() {
                startLX = 0, startLY = TopAdjust;
                var d = document;

                function m2(id) {
                    var e2 = d.getElementById ? d.getElementById(id) : d.all ? d.all[id] : d.layers[id];
                    e2.sP = function (x, y) { this.style.left = x + 'px'; this.style.top = y + 'px'; };
                    e2.x = startLX;
                    e2.y = startLY;
                    return e2;
                }
                window.stayTopLeft = function () {
                    if (document.documentElement && document.documentElement.scrollTop)
                        var pY = document.documentElement.scrollTop;
                    else if (document.body)
                        var pY = document.body.scrollTop;
                    startLY = TopAdjust; startRY = TopAdjust;
                    ftlObj2.y += (pY + startLY - ftlObj2.y) / 16;
                    ftlObj2.sP(ftlObj2.x, ftlObj2.y-30);
                    
                    setTimeout("stayTopLeft()", 1);
                }

                ftlObj2 = m2("banner_side");
                stayTopLeft();
            }
            FloatTopDiv();

            // add event for mouse over and mouse out
            $('.menu_item').mouseover(function() {
                   $(this).animate({
                        bottom: '+=20'
                        }, 0, function() {
                        // Animation complete.
                   });
            });

            $('.menu_item').mouseout(function() {
                   $(this).animate({
                        bottom: '-=20'
                        },0, function() {
                        // Animation complete.
                   });

            });

        });

        //this function simply gets the window scroll position, works in all browsers
        function getPageScroll() {
            var yScroll;
            if (self.pageYOffset) {
                    yScroll = self.pageYOffset;
            } else if (document.documentElement && document.documentElement.scrollTop) {
                yScroll = document.documentElement.scrollTop;
            } else if (document.body) {
                yScroll = document.body.scrollTop;
            }
            return yScroll;
        }

        function getQuerystring(key, default_)
        {
          if (default_==null) default_=""; 
          key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
          var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
          var qs = regex.exec(window.location.href);
          if(qs == null)
            return default_;
          else
            return qs[1];
        }
       
    </script>
</body>
</html>
<script type="text/javascript">
    window.onload = function(){
        
    }
    function createAlbum() {
        var lsImages = "";
        var arrAlbum = "";

        lsImages = <%= getImageList()%>
        arrAlbum = lsImages.split('#');
        return arrAlbum;
    }

    function getAlbumByID(id){
        var arrAlbum = createAlbum();
        if(arrAlbum.length > 0 && id < arrAlbum.length){
            var album = arrAlbum[id].split(',');
        }
        generate_album(album);
    }

    function generate_album(album){
        var content = "";
        for(var i = 0; i < album.length - 1; i++)
        {
            content += "<div class='slide'>"+
                        "<img src=" + album[i] + " width='570' height='270'/>"+
                        "</div>";
        }
        $("#slide_show")[0].innerHTML = "<div id='slides'><div class='slides_container'>" +content + "</div>"+
                                        "<a href='#' class='prev'><img src='images/albums/arrow-prev.png' width='24' height='43' alt='Arrow Prev'/></a>"+
				                        "<a href='#' class='next'><img src='images/albums/arrow-next.png' width='24' height='43' alt='Arrow Next'/></a>"+
                                        "</div>"
         $(function () {
            $('#slides').slides({
                preload: true,
                preloadImage: 'images/albums/loading.gif',
                play: 5000,
                pause: 2500,
                hoverPause: true,
                animationStart: function (current) {
                    $('.caption').animate({
                        bottom: -35
                    }, 100);
                },
                animationComplete: function (current) {
                    $('.caption').animate({
                        bottom: 0
                    }, 200);
                },
                slidesLoaded: function () {
                    $('.caption').animate({
                        bottom: 0
                    }, 200);
                }
            });
        });
    }
    function generate_album_list(lsAlbum){
        var content = "";
        for(var i = 0; i < lsAlbum.length - 1; i++){
            
        }
    }
    //marquee images
    marqueeInit({
        uniqueid: 'mycrawler',
        style: {
            'padding': '2px',
            'width': '90%',
            'height': '180px'
        },
        inc: 4, //speed - pixel increment for each iteration of this marquee's movement
        mouse: 'cursor driven', //mouseover behavior ('pause' 'cursor driven' or false)
        moveatleast: 2,
        neutral: 150,
        savedirection: true,
        random: true
    });
    function setFocusCurrentPage(){
        var url = document.location.href;
        if(url.indexOf("Default.aspx") != -1){
            $('#default')[0].style.color = '#FF7F50';
        }
        if (url.indexOf("Services.aspx") != -1) {
            $('#service')[0].style.color = '#FF7F50';
        }
        if (url.indexOf("List.aspx") != -1) {
            $('#list')[0].style.color = '#FF7F50';
        }
        if (url.indexOf("ImagesLibrary.aspx") != -1) {
            $('#image_library')[0].style.color = '#FF7F50';
        }
        if (url.indexOf("Contact.aspx") != -1) {
            $('#contact')[0].style.color = '#FF7F50';
        }
        $('.menu_i').each(function () {
            $(this).mouseover(function () {
                if (this.style.color) this.style.color = 'orange';
            });
            $(this).mouseout(function () {
                if (this.style.color) this.style.color = '#FF7F50';
            });
        });
    }
</script>
