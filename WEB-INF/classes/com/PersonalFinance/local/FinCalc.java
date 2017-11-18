package com.PersonalFinance.local;

import java.time.Duration;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public interface FinCalc {
	public static class AccountStatement{
		public double principle;
		public Date start_date;
		public Date end_date;
		public double profitPrecentage_Current;
		public double amount_current;
		public double CAGR;
		
		public AccountStatement(double principle, Date start_date, double CAGR){
			// In case of Bank Deposit CAGR is known earlier 
			this.principle = principle;
			this.start_date = start_date;
			this.end_date = new Date();
			this.CAGR=CAGR;
			this.amount_current = quaterlyCoumpoundedInterest(this.principle,this.start_date,this.end_date,this.CAGR);
		}

		private double quaterlyCoumpoundedInterest(double amount_in2, Date start_date2, Date end_date2, double cagr2) {
			//Duration duration = Duration.between(start_date2 , end_date2 );
			return 0;
		}
		private double coumpoundedInterest(double principle, double amount_current, Date start_date){
			return coumpoundedInterest(principle, amount_current, start_date,  new Date());
		}
		private double coumpoundedInterest(double principle, double amount_current, Date start_date, Date end_date){
			long diff = end_date.getTime() - start_date.getTime();
		    long noOfDays =  TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
		    profitPrecentage_Current = (amount_current - principle)*100/principle;
		    CAGR = profitPrecentage_Current*365/noOfDays;
			return CAGR;
		}
	}
	
}
