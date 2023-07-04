package com.bit.spring.model;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
public class Product implements Serializable{
    private byte[] ProductImg;

    private MultipartFile UploadFile;

    private String Base64Img;
}