package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Random;
import weka.classifiers.Evaluation;
import weka.classifiers.trees.RandomForest;
import weka.core.Instances;
import javax.swing.JOptionPane;
import java.io.BufferedReader;
import java.io.FileReader;
import Demo.Features;
import java.io.BufferedWriter;
import java.io.FileWriter;

public final class adminhome_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"[]>\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\" dir=\"ltr\" lang=\"en-US\" xml:lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <!--\n");
      out.write("    Created by Artisteer v3.1.0.48375\n");
      out.write("    Base template (without user's data) checked by http://validator.w3.org : \"This page is valid XHTML 1.0 Transitional\"\n");
      out.write("    -->\n");
      out.write("    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");
      out.write("    <title>Home</title>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\" type=\"text/css\" media=\"screen\" />\n");
      out.write("    <!--[if IE 6]><link rel=\"stylesheet\" href=\"style.ie6.css\" type=\"text/css\" media=\"screen\" /><![endif]-->\n");
      out.write("    <!--[if IE 7]><link rel=\"stylesheet\" href=\"style.ie7.css\" type=\"text/css\" media=\"screen\" /><![endif]-->\n");
      out.write("\n");
      out.write("    <script type=\"text/javascript\" src=\"jquery.js\"></script>\n");
      out.write("    <script type=\"text/javascript\" src=\"script.js\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<div id=\"art-main\">\n");
      out.write("    <div class=\"cleared reset-box\"></div>\n");
      out.write("    <div class=\"art-box art-sheet\">\n");
      out.write("        <div class=\"art-box-body art-sheet-body\">\n");
      out.write("            <div class=\"art-header\">\n");
      out.write("<div class=\"art-bar art-nav\">\n");
      out.write("<div class=\"art-nav-outer\">\n");
      out.write("<div class=\"art-nav-wrapper\">\n");
      out.write("<div class=\"art-nav-inner\">\n");
      out.write("\t<ul class=\"art-hmenu\">\n");
      out.write("\t\t<li>\n");
      out.write("\t\t\t<a href=\"#\" class=\"active\">Home</a>\n");
      out.write("\t\t</li>\t\n");
      out.write("\t\t<li>\n");
      out.write("                    <a href=\"check.jsp\">Check URL HERE..</a></li>\n");
      out.write("\t\t\t\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"cleared reset-box\"></div>\n");
      out.write("<div class=\"art-logo\">\n");
      out.write("                                                 <h1 class=\"art-logo-name\"><a href=\"#\">Detecting Phishing Web page</a></h1>\n");
      out.write("                                                                         <h2 class=\"art-logo-text\"></h2>\n");
      out.write("                                                </div>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            <center>\n");
      out.write("                <script language=\"JavaScript\">\n");
      out.write("            function validation()\n");
      out.write("            {\n");
      out.write("                var a = document.form.userid.value;\n");
      out.write("                var b = document.form.pass.value;\n");
      out.write("                if(a==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"Enter your UserId\");\n");
      out.write("                    document.form.userid.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("                if(b==\"\")\n");
      out.write("                {\n");
      out.write("                    alert(\"Enter your Password\");\n");
      out.write("                    document.form.pass.focus();\n");
      out.write("                    return false;\n");
      out.write("                }\n");
      out.write("\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("             \n");
      out.write("                \n");
      out.write("   \n");
      out.write("            </center>\n");
      out.write("            ");

            try{
                 BufferedReader br = null;
        int numFolds = 10;
        br = new BufferedReader(new FileReader("D:\\PhishingData\\my dataset.arff"));
 
        Instances trainData = new Instances(br);
        trainData.setClassIndex(trainData.numAttributes() - 1);
        br.close();
        RandomForest rf = new RandomForest();
        
        rf.setNumTrees(100);
         
     //   rf.buildClassifier(trainData);
        Evaluation evaluation = new Evaluation(trainData);
        evaluation.crossValidateModel(rf, trainData, numFolds, new Random(1));
        System.out.println(evaluation.toSummaryString("\nResults\n======\n", true));
        System.out.println(evaluation.toClassDetailsString());
        System.out.println("Results For Class -1- ");
        System.out.println("Precision=  " + evaluation.precision(0));
        System.out.println("Recall=  " + evaluation.recall(0));
        System.out.println("F-measure=  " + evaluation.fMeasure(0));
        System.out.println("Results For Class -2- ");
        System.out.println("Precision=  " + evaluation.precision(1));
        System.out.println("Recall=  " + evaluation.recall(1));
        System.out.println("F-measure=  " + evaluation.fMeasure(1));
        /*****************************************************/
        out.println(evaluation.toSummaryString("\nResults\n======\n", true));
        out.println("<br></br>");
        out.println(evaluation.toClassDetailsString());
        
        out.println("Results For Class -1- ");
        out.println("<br></br>");
        
        out.println("Precision=  " + evaluation.precision(0));
        out.println("<br></br>");
        
        out.println("Recall=  " + evaluation.recall(0));
        out.println("<br></br>");
        
        out.println("F-measure=  " + evaluation.fMeasure(0));
        out.println("<br></br>");
        
        out.println("Results For Class -2- ");
        out.println("<br></br>");
        
        out.println("Precision=  " + evaluation.precision(1));
        out.println("<br></br>");
        
        out.println("Recall=  " + evaluation.recall(1));
        out.println("<br></br>");
        
        out.println("F-measure=  " + evaluation.fMeasure(1));
        out.println("<br></br>");
                
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
