<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="home.aspx.cs" Inherits="testmain.home" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div class="content">
        <div>
            <lable class="main_lable">Buy and Sell Shares Online</lable><br /><br />
            <label class="second_lable">ShareLog is the easiest place to buy, sell, and manage your shares portfolio.</label>
        </div>
        <div class="lbl-get-started">
            <label>
            <br />
            <br />
            <br />
            <br />
            Hurry!! Sign up Now and get 10 Chips Free... <asp:LinkButton runat="server" OnClick="btnsignup_Click" ID="btnsignup">Get Started</asp:LinkButton></label>
        </div>
        <div>
            <asp:GridView CssClass="Grid" ID="share_info" runat="server" DataKeyField="id" AutoGenerateColumns="False" style="margin-left: 1px" Width="849px" >
                <Columns>
                    <asp:TemplateField HeaderText="#">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'> </asp:Label>
                        </ItemTemplate>
				    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("name") %>'> </asp:Label>
                        </ItemTemplate>
				    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                        </ItemTemplate>
				    </asp:TemplateField>
                
                    <asp:TemplateField HeaderText="Change">
                        <ItemTemplate>
                            <asp:Label ID="lblchange" runat="server" Text='<%# Bind("last_price") %>'></asp:Label>
                        </ItemTemplate>
				    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
