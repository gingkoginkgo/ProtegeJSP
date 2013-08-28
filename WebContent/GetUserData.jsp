<% String action = request.getParameter("action"); 
	String _target = new String();
 if (action==null)
 {_target = "nothing";}
 else if (action.equals("Buy")) { 
	 _target = "convenience_store";
 } else if (action.equals("Take"))  { 
	 _target = "convenience_store";
 } else if (action.equals("Pay"))  { 
	 _target = "convenience_store";
 } 
  %>
 <%= _target %>