
package me.imran.personalblog.website.controller;


import me.imran.personalblog.admin.model.*;
import me.imran.personalblog.admin.repository.*;
import me.imran.personalblog.admin.validator.FeedBackValidator;
import me.imran.personalblog.login.util.VerifyRecaptcha;
import me.imran.personalblog.website.repository.SearchRepository;
import org.jsoup.Jsoup;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;




/**
 * @author Imran Hossain
 */

@Controller
public class HomeController extends MyWebBaseController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

   /* @Autowired
    VolumeRepository volumeRepository;
    @Autowired
    ActRepository actRepository;
    @Autowired
    ActPartRepository actPartRepository;
    @Autowired
    ActChapterRepository actChapterRepository;
    @Autowired
    ActSectionRepository actSectionRepository;
    @Autowired
    RelatedLinkRepository relatedLinkRepository;
    @Autowired
    FaqRepository faqRepository;
    @Autowired
    StaticPageRepository staticPageRepository;
    ;*/
   @Autowired
   FeedBackRepository feedBackRepository;

    @Autowired
    FeedBackValidator feedBackValidator;
    @Autowired
    private MessageSource messageSource;
    @Autowired
    private SearchRepository searchRepository;
    @Autowired
    PortFolioRepository portFolioRepository;
    @Autowired
    PostRepository postRepository;
    @Autowired
    PostCategoryRepository   postCategoryRepository;
    @Autowired
    PostTagRepository postTagRepository;
    @Autowired
    CommentRepository commentRepository;
   /* @Autowired
    private ActSearchRepository actSearchRepository;
    @Autowired
    private PartSearchRepository partSearchRepository;
    @Autowired
    private ChapterSearchRepository chapterSearchRepository;
    @Autowired
    private SectionSearchRepository sectionSearchRepository;
    @Autowired
    private AdvancedSearchRepository advancedSearchRepository;
    @Autowired
    private NewsRepository newsRepository;*/
    @Autowired
    VerifyRecaptcha verifyRecaptcha;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);


    }


    @RequestMapping(value = {"", "/", "index.html"}, method = RequestMethod.GET)
    public String indexPage(Model model, Locale locale, HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        model.addAttribute("page", "home");


        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        List<Portfolio> portfolioList=portFolioRepository.findAllByOrderByTitleAsc();
        model.addAttribute("portfolioList",portfolioList);

        List<Post> PostList=postRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("PostList",PostList);
        return "website/index";
    }


    @RequestMapping(value = {"about.html"}, method = RequestMethod.GET)
    public String about(Model model, Locale locale, HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        model.addAttribute("page", "about");


        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));


        return "website/index";
    }
    @RequestMapping(value = {"services.html"}, method = RequestMethod.GET)
    public String services(Model model, Locale locale, HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        model.addAttribute("page", "services");


        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));


        return "website/index";
    }

    @RequestMapping(value = {"portfolio.html"}, method = RequestMethod.GET)
    public String portfolio(Model model, Locale locale, HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        model.addAttribute("page", "portfolio");


        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));
        List<Portfolio> portfolioList=portFolioRepository.findAllByOrderByTitleAsc();
        model.addAttribute("portfolioList",portfolioList);

        return "website/index";
    }
    @RequestMapping(value = {"/blog-home.html"}, method = RequestMethod.GET)
    public String bloghome(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page, HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Post postsingle=postRepository.findLastPost();
        model.addAttribute("postsingle",postsingle);

        Integer size = 1;

        Page<?> results = null;

        if (page == null || page < 1) {
            page = 0;
        } else {
            page = page - 1;
        }
        Pageable pageable = new PageRequest(page, size);
        results = postRepository.findAllByOrderByIdDesc(pageable);
        model.addAttribute("p", page + 1);
        model.addAttribute("s", size);
        model.addAttribute("PostList", results);

        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);
        List<PostCategory> postCategoriestop=postCategoryRepository.findAllByOrderByOrderNoAscLim();
        model.addAttribute("postCategoriestop",postCategoriestop);
        List<Date> postyear=postRepository.findAllPopularPostByYear();
        model.addAttribute("postyear",postyear);

        model.addAttribute("page", "blog-home");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/blogby-category-{id}.html"}, method = RequestMethod.GET)
    public String blogbycategory(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page, @PathVariable("id") Integer id,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Integer size = 1;

        Page<?> results = null;

        if (page == null || page < 1) {
            page = 0;
        } else {
            page = page - 1;
        }
        Pageable pageable = new PageRequest(page, size);
        results = postRepository.findAllByCategory(id,pageable);
        model.addAttribute("catId",id);
        model.addAttribute("p", page + 1);
        model.addAttribute("s", size);
        model.addAttribute("PostList", results);
        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);
        List<Date> postyear=postRepository.findAllPopularPostByYear();
        model.addAttribute("postyear",postyear);

        model.addAttribute("page", "blogby-category");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/blogby-tag-{id}.html"}, method = RequestMethod.GET)
    public String blogbytag(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page, @PathVariable("id") Integer id,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Integer size = 1;

        Page<?> results = null;

        if (page == null || page < 1) {
            page = 0;
        } else {
            page = page - 1;
        }
        Pageable pageable = new PageRequest(page, size);
        results = postRepository.findAllByTag(id,pageable);
        model.addAttribute("tagId",id);
        model.addAttribute("p", page + 1);
        model.addAttribute("s", size);
        model.addAttribute("PostList", results);
        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);
        List<Date> postyear=postRepository.findAllPopularPostByYear();
        model.addAttribute("postyear",postyear);

        model.addAttribute("page", "blogby-tag");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/blog-single-{id}.html"}, method = RequestMethod.GET)
    public String blogsingleviewmore(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page, @PathVariable("id") Integer id,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Comment comment = new Comment();
        model.addAttribute("comment", comment);

        Post postsingle=postRepository.findOne(id);
        model.addAttribute("postsingle",postsingle);
        model.addAttribute("view",hitRepository.findAllByUrl("/blog-single-"+id+".html"));
        List<Comment> comments= commentRepository.getAllCommentByStatus(id);
        model.addAttribute("comments",comments);
        if(id!=0)
        {
            Post previouspost=postRepository.findPreviousPost(postsingle.getCreatedAt());
            model.addAttribute("previouspost",previouspost);
        }

        Post postLast=postRepository.getNewPost();
        if(id!=postLast.getId() && id<postLast.getId())
        {
            Post nextpost=postRepository.findNextPost(postsingle.getCreatedAt());
            model.addAttribute("nextpost",nextpost);
        }

        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);
        List<Date> postyear=postRepository.findAllPopularPostByYear();
        model.addAttribute("postyear",postyear);

        model.addAttribute("page", "blog-single");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/comment-review.html"}, method = RequestMethod.GET)
    public String commentreview(Model model, @RequestParam("id") Integer id, Locale locale,HttpServletRequest request) {
        model.addAttribute("page", "comment-review");
        model.addAttribute("id", id);
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));
        return "website/index";
    }




    @RequestMapping(value = {"/comment-{id}.html"}, method = RequestMethod.POST)
    public String  blogcomment(ModelMap model, Locale locale, @Valid @ModelAttribute("comment") Comment comment, @PathVariable("id") Integer id, HttpServletRequest request) {
        //hitLogger(request);
        //model.addAttribute("totalHits", hitRepository.count());
        Post postsingle=postRepository.findOne(id);


        comment.setPostId(postsingle);
        comment.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        comment.setCreatedAt(new Date());
        commentRepository.save(comment);
        model.addAttribute("id", id);
        //model.addAttribute("page", "comment-review");
        //model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        //model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        //model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));
         //return "website/pages/comment-review";
        return "redirect:/comment-review.html";
    }


    @RequestMapping(value = {"/search.html"}, method = RequestMethod.GET)
    public String blogsearch(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page,@RequestParam(name = "search", required = false) String search,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Integer size = 1;

        Page<?> results = null;

        if (page == null || page < 1) {
            page = 0;
        } else {
            page = page - 1;
        }
        if (search != null) {
            search = Jsoup.parse(search).text();
        }
        Pageable pageable = new PageRequest(page, size);
        results = postRepository.findAllByString(search,pageable);
     //   model.addAttribute("tagId",id);
        model.addAttribute("p", page + 1);
        model.addAttribute("s", size);
        model.addAttribute("PostList", results);
        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);
        List<Date> postyear=postRepository.findAllPopularPostByYear();
        model.addAttribute("postyear",postyear);

        model.addAttribute("page", "blogby-search");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/blogby-year.html"}, method = RequestMethod.GET)
    public String blogbyyear(Model model, Locale locale, @RequestParam(name = "page", required = false) Integer page,@RequestParam(name = "year", required = false) String year,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        Integer size = 1;

        Page<?> results = null;

        if (page == null || page < 1) {
            page = 0;
        } else {
            page = page - 1;
        }
        /*if (year!= null) {
            year = year;
        }
       */ Pageable pageable = new PageRequest(page, size);
        results = postRepository.findAllByStringYear(year,pageable);
        //   model.addAttribute("tagId",id);
        model.addAttribute("p", page + 1);
        model.addAttribute("s", size);
        model.addAttribute("PostList", results);
        List<Post> PopularPostList=postRepository.findAllPopularPost();
        model.addAttribute("popularPostList",PopularPostList);
        List<PostCategory> postCategories=postCategoryRepository.findAllByOrderByOrderNoAsc();
        model.addAttribute("postCategories",postCategories);
        List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        model.addAttribute("postTags",postTags);

        model.addAttribute("page", "blogby-year");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "website/index";
    }

    @RequestMapping(value = {"/contact.html"}, method = RequestMethod.GET)
    public String contact(Model model, Locale locale,HttpServletRequest request) {
        hitLogger(request);
        model.addAttribute("totalHits", hitRepository.count());

        FeedBack feedBack = new FeedBack();
        model.addAttribute("feedBack", feedBack);
        model.addAttribute("page", "contact");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));
        return "website/index";
    }

    @RequestMapping(value = {"/feedback-review.html"}, method = RequestMethod.GET)
    public String feedbackreview(Model model, Locale locale,HttpServletRequest request) {
        model.addAttribute("page", "feedback-review");
        model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));
        return "website/index";
    }


    @RequestMapping(value = {"/mcontact.html"}, method = RequestMethod.POST)
    public String saveContactMe(Model model, Locale locale, @Valid @ModelAttribute("feedBack") FeedBack feedBack, BindingResult result, HttpServletRequest request) {

       // hitLogger(request);
        //model.addAttribute("totalHits", hitRepository.count());

        feedBackValidator.validate(feedBack, result);
        if (result.hasErrors()) {
            return "redirect:/mcontact.html?error";
        }
        feedBack.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        feedBack.setCreatedAt(new Date());
        feedBackRepository.save(feedBack);
        //model.addAttribute("page", "comment-review");
        //model.addAttribute("metaTitle", messageSource.getMessage("website.meta.title", null, locale));
        //model.addAttribute("metaDescription", messageSource.getMessage("website.meta.description", null, locale));
        //model.addAttribute("metaKeywords", messageSource.getMessage("website.meta.keywords", null, locale));

        return "redirect:/feedback-review.html";
    }


    @RequestMapping(value="/like", method=RequestMethod.GET,produces = "application/json")
    public @ResponseBody Integer likePage(@RequestParam("postId") int postId)
    {
        System.out.println("Prod ID:  " + postId);

        System.out.println("Prod ID:  " + postId);
        Post post= postRepository.findOne(postId);
        post.setLove(post.getLove()+1);
        postRepository.save(post);
        //DB insert and modification and return result code, just a sample here
        //to be processed by jquery
        //int res = productService.insertProductLike(productId);
        //if(res>0)
        return postRepository.findOne(postId).getLove();
        //else
        //  return false;
    }


  }

