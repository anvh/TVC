<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Default2" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" Runat="Server">
Chi tiết
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT * from News where id = @id">
    <SelectParameters>
        <asp:Parameter Name='id'/>
    </SelectParameters>
    </asp:SqlDataSource>

<asp:DataList ID="Data" runat="server" DataSourceID="DataSource" Width="100%" >
    <ItemTemplate>
        <tr>
            <td colspan='3'>
                <div style='position:fixed;left:-300px' id='hide'>
                    <img src="<%# Server.HtmlDecode(Eval("Image") as string) %>" width="190px" height="140px" alt=""/>
                </div>
                <div style='font-size:20px;color:red;font-weight:bold;text-align:left;'>
                    <%# Server.HtmlDecode(Eval("title") as string) %>
                </div>
                <hr/>
            </td>
        </tr>
        <tr>
            <td colspan='3'>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%# Server.HtmlDecode(Eval("Description") as string)  %>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        <tr style='height:60px'>
            <td colspan='2'>
                <hr/>
            </td>
            <td align='right'  width='500px'>
                <span class='st_facebook_hcount' displayText='Facebook'></span>
                <span class='st_fblike_hcount' displayText='Facebook Like'></span>
                <!--
                <span class='st_fbrec_hcount' displayText='Facebook Recommend'></span>
                <span class='st_fbsend_hcount' displayText='Facebook Send'></span>
                <span class='st_fbsub_hcount' displayText='Facebook Subscribe' st_username='ThienViet Company'></span>
                -->
                <span class='st_plusone_hcount' displayText='Google +1'></span>
                <span class='st_twitter_hcount' displayText='Tweet'></span>
                <span class='st_email_hcount' displayText='Email'></span>
            </td>
        </tr>
        <tr style='height:20px'>
            <td colspan='3'>
            </td>
        </tr>
        <tr>
            <td colspan='2' align='left' style='font-weight:bold;font-size:18px'>
                <a href="#" target="_blank"> Các tin khác </a>
            </td>
            <td align='right'>
            </td>
        </tr>
        <%# get_list_item()%>

    </FooterTemplate>
</asp:DataList>

</asp:Content>

