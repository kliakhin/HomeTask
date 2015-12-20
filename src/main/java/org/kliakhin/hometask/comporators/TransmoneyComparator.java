package org.kliakhin.hometask.comporators;

import org.kliakhin.hometask.entity.Transmoney;

import java.util.Comparator;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/21/15 12:13 AM
 */
public class TransmoneyComparator implements Comparator<Transmoney>{
    @Override
    public int compare(Transmoney tm1, Transmoney tm2) {
        int date = tm1.getSentDate().compareTo(tm2.getSentDate());
        if (date == 0 ) {
            return (int) (tm1.getSumSent() - tm2.getSumSent());
            }
        return date;
    }
}
