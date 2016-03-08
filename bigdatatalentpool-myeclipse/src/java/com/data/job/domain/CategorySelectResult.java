package com.data.job.domain;

/**
 * 类别选择结果
 *
 * @author tyee.noprom@qq.com
 * @time 2/11/16 10:25 PM.
 */
public class CategorySelectResult {

    private Category category;
    private boolean chosen;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public boolean isChosen() {
        return chosen;
    }

    public void setChosen(boolean chosen) {
        this.chosen = chosen;
    }
}
