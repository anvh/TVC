<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
Trang chủ
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="StudentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="SELECT top 5 * from News order by id desc">
</asp:SqlDataSource>

<table width="100%" style='font-size:11pt'>
<tr>
    <td colspan='2'>
        <div style='font-size:20px;color:red;font-weight:bold;text-align:left;'>
            Giới Thiệu
        </div>
        <hr/>
    </td>
</tr>
<tr>
    <td colspan='2'>
        Giới thiệu công ty Thiên Việt!
    </td>
</tr>
</table>
</asp:Content>
