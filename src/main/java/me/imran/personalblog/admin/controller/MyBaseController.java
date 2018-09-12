package me.imran.personalblog.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by imran on 3/1/17.
 */
public class MyBaseController {
    private static final Logger loggerBase = LoggerFactory.getLogger(MyBaseController.class);
    //protected String username = SecurityContextHolder.getContext().getAuthentication().getName();
    @Autowired
    ServletContext servletContext;
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    HttpServletRequest baseHttpServletRequest;
    @Value("${uploadPath}")
    String uploadPath;

    protected String getUsername() {
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }

    protected String uploadFile(MultipartFile file) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-");
        String date = dateFormat.format(new Date());
        String name = date + file.getOriginalFilename().replace(' ', '-');
        String path = baseHttpServletRequest.getRequestURI().split("/")[2].toLowerCase();

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = servletContext.getRealPath("/");
                //File dir = new File(rootPath + File.separator + "resources" + File.separator + "upload");
//                loggerBase.info("******************************************************");
//                loggerBase.info(uploadPath);
//                loggerBase.info("******************************************************");
                File dir = new File(uploadPath + "/" + path);
                if (!dir.exists())
                    dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                return path + "/" + name;
            } catch (Exception e) {
                return null;
            }
        }
        return null;
    }
}
