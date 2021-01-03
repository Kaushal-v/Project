<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="home.aspx.cs" Inherits="testmain.home" %>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="main">
    <div>
        <div style="padding-top:70px;">
            <lable style="font-size:50px;margin-top:100px;font-weight:bold">Buy and Sell Shares Online</lable><br /><br />
            <label>ShareLog is the easiest place to buy, sell, and manage your shares portfolio.</label>
        </div>
        <div class="lbl-get-started">
            <br />
            <br />
            <br />
            <label style="font-size:30px;">Hurry!! Sign up Now and get 10 Chips Free... <asp:LinkButton runat="server" OnClick="btnsignup_Click" ID="btnsignup">Get Started</asp:LinkButton></label>
        </div>
        <div>
            <div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
							   <asp:GridView ID="share_info" runat="server" DataKeyField="id" AutoGenerateColumns="False" style="border:none; margin-top:50px; margin-left: auto; margin-right:auto;" Width="70%">
                                <Columns>
                                    <asp:TemplateField HeaderText="#" ControlStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblid" runat="server" Text='<%# Bind("share_id") %>'> </asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Name" ControlStyle-Width="40%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblname" runat="server" Text='<%# Bind("share_name") %>'> </asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Price" ControlStyle-Width="25%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblprice" runat="server" Text='<%# Bind("share_price") %>'></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Trade" ControlStyle-Width="25%">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnbuy" runat="server" Text="Buy"></asp:LinkButton>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
		                </div><!--//row-->
			        </div><!--//app-card-header-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
