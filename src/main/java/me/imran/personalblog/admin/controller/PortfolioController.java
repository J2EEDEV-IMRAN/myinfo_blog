package me.imran.personalblog.admin.controller;

import com.fasterxml.jackson.annotation.JsonView;
import me.imran.personalblog.admin.model.Portfolio;
import me.imran.personalblog.admin.repository.PortfolioDataTableRepository;
import me.imran.personalblog.admin.validator.PortFolioValidator;
import me.imran.personalblog.admin.repository.PortFolioRepository;
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
 * Created by imran hossain on 12/22/16.
 */

@Controller
@RequestMapping({"/admin/Portfolio", "/admin/portfolio"})
public class PortfolioController extends MyBaseController {

    private static final Logger logger = LoggerFactory.getLogger(PortfolioController.class);

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        StringTrimmerEditor stringtrimmer = new StringTrimmerEditor(true);
        binder.registerCustomEditor(String.class, stringtrimmer);
    }

    @Autowired
    PortFolioRepository portFolioRepository;
    @Autowired
    PortfolioDataTableRepository portfolioDataTableRepository;


    /*AUTOWIRED_EXTRA_REPOSITORY*/
    @Autowired
    PortFolioValidator portFolioValidator;

    @RequestMapping(value = {"", "/index"}, method = RequestMethod.GET)
    public String index(Model model) {
        return "admin/pages/Portfolio/datatable";
    }

    @RequestMapping(value = {"/create", "/create/*"}, method = RequestMethod.GET)
    public String create(Model model, HttpServletRequest request) {
       // List<PostTag> postTags=postTagRepository.findAllByOrderByIdAsc();
        Portfolio portfolio = new Portfolio();
        model.addAttribute("portfolio", portfolio);

        model.addAttribute("action", "/create");
        /*EXTA_PARAMETER*/
        return "admin/pages/Portfolio/create";
    }


    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String save(Model model, @Valid @ModelAttribute("portFolio") Portfolio portfolio, @RequestParam("portFolioImageFile") MultipartFile portFolioImageFile, BindingResult result, HttpServletRequest request) {

        portFolioValidator.validate(portfolio, result);
        if (result.hasErrors()) {
            model.addAttribute("portfolio", portfolio);
            model.addAttribute("action", "/create");
            /*EXTA_PARAMETER*/
            return "admin/pages/PortFolio/create";
        }
        String portFolioImage = uploadFile(portFolioImageFile);
        portfolio.setPortFolioImage(null);
        if (portFolioImage == null) {
            portfolio.setPortFolioImage(null);
        } else {
            portfolio.setPortFolioImage(portFolioImage);
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        portfolio.setCreatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        portfolio.setCreatedAt(new Date());
        portFolioRepository.save(portfolio);
        portfolio = portFolioRepository.getNewPortfolio();
        model.addAttribute("portfolio", portfolio);
        return "admin/pages/Portfolio/details";
        //return "redirect:/admin/volume";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {


        Portfolio portfolio = portFolioRepository.findOne(id);

        model.addAttribute("portfolio", portfolio);
        model.addAttribute("action", "/edit/" + id);
        /*EXTA_PARAMETER*/
        return "admin/pages/Portfolio/create";
    }


    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String update(@PathVariable("id") Integer id, Model model, @Valid @ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFolioImageFile") MultipartFile portFolioImageFile, BindingResult result, HttpServletRequest request) {

        Portfolio portfolioOld = portFolioRepository.findOne(id);
        portFolioValidator.validate(portfolio, result);
        if (result.hasErrors()) {
            model.addAttribute("portfolio", portfolio);
            model.addAttribute("action", "/edit/" + id);
            /*EXTA_PARAMETER*/
            return "admin/pages/Portfolio/create";
        }
        /*SET_NULL_TO_FOREIN_KEY*/
        String portFolioImage = uploadFile(portFolioImageFile);
        portfolio.setPortFolioImage(null);
        if (portFolioImage == null) {
            portfolio.setPortFolioImage(portfolioOld.getPortFolioImage());
        } else {
            portfolio.setPortFolioImage(portFolioImage);
        }
        portfolio.setCreatedBy(portfolioOld.getCreatedBy());
        portfolio.setCreatedAt(portfolioOld.getCreatedAt());

        portfolio.setUpdatedBy(SecurityContextHolder.getContext().getAuthentication().getName());
        portfolio.setUpdatedAt(new Date());

        portFolioRepository.save(portfolio);
        return "redirect:/admin/Portfolio";
    }


    @RequestMapping(value = "/details/{id}", method = RequestMethod.GET)
    public String details(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {
        Portfolio portfolio = portFolioRepository.findOne(id);
        model.addAttribute("portfolio", portfolio);
        return "admin/pages/Portfolio/details";
    }



    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> delete(@PathVariable("id") Integer id, Model model) {
        portFolioRepository.delete(id);
        Map<String, Object> response = new HashMap();

        response.put("success", true);
        response.put("message", "You have successfully deleted the record");
        return response;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Portfolio getById(@PathVariable("id") Integer id, Model model) {
        Portfolio portfolio = portFolioRepository.findOne(id);
        return portfolio;
    }


    @RequestMapping(value = "/dataApi", method = RequestMethod.GET)
    @ResponseBody
    public List<Portfolio> data() {
        return portFolioRepository.findAll();
    }

    @JsonView(DataTablesOutput.View.class)
    @ResponseBody
    @RequestMapping(value = "/data", method = RequestMethod.POST, headers = "Accept=application/json")
    public DataTablesOutput<Portfolio> getVolumes(@Valid @RequestBody DataTablesInput input) {

        return portfolioDataTableRepository.findAll(input);
    }

    @RequestMapping(value = "/newDetails")
    public String newDetails(Model model) {
        model.addAttribute("newDetails", portFolioRepository.getNewPortfolio());
        return "admin/pages/Portfolio/newDetails";
    }

}
