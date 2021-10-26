package com.tech.gulimall.thirdparty;

import com.aliyun.oss.OSSClient;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class GulimallThirdPartyApplicationTests {
    //    @Value("${spring.alicloud.oss.endpoint}")
    //    private String endpoint;
    //
    //    @Value("${spring.alicloud.access-key}")
    //    private String accessKeyId;
    //
    //    @Value("${spring.alicloud.secret-key}")
    //    private String accessKeySecret;

    // @Value("${spring.alicloud.oss.bucket}")
    private String bucket = "gulimail-dong";

    @Autowired
    OSSClient ossClient;

    @Test
    public void testUpload() throws FileNotFoundException {

        // 创建OSSClient实例。
//        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        // 上传文件流。
        InputStream inputStream = new FileInputStream("C:\\Users\\FG\\Pictures\\Saved Pictures\\1.jpg");
        ossClient.putObject(bucket, "test1.jpg", inputStream);

        // 关闭OSSClient。
        ossClient.shutdown();
        System.out.println("上传成功！");
    }

    @Test
    public void contextLoads() {
    }

}
