<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePoint.aspx.cs" Inherits="SinhVien.UpdatePoint" %>

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
    <div class="container">
        <h1><asp:Label ID="name"  runat="server" Text="Tên Giảng Viên: "></asp:Label><asp:Label ID="lblName" runat="server"></asp:Label></h1>
        <div class="row">
            <div class="row">
                 <div class="col-sm-4"> 
                  <br />
                  <p style="margin-left:20px">
                      Mã Lớp/Mã Học phần:
                      <asp:DropDownList 
                          ID="dropLop" 
                          runat="server" 
                          Height="20px" 
                          Width="224px" 
                          AutoPostBack="True" 
                          OnSelectedIndexChanged="dropLop_SelectedIndexChanged">

                      </asp:DropDownList></p>
                <br />
            </div>    
            </div>
                                     
             <div class="col-sm-8">  
                 <asp:GridView 
                     ID="GrvStudent" 
                     runat="server" 
                     AllowPaging="True" 
                     CellPadding="4" 
                     AutoGenerateColumns="False"
                     ForeColor="#333333" 
                     BorderColor="Black"  
                     OnPageIndexChanging="GrvStudent_PageIndexChanging"
                     OnRowEditing="GrvStudent_RowEditing"
                     OnRowUpdating="GrvStudent_RowUpdating" 
                     OnRowCancelingEdit="GrvStudent_RowCancelingEdit" 
                     DataKeyNames="idHocPhan"
                     GridLines="None"
                     Height="428px" 
                     Width="1191px" >
                    
                     <Columns>
                        <asp:BoundField HeaderText="Mã Sinh Viên" DataField="MaSV"/>
                        <asp:BoundField HeaderText="Họ Tên" DataField="HoTenSV" ReadOnly="true"/>
                        <asp:BoundField HeaderText="Mã Lớp" DataField="MaLop" ReadOnly="true"/>
                        <asp:BoundField HeaderText="Điểm" DataField="GiaTri" />
                        <asp:CommandField EditText="Cập Nhật Điểm" ShowEditButton="true" UpdateText="Lưu" CancelText="Thoát" ShowCancelButton="true" HeaderText="Thao tác"/>
                     </Columns>

                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" BorderStyle="None" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" VerticalAlign="Middle" Wrap="True" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" Height="5px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
