package me.imran.personalblog.admin.controller;

import me.imran.personalblog.admin.model.PostTag;
import me.imran.personalblog.admin.model.Role;
import me.imran.personalblog.admin.model.User;
/*IMPORT_EXTRA_MODEL*/
import me.imran.personalblog.admin.repository.RoleRepository;
import me.imran.personalblog.admin.repository.UserRepository;
import me.imran.personalblog.admin.repository.UserDataTableRepository;

/*IMPORT_EXTRA_REPOSITORY*/

import me.imran.personalblog.admin.validator.UserValidator;

import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

/**
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/User", "/admin/user"})
public class UserController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    private Map<String, Role> userRoleCache;

    @InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception{
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
        binder.registerCustomEditor(Set.class,"roles", new CustomCollectionEditor(Set.class){
            protected Object convertElement(Object element){
               /* if (element instanceof String) {
                    PostTag tag = postTagCache.get(Integer.parseInt(element.toString()));
                    return tag;
                }*/

                if (element instanceof Role) {
                    System.out.println("Converting from Staff to Staff: " + element);
                    return element;
                }
                if (element instanceof String) {
                    Role userRole = userRoleCache.get(element.toString());
                    System.out.println("Looking up staff for id " + element + ": " + userRole);
                    return userRole;
                }
                return null;
            }
        });
    }

    @Autowired
    UserRepository userRepository;
    @Autowired
    UserDataTableRepository userDataTableRepository;
    @Autowired
    RoleRepository roleRepository;
    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    UserValidator userValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/User/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {

        List<Role> userRoleList=roleRepository.findAllByOrderByIdAsc();
        userRoleCache = new HashMap<String, Role>();
        for (Role userRole : userRoleList) {
            userRoleCache.put(userRole.getId().toString(), userRole);

        }

        User user = new User();
        model.addAttribute("user", user);
        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/User/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {

        userValidator.validate(user, result);
        if (result.hasErrors()) {
            List<Role> userRoleList=roleRepository.findAllByOrderByIdAsc();
            userRoleCache = new HashMap<String, Role>();
            for (Role userRole : userRoleList) {
                userRoleCache.put(userRole.getId().toString(), userRole);
            }
            model.addAttribute("user", user);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/User/create";
        }

        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setPasswordRecoveryCode(bCryptPasswordEncoder.encode(user.getPasswordRecoveryCode()));

        /*SET_NULL_TO_FOREIN_KEY*/
        user.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        user.setCreatedAt(new Date());
        userRepository.save(user);
        return "redirect:/admin/User";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        List<Role> userRoleList=roleRepository.findAllByOrderByIdAsc();
        userRoleCache = new HashMap<String, Role>();
        for (Role userRole : userRoleList) {
            userRoleCache.put(userRole.getId().toString(), userRole);
        }
        User user = userRepository.findOne(id);
        /*SET_OTHER_FIELD*/
        model.addAttribute("user", user);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/User/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("user") User user, BindingResult result, HttpServletRequest request) {

        User userOld = userRepository.findOne(id);
        userValidator.validate(user, result);
        if (result.hasErrors()) {
            List<Role> userRoleList=roleRepository.findAllByOrderByIdAsc();
            userRoleCache = new HashMap<String, Role>();
            for (Role userRole : userRoleList) {
                userRoleCache.put(userRole.getId().toString(), userRole);
            }
            model.addAttribute("user", user);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/User/create";
        }


        if (user.getPassword() == null) {
            user.setPassword(userOld.getPassword());
        } else {
            user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

        }
        if (user.getPasswordRecoveryCode() == null) {
            user.setPasswordRecoveryCode(userOld.getPasswordRecoveryCode());
        } else {
            user.setPasswordRecoveryCode(bCryptPasswordEncoder.encode(user.getPasswordRecoveryCode()));
        }

        /*SET_NULL_TO_FOREIN_KEY*/
        user.setCreatedBy(userOld.getCreatedBy());
        user.setCreatedAt(userOld.getCreatedAt());
        user.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        user.setUpdatedAt(new Date());
        userRepository.save(user);
        return "redirect:/admin/user";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        return "admin/pages/User/details";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        userRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User getById(@PathVariable("id") Integer id, Model model) {
        User user = userRepository.findOne(id);
        return user;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<User> data() {
        return userRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<User> getUsers(@Valid @RequestBody DataTablesInput input) {

        return userDataTableRepository.findAll(input);
    }

    @ModelAttribute("userRoleCache")
    public List<Role> getTeams(){
        return roleRepository.findAllByOrderByIdAsc();
    }

}
