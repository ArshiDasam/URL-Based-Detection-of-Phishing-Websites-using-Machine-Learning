<%@page import="java.util.Random"%>
<%@page import="weka.classifiers.Evaluation"%>
<%@page import="weka.classifiers.trees.RandomForest"%>
<%@page import="weka.core.Instances"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="Demo.Features"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.FileWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"[]>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
    <!--
    Created by Artisteer v3.1.0.48375
    Base template (without user's data) checked by http://validator.w3.org : "This page is valid XHTML 1.0 Transitional"
    -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title> ML Algorithm Results</title>



    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" href="style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" href="style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <script type="text/javascript" src="jquery.js"></script>
    <script type="text/javascript" src="script.js"></script>

</head>
<body>
<div id="art-main">
    <div class="cleared reset-box"></div>
    <div class="art-box art-sheet">
        <div class="art-box-body art-sheet-body">
            <div class="art-header">
<div class="art-bar art-nav">
<div class="art-nav-outer">
<div class="art-nav-wrapper">
<div class="art-nav-inner">
	<ul class="art-hmenu">
                <li>
			<a href="home.jsp" >Home</a>
		</li>	
		<li>
			<a href="#" class="active">ML Algorithm Results</a>
		</li>	
		<li>
                    <a href="check.jsp">Detect URL Here..</a>
                </li>
                 <li>
                    <a href="index.html" id="a">LogOut</a>
                </li>
			
</div>
</div>
</div>
</div>
<div class="cleared reset-box"></div>
<div class="art-logo">
                                                 <h1 class="art-logo-name"><a href="#">Random Forest Classifier on the Dataset</a></h1>
                                                                         <h2 class="art-logo-text" ></h2>
                                                </div>
                
            </div>
            <center>
                <script language="JavaScript">
            function validation()
            {
                var a = document.form.userid.value;
                var b = document.form.pass.value;
                if(a=="")
                {
                    alert("Enter your UserId");
                    document.form.userid.focus();
                    return false;
                }
                if(b=="")
                {
                    alert("Enter your Password");
                    document.form.pass.focus();
                    return false;
                }
            }
        </script>
             
                
   
            </center>
            <%
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
            %>

</body>
</html>
