<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin.Master" CodeBehind="adminTransactions.aspx.cs" Inherits="testmain.transacrions" %>

<asp:Content runat="server" ContentPlaceHolderID="adminContent">
    <div class="app-wrapper">
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
													<h3 class="app-page-title" style="font-size:15px;">Pending Transactions</h3>
													<div class="row justify-content-between align-items-center">
													   <asp:GridView ID="gvpendingtransactions" BorderStyle="None" runat="server" OnPageIndexChanging="gvtransactiondetails_PageIndexChanging" Width="100%" AutoGenerateColumns="False" EmptyDataText="No records has been added." AllowPaging="True" PageSize="5" PagerStyle-HorizontalAlign="Center">
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
													<div class="row justify-content-between align-items-center">
														 <asp:GridView ID="gvtransactiondetails" BorderStyle="None" runat="server" OnPageIndexChanging="gvtransactiondetails_PageIndexChanging" Width="100%" AutoGenerateColumns="False" DataKeyNames="block_hash" EmptyDataText="No records has been added." AllowPaging="True" PageSize="5" PagerStyle-HorizontalAlign="Center">
															<Columns>
																<asp:BoundField DataField="block_hash" HeaderText="Hash"/>
																<asp:BoundField DataField="transaction_sender_hash" HeaderText="Sender Hash"/>
																<asp:BoundField DataField="transaction_receiver_hash" HeaderText="Receiver Hash"/>
																<asp:BoundField DataField="transaction_chips" HeaderText="Chips"/>
																<asp:BoundField DataField="block_previous_hash" HeaderText="Previous Hash"/>
																<asp:BoundField DataField="block_timestamp" HeaderText="Time Stamp"/>
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
    </div><!--//app-wrapper-->
</asp:Content>