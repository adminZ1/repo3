package cn.smbms.utils;

import java.util.Date;

public class DateCutUtil {
    public static long cut(Date date) {
        Date d = new Date();
        long time = d.getTime() - date.getTime();
        time = time / 1000 / 60 / 60 / 24 / 365;
        return time;
    }
}
