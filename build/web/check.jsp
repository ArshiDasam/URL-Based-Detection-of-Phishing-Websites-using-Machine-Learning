<%@page import="DEMO.*"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="Demo.Features"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
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
    <title>Detecting URLs</title>



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
			<a href="#" >ML Algorithm Results</a>
		</li>	
		<li>
                    <a href="check.jsp" class="active">Detect URL Here..</a>
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
                                                 <h1 class="art-logo-name"><a href="#">Detecting Phishing Websites</a></h1>
                                                                         <h2 class="art-logo-text"></h2>
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
          <div style="position:absolute; right:30px; top:230px;">
                <fieldset>

                   <legend><font color="#FF8000"><strong><font size="4">Search Here</font></strong></font></legend>
                    <table height="160">
                        <form action="#" method="post" name="form" onsubmit="return validation();">
                            <input type="text" name="urlname" value="">  </input>
                                <input type="submit" name="submit" value="Search"></input>
                      </form>
                    </table>
                </fieldset>
                <br><br><br>
           </div>
                
                
   
            </center>
            <%
                                String name=request.getParameter("urlname");

            try{
                //JOptionPane.showMessageDialog(null, "hello");
                int cntt=0;
                name=request.getParameter("urlname");
                //JOptionPane.showMessageDialog(null, "hello"+name);
                FileWriter fw=new FileWriter("D:\\PhishingData\\cst.txt");
                BufferedWriter bw=new BufferedWriter(fw);
                bw.write(name);
                bw.close();
                fw.close();
                Features ob=new Features();
                ob.main("D:\\PhishingData\\cst.txt");
                /******************************/
                FileReader fr1=new FileReader("D:\\PhishingData\\output.arff");
                BufferedReader br1=new BufferedReader(fr1);
                // String data=br.readLine();
                String data1=br1.readLine();
                int count1=0;
                while(data1!=null)
                {
                //JOptionPane.showMessageDialog(null, "hello"+name);
                if(data1.contains("@"))
                data1=br1.readLine();
                 //bw.write(data1+"\n");
                if(data1.contains("-1"))
                {
                   // out.println("<h1>Phishing WebSite</h1>");
                    //JOptionPane.showMessageDialog(null,"Phishing WebSite");
                    count1=0;
                    
                }
                else if(data1.contains("1"))
                {
                     //out.println("<h1>Non Phishing WebSite</h1>");
                     //JOptionPane.showMessageDialog(null,"Non Phishing WebSite");
                    count1=1;
                }
         //   }
           data1=br1.readLine();
        }
                System.out.println("Count1::"+count1);
                if(count1>0)
                {
                    out.println("<h1>Non Phishing WebSite</h1>");
                   // int spamcnt=new Spam_feature().main(name);
                   %>
                   <a href="<%=name%>">Click Here</a>
                   <%
                    
                }
                else
                {
                    out.println("<h1>Phishing WebSite</h1>");
                }
                /*************SPAM DETECTION***************/
                int spmcount=0;
                URL url = new URL(name);
HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
urlConnection.setRequestMethod("GET");
urlConnection.connect();
InputStream in = urlConnection.getInputStream();
byte[] data = new byte[8192];
int length;

while ((length = in.read(data)) != -1) {
    System.out.print(new String(data, 0, length));
    String[] d=new String(data, 0, length).split("htttp://");
    for(int i=0;i<d.length;i++)
    {
    if(d[i].contains("year")||d[i].contains("event | product name")||d[i].contains("adult")||d[i].contains("porn")||d[i].contains("cheap")||d[i].contains("free")||d[i].contains("offer"))
    {
    spmcount++;
    cntt++;
    }
        }
}
in.close();
urlConnection.disconnect();
             if(spmcount>0)
                 out.println("<h1>SPAM WebSite</h1>");
             else
                 out.println("<h1>Non SPAM WebSite</h1>");
             /****************MALWARE DETECTION********************/
             FileReader frr=new FileReader("D://malware_data.txt");
             BufferedReader brr=new BufferedReader(frr);
             String mdata=brr.readLine();
             int malcnt=0;
             while(mdata!=null)
             {
             if(mdata.equalsIgnoreCase(name)){
                 malcnt++;
                 cntt++;
             }
             mdata=brr.readLine();
             }
             if(malcnt>0)
                 out.println("<h1>MaleWare WebSite</h1>");
             else
                 out.println("<h1>Non MalWare WebSite</h1>");
                 /******Malicious***************************/
               if(malcnt>0||spmcount>0||count1>0)

               out.println("<h1>Malicous WebSite</h1>");
             else
                 out.println("<h1>Non Malicious WebSite</h1>");
               
             /************************/
             
            }
            
            catch(Exception e)
            {
                e.printStackTrace();
            }

            %>

</body>
</html>
