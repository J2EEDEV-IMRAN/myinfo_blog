package me.imran.personalblog.admin.controller;

import com.fasterxml.jackson.annotation.JsonView;
import me.imran.personalblog.admin.model.Comment;
import me.imran.personalblog.admin.repository.CommentDataTableRepository;
import me.imran.personalblog.admin.repository.CommentRepository;
import me.imran.personalblog.admin.repository.PostRepository;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*IMPORT_EXTRA_MODEL*/
/*IMPORT_EXTRA_REPOSITORY*/

/**
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/Comment", "/admin/comment"})
public class CommentController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(CommentController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @Autowired
    CommentRepository commentRepository;
    @Autowired
    CommentDataTableRepository commentDataTableRepository;
    @Autowired
    PostRepository postRepository;
    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/Comment/datatable";
    }



    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        Comment comment = commentRepository.findOne(id);
        model.addAttribute("PostList",postRepository.findAllByOrderByIdAsc());
        model.addAttribute("comment", comment);
        model.addAttribute("action", "/edit/" + id);
        return "admin/pages/Comment/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("comment") Comment comment,  BindingResult result, HttpServletRequest request) {

        Comment commentOld = commentRepository.findOne(id);

        comment.setCreatedBy(commentOld.getCreatedBy());
        comment.setCreatedAt(commentOld.getCreatedAt());

        comment.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        comment.setUpdatedAt(new Date());

        commentRepository.save(commentOld);
        return "redirect:/admin/Comment";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        Comment comment =commentRepository.findOne(id);
        model.addAttribute("comment", comment);
        return "admin/pages/Comment/details";
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        commentRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Comment getById(@PathVariable("id") Integer id, Model model) {
        Comment comment = commentRepository.findOne(id);
        return comment;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<Comment> data() {
        return commentRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<Comment> getVolumes(@Valid @RequestBody DataTablesInput input) {

        return commentDataTableRepository.findAll(input);
    }

    @RequestMapping(value = "/newDetails")
    public String newDetails(Model model) {
        model.addAttribute("newDetails", commentRepository.getNewComment());
        return "admin/pages/Comment/newDetails";
    }

}
