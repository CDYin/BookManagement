package com.wy.ks.management.daoimpl;

import com.wy.ks.management.Bean.Book;
import com.wy.ks.management.dao.IBookDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookDaoImpl {
    @Autowired
    IBookDao iBookDao;

    public Book getOneBookInfo(String ID){
        return iBookDao.getOneBookInfo(ID);
    }

    public boolean addBook(Book book) {
        return iBookDao.addBook(book)>0;
    }

    public boolean deletBook(Book book) {
        return iBookDao.deletBook(book)>0;
    }
}
