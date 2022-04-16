
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Lunar
 */
public class Spam_feature {
    
    public static int main(String args) throws MalformedURLException, IOException
    {
        int count=0;
    URL url = new URL(args);
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
    count++;
    }
        }
}
in.close();
urlConnection.disconnect();
        return count;
    }
}
