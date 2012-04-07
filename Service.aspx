<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Service.aspx.cs" Inherits="Service_1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
Báo giá
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<table width="100%" style='font-size:11pt'>
<tr>
    <td colspan='2'>
        <div style='font-size:20px;color:red;font-weight:bold;text-align:left;'>
            Báo giá
        </div>
        <hr/>
    </td>
</tr>
<tr>
    <td colspan='2'>
        <asp:Label ID="content" runat="server" Text=""></asp:Label>
    </td>
</tr>
</table>
</asp:Content>

