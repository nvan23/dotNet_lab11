<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="SinhVien.LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 
  <!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <style type="text/css">
        /* set entire body that is webpage */
        /* set form background colour*/
        form{
	        background: #fff;
        }
        /* set padding and size of th form */
        .form-container{
	        border-radius: 10px;
            border-color:aqua;
	        padding: 30px;
        }
    </style>
</head>
<body>
    <form runat="server">
        <section class="container-fluid">
            <!-- row and justify-content-center class is used to place the form in center -->
            <section class="row justify-content-center">
              <section class="col-12 col-sm-6 col-md-4">
                <div class="form-container">
                    <div class="form-group">
                        <h4 class="text-center font-weight-bold"> Đăng nhập </h4>
                        <label>Tên đăng nhập</label>
                        <asp:TextBox runat="server" ID="txtName" Enabled="true" CssClass="form-control input-sm" placeholder="Tên đăng nhập"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" runat="server" ErrorMessage="Tên đăng nhập không được rỗng"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Mật khẩu</label>
                        <asp:TextBox runat="server" ID="txtpwd" TextMode="Password" Enabled="true" CssClass="form-control input-sm" placeholder="Mật khẩu"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtpwd" runat="server" ErrorMessage="Mật khẩu không được rỗng"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button Text="Đăng nhập" ID="Button2" type="submit" CssClass="btn btn-success btn-block" OnClick="btnlogin_Click" runat="server"></asp:Button>
                </div>
              </section>
            </section>
          </section>
    </form>

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>
