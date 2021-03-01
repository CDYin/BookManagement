package com.wy.ks.management.Bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Book {
    private String ID;
    private String name;
    private String author;
    private String price;

    @Override
    public String toString() {
        return "Book{" +
                "ID='" + ID + '\'' +
                ", name='" + name + '\'' +
                ", author='" + author + '\'' +
                ", price='" + price + '\'' +
                '}';
    }

//    public String getID() {
//        return ID;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public String getAuthor() {
//        return author;
//    }
//
//    public String getPrice() {
//        return price;
//    }
//
//    public void setID(String ID) {
//        this.ID = ID;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public void setAuthor(String author) {
//        this.author = author;
//    }
//
//    public void setPrice(String price) {
//        this.price = price;
//    }
}
