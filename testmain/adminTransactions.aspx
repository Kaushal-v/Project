<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminTransactions.aspx.cs" Inherits="testmain.transacrions" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    <div class="app-wrapper">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
				<div class="row g-4 mb-4">
                <div class="col-12">
				        <div class="app-card app-card-stats-table h-100 shadow-sm">
					        <div class="app-card-header p-3">
								 <div id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
					        <asp:LinkButton runat="server" ID="btnhome" CssClass="nav-link" OnClick="btnhome_Click">
						        <span class="nav-icon">
						       <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-download" viewBox="0 0 16 16">
  <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5z"/>
  <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V1.5a.5.5 0 0 0-1 0v8.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3z"/>
</svg>

						         </span>
					        </asp:LinkButton><!--//nav-link-->	
									 </div>
						        <div class="row justify-content-between align-items-center">
									<div class="row g-4 mb-4">
										<div class="col-12">
											<div class="app-card app-card-stats-table h-100 shadow-sm">
												<div class="app-card-header p-3">
													<h3 class="app-page-title" style="font-size:15px;">Pending Transactions</h3>
													<div class="row justify-content-between align-items-center">
													   <asp:GridView ID="gvpendingtransactions" BorderStyle="None" runat="server" OnPageIndexChanging="gvpendingtransactions_PageIndexChanging" Width="100%" AutoGenerateColumns="False" EmptyDataText="No records has been added." AllowPaging="True" PageSize="5" PagerStyle-HorizontalAlign="Center">
															<Columns>																
																<asp:BoundField DataField="from" HeaderText="Sender Hash"/>
																<asp:BoundField DataField="to" HeaderText="Receiver Hash"/>
																<asp:BoundField DataField="amount" HeaderText="Chips"/>
															</Columns>
														</asp:GridView>
													</div>
												</div>
												<div class="app-card-header p-3">
													<h3 class="app-page-title" style="font-size:15px;">Verified Transactions</h3>
													<div class="row justify-content-between align-items-center" style=" overflow-x:auto;">
														 <asp:GridView ID="gvtransactiondetails" BorderStyle="None" runat="server" OnPageIndexChanging="gvtransactiondetails_PageIndexChanging" Width="100%" AutoGenerateColumns="False" DataKeyNames="block_hash" EmptyDataText="No records has been added." AllowPaging="True" PageSize="10" PagerStyle-HorizontalAlign="Center">
															<Columns>
																<asp:TemplateField HeaderText="Hash">
																	<ItemTemplate>
																		<asp:Label width="248" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("block_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Sender Hash">
																	<ItemTemplate>
																		<asp:Label width="248" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("transaction_sender_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Receiver Hash">
																	<ItemTemplate>
																		<asp:Label width="248" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("transaction_receiver_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Chips">
																	<ItemTemplate>
																		<asp:Label ID="lblblockhash" runat="server" Text='<%# ((double)Eval("transaction_chips")).ToString().Length < 10? Eval("transaction_chips") :(Math.Round((double)Eval("transaction_chips"),2))%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Previous Hash">
																	<ItemTemplate>
																		<asp:Label width="248" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("block_previous_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Time Stamp">
																	<ItemTemplate>
																		<asp:Label width="148" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("block_timestamp")%>'></asp:Label>
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
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
</asp:Content>