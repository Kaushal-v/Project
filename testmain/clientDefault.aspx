<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/client.Master" CodeBehind="clientDefault.aspx.cs" Inherits="testmain.clientDefault" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content runat="server" ContentPlaceHolderID="clientContent">
	<asp:Literal id="lit1" Visible="false" runat="server" />
	<asp:Literal id="lit2" Visible="false" runat="server" />
<script>
    var thisweekdatajson = JSON.parse('<%=lit1.Text%>')
	var lastweekdatajson = JSON.parse('<%=lit2.Text%>')
    var thisweekdata = parseInt(thisweekdatajson[0]);
    console.log(thisweekdata)
    window.chartColors = {
        green: '#75c181',
        gray: '#a9b5c9',
        text: '#252930',
        border: '#e7e9ed'
    };

    /* Random number generator for demo purpose */
    var randomDataPoint = function () { return Math.round(Math.random() * 100) };
    //Chart.js Line Chart Example 
    var lineChartConfig = {
        type: 'line',

        data: {
            labels: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6', 'Day 7'],

            datasets: [{
                label: 'Current week',
                fill: false,
                backgroundColor: window.chartColors.green,
                borderColor: window.chartColors.green,
                data: [
                    thisweekdatajson[0],
                    thisweekdatajson[1],
                    thisweekdatajson[2],
                    thisweekdatajson[3],
                    thisweekdatajson[4],
                    thisweekdatajson[5],
                    thisweekdatajson[6]
                ],
            }, {
                label: 'Previous week',
                borderDash: [3, 5],
                backgroundColor: window.chartColors.gray,
                borderColor: window.chartColors.gray,

                data: [
                    lastweekdatajson[0],
                    lastweekdatajson[1],
                    lastweekdatajson[2],
                    lastweekdatajson[3],
                    lastweekdatajson[4],
                    lastweekdatajson[5],
                    lastweekdatajson[6]
                ],
                fill: false,
            }]
        },
        options: {
            responsive: true,
            aspectRatio: 1.5,

            legend: {
                display: true,
                position: 'bottom',
                align: 'end',
            },
            tooltips: {
                mode: 'index',
                intersect: false,
                titleMarginBottom: 10,
                bodySpacing: 10,
                xPadding: 16,
                yPadding: 16,
                borderColor: window.chartColors.border,
                borderWidth: 1,
                backgroundColor: '#fff',
                bodyFontColor: window.chartColors.text,
                titleFontColor: window.chartColors.text,

                callbacks: {
                    //Ref: https://stackoverflow.com/questions/38800226/chart-js-add-commas-to-tooltip-and-y-axis
                    label: function (tooltipItem, data) {
                        if (parseInt(tooltipItem.value) >= 100) {
                            return tooltipItem.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + 'C';
                        } else {
                            return tooltipItem.value + 'C';
                        }
                    }
                },

            },
            hover: {
                mode: 'nearest',
                intersect: true
            },
            scales: {
                xAxes: [{
                    display: true,
                    gridLines: {
                        drawBorder: false,
                        color: window.chartColors.border,
                    },
                    scaleLabel: {
                        display: false,

                    }
                }],
                yAxes: [{
                    display: true,
                    gridLines: {
                        drawBorder: false,
                        color: window.chartColors.border,
                    },
                    scaleLabel: {
                        display: false,
                    },
                    ticks: {
                        beginAtZero: true,
                        userCallback: function (value, index, values) {
                            return value.toLocaleString() + 'C';   //Ref: https://stackoverflow.com/questions/38800226/chart-js-add-commas-to-tooltip-and-y-axis
                        }
                    },
                }]
            }
        }
    };

    // Generate charts on load
    window.addEventListener('load', function () {

        var lineChart = document.getElementById('canvas-linechart').getContext('2d');
        window.myLine = new Chart(lineChart, lineChartConfig);


    });	
