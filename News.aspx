<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
Tin tức
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT top 5 * from News order by id desc">
</asp:SqlDataSource>

<table width="100%" style='font-size:11pt'>
<tr>
    <td colspan='2'>
        <div style='font-size:20px;color:red;font-weight:bold;text-align:left;'>
            Tin tức
        </div>
        <hr/>
    </td>
</tr>
<tr>
    <td colspan='2'>
<asp:DataList ID="StudentData" runat="server" DataSourceID="StudentDataSource" Width="100%" >
    <ItemTemplate>
        <tr>
            <td colspan="2">
	        <div >
                <table width="100%">
                    <tbody>
                        <tr>
                            <td width="200" rowspan="3">
                                <div class='frame'>
                                      <a target="_blank" href="news-<%# Eval("id")%>-<%# Server.HtmlDecode(Eval("Title") as string).Replace(" ","+")  %>" style="color:Black;">
                                        <img src="<%# Server.HtmlDecode(Eval("Image") as string) %>" width="190px" height="140px">	
                                    </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                            </td>
                            <td width="10px"></td>
                            <td height="6px" valign="top" style="font-size:13pt;font-weight:bold;">
                                 <a target="_blank" href="news-<%# Eval("id")%>-<%# Server.HtmlDecode(Eval("Title") as string).Replace(" ","+")  %>" style="color:Black;">
                                    <%# Server.HtmlDecode(Eval("Title") as string) %>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td valign="top" height='106px'>
                                <div>
                                    <%# get_description(Server.HtmlDecode(Eval("content") as string))%> 
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td></td>
                            <td valign="bottom" align=right>
                                <div style='margin-top:-5px;margin-bottom:-5px;'>...  <a target="_blank" href="Detail.aspx?id=<%# Eval("id")%>&title=<%# Server.HtmlDecode(Eval("Title") as string).Replace(" ","+")  %>" style="color:Black;"> Chi tiết</a></div>
                                <hr/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </td>
        </tr>
        <tr height='0'><td colspan="2"></td></tr>
    </ItemTemplate>
    <FooterTemplate>
        <tr>
            <td colspan='2' align='right' style='font-weight:bold'>
                <a href="List.aspx" target="_blank"> Các tin khác >> </a>
            </td>
        </tr>
    </FooterTemplate>
</asp:DataList>
</td>
</tr>
</table>
</asp:Content>
