<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="AdminManegement" %>
<%@ Register src="Controls/TextEditor.ascx" tagname="TextEditor" tagprefix="uc1" %>
<%@ Register src="Controls/File_Manager.ascx" tagname="File_Manager" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">
Quản trị
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server" >

    <asp:LoginView ID="LoginView1" runat="server" >
        <AnonymousTemplate>
            <div>
            <table width='100%' >
                <tr align="center" height='200px'>
                    <td>
                        <font size='2'><i>(Vui lòng đăng nhập để quản lí thông tin!)</i></font>
                        <br>
                        </br>
                        <asp:login id="ctlLogin" runat="server" onauthenticate="OnAuthenticate" onloggedin="OnLoggedIn" destinationpageurl="~" Width="300px" BackColor="#CCCCCC" >
                        </asp:login>
                    </td>
                </tr>
            </table>
        </AnonymousTemplate>
        <LoggedInTemplate>
            <table width='100%'>
                <tr>
                    <td>
                        <a href="#" id ='show_1'>Quản trị nội dung </a>
                    </td>
                    <td align='right'>
                        <asp:LoginStatus ID="LoginStatus1" runat="server" />
                    </td>
                </tr>
            </table>
            <div id='manage_news'>
                <uc1:TextEditor ID="TextEditor1" runat="server" />
                <br />
            </div>
            <hr />
            
            <div>
                <a href="#" id= 'show_4'>Quản lí thư viện ảnh</a>
            </div>
            <div id='file_manager' >
                <uc1:File_Manager ID="File_Manager2" runat="server" />
            </div>
            <hr />

            <div>
                <a href="#" id= 'show_2'>Quản trị thông số </a>
            </div>
            <div id='manage_pararams' >
                    <asp:SqlDataSource ID="EditMarkSource" runat="server"
                    ConnectionString="<%$ ConnectionStrings : ApplicationServices%>"
                    SelectCommand = "SELECT * FROM ADMIN"
                    UpdateCommand = "Update ADMIN SET kg = @kg,m3 = @m3 WHERE target = @target"
                    DeleteCommand = "DELETE From ADMIN WHERE target = @target"
                    InsertCommand = "Insert into ADMIN values(@target,@kg,@m3)">
                        <UpdateParameters>
                            <asp:Parameter Name = "target" />
                            <asp:Parameter Name = "kg" />
                            <asp:Parameter Name = "m3" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name = "target" />
                            <asp:Parameter Name = "kg" />
                            <asp:Parameter Name = "m3" />
                        </InsertParameters>
                        <DeleteParameters>
                            <asp:Parameter Name = "target" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <table width='100%' border='0'>
                    <tr>
                        <td width='700px'>
                            <asp:GridView ID="GridView2" runat="server"
                            DataSourceID="EditMarkSource" AutoGenerateColumns="False" Width = "700px"
                            AllowPaging="true" PageSize='30' ShowFooter="true"
                            OnRowDeleting="GridView2_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="Tỉnh">
                                        <ItemTemplate>
                                            <asp:Label runat = "server"  ID ="target" Text='<%# Eval("target") %>'/>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="target_footer" runat="server" Text=''  Width="95%"/>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="left" />
                                        <HeaderStyle Width="270px" Font-Bold="true" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Kg" >
                                        <ItemTemplate>
                                           <asp:TextBox class = "value_class" ID="value_kg" runat="server" Text='<%# Eval("kg") %>' style='text-align:right'  Width="95%"/>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="value_footer_kg" runat="server" Text='0'  Width="95%" class = "value_class" style='text-align:right'/>
                                        </FooterTemplate>
                                       <ItemStyle HorizontalAlign="Center"/>
                                        <HeaderStyle Width="200px" Font-Bold="true" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="M3">
                                        <ItemTemplate>
                                              <asp:TextBox class = "value_class" ID="value_m3" runat="server"  Text='<%# Eval("m3") %>' style='text-align:right;'  Width="95%"></asp:TextBox>
                                        </ItemTemplate>
                                       <FooterTemplate>
                                            <asp:TextBox ID="value_footer_m3" class = "value_class" runat="server" Text=''  Width="95%" style='text-align:right'/>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                        <HeaderStyle Width="200px" Font-Bold="true" HorizontalAlign="center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="delete" runat="server" CommandName="Delete" OnClientClick="return confirm('Ban co muon xoa item nay khong?')">x</asp:LinkButton>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            <asp:Button ID="insert" runat="server" Text="Insert" OnClick="Insert_data"/>
                                        </FooterTemplate>
                                        <ItemStyle HorizontalAlign="Center" Font-Bold="true" />
                                        <HeaderStyle Width="50px" Font-Bold="true" HorizontalAlign="center" />
                                        <FooterStyle HorizontalAlign='center' />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </td>
                        <td>
                            <asp:Button ID="Save" runat="server" Text="Save" OnClick="Save_data"/>
                        </td>
                    </tr>
                </table>

            </div>
            <hr />
            <div>
                <a href="#" id= 'show_3'>Thống kê số lượng </a>
            </div>
            <div id='manage_count' >
                Quản trị các thông số thống kê: trang <a href = "http://www.easycounter.com/user/?comm=show_stat" target="_blank">http://www.easycounter.com/user/?comm=show_stat</a>
                đăng nhập: user: thienviet pass:thienviet để xem thông tin truy cập.
            </div>

            <!-- script content -->
            <script type="text/javascript">
                $(document).ready(function () {

                    <% if(Session["State"] == "1"){%>
                        $("#manage_news").show();
                        $("#file_manager").hide();
                        $("#manage_pararams").hide();
                        $("#manage_count").hide();

                    <% }else if(Session["State"] == "2"){ %>
                        $("#manage_news").hide();
                        $("#file_manager").show();
                        $("#manage_pararams").hide();
                        $("#manage_count").hide();
                        
                    <% }else if(Session["State"] == "3"){ %>
                        $("#manage_news").hide();
                        $("#file_manager").hide();
                        $("#manage_pararams").show();
                        $("#manage_count").hide();
                    <% } else {%>
                        $("#manage_news").hide();
                        $("#file_manager").hide();
                        $("#manage_pararams").show();
                        $("#manage_count").hide();
                    <% }%>

                   
                    $('#show_1').click(function () {
                        var i = $("#manage_news");
                        if (i.is(":hidden"))
                            i.show();
                        else i.hide();

                        $("#file_manager").hide();
                        $("#manage_pararams").hide();
                        $("#manage_count").hide();
                        return false;
                    });
                    $('#show_2').click(function () {
                        $("#manage_news").hide();
                        $("#file_manager").hide();

                        var i = $("#manage_pararams");
                        if (i.is(":hidden"))
                            i.show();
                        else i.hide();
                        $("#manage_count").hide();
                        return false;
                    });
                    $('#show_3').click(function () {
                        $("#manage_news").hide();
                        $("#manage_pararams").hide();
                        $("#file_manager").hide();

                        var i = $("#manage_count");
                        if (i.is(":hidden"))
                            i.show();
                        else i.hide();
                        return false;
                    });
                    $('#show_4').click(function () {
                        $("#manage_pararams").hide();
                        $("#manage_count").hide();
                        $("#manage_news").hide();
                        
                        var i = $("#file_manager");
                        if (i.is(":hidden"))
                            i.show();
                        else i.hide();
                        return false;
                    });

                    $('.value_class').each(function(){
                        $(this).change(function(){this.value = CommaFormatted(CurrencyFormatted(parseInt(this.value.replace(".","").replace(",",""))));});
                        this.value = CommaFormatted(CurrencyFormatted(parseInt(this.value.replace(".","").replace(",",""))));
                    });

                });

                function change_value(source) {
                    $('#MainContent_LoginView1_value')[0].value = source.value;
                }

                function CurrencyFormatted(amount) {
                    var i = parseFloat(amount);
                    if (isNaN(i)) { i = 0; }
                    var minus = '';
                    if (i < 0) { minus = '-'; }
                    i = Math.abs(i);
                    i = parseInt((i + .005) * 100);
                    i = i / 100;
                    s = new String(i);
                    if (s.indexOf('.') == (s.length - 2)) { s += '0'; }
                    s = minus + s;
                    return s;
                }

                function CommaFormatted(amount) {
                    var delimiter = ","; // replace comma if desired
                    amount = new String(amount);
                    var a = amount.split('.', 2)
                    var d = a[1];
                    var i = parseInt(a[0]);
                    if (isNaN(i)) { return ''; }
                    var minus = '';
                    if (i < 0) { minus = '-'; }
                    i = Math.abs(i);
                    var n = new String(i);
                    var a = [];
                    while (n.length > 3) {
                        var nn = n.substr(n.length - 3);
                        a.unshift(nn);
                        n = n.substr(0, n.length - 3);
                    }
                    if (n.length > 0) { a.unshift(n); }
                    n = a.join(delimiter);
                    amount = n; 
                    amount = minus + amount;
                    return amount;
                }
            </script>
        </LoggedInTemplate>
    </asp:LoginView>
</asp:Content>