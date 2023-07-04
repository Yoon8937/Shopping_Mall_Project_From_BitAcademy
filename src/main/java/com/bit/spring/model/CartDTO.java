package com.bit.spring.model;

import lombok.Data;

@Data
public class CartDTO {

    private int id;
    private int productId;
    private int memberId;
    private int price;
    private int quantity;

    private String productName;
    private int originalPrice;
    private String img;


}
