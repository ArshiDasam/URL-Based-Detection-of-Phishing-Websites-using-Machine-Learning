
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.security.NoSuchAlgorithmException;
import javax.imageio.ImageIO;
import java.security.MessageDigest;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Lunar
 */
public class ImageToHash {
  public static void main(String args) throws NoSuchAlgorithmException, Exception {

        File input = new File("F://Screen1.png");
       
        BufferedImage buffImg = ImageIO.read(input);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(buffImg, "png", outputStream);
        byte[] data = outputStream.toByteArray();

       // System.out.println("Start MD5 Digest");
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(data);
        byte[] hash = md.digest();
        System.out.println(returnHex(hash));
    }                                       // Belongs to main class
  
    // Below method of converting Byte Array to hex
    // Can be found at: http://www.rgagnon.com/javadetails/java-0596.html
    static String returnHex(byte[] inBytes) throws Exception {
        String hexString = null;
        for (int i=0; i < inBytes.length; i++) { //for loop ID:1
            hexString +=
            Integer.toString( ( inBytes[i] & 0xff ) + 0x100, 16).substring( 1 );
        }                                   // Belongs to for loop ID:1
    return hexString;
  }                                         // Belongs to returnHex class

}                                           // Belongs to Main class