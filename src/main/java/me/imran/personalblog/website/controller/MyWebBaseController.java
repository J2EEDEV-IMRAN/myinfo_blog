package me.imran.personalblog.website.controller;

import eu.bitwalker.useragentutils.UserAgent;
import me.imran.personalblog.admin.model.Hit;
import me.imran.personalblog.admin.repository.HitRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author Imran Hossain
 */
public class MyWebBaseController {
    private static final Logger baseLogger = LoggerFactory.getLogger(MyWebBaseController.class);
    @Autowired
    HitRepository hitRepository;

    public void  hitLogger(HttpServletRequest request){
        try{
            Hit hit = new Hit();

            String ipAddress=null;
            //String getWay = request.getHeader("VIA");   // Gateway
            ipAddress = request.getHeader("X-FORWARDED-FOR");   // proxy
            if(ipAddress==null)
            {
                ipAddress = request.getRemoteAddr();
            }

            hit.setIp(ipAddress);

            UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));

            hit.setBrowser(userAgent.getBrowser().getName());
            hit.setBrowserVersion(userAgent.getBrowserVersion().getVersion());
            hit.setOperatingSystem(userAgent.getOperatingSystem().getName());
            hit.setResource(request.getRequestURI());
            hit.setQuery(request.getQueryString());
            hit.setType(request.getMethod());
            hit.setDate(new Date());
            hitRepository.save(hit);

        }catch (Exception e){

        }
    }
}
