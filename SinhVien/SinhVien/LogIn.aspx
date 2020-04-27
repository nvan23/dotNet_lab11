<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="SinhVien.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
        <div class="col-md-6 col-md-offset-3" style="border-color:brown;background-color: darkslategray;height:300px">
            <h1 style="text-align:center;color:white"> Đăng Nhập</h1>
            <div>
                <table style="margin-left:200px;">
                    <tr>
                        <td class="auto-style1"> <asp:Label ID="name" runat="server" Text="Tên Đăng nhập:" BackColor="White"></asp:Label></td>
                        <td class="auto-style1" ><asp:TextBox ID="txtName" runat="server" Width="230px" style="margin-left:20px" ForeColor="Black"></asp:TextBox></td>    
                    </tr>
                    <tr>
                        <td> <asp:Label ID="lblpwd" runat="server" Text="Mật Khẩu:" BackColor="White"></asp:Label></td>
                        <td><asp:TextBox ID="txtpwd" runat="server" TextMode="Password" Width="230px" style="margin-left:20px" ForeColor="Black" ></asp:TextBox></td>    
                    </tr>
                </table>
                <br />
                <p style="text-align:center"><asp:Button ID="btnlogin" runat="server" Text="Đăng Nhập" OnClick="btnlogin_Click"/></p>
            </div>
        </div>
    
    </div>
    </form>
</body>
</html>
