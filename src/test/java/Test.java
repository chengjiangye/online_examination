import org.jasypt.util.password.StrongPasswordEncryptor;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator
 * 2016/8/25.
 */
public class Test {
    public static void main(String[] args) {
//        StrongPasswordEncryptor strongPasswordEncryptor = new StrongPasswordEncryptor();
//        System.out.println(strongPasswordEncryptor.encryptPassword("123"));
//
//        String s = "2147483648";
//        System.out.println(Integer.toUnsignedString(Integer.parseUnsignedInt(s)));

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        System.out.println(simpleDateFormat.format(new Date()));
    }
}
