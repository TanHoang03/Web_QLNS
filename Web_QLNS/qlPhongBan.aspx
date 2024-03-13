<%@ Page Title="" Language="C#" MasterPageFile="~/ql.Master" AutoEventWireup="true" CodeBehind="qlPhongBan.aspx.cs" Inherits="Web_QLNS.qlPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="noiDung" runat="server">
    <h2 class="text-center">DANH SÁCH PHÒNG BAN</h2>
    <asp:SqlDataSource ID="dsPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
    <asp:DropDownList CssClass="row m-auto w-25" ID="ddlPhongBan" runat="server" DataSourceID="dsPhongBan" DataTextField="TenPhong" AutoPostBack="true" DataValueField="MaPhong"></asp:DropDownList>
    <asp:SqlDataSource ID="dsNhanVienPhongBan" runat="server" ConnectionString="<%$ ConnectionStrings:QLNhanVienConnectionString %>" SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlPhongBan" Name="MaPhong" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br>
    <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover " DataKeyNames="MaNV" DataSourceID="dsNhanVienPhongBan" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã Nhân viên" InsertVisible="False" ReadOnly="True"/>
            <asp:BoundField DataField="HoNV" HeaderText="Họ nhân viên"/>
            <asp:BoundField DataField="TenNV" HeaderText="Tên nhân viên"/>
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái"/>
            <asp:BoundField DataField="NgaySinh" HeaderText="Ngày sin"/>
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh"/>
            <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng"/>
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" ButtonType="Button"/>
        </Columns>
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FFF1D4" />
        <SortedAscendingHeaderStyle BackColor="#B95C30" />
        <SortedDescendingCellStyle BackColor="#F1E5CE" />
        <SortedDescendingHeaderStyle BackColor="#93451F" />
    </asp:GridView>
</asp:Content>
