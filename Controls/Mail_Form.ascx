<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Mail_Form.ascx.cs" Inherits="Controls_Mail_Form" %>
<div style='text-align:center;'>
    <table cellpadding='0' cellspacing='0' border='0' width='100%'>
        <tr height='30px' align='left'>
            </td>
            <td  width='20px'>
            </td>
            <td>
            </td>
            <td>
                <font size='2'>
                    <i> 
                        (Quý khách vui lòng điền đầy đủ thông tin sau và gửi mail về công ty để được tư vấn và hỗ trợ.)
                    </i>
                </font>
            </td>
        </tr>
        <tr height='30px' align='left'>
            <td width='100px' align='right' style='font-weight:bold;'>
                Email
            </td>
            <td  width='20px'>
            </td>
            <td>
                <asp:TextBox ID="email" runat="server" Width="75%"></asp:TextBox>
            </td>
            <td width='20px'></td>
        </tr>
        <tr height='30px' align='left'>
            <td  align='right' style='font-weight:bold;'>
                Họ tên
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="name" runat="server" Width="75%"></asp:TextBox>
            </td>
             <td width='20px'></td>
        </tr>
        <tr height='30px' align='left'>
            <td align='right' style='font-weight:bold;'>
                Chủ đề
            </td>
            <td></td>
            <td>
                <asp:TextBox ID="subject" runat="server" Width="75%"></asp:TextBox>
                <asp:Label ID="show_info" runat="server" Text="" ForeColor="red"></asp:Label>
            </td>
             <td width='20px'>
             </td>
        </tr>
        <tr align='left'>
            <td align='right' style='font-weight:bold;'>
                Nội dung
            </td>
            <td></td>
            <td colspan='2'>
                <asp:TextBox ID="content" runat="server" TextMode="MultiLine" Rows='20' Width="100%"></asp:TextBox>
            </td>
        </tr>
        <tr height='30px' align='left'>
            <td></td>
            <td></td>
            <td>
                <asp:Button ID="send" runat="server" Text="Gửi mail >>" OnClientClick="return check_valid();" OnClick="send_mail"/>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
    function check_valid() {
        var email = $('#MainContent_email')[0];
        var name = $("#MainContent_name")[0];
        var subject = $("#MainContent_subject")[0];
        var content = $('#MainContent_content')[0];

        if (email.value.trim() == "" || !validateEmail(email.value)) {
            email.style.borderColor = "red";
            alert("Email không hợp lệ!");
            return false;
        } else email.style.borderColor = "";

        if (name.value.trim() == "") {
            name.style.borderColor = "red";
            alert("Tên không được trống!");
            return false;
        } else name.style.borderColor = "";

        if (subject.value.trim() == "") {
            subject.style.borderColor = "red";
            alert("Chủ đề không hợp lệ!");
            return false;
        } else subject.style.borderColor = "";

        if (content.value.trim() == "") {
            content.style.borderColor = "red";
            alert("Nội dung không hợp lệ!");
            return false;
        } else content.style.borderColor = "";

    }
    function validateEmail(elementValue) {
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailPattern.test(elementValue);
    }  
</script>