</script>
      <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			    
			    <h1 class="app-page-title">Home</h1>
                <div class="row gy-4 mb-4">
					<div class="col-12 col-lg-6">
				        <div class="app-card app-card-chart h-100 shadow-sm">
					        <div class="app-card-header p-3">
						        <div class="row justify-content-between align-items-center">
							        <div class="col-auto">
						                <h4 class="app-card-title">Sales Chart</h4>
							        </div><!--//col-->							        
						        </div><!--//row-->
					        </div><!--//app-card-header-->
					        <div class="app-card-body p-3 p-lg-4">							   
						        <div class="chart-container">
				                    <canvas id="canvas-linechart"></canvas>
						        </div>
					        </div><!--//app-card-body-->
				        </div><!--//app-card-->
			        </div><!--//col-->
	                <div class="col-12 col-lg-6">

		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
									<div class="col-auto">
								        <div class="app-icon-holder">
										     <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-folder" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path d="M9.828 4a3 3 0 0 1-2.12-.879l-.83-.828A1 1 0 0 0 6.173 2H2.5a1 1 0 0 0-1 .981L1.546 4h-1L.5 3a2 2 0 0 1 2-2h3.672a2 2 0 0 1 1.414.586l.828.828A2 2 0 0 0 9.828 3v1z"></path>
  <path fill-rule="evenodd" d="M13.81 4H2.19a1 1 0 0 0-.996 1.09l.637 7a1 1 0 0 0 .995.91h10.348a1 1 0 0 0 .995-.91l.637-7A1 1 0 0 0 13.81 4zM2.19 3A2 2 0 0 0 .198 5.181l.637 7A2 2 0 0 0 2.826 14h10.348a2 2 0 0 0 1.991-1.819l.637-7A2 2 0 0 0 13.81 3H2.19z"></path>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Shares</h4>
							        </div><!--//col-->									
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <asp:GridView ID="gvshare_info" CssClass="table app-table-hover mb-auto text-center" runat="server" DataKeyField="id" AutoGenerateColumns="False" style="border:none;" Width="100%" PageSize="5">
                                <Columns>
									<asp:BoundField DataField="share_name" HeaderText="Share Name"/>
									<asp:TemplateField HeaderText="Price">
                                        <ItemTemplate>
                                            <asp:Label ID="share_price" runat="server" Text='<%#  Math.Round(Convert.ToDouble(Eval("share_price")),3) %>'></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
									<asp:TemplateField HeaderText="Purchesed Count">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusercount" runat="server" Text='<%#  Eval("user_share") %>'></asp:Label>
                                        </ItemTemplate>
				                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
						    </div><!--//app-card-body-->
						   
						</div><!--//app-card-->
	                </div><!--//col-->						
					 <div class="col-12 col-lg-6">
		                <%--<div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">--%>
						   
						   
<%--						</div><!--//app-card-->--%>
	                </div><!--//col-->
                </div><!--//row-->
				<div class="row mb-4 gy-4">
	                <div class="col-12 col-lg-12">
		                <div class="app-card app-card-account shadow-sm d-flex flex-column align-items-start">
						    <div class="app-card-header p-3 border-bottom-0">
						        <div class="row align-items-center gx-3">
							        <div class="col-auto">
								        <div class="app-icon-holder">
										    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-card-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M14.5 3h-13a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h13a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 0-.5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"></path>
  <path fill-rule="evenodd" d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5z"></path>
  <circle cx="3.5" cy="5.5" r=".5"></circle>
  <circle cx="3.5" cy="8" r=".5"></circle>
  <circle cx="3.5" cy="10.5" r=".5"></circle>
</svg>
									    </div><!--//icon-holder-->
						                
							        </div><!--//col-->
							        <div class="col-auto">
								        <h4 class="app-card-title">Your Transactions</h4>
							        </div><!--//col-->									
						        </div><!--//row-->
						    </div><!--//app-card-header-->
						    <div class="app-card-body px-4 w-100">
							    <div class="item border-bottom py-3">
								    <div class="row justify-content-between align-items-center">
									    <div class="col-auto" style="overflow-x:auto;">
										     <asp:GridView ID="gvtransactiondetails" CssClass="table app-table-hover mb-0 text-left" OnRowDataBound="gvtransactiondetails_RowDataBound" BorderStyle="None" runat="server" OnPageIndexChanging="gvtransactiondetails_PageIndexChanging" Width="100%" AutoGenerateColumns="False" DataKeyNames="block_hash" EmptyDataText="No records has been added." AllowPaging="True" PageSize="5" PagerStyle-HorizontalAlign="Center">
															<Columns>
																<asp:TemplateField HeaderText="Hash">
																	<ItemTemplate>
																		<asp:Label CssClass="cell" width="228" Style="word-wrap: normal; word-break: break-all;" ID="lblblockhash" runat="server" Text='<%#  Bind("block_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Sender Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label1" runat="server" Text='<%#  Bind("transaction_sender_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Receiver Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label2" runat="server" Text='<%#  Bind("transaction_receiver_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>																
																<asp:TemplateField HeaderText="Previous Hash">
																	<ItemTemplate>
																		<asp:Label width="228" Style="word-wrap: normal; word-break: break-all;" ID="Label3" runat="server" Text='<%#  Bind("block_previous_hash")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Time Stamp">
																	<ItemTemplate>
																		<asp:Label width="128" Style="word-wrap: normal; word-break: break-all;" ID="Label4" runat="server" Text='<%#  Bind("block_timestamp")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Status">
																	<ItemTemplate>
																		<asp:Label Style="word-wrap: normal; word-break: break-all;" ID="Label5" runat="server" Text='<%#  Bind("status")%>'></asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
																<asp:TemplateField HeaderText="Chips">
																	<ItemTemplate>
																		<asp:Label runat="server" ID="Label5" Text='<%# Math.Round(Convert.ToDouble(Eval("transaction_chips")),3)%>'> </asp:Label>
																	</ItemTemplate>
																</asp:TemplateField>
															</Columns>

<PagerStyle HorizontalAlign="Center"></PagerStyle>
														</asp:GridView>
									    </div><!--//col-->
								    </div><!--//row-->
							    </div><!--//item-->		
							</div>
						</div><!--//app-card-->
	                </div><!--//col-->					
				</div>
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->
</asp:Content>
