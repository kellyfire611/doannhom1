package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class vd {

    public static void main(String[] args) throws ParseException {
        String date_s = "10-12-2015";

        // *** note that it's "yyyy-MM-dd hh:mm:ss" not "yyyy-mm-dd hh:mm:ss"  
        SimpleDateFormat dt = new SimpleDateFormat("dd-MM-yyyy");
        Date date = dt.parse(date_s);

        // *** same for the format String below
       // SimpleDateFormat dt1 = new SimpleDateFormat("yyyy-MM-dd");
        System.out.println(date);
    }

}