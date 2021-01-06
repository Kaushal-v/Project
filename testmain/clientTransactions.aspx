<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/client.Master" CodeBehind="clientTransactions.aspx.cs" Inherits="testmain.clientTransactions" %>

<asp:Content runat="server" ContentPlaceHolderID="clientContent">
    <div class="content">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Transactions</h1>
				<div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										<div class="col-12">
											<div class="app-card app-card-stats-table h-100 shadow-sm">
												<div class="app-card-header p-3">
													<div class="row justify-content-between align-items-center">
													   <asp:GridView ID="gvtransactiondetails" BorderStyle="None" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="block_hash" EmptyDataText="No records has been added.">
															<Columns>
																<asp:TemplateField HeaderText="Hash">
																	 <ItemTemplate>
																		<asp:Label ID="lblid" runat="server" Text='<%# Bind("block_hash") %>'> </asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>

																<asp:TemplateField HeaderText="Sender">
																	<ItemTemplate>
																		<asp:Label ID="lblname" runat="server" Text='<%# Bind("transaction_sender_hash") %>'> </asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>

																<asp:TemplateField HeaderText="Receiver">
																	<ItemTemplate>
																		<asp:Label ID="lblprice" runat="server" Text='<%# Bind("transaction_receiver_hash") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Chips">
																	<ItemTemplate>
																		<asp:Label ID="Label1" runat="server" Text='<%# Bind("transaction_chips") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Previous Hash">
																	<ItemTemplate>
																		<asp:Label ID="lblavailc" runat="server" Text='<%# Bind("block_previous_hash") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Time">
																   <ItemTemplate>
																		<asp:Label ID="lblsoldc" runat="server" Text='<%# Bind("block_timestamp") %>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>
														</asp:GridView>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>