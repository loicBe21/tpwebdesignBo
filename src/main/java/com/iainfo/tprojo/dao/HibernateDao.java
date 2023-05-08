package com.iainfo.tprojo.dao;

import com.iainfo.tprojo.model.Article;
import com.iainfo.tprojo.util.Helper;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class HibernateDao {

    @Autowired
    private SessionFactory sessionFactory ;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Integer getSizeResult(String sql , Class<?> clazz , Session session) throws Exception {
        //Session session = sessionFactory.openSession();
        int val =  session.createSQLQuery(sql).addEntity(clazz).list().size();
        return val;
    }

    public HashMap homeData(int elementPerPages , int numPages) throws Exception {
        Session session = sessionFactory.openSession();
        HashMap<String , Object> bigData = new HashMap<String,Object>();
        int length = getSizeResult("SELECT * from v_home", Article.class , session);
        int offset =(numPages-1)*elementPerPages;
        int pages = Helper.pagesCount(length,elementPerPages);
        String sql = "SELECT * FROM v_home ORDER BY id DESC OFFSET "+offset+" LIMIT "+ elementPerPages;
        List<Article> data = session.createSQLQuery(sql).addEntity(Article.class).list();
        session.close();
        bigData.put("data",data);
        bigData.put("pages",pages);
        return bigData;
    }

    public HashMap byCategorie(int elementPerPages , int categorie_id ,  int numPages) throws Exception {
        Session session = sessionFactory.openSession();
        HashMap<String , Object> bigData = new HashMap<String,Object>();
        int length = getSizeResult("SELECT * from v_home WHERE idcategorie="+categorie_id, Article.class , session);
        int offset =(numPages-1)*elementPerPages;
        int pages = Helper.pagesCount(length,elementPerPages);
        String sql = "SELECT * FROM v_home WHERE idcategorie= "+categorie_id+" OFFSET "+offset+" LIMIT "+ elementPerPages;
        List<Article> data = session.createSQLQuery(sql).addEntity(Article.class).list();
        session.close();
        bigData.put("data",data);
        bigData.put("pages",pages);
        return bigData;
    }

    public <T> T findById(Class<T> clazz, Serializable id){
        Session session = sessionFactory.openSession();
        T entity = (T) session.get(clazz, id);
        session.close();
        return entity;
    }


    public <T> List<T> findAll(Class<T> tClass){
        Session session = sessionFactory.openSession();
        List<T> results = session.createCriteria(tClass).list();
        session.close();
        return results;
    }
}
