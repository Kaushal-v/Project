<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/client.Master" CodeBehind="clientDefault.aspx.cs" Inherits="testmain.clientDefault" %>


<asp:Content runat="server" ContentPlaceHolderID="clientContent">
      <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Home</h1>
                <div class="row gy-4">
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">							  
							        <div class="col-auto">
								        <h4 class="app-card-title">Shares</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <asp:GridView ID="gvshare_info" runat="server" DataKeyField="id" AutoGenerateColumns="False" style="border:none; margin-top:50px; margin-left: auto; margin-right:auto;" Width="100%" PageSize="5">
                                <Columns>
									<asp:BoundField DataField="share_id" HeaderText="#"/>
									<asp:BoundField DataField="share_name" HeaderText="Share Name"/>
									<asp:BoundField DataField="share_price" HeaderText="Price"/>                                   
									<%--<asp:TemplateField HeaderText="Purchesed Count">
                                        <ItemTemplate>
                                            <asp:Label ID="lblchange" runat="server" Text="0"></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>--%>
                                </Columns>
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
						    </div><!--//app-card-body-->
						   
						</div><!--//app-card-->
	                </div><!--//col-->
	                <div class="col-12 col-lg-6">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-shield-check" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z"/>
  <path fill-rule="evenodd" d="M10.854 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 8.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Security</h4>
							        </div><!--//col-->
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Contact No</strong></div>
											<div class="item-data text-left"><asp:Label runat="server" ID="lblconno"></asp:Label></div>
									        <asp:TextBox ReadOnly="true" ID="tbconno" Visible="false" runat="server" CssClass="item-data tb"></asp:TextBox>
									    </div><!--//col-->
									    <div class="col text-right">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto">
										    <div class="item-label text-left"><strong>Password</strong></div>
									        <div class="item-data text-left">••••••••</div>
									    </div><!--//col-->
									    <div class="col text-right">
										    <a class="btn-sm app-btn-secondary" href="#">Change</a>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->
						    </div><!--//app-card-body-->
						</div><!--//app-card-->
					</div>
                </div><!--//row-->
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
    </div><!--//app-wrapper-->
</asp:Content>
