<%@include file="../includes/util.jsp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%
	int colLength = 7;
	JSONObject portfolio_stock = new JSONObject();
	portfolio_stock = (JSONObject) request.getAttribute("portfolio_stock");
%>
<p class="text-muted font-13 m-b-30">
<h2>
	Total amount:
	<%=formatINR((double) portfolio_stock.get("totalInv"))%>
	(xx% of Portfolio)
</h2>

</p>


<table id="stockTable"
	class="table table-striped table-bordered dt-responsive nowrap"
	cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Symbol</th>
			<th>Quantity</th>
			<th>Buy Avg</th>
			<th>LTP</th>
			<th>Present Value</th>
			<th>P&L</th>
			<th>Net Change</th>
		</tr>
	</thead>
	<tbody>
		<%
			JSONArray portfolio = (JSONArray) portfolio_stock.get("portfolio");

			for (int i = 0; i < portfolio.size(); i++) {
				JSONObject account = (JSONObject) portfolio.get(i);
		%>
		<tr>
			<td><%=account.get("Symbol")%></td>
			<td><%=account.get("Quantity")%></td>
			<td><%=formatINR((double) account.get("BuyAvg"))%></td>
			<td><%=formatINR((double) account.get("PreviousClossingPrice"))%></td>
			<td><%=formatINR((double)account.get("PresentValue"))%></td>
			<td><%=formatINR((double)account.get("Profit"))%></td>
			<td><%=formatPercentage((double)account.get("ProfitPercentage"))%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>
<div class="ln_solid"></div>
<div style="text-align: center" id="addNewBankInvButton">
	<button type="button" class="btn btn-primary btn-sm"
		onClick="addNewBankInv()">&nbsp;+ Add</button>
</div>
