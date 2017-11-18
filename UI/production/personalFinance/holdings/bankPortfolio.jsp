<%@include file="../includes/util.jsp"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%
	int colLength = 9;
	JSONObject portfolio_bank = new JSONObject();
	portfolio_bank = (JSONObject) request.getAttribute("portfolio_bank");
%>
<p class="text-muted font-13 m-b-30">
<h2>
	Total amount:
	<%=formatINR((Long) portfolio_bank.get("total"))%>
	(xx% of Portfolio)
</h2>

</p>


<table id="datatable-responsive"
	class="table table-striped table-bordered dt-responsive nowrap"
	cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Maturity Amount</th>
			<th>Inv. Ammount</th>
			<th>Interest Rate</th>
			<th>Duration</th>
			<th>Start Date</th>
			<th>End Date</th>
			<th>Acc. No</th>
			<th>Bank</th>
		</tr>
	</thead>
	<tbody>
		<%
			JSONArray portfolio = (JSONArray) portfolio_bank.get("portfolio");

			for (int i = 0; i < portfolio.size(); i++) {
				JSONObject account = (JSONObject) portfolio.get(i);
		%>
		<tr>
			<td><%=formatINR((long) account.get("maturity_amount"))%></td>
			<td><%=formatINR((long) account.get("amount"))%></td>
			<td><%=formatPercentage((Double) account.get("interest_rate"))%></td>
			<td><%=formatDays(Long.toString((long) account.get("durationDays")))%></td>
			<td><%=account.get("start_date")%></td>
			<td><%=account.get("end_date")%></td>
			<td><%=account.get("account_number")%></td>
			<td><%=account.get("bank_name")%></td>
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
<div id="addNewBankInv" style="display: none">
	<form class="form-horizontal form-label-left" novalidate>

		<span class="section">New Bank Account</span>

		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankName">Bank Name <span class="required">*</span>
			</label>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<select id="bankName" name="bankName"
					class="form-control col-md-7 col-xs-12" col-md-7 col-xs-12>
					<option>HDFC</option>
					<option>Indian Bank</option>
				</select>
			</div>
		</div>


		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankType">Type <span class="required">*</span>
			</label>

			<div class="col-md-6 col-sm-6 col-xs-12">
				<select id="bankType" name="bankType"
					class="form-control col-md-7 col-xs-12" col-md-7 col-xs-12>
					<option>Fixed Deposit</option>
					<option>Recurring Deposit</option>
				</select>
			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankAccNo">Account number<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" id="bankAccNo" name="bankAccNo"
					required="required" class="form-control col-md-7 col-xs-12">
			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankIntrest">Interest Rate<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" id="bankIntrest" name="bankIntrest"
					required="required" data-validate-minmax="0,14"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankInvAmt">Investment Amount (&#8377;)<span
				class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" id="bankInvAmt" name="bankInvAmt"
					required="required" data-validate-minmax="0,100000000"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankStartDate">Start Date<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="bankStartDate" name="bankStartDate"
					class="date-picker form-control col-md-7 col-xs-12"
					required="required" type="text">

			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankEndDate">End Date<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input id="bankEndDate" name="bankEndDate"
					class="date-picker form-control col-md-7 col-xs-12"
					required="required" type="text">

			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankDuration">Duration<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<label class="col-md-7 col-xs-12"><span class="bankDuration"
					style="font-size: 20px">0</span> &nbsp;days</label> <input type="hidden"
					id="bankDuration" class="bankDuration" name="bankDuration"
					required="required" data-validate-minmax="1,100000000"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>
		<div class="item form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12"
				for="bankMatAmt">Maturity amount<span class="required">*</span>
			</label>
			<div class="col-md-4 col-sm-4 col-xs-8">
				<input type="number" id="bankMatAmt" name="bankMatAmt"
					required="required" data-validate-minmax="0,100000000"
					class="form-control col-md-7 col-xs-12">
			</div>
			<div class="col-md-2 col-sm-2 col-xs-12">
				<button type="button" class="btn btn-primary" disabled>Calculate</button>
			</div>
		</div>
		<div class="ln_solid"></div>
		<div class="form-group">
			<div class="col-md-6 col-md-offset-3">
				<button type="submit" class="btn btn-primary">Cancel</button>
				<button id="send" type="submit" class="btn btn-success">Submit</button>
			</div>
		</div>
	</form>
</div>
