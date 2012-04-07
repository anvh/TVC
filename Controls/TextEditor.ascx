<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TextEditor.ascx.cs" Inherits="TextEditor" %>
<%@ Register TagPrefix="CE" Namespace="CuteEditor" Assembly="CuteEditor" %>
<script type="text/javascript">
    function check_valid() {
        var title_e = $('#MainContent_TextEditor1_title')[0];
        var sumary = $('#MainContent_TextEditor1_summary')[0];
        var file = $('#MainContent_TextEditor1_file')[0];

        if (title_e.value.trim() == "") {
            title_e.style.borderColor = 'red';
            title_e.focus();
            alert("Thiếu tựa đề!");
            return false;
        } else title_e.style.borderColor = '';

        if (sumary.value.trim() == "") {
            sumary.borderColor = 'red';
            sumary.focus();
            alert("Thiếu sơ lược!");
            return false;
        } else sumary.borderColor = '';

        if (file.value.trim() == "") {
            file.borderColor = 'red';
            file.focus();
            alert("Thiếu ảnh mô tả!");
            return false;
        } else file.borderColor = '';

        return true;
    }
</script>
<table width="100%">
    <tr>
        <td style="font-weight:bold" width='10%'>
            Tiêu đề:
        </td>
        <td width="70%" >
            <asp:TextBox ID="title" runat="server" style="width:100%"></asp:TextBox>
        </td>
        <td align='right'>
            
            <asp:Button ID="post" runat="server" Text="Post bài >>" 
                style='font-weight:bold;' onclick="post_Click" OnClientClick='return check_valid();'/>
        </td>
    </tr>
    <tr>
        <td style="font-weight:bold" >
            Nội dung:
        </td>
        <td colspan='2'>
            <CE:Editor id="description" EditorWysiwygModeCss="Styles/example.css" runat="server" Width='100%' Height="700px"></CE:Editor>
        </td>
    </tr>
    <tr>
        <td style="font-weight:bold">
            Sơ lược:
        </td>
        
        <td colspan='2'>
            <asp:TextBox ID="summary" runat="server" Width="99%" Rows="5" TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="font-weight:bold">
            Hình:
        </td>
        <td align='left' colspan='2'>
            <asp:FileUpload ID="file" runat="server" size='70' Width="536px"/>
        </td>
    </tr>
     <tr>
        <td style="font-weight:bold">
            Bài cũ:
        </td>
        <td align='left'>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Title" DataValueField="Id" style='width:80%'></asp:DropDownList> 
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                SelectCommand="SELECT top 20 [Id], [Title] FROM [News] WHERE ID >= 0 ORDER BY ID DESC"></asp:SqlDataSource>
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" OnClientClick='return confirm("Bạn có chắc muốn xóa bài này không ?")'>Delete</asp:LinkButton>/
            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton1_Edit" >Edit</asp:LinkButton>
            <span style='color:red'>
                <asp:Literal ID="show_info" runat="server"></asp:Literal>
            </span>
        </td>
        <td>
            <asp:RadioButtonList ID="Select_Item" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="selected_index_changed" AutoPostBack="true">
                <asp:ListItem Text="GThiệu" Selected="False">
                </asp:ListItem>
                <asp:ListItem Text="BGiá" Selected="False">
                </asp:ListItem>
                <asp:ListItem Text="New" Selected="True">
                </asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</table>

