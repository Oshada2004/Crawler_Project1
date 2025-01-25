import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;

import org.openqa.selenium.*;
import org.openqa.selenium.bidi.module.Input;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
//import org.openqa.selenium.chrome.*;
import org.openqa.selenium.support.ui.Select;

public class WebCrawler {

    public static String StartStation = "Nanuoya"; // Edit this
    public static String EndStation = "Bandarawela"; // Edit this
    public static String Date = "01-30-2025";

    public static boolean isCheck = false;
    public static String url_a;

    private static void openSite() {

        WebDriver drvr;
        ChromeOptions options = new ChromeOptions();
        options.addArguments("headless");
        drvr = new ChromeDriver(options);
        drvr.get("https://trainschedule.lk/");

        try {

            Thread.sleep(500);
            Select dropdown1 = new Select(drvr.findElement(By.id("drStartStation")));
            Select dropdown2 = new Select(drvr.findElement(By.id("drEndStation")));
            WebElement dateBox = drvr.findElement(By.id("datepicker"));
            dropdown1.selectByVisibleText(StartStation);
            dropdown2.selectByVisibleText(EndStation);
            dateBox.sendKeys(Date);
            Thread.sleep(1000);
            drvr.findElement(By.xpath("//*[@id=\"searchForm\"]/button")).click();
            Thread.sleep(1000);
            url_a = drvr.getCurrentUrl();
            drvr.quit();
            isCheck = true;

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private static void getInfo() {

        try {

            Document doc = Jsoup.connect(url_a).userAgent("Mozilla/5.0").get();

            System.out.println(" ");
            System.out.println(doc.getElementsByTag("h5").text());

            Elements temp = doc.select("table.table");

            for (Element timelist : temp) {

                System.out.println(timelist.getElementsByTag("th").eachText());

                int count = timelist.getElementsByTag("td").size() / 7;
                
                for (int i = 0; i < count; i++) {
                    System.out.println(timelist.getElementsByTag("td").eachText().subList(6 * i, 6 * (i + 1)));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {

        try {
            openSite();
            if (isCheck) {
                getInfo();
            }
        } catch (Error e) {
            System.err.println(e);
        }

    }

}
