<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Services.aspx.cs" Inherits="Services" MasterPageFile="~/Site.master" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
Dịch vụ
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div>
    <table width='100%'>
        <tr align='center' height='50px' valign='bottom'>
            <td>
                Quý khách vui lòng nhập các thông số cần thiết vào các ô bên dưới, để biết kết quả:
            </td>
        </tr>
        <tr  align='center'>
            <td>
                <div id='Square' style='text-align:center'>
                <table width='1005'>
                    <tr>
                        <td align='center'>
                            <table border='1' cellpadding='0' cellspacing='0' width='50%'>
                                <tr align='center' height='26'>
                                    <td >
                                        Số lượng
                                    </td>
                                    <td>
                                        <input type="text" ID="count" style='width:155px;'></input>
                                    </td>
                                </tr>
                                <tr align='center' height='26'>
                                    <td width='50%' >
                                        Đơn vị tính
                                    </td>
                                    <td>
                                        <select id="Select1" style='width:158px;'>
                                            <option>m3</option>
                                            <option>kg</option>
                                        </select>
                                    </td>
                                </tr>
                                 <tr align='center' height='26'>
                                    <td >
                                        Nơi đến
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="to" style='width:158px;text-align:left' runat="server" 
                                            DataSourceID="SqlDataSource1" DataTextField="target" class='to'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" 
                                            SelectCommand="SELECT distinct target FROM [Admin]"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                 <tr align='center' height='29'>
                                    <td>
                                         <b>
                                            Kết quả
                                         </b>
                                    </td>
                                    <td align='center'>
                                         <input type="text" ID="result" style='width:155px;font-weight:bold;text-align:right;'></input>
                                    </td>
                                </tr>

                            </table>
                            <br/>
                            <input type="button" value="Tính kết quả" onclick='cal();' />
                        </td>
                    </tr>
                </table>
                    
                </div>
            </td>
        </tr>
        
    </table>
</div>

<!-- script content -->
<script type="text/javascript">

    function Hash() {
        this.length = 0;
        this.items = new Array();
        for (var i = 0; i < arguments.length; i += 2) {
            if (typeof (arguments[i + 1]) != 'undefined') {
                this.items[arguments[i]] = arguments[i + 1];
                this.length++;
            }
        }

        this.removeItem = function (in_key) {
            var tmp_value;
            if (typeof (this.items[in_key]) != 'undefined') {
                this.length--;
                var tmp_value = this.items[in_key];
                delete this.items[in_key];
            }

            return tmp_value;
        }

        this.get = function (in_key) {
            return this.items[in_key];
        }

        this.set = function (in_key, in_value) {
            if (typeof (in_value) != 'undefined') {
                if (typeof (this.items[in_key]) == 'undefined') {
                    this.length++;
                }

                this.items[in_key] = in_value;
            }

            return in_value;
        }

        this.hasItem = function (in_key) {
            return typeof (this.items[in_key]) != 'undefined';
        }
    }

    var results = new Hash();
    var store = '<%= get_store() %>';
    var arrays = store.split("#");

    var old = null;
    for (i = 0; i < arrays.length; i++) {
        var array = arrays[i].split("%");
        var item = new Hash();
        item.set('kg', array[1]);
        item.set('m3', array[2]);
        results.set(array[0].toString().trim(), item);
    }

    var m = results;

    $(document).ready(function () {

        $('#square_click').click(function () {
            $("#Square").slideToggle();
            $("#Kg").slideToggle();
            return false;
        });
        $('#kg_click').click(function () {
            $("#Square").slideToggle();
            $("#Kg").slideToggle();
            return false;
        });

    });

    function cal() {
        var myHash = new Hash('one', [1, 10, 5], 'two', [2], 'three', [3, 30, 300]);

        var unit = $('#Select1')[0].value.trim();
        var to = $('.to')[0].value.trim();
        var count = $('#count')[0].value;
        if (count == "") count = 1;

        $('#result')[0].value = CommaFormatted(parseInt(m.get(to).get(unit) * count).toString()) + " VNĐ";

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

</asp:Content>

