<%@page import = "java.io.*"%>
<%@page import = "edu.stanford.smi.protegex.owl.model.OWLModel"%>
<%@page import = "edu.stanford.smi.protegex.owl.model.OWLNamedClass"%>
<%@page import = "edu.stanford.smi.protegex.owl.ProtegeOWL"%>
<%@page import = "edu.stanford.smi.protegex.owl.jena.JenaOWLModel"%>
<%@page import = "edu.stanford.smi.protegex.owl.swrl.exceptions.SWRLRuleEngineException"%>
<%@page import = "edu.stanford.smi.protege.exception.OntologyLoadException"%>
<%@page import = "edu.stanford.smi.protegex.owl.swrl.SWRLRuleEngine"%>
<%@page import = "edu.stanford.smi.protegex.owl.swrl.SWRLRuleEngineFactory"%>
<%@page import = "edu.stanford.smi.protegex.owl.swrl.SWRLRuleEngine"%>
<%
String act = request.getParameter("action");
if(act == null){
	act = "non";
}
File f = new File("C:/ToDoLost/ToDoList.owl");
try { 
FileInputStream FIS = new FileInputStream(f);
String str="";
byte[] a = new byte[1024];
int l;
for(;;){
	l = FIS.read(a);
	if(l!=-1)
	{
		str+=new String(a,0,l);
	}
	else break;
}
FIS.close();
str=str.replace("zaq12wsx", act);
f= new File("C:/ToDoLost/ToDoListtemp.owl");
if(!f.exists())
	f.createNewFile();
FileWriter FW = new FileWriter(f,false);
FW.write(str);
FW.close();
}catch(IOException e){}
String uri = "file:///C:/ToDoLost/ToDoListtemp.owl";
JenaOWLModel owlModel = ProtegeOWL.createJenaOWLModelFromURI(uri);//Load Ontology 
SWRLRuleEngine ruleEngine = SWRLRuleEngineFactory.create(owlModel);//
ruleEngine.run();//start inferring
ruleEngine.importSWRLRulesAndOWLKnowledge();												   //
ruleEngine.infer();        
String s = ruleEngine.getInferredAxioms().toString();
int i = s.lastIndexOf("#");
s = s.substring(i+1,s.length()-2);
%>
<%= s %>