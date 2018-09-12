package me.imran.personalblog.admin.controller;

import me.imran.personalblog.admin.model.Role;
/*IMPORT_EXTRA_MODEL*/
import me.imran.personalblog.admin.repository.RoleRepository;
import me.imran.personalblog.admin.repository.RoleDataTableRepository;

/*IMPORT_EXTRA_REPOSITORY*/

import me.imran.personalblog.admin.validator.RoleValidator;

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

/**
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/Role", "/admin/role"})
public class RoleController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(RoleController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @Autowired
    RoleRepository roleRepository;
    @Autowired
    RoleDataTableRepository roleDataTableRepository;


    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    RoleValidator roleValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/Role/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {

        Role role = new Role();
        model.addAttribute("role", role);
        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/Role/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("role") Role role, BindingResult result, HttpServletRequest request) {

        roleValidator.validate(role, result);
        if (result.hasErrors()) {
            model.addAttribute("role", role);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/Role/create";
        }

        /*SET_NULL_TO_FOREIN_KEY*/
        role.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        role.setCreatedAt(new Date());
        roleRepository.save(role);
        return "redirect:/admin/role";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        Role role = roleRepository.findOne(id);
        /*SET_OTHER_FIELD*/
        model.addAttribute("role", role);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/Role/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("role") Role role, BindingResult result, HttpServletRequest request) {

        Role roleOld = roleRepository.findOne(id);
        roleValidator.validate(role, result);
        if (result.hasErrors()) {
            model.addAttribute("role", role);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/Role/create";
        }

        /*SET_NULL_TO_FOREIN_KEY*/
        role.setCreatedBy(roleOld.getCreatedBy());
        role.setCreatedAt(roleOld.getCreatedAt());

        role.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        role.setUpdatedAt(new Date());

        roleRepository.save(role);
        return "redirect:/admin/role";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        Role role = roleRepository.findOne(id);
        model.addAttribute("role", role);
        return "admin/pages/Role/details";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        roleRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Role getById(@PathVariable("id") Integer id, Model model) {
        Role role = roleRepository.findOne(id);
        return role;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<Role> data() {
        return roleRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<Role> getRoles(@Valid @RequestBody DataTablesInput input) {

        return roleDataTableRepository.findAll(input);
    }


}
