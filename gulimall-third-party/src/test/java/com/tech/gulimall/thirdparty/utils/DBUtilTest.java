package com.tech.gulimall.thirdparty.utils;

import ch.qos.logback.core.db.dialect.DBUtil;
import com.tech.gulimall.thirdparty.properties.DataSouceProperties;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class DBUtilTest {

    @Autowired
    private DBUtil dbUtil;

    @Autowired
    private DataSouceProperties dataSouceProperties;


    @Test
    public void dataSourceTest() {
        DataSouceProperties.main(null);
    }

}
