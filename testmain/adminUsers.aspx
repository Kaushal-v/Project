<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminUsers.aspx.cs" Inherits="testmain.adminUsers" MasterPageFile="~/admin.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">    
				 <h1 class="app-page-title">Users</h1>			    		
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">							
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										<h1 class="app-page-title"><asp:Label runat="server" ID="lblmain"></asp:Label></h1>
										 <asp:GridView ID="gvuser_info" runat="server" DataKeyField="user_id" AutoGenerateColumns="False" style="border:none; margin-top:50px; margin-left: auto; margin-right:auto;" Width="70%" PageSize="5">
											<Columns>
												<asp:BoundField DataField="user_id" HeaderText="User ID"/>																						                                   
												<asp:TemplateField HeaderText="User Name">
													<ItemTemplate>
														<asp:LinkButton ID="btnu_name" href='<%# "adminUserProfile.aspx?u_id=" + Eval("user_id") %>' runat="server" Text='<%# Bind("user_name") %>'></asp:LinkButton>
													</ItemTemplate>
												</asp:TemplateField>
												<asp:BoundField DataField="user_display_name" HeaderText="Name"/>
												<asp:BoundField DataField="user_mail_address" HeaderText="User Email"/>												
											</Columns>
											<AlternatingRowStyle BackColor="White" />
										</asp:GridView>
									</div>
								</div>
							</div>
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
</asp:Content>