/*
package me.imran.personalblog.admin.controller;

*/
/*IMPORT_EXTRA_MODEL*//*

import me.imran.personalblog.admin.repository.UserRoleRepository;
import me.imran.personalblog.admin.repository.UserRoleDataTableRepository;


import me.imran.personalblog.admin.repository.UserRepository;
import me.imran.personalblog.admin.repository.RoleRepository;

import me.imran.personalblog.admin.validator.UserRoleValidator;

import com.fasterxml.jackson.annotation.JsonView;
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

*/
/**
 * Created by imran hossain on 12/22/16.
 *//*


@Controller
@RequestMapping({"/admin/UserRole", "/admin/userRole"})
public class UserRoleController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserRoleController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @Autowired
    UserRoleRepository userRoleRepository;
    @Autowired
    UserRoleDataTableRepository userRoleDataTableRepository;


    @Autowired
    UserRepository userRepository;

    @Autowired
    RoleRepository roleRepository;

    @Autowired
    UserRoleValidator userRoleValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/UserRole/datatable";
    }

    @RequestMapping(value = {"/create", "/create*/
/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {

        UserRole userRole = new UserRole();
        model.addAttribute("userRole", userRole);
        model.addAttribute("action", "/create");
        model.addAttribute("userList", userRepository.findAllByOrderByUsernameAsc());
        model.addAttribute("roleList", roleRepository.findAllByOrderByNameAsc());
        return "admin/pages/UserRole/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("userRole") UserRole userRole, BindingResult result, HttpServletRequest request) {


        userRoleValidator.validate(userRole, result);
        if (result.hasErrors()) {
            model.addAttribute("userRole", userRole);
            model.addAttribute("action", "/create");
            model.addAttribute("userList", userRepository.findAllByOrderByUsernameAsc());
            model.addAttribute("roleList", roleRepository.findAllByOrderByNameAsc());
            return "admin/pages/UserRole/create";
        }

        if (userRole.getUserId().getId() == 0) {
            userRole.setUserId(null);
        }
        if (userRole.getRoleId().getId() == 0) {
            userRole.setRoleId(null);
        }
        userRole.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        userRole.setCreatedAt(new Date());
        userRoleRepository.save(userRole);
        return "redirect:/admin/userRole";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        UserRole userRole = userRoleRepository.findOne(id);
        */
/*SET_OTHER_FIELD*//*

        model.addAttribute("userRole", userRole);
        model.addAttribute("action", "/edit/" + id);
        model.addAttribute("userList", userRepository.findAllByOrderByUsernameAsc());
        model.addAttribute("roleList", roleRepository.findAllByOrderByNameAsc());
        return "admin/pages/UserRole/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("userRole") UserRole userRole, BindingResult result, HttpServletRequest request) {

        UserRole userRoleOld = userRoleRepository.findOne(id);

        userRoleValidator.validate(userRole, result);
        if (result.hasErrors()) {
            model.addAttribute("userRole", userRole);
            model.addAttribute("action", "/edit/" + id);
            model.addAttribute("userList", userRepository.findAllByOrderByUsernameAsc());
            model.addAttribute("roleList", roleRepository.findAllByOrderByNameAsc());
            return "admin/pages/UserRole/create";
        }

        if (userRole.getUserId().getId() == 0) {
            userRole.setUserId(null);
        }
        if (userRole.getRoleId().getId() == 0) {
            userRole.setRoleId(null);
        }

        userRole.setCreatedBy(userRoleOld.getCreatedBy());
        userRole.setCreatedAt(userRoleOld.getCreatedAt());
        userRole.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        userRole.setUpdatedAt(new Date());
        userRoleRepository.save(userRole);
        return "redirect:/admin/userRole";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        UserRole userRole = userRoleRepository.findOne(id);
        model.addAttribute("userRole", userRole);
        return "admin/pages/UserRole/details";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        userRoleRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public UserRole getById(@PathVariable("id") Integer id, Model model) {
        UserRole userRole = userRoleRepository.findOne(id);
        return userRole;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<UserRole> data() {
        return userRoleRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<UserRole> getUserRoles(@Valid @RequestBody DataTablesInput input) {

        return userRoleDataTableRepository.findAll(input);
    }


}
*/
