<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/client.Master" CodeBehind="minersPage.aspx.cs" Inherits="testmain.minersPage" %>
<asp:Content runat="server" ContentPlaceHolderID="clientContent">
    <div class="content">
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Mine</h1>
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
													   <asp:GridView ID="gvpendingtransactions" BorderStyle="None" runat="server" OnPageIndexChanging="gvpendingtransactions_PageIndexChanging" Width="100%" AutoGenerateColumns="False" EmptyDataText="No records has been added." AllowPaging="True" PageSize="20" PagerStyle-HorizontalAlign="Center">
															<Columns>																
																<asp:BoundField DataField="from" HeaderText="Sender Hash"/>
																<asp:BoundField DataField="to" HeaderText="Receiver Hash"/>
																<asp:BoundField DataField="amount" HeaderText="Chips"/>
															</Columns>
														</asp:GridView>
													</div>
												</div>												
											</div>
										</div>
									</div>
								</div>
								<div class="text-right" style="padding:30px 30px 0px 30px;"><h3><asp:LinkButton ID="btnmine" CssClass="btn-lg app-btn-secondary" OnClick="btnmine_Click" runat="server" Text="Mine Transactions"></asp:LinkButton></h3></div>
							</div>
						</div>
					</div><!--//row-->
				</div>
			</div>
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>
