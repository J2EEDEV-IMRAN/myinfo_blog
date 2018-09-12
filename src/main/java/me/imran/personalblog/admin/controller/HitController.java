package me.imran.personalblog.admin.controller;

import me.imran.personalblog.admin.model.Hit;
/*IMPORT_EXTRA_MODEL*/
import me.imran.personalblog.admin.repository.HitRepository;
import me.imran.personalblog.admin.repository.HitDataTableRepository;

/*IMPORT_EXTRA_REPOSITORY*/

import me.imran.personalblog.admin.validator.HitValidator;

import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

/**
 * Created by imran on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/Hit", "/admin/hit"})
public class HitController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(HitController.class);
    @Autowired
    HitRepository hitRepository;
    @Autowired
    HitDataTableRepository hitDataTableRepository;
    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    HitValidator hitValidator;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/Hit/datatable";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        Hit hit = hitRepository.findOne(id);
        model.addAttribute("hit", hit);
        return "admin/pages/Hit/details";
    }


    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        hitRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Hit getById(@PathVariable("id") Integer id, Model model) {
        Hit hit = hitRepository.findOne(id);
        return hit;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<Hit> data() {
        return hitRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<Hit> getHits(@Valid @RequestBody DataTablesInput input) {

        return hitDataTableRepository.findAll(input);
    }


}
