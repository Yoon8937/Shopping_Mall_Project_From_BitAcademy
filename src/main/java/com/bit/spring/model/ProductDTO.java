package com.bit.spring.model;

import lombok.Data;

import java.sql.Date;

@Data
public class ProductDTO {
    private int id;
    private int sellerId;
    private String name;
    private int price;
    private int quantity;
    private String info;
    private Date register_date;

    private String img1;
    private String img2;
    private String img3;
}
