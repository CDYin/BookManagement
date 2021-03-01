package com.wy.ks.management.Controller;

import com.alibaba.fastjson.JSON;
import com.wy.ks.management.Bean.Book;
import com.wy.ks.management.daoimpl.BookDaoImpl;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
@Slf4j
@RestController
public class BookController {

//    private final Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    BookDaoImpl bookDao;

    @RequestMapping("/Book_info")
    public Object bookInfo(HttpServletRequest request){
        String ID = request.getParameter("ID");
        Book book = bookDao.getOneBookInfo(ID);
        return JSON.toJSON(book);
    }
    @RequestMapping("/bookadd")
    public Object bookAdd(HttpServletRequest request, @ModelAttribute Book book){


        log.info(book.toString());
//        book.setID(request.getParameter("ID"));
//        book.setName(request.getParameter("name"));
//        book.setAuthor(request.getParameter("author"));
//        book.setPrice(request.getParameter("price"));
        return bookDao.addBook(book);
    }
    @RequestMapping("/bookdelete")
    public  Object bookDelete(HttpServletRequest request,@ModelAttribute Book book){
        book.setID(request.getParameter("ID"));
        return bookDao.deletBook(book);
    }
}
