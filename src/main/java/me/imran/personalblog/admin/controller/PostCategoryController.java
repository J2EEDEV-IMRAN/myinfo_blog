package me.imran.personalblog.admin.controller;

import com.fasterxml.jackson.annotation.JsonView;
import me.imran.personalblog.admin.model.PostCategory;
import me.imran.personalblog.admin.repository.PostCategoryDataTableRepository;
import me.imran.personalblog.admin.repository.PostCategoryRepository;
import me.imran.personalblog.admin.validator.PostCategoryValidator;
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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*IMPORT_EXTRA_MODEL*/
/*IMPORT_EXTRA_REPOSITORY*/

/**
 * Created by imran on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/PostCategory", "/admin/postcategory"})
public class PostCategoryController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(PostCategoryController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @Autowired
    PostCategoryRepository postCategoryRepository;
    @Autowired
    PostCategoryDataTableRepository postCategoryDataTableRepository;


    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    PostCategoryValidator postCategoryValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/PostCategory/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {

        PostCategory postCategory = new PostCategory();
        model.addAttribute("postCategory", postCategory);
        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/PostCategory/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("postCategory") PostCategory postCategory, BindingResult result, @RequestParam("catImageFile") MultipartFile catImageFile,HttpServletRequest request) {

        postCategoryValidator.validate(postCategory, result);
        if (result.hasErrors()) {
            model.addAttribute("postCategory", postCategory);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/PostCategory/create";
        }
        String catImage = uploadFile(catImageFile);
        postCategory.setCatImage(null);
        if (catImage == null) {
            postCategory.setCatImage(null);
        } else {
            postCategory.setCatImage(catImage);
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        postCategory.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        postCategory.setCreatedAt(new Date());
        postCategoryRepository.save(postCategory);
        postCategory = postCategoryRepository.getNewPostCategory();
        model.addAttribute("postCategory", postCategory);
        return "admin/pages/PostCategory/details";
        //return "redirect:/admin/volume";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        PostCategory postCategory = postCategoryRepository.findOne(id);
        /*SET_OTHER_FIELD*/
        model.addAttribute("postCategory", postCategory);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/PostCategory/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("postCategory") PostCategory postCategory,@RequestParam("catImageFile") MultipartFile catImageFile, BindingResult result, HttpServletRequest request) {

        PostCategory postCategoryOld = postCategoryRepository.findOne(id);
        postCategoryValidator.validate(postCategory, result);
        if (result.hasErrors()) {
            model.addAttribute("postCategory", postCategory);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/PostCategory/create";
        }
        String postImage = uploadFile(catImageFile);
        postCategory.setCatImage(null);
        if (postImage == null) {
            postCategory.setCatImage(postCategoryOld.getCatImage());
        } else {
            postCategory.setCatImage(postImage);
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        postCategory.setCreatedBy(postCategoryOld.getCreatedBy());
        postCategory.setCreatedAt(postCategoryOld.getCreatedAt());

        postCategory.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        postCategory.setUpdatedAt(new Date());

        postCategoryRepository.save(postCategory);
        return "redirect:/admin/postcategory";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        PostCategory postCategory = postCategoryRepository.findOne(id);
        model.addAttribute("postCategory", postCategory);
        return "admin/pages/PostCategory/details";
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        postCategoryRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public PostCategory getById(@PathVariable("id") Integer id, Model model) {
        PostCategory postCategory = postCategoryRepository.findOne(id);
        return postCategory;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<PostCategory> data() {
        return postCategoryRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<PostCategory> getPostCategory(@Valid @RequestBody DataTablesInput input) {

        return postCategoryDataTableRepository.findAll(input);
    }

    @RequestMapping(value = "/newDetails")
    public String newDetails(Model model) {
        model.addAttribute("newDetails", postCategoryRepository.getNewPostCategory());
        return "admin/pages/PostCategory/newDetails";
    }

}
