package me.imran.personalblog.admin.controller;

import com.fasterxml.jackson.annotation.JsonView;
import me.imran.personalblog.admin.model.Post;
import me.imran.personalblog.admin.model.PostTag;
import me.imran.personalblog.admin.validator.PostValidator;
import me.imran.personalblog.admin.repository.PostCategoryRepository;
import me.imran.personalblog.admin.repository.PostDataTableRepository;
import me.imran.personalblog.admin.repository.PostRepository;
import me.imran.personalblog.admin.repository.PostTagRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
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
import java.util.*;

/*IMPORT_EXTRA_MODEL*/
/*IMPORT_EXTRA_REPOSITORY*/

/**
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/Post", "/admin/post"})
public class PostController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(PostController.class);
    private Map<String, PostTag> postTagCache;
 /*   @InitBinder
    public void initBinder(WebDataBinder binder) {

    }
*/
    @InitBinder
    protected void initBinder(WebDataBinder binder) throws Exception{
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
        binder.registerCustomEditor(Set.class,"postTags", new CustomCollectionEditor(Set.class){
            protected Object convertElement(Object element){
               /* if (element instanceof String) {
                    PostTag tag = postTagCache.get(Integer.parseInt(element.toString()));
                    return tag;
                }*/

                if (element instanceof PostTag) {
                    System.out.println("Converting from Staff to Staff: " + element);
                    return element;
                }
                if (element instanceof String) {
                     PostTag postTag = postTagCache.get(element.toString());
                    System.out.println("Looking up staff for id " + element + ": " + postTag);
                    return postTag;
                }
                return null;
            }
        });
    }

    @Autowired
    PostRepository postRepository;
    @Autowired
    PostCategoryRepository postCategoryRepository;
    @Autowired
    PostTagRepository postTagRepository;
    @Autowired
    PostDataTableRepository postDataTableRepository;
    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    PostValidator postValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/Post/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
       // List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        Post post = new Post();
        model.addAttribute("post", post);
        model.addAttribute("categoryList",postCategoryRepository.findAllByOrderByIdAsc());
        List<PostTag> postTagList=postTagRepository.findAllByOrderByIdAsc();
         postTagCache = new HashMap<String, PostTag>();
        for (PostTag postTag : postTagList) {
            postTagCache.put(postTag.getId().toString(), postTag);
        }
       // model.addAttribute("postTag",postTagList);
        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/Post/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("post") Post post, BindingResult result, @RequestParam("postImageFile") MultipartFile postImageFile, HttpServletRequest request) {

        postValidator.validate(post, result);
        if (result.hasErrors()) {
            model.addAttribute("post", post);
            List<PostTag> postTagList=postTagRepository.findAllByOrderByIdAsc();
             postTagCache = new HashMap<String, PostTag>();
            for (PostTag postTag : postTagList) {
                postTagCache.put(postTag.getId().toString(), postTag);
            }
            //model.addAttribute("postTag",postTagList);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/Post/create";
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        String postImage = uploadFile(postImageFile);
        post.setPostImage(null);
        if (postImage == null) {
            post.setPostImage(null);
        } else {
            post.setPostImage(postImage);
        }

        post.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        post.setCreatedAt(new Date());
        postRepository.save(post);
        post = postRepository.getNewPost();
        model.addAttribute("post", post);
        return "admin/pages/Post/details";
        //return "redirect:/admin/volume";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        Post post = postRepository.findOne(id);
        /*SET_OTHER_FIELD*/
        model.addAttribute("categoryList",postCategoryRepository.findAllByOrderByIdAsc());
        List<PostTag> postTagList=postTagRepository.findAllByOrderByIdAsc();
        postTagCache = new HashMap<String, PostTag>();
        for (PostTag postTag : postTagList) {
            postTagCache.put(postTag.getId().toString(), postTag);
        }
      //  model.addAttribute("postTag",postTagList);
        model.addAttribute("post", post);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/Post/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("post") Post post, BindingResult result,@RequestParam("postImageFile") MultipartFile postImageFile, HttpServletRequest request) {

        Post postOld = postRepository.findOne(id);
        postValidator.validate(post, result);
        if (result.hasErrors()) {
            model.addAttribute("post", post);
            List<PostTag> postTagList=postTagRepository.findAllByOrderByIdAsc();
            postTagCache = new HashMap<String, PostTag>();
            for (PostTag postTag : postTagList) {
                postTagCache.put(postTag.getId().toString(), postTag);
            }
         //   model.addAttribute("postTag",postTagList);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/Post/create";
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        String postImage = uploadFile(postImageFile);
        post.setPostImage(null);
        if (postImage == null) {
            post.setPostImage(postOld.getPostImage());
        } else {
            post.setPostImage(postImage);
        }
        post.setCreatedBy(postOld.getCreatedBy());
        post.setCreatedAt(postOld.getCreatedAt());

        post.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        post.setUpdatedAt(new Date());

        postRepository.save(post);
        return "redirect:/admin/Post";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        Post post = postRepository.findOne(id);
        model.addAttribute("post", post);
        return "admin/pages/Post/details";
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        postRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Post getById(@PathVariable("id") Integer id, Model model) {
        Post post = postRepository.findOne(id);
        return post;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<Post> data() {
        return postRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<Post> getVolumes(@Valid @RequestBody DataTablesInput input) {

        return postDataTableRepository.findAll(input);
    }

    @RequestMapping(value = "/newDetails")
    public String newDetails(Model model) {
        model.addAttribute("newDetails", postRepository.getNewPost());
        return "admin/pages/Post/newDetails";
    }

    @ModelAttribute("postTagCache")
    public List<PostTag> getTeams(){
        return postTagRepository.findAllByOrderByIdAsc();
    }

}
