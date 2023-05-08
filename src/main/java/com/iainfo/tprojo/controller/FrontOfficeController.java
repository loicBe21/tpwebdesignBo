package com.iainfo.tprojo.controller;


import com.iainfo.tprojo.dao.HibernateDao;
import com.iainfo.tprojo.model.Article;
import com.iainfo.tprojo.model.Categorie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;

@Controller
public class FrontOfficeController {


    @Autowired
    private HibernateDao hibernateDao ;

    public HibernateDao getHibernateDao() {
        return hibernateDao;
    }

    public void setHibernateDao(HibernateDao hibernateDao) {
        this.hibernateDao = hibernateDao;
    }


    public ModelAndView showListe(HashMap hashMap , List<Categorie> categories , String name) throws Exception {
        ModelAndView modelAndView = new ModelAndView("frontOffice/home");
        if((name==null)||(name.isEmpty())){
            name = "ALL";
        }
        modelAndView.addObject("categories" , categories);
        modelAndView.addObject("data" , hashMap);
        modelAndView.addObject("filtre" , name);
        return modelAndView;
    }

    @GetMapping("/")
    public String load(){
        return "redirect:/allContents-1-inteligenceArtifial_actu.html";
    }

    @GetMapping("/home")
    public ModelAndView homePage(@RequestParam(name = "num" , defaultValue = "1") int num) throws Exception {
        HashMap hashMap = hibernateDao.homeData(8,num);
        List<Categorie> categories = hibernateDao.findAll(Categorie.class);
        return showListe(hashMap,categories , null);
    }

    @GetMapping("/byCategorie")
    public ModelAndView byCategorie(@RequestParam(name = "num" , defaultValue = "1") int num ,@RequestParam(name = "cat_id") int categorie_id  ,@RequestParam(name = "cat_name") String cat_name) throws Exception {
        HashMap hashMap = hibernateDao.byCategorie(8,categorie_id,num);
        List<Categorie> categories = hibernateDao.findAll(Categorie.class);
        return showListe(hashMap,categories , cat_name);
    }

    @GetMapping("/acticle/{id}")
    public ModelAndView fiche(@PathVariable Integer id , @RequestParam(name = "num") Integer num) throws Exception {
        ModelAndView modelAndView = new ModelAndView("frontOffice/ficheArticle");
        Article article = hibernateDao.findById(Article.class,id);
        modelAndView.addObject("curr_page" , num);
        modelAndView.addObject("data" , article);
        return modelAndView ;
    }
}
