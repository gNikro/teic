package main;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;

public class InitClass {

    static Logger log = Logger.getLogger(InitClass.class.getName());
    public static ApplicationContext applicationContext;

    public static void main(String[] argv) throws IOException, InterruptedException
    {



        //dbname [dbname] port [port] name [name] pass [pass] webPort [webPort]

        for(int i = 0; i < argv.length; i++)
        {
            String arg = argv[i];

            if(arg.equals("profile"))
            {
                i++;


                if(argv[i].equals("test"))
                {
                    GlobalSettings.baseName = "monopoly2";
                    GlobalSettings.port = 8882;
                    GlobalSettings.name = "root";
                    GlobalSettings.password = "Nnn09011666";
                    GlobalSettings.webPort = 5556;
                }
            }
            else if(arg.equals("dbname"))
            {
                i++;
                GlobalSettings.baseName = argv[i];
            }
            else if(arg.equals("port"))
            {
                i++;
                GlobalSettings.port = Integer.parseInt(argv[i]);
            }
            else if(arg.equals("name"))
            {
                i++;
                GlobalSettings.name = argv[i];
            }
            else if(arg.equals("pass"))
            {
                i++;
                GlobalSettings.password = argv[i];
            }
            else if(arg.equals("webPort"))
            {
                i++;
                GlobalSettings.webPort = Integer.parseInt(argv[i]);
            }
        }
       // dbname [dbname] port [port] name [name] pass [pass] webPort [webPort]
        log.debug(String.format("init settings dbname=%s port=%s webPort=%s", GlobalSettings.baseName, String.valueOf(GlobalSettings.port), String.valueOf(GlobalSettings.webPort)));

        applicationContext = new ClassPathXmlApplicationContext("config/main.xml");



        File file = new File("err.txt");
        FileOutputStream fos = new FileOutputStream(file);
        PrintStream ps = new PrintStream(fos);
        System.setErr(ps);

        try {
            throw new Exception("Exception goes to err.txt");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
