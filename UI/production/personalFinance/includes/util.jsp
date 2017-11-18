<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Locale" %>
<%!
	public String formatDays(String daycount){
		return daycount + " days" ;
	}
	public String formatPercentage(Double number){
		return addComma(((double)number)) +"%";
	}
	
	
	public String formatINR(double number){
		if(number>1000000){
			return "&#8377;"+  addComma((number)/100000) + "L" ;
		}else{
			return "&#8377;"+  addComma((number)) ;
		}
	}
	public String formatINR(Long number){
		return formatINR((double)number);
	}
	
	private static String addComma(double d) {
	    String s = String.format(Locale.UK, "%1.2f", Math.abs(d));
	    s = s.replaceAll("(.+)(...\\...)", "$1,$2");
	    while (s.matches("\\d{3,},.+")) {
	        s = s.replaceAll("(\\d+)(\\d{2},.+)", "$1,$2");
	    }
	    return d < 0 ? ("-" + s) : s;
	}
%>