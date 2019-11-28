<%@page import="ejb.ListElementRemote"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%!
	private static ListElementRemote elementRemote;

	public void jspInit() {
		try {
			InitialContext context = new InitialContext();
			elementRemote = (ListElementRemote) context.lookup("java:global/2EJBSessionBeanStatefulDemo/ListElements");
		} catch (Exception e) {
			System.out.println(e);
		}
	}
%>

<%
	if (request.getParameter("addNum") != null) {
		int e = Integer.parseInt(request.getParameter("num"));
		elementRemote.addElement(e);
	}

	if (request.getParameter("remNum") != null) {
		int e = Integer.parseInt(request.getParameter("num"));
		elementRemote.removeElement(e);
	}
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Jsp Demo</title>
</head>
<body>
	<h1>Welcome</h1>

	<form name="abc" method="post">
		Enter the Number <input type="text" name="num"><br>
		 	<input type="submit" value="Add" name="addNum"><br> 
			<input type="submit" value="Remove" name="remNum"><br>
		<%
			if (elementRemote != null) {
				List<Integer> nums = elementRemote.getElement();

				for (int i : nums) {
					out.println("<br>" +i+"<br>");
				}
				out.println("Size is:" + nums.size());

			}
		%>
	</form>

</body>
</html>