package com.wy.ks.management.dao;

import com.wy.ks.management.Bean.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class IBookDao {
    private JdbcTemplate jdbcTemplate;
    private final String ADD_BOOK = "INSERT INTO book VALUES(?,?,?,?)";
    private final String GET_ONE_BOOK_INFO = "SELECT * FROM book WHERE ID=?";
    private final String DELETE_ONE_BOOK = "DELETE FROM book where ID=?";

    @Autowired
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate=jdbcTemplate;
    }

    public Book getOneBookInfo(String ID){
        final Book book = new Book();
        jdbcTemplate.query(GET_ONE_BOOK_INFO,new Object[]{ID}, new RowCallbackHandler() {
            @Override
            public void processRow(ResultSet resultSet) throws SQLException {
                    book.setID(resultSet.getString("ID"));
                    book.setName(resultSet.getString("name"));
                    book.setAuthor(resultSet.getString("author"));
                    book.setPrice(resultSet.getString("price"));
            }
        });
        return book;
    }

    public int addBook(Book book) {
        String ID = book.getID();
        String name = book.getName();
        String author = book.getAuthor();
        String price = book.getPrice();
        return jdbcTemplate.update(ADD_BOOK,new Object[]{ID,name,author,price});
    }

    public int deletBook(Book book) {
        String ID = book.getID();
        return jdbcTemplate.update(DELETE_ONE_BOOK,ID);
    }
}
