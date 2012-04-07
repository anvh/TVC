using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;

public partial class Controls_Mail_Form : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public bool SendEmail(string pGmailEmail, string pGmailPassword, string pTo, string pSubject, string pBody, System.Web.Mail.MailFormat pFormat, string pAttachmentPath)
    {
        try
        {
            System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpserver",
            "smtp.gmail.com");
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpserverport",
            "465");
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/sendusing",
            "2");
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1");
            //Use 0 for anonymous
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/sendusername",
            pGmailEmail);
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/sendpassword",
            pGmailPassword);
            myMail.Fields.Add
            ("http://schemas.microsoft.com/cdo/configuration/smtpusessl",
            "true");
            myMail.From = pGmailEmail;
            myMail.To = pTo;
            myMail.Subject = pSubject;
            myMail.BodyFormat = pFormat;
            myMail.Body = pBody;
            myMail.BodyEncoding = System.Text.Encoding.UTF8;
            if (pAttachmentPath.Trim() != "")
            {
                MailAttachment MyAttachment =
                new MailAttachment(pAttachmentPath);
                myMail.Attachments.Add(MyAttachment);
                myMail.Priority = System.Web.Mail.MailPriority.High;
            }

            System.Web.Mail.SmtpMail.SmtpServer = "smtp.gmail.com:465";
            System.Web.Mail.SmtpMail.Send(myMail);
            return true;
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    protected void send_mail(object sender, EventArgs e)
    {
        string admin_addr = "Thienvietltd@gmail.com";
        string sender_addr = "admin@vanchuyenhang.com.vn";
        string pass = "thienvietco";
        string body = string.Format("{0} - {1} ({2}):\n{3}", DateTime.Now.ToLocalTime(), name.Text, email.Text, content.Text);

        try
        {
            SendEmail(sender_addr, pass, admin_addr, subject.Text, body, MailFormat.Text, "");

            show_info.Text = "Đã gửi mail thành công!";
        }
        catch (Exception ex) { show_info.Text = "Lỗi! Bạn vui lòng gửi trực tiếp vào hộp thư " + admin_addr; }
    }
}