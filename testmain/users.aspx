<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="users.aspx.cs" Inherits="testmain.WebForm1" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    <div class="app-wrapper">
        <asp:GridView CssClass="grid" ID="user_info" runat="server" DataKeyField="id" AutoGenerateColumns="False" style="margin-left: 1px" Width="849px" >
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'> </asp:Label>
                            </ItemTemplate>
				        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lbluname" runat="server" Text='<%# Bind("user_name") %>'> </asp:Label>
                            </ItemTemplate>
				        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Type">
                            <ItemTemplate>
                                <asp:Label ID="lblprice" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                            </ItemTemplate>
				        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </div>
</asp:Content>
