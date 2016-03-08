package com.data.job.domain;

/**
 * 城市下拉框选择结果
 *
 * @author tyee.noprom@qq.com
 * @time 2/11/16 10:30 PM.
 */
public class CitySelectResult {

    private City city;
    private boolean chosen;

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public boolean isChosen() {
        return chosen;
    }

    public void setChosen(boolean chosen) {
        this.chosen = chosen;
    }
}
