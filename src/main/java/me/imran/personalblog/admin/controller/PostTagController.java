package me.imran.personalblog.admin.controller;

import com.fasterxml.jackson.annotation.JsonView;
import me.imran.personalblog.admin.model.PostTag;
import me.imran.personalblog.admin.repository.PostTagDataTableRepository;
import me.imran.personalblog.admin.validator.PostTagValidator;
import me.imran.personalblog.admin.repository.PostTagRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.data.jpa.datatables.mapping.DataTablesInput;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

/*IMPORT_EXTRA_MODEL*/
/*IMPORT_EXTRA_REPOSITORY*/

/**
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/PostTag", "/admin/posttag"})
public class PostTagController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(PostTagController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }



    @Autowired
    PostTagRepository postTagRepository;
    @Autowired
    PostTagDataTableRepository postTagDataTableRepository;


    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    PostTagValidator postTagValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/PostTag/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {

        PostTag postTag = new PostTag();
        model.addAttribute("postTag", postTag);
        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/PostTag/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("postTag") PostTag postTag, BindingResult result, HttpServletRequest request) {

        postTagValidator.validate(postTag, result);
        if (result.hasErrors()) {
            model.addAttribute("postTag", postTag);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/PostTag/create";
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        postTag.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        postTag.setCreatedAt(new Date());
        postTagRepository.save(postTag);
        postTag = postTagRepository.getNewPostTag();
        model.addAttribute("postTag", postTag);
        return "admin/pages/PostTag/details";
        //return "redirect:/admin/volume";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        PostTag postTag = postTagRepository.findOne(id);
        /*SET_OTHER_FIELD*/
        model.addAttribute("postTag", postTag);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/PostTag/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("postTag") PostTag postTag, BindingResult result, HttpServletRequest request) {

        PostTag postTagOld = postTagRepository.findOne(id);
        postTagValidator.validate(postTag, result);
        if (result.hasErrors()) {
            model.addAttribute("postTag", postTag);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/PostTag/create";
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        postTag.setCreatedBy(postTagOld.getCreatedBy());
        postTag.setCreatedAt(postTagOld.getCreatedAt());

        postTag.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        postTag.setUpdatedAt(new Date());

        postTagRepository.save(postTag);
        return "redirect:/admin/PostTag";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        PostTag postTag = postTagRepository.findOne(id);
        model.addAttribute("postTag", postTag);
        return "admin/pages/PostTag/details";
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        postTagRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public PostTag getById(@PathVariable("id") Integer id, Model model) {
        PostTag postTag = postTagRepository.findOne(id);
        return postTag;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<PostTag> data() {
        return postTagRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<PostTag> getVolumes(@Valid @RequestBody DataTablesInput input) {

        return postTagDataTableRepository.findAll(input);
    }

    @RequestMapping(value = "/newDetails")
    public String newDetails(Model model) {
        model.addAttribute("newDetails", postTagRepository.getNewPostTag());
        return "admin/pages/PostTag/newDetails";
    }

}
