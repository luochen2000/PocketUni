package com.nowcoder.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * Created by rainday on 16/6/30.
 */
//专用来为视图展示的对象
public class ViewObject {
    private Map<String, Object> objs = new HashMap<String, Object>();

    public void setObjs(Map<String, Object> objs) {
        this.objs = objs;
    }

    public Map<String, Object> getObjs() {
        return objs;
    }

    public void set(String key, Object value) {
        objs.put(key, value);
    }

    public Object get(String key) {
        return objs.get(key);
    }
}
