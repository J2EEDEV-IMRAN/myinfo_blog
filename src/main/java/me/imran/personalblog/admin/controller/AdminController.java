package me.imran.personalblog.admin.controller;

import me.imran.personalblog.admin.model.User;


import me.imran.personalblog.admin.repository.*;
import me.imran.personalblog.login.model.ChangePassword;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by imran on 12/22/16.
 */

@Controller
public class AdminController extends MyBaseController {
    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    @Autowired
    UserRepository userRepository;
    @Autowired
    PostCategoryRepository postCategoryRepository;

    @Autowired
    PostTagRepository postTagRepository;
    @Autowired
    PostRepository postRepository;

    @Autowired
    private HitRepository hitRepository;

    @RequestMapping(value = {"/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        try {
            User user = userRepository.findByUsername(getUsername());

            return "admin/index";
        } catch (Exception e) {
            return "redirect:/login";
        }

    }

    @RequestMapping(value = {"/admin"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/index";
    }

    @RequestMapping(value = {"/upload"}, method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> upload(@RequestParam("file") MultipartFile file) {
        logger.info("File", file);
        String filePath = null;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss-");
        String date = dateFormat.format(new Date());
        String name = date + file.getOriginalFilename().replace(' ', '-');
        String path = "ataur";

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                String rootPath = servletContext.getRealPath("/");
                File dir = new File(uploadPath + "/" + path);
                if (!dir.exists())
                    dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
                filePath = path + "/" + name;
                Map<String, String> response = new HashMap<>();
                if (filePath == null) {
                    response.put("error", "Something wrong!");
                } else {
                    response.put("success", "Successfully uploaded");
                    response.put("url", filePath);
                }
                return response;
            } catch (Exception e) {
                return null;
            }
        }
        return null;

    }

    @RequestMapping(value = {"/upload"}, method = RequestMethod.GET)
    public String multiUpload(Model model) {
        return "upload";
    }

    @RequestMapping(value = {"/admin/home"}, method = RequestMethod.GET)
    public String home(Model model) {
        model.addAttribute("total_active_volume", postCategoryRepository.count());
        model.addAttribute("total_active_act", postTagRepository.count());
        model.addAttribute("total_active_section", postRepository.count());
        model.addAttribute("total_visitor", hitRepository.count());
        return "admin/home";
    }

    @RequestMapping(value = {"/{type}/change_password"}, method = RequestMethod.GET)
    public String changePassword(Model model, @PathVariable("type") String type) {
        ChangePassword password = new ChangePassword();
        model.addAttribute("password", password);
        model.addAttribute("type", type);
        return "admin/pages/change_password";
    }


    @RequestMapping(value = {"/{type}/change_password"}, method = RequestMethod.POST)
    public String changePasswordPost(Model model, @PathVariable("type") String type, @Valid @ModelAttribute("password") ChangePassword password, BindingResult result) {
        User user = userRepository.findByUsername(getUsername());
        String error = null;

        if (password.getNewPassword().length() < 8) {
            error = " New password should be greater than 8 characters.";
        }
        logger.info(password.getNewPassword());
        logger.info(password.getConfirmPassword());
        if (!password.getNewPassword().equals(password.getConfirmPassword())) {
            error = " New password & Confirm Password does not macth.";
        }


        if (result.hasErrors() || error != null) {
            model.addAttribute("type", type);
            model.addAttribute("error_message", error);
            return "admin/pages/change_password";
        }


        user.setPassword(bCryptPasswordEncoder.encode(password.getNewPassword()));
        user.setUpdatedBy(user.getUsername());
        user.setUpdatedAt(new Date());
        userRepository.save(user);
        model.addAttribute("type", type);
        model.addAttribute("success_message", "You have successfully changed your password");
        return "admin/pages/change_password";
    }

    @RequestMapping(value = {"/google-analytic-report.html"}, method = RequestMethod.GET)
    public String googleAnalyticReport() {
        return "admin/google-analytic-report";
    }


}

