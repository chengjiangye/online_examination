package demo.util;

import freemarker.template.Template;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.servlet.view.freemarker.FreeMarkerConfig;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created at 221
 * 16-8-24 下午12:50.
 */
class ComponentsGenerator {
    // ------------- edit PACKAGE and DATABASE -------------
    private final static String PACKAGE = "demo";
    private final static String DATABASE = "db_examination";
    // -----------------------------------------------------
    private final static String TYPE_PATH = "src/main/java/";
    private static final String VIEW_PATH = "src/main/webapp/";
    private static final String CONF_PATH = "src/main/resources/";
    private final static String PATH = TYPE_PATH + PACKAGE.replace(".", "/");
    private final static String[] TYPE_TPLS = {"Model", "Dao", "Dao.Impl", "Service", "Service.Impl", "Controller"};
    private final static String[] VIEW_TPLS = {"index", "create", "list", "edit"};
    private final static String[] CONF_TPLS = {"mapper"};
    private static String model;
    private static String pk;
    private static String properties;
    private static Scanner scanner = new Scanner(System.in);
    private static ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

    public static void main(String[] args) throws Exception {
        input();
        for (String tpl : TYPE_TPLS) {
            generate(tpl, "type");
        }
        for (String tpl : CONF_TPLS) {
            generate(tpl, "conf");
        }
        System.out.println("generate pages?(y/n)");
        String s = scanner.nextLine();
        if (s.equalsIgnoreCase("y")) {
            for (String tpl : VIEW_TPLS) {
                generate(tpl, "view");
            }
        }
        System.out.println("done.");
    }

    private static void input() {
        System.out.println("input model class name, e.g:Person:");
        model = scanner.nextLine();
        System.out.println("input primary key type, e.g:Integer:");
        pk = scanner.nextLine();
        System.out.println("input properties, e.g:String name, :");
        properties = scanner.nextLine();
    }

    private static void generate(String tpl, String type) throws Exception {
        Map<String, String> propertyMap = new LinkedHashMap<>();
        Map<String, String> columnMap = new LinkedHashMap<>();
        for (String kv : properties.split(", ")) {
            String[] strings = kv.split(" ");
            propertyMap.put(strings[1], strings[0]);
            columnMap.put(strings[1], strings[1]);
        }

        Map<String, Object> map = new LinkedHashMap<>();
        map.put("properties", propertyMap);
        map.put("package", PACKAGE);
        map.put("model", model);
        map.put("PK", pk);
        map.put("db", DATABASE);
        map.put("table", convertJavaNameToDatabaseName(model));
        map.put("columns", columnMap);

        File file = null;
        String name = null;
        switch (type) {
            case "view": {
                File path = new File(VIEW_PATH + model.toLowerCase());
                if (!path.exists()) {
                    System.out.println("make view directories..." + path.mkdir());
                }
                file = new File(path + "/" + tpl + ".jsp");
                name = "view/" + tpl + ".ftl";
                break;
            }
            case "type":
                file = new File(PATH + "/" + tpl.toLowerCase().replace('.', '/') + "/" + model + tpl.replace(".", "") + ".java");
                if (tpl.equals("Model")) {
                    file = new File(PATH + "/model/" + model + ".java");
                }
                name = "type/" + tpl + ".ftl";
                break;
            case "conf": {
                File path = new File(CONF_PATH + "mapper");
                if (!path.exists()) {
                    System.out.println("make conf directories..." + path.mkdir());
                }
                file = new File(path + "/" + convertJavaNameToDatabaseName(model) + "-mapper" + ".xml");
                name = "conf/" + tpl + ".ftl";
                break;
            }
        }
        Writer writer = null;
        if (file != null) {
            writer = new FileWriter(file);
        }
        FreeMarkerConfig freeMarkerConfig = (FreeMarkerConfig) applicationContext.getBean("freemarker");
        System.out.println("name: " + name);
        Template template = freeMarkerConfig.getConfiguration().getTemplate(name);
        template.process(map, writer);
        if (writer != null) {
            writer.close();
        }

        System.out.println("\t" + file + " \t generated!");
    }

    private static String convertJavaNameToDatabaseName(String ClassName) {
        Pattern pattern = Pattern.compile("[A-z][a-z]*");
        Matcher matcher = pattern.matcher(ClassName);
        StringBuilder stringBuilder = new StringBuilder();
        while (matcher.find()) {
            stringBuilder.append(matcher.group().toLowerCase());
            if (!matcher.hitEnd()) {
                stringBuilder.append("_");
            }
        }
        return stringBuilder.toString();
    }
}
