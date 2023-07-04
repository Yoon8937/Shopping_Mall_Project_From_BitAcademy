package com.bit.spring.controller;

import com.bit.spring.model.CartDTO;
import com.bit.spring.model.MemberDTO;
import com.bit.spring.model.ProductDTO;
import com.bit.spring.service.CartService;
import com.bit.spring.service.ProductService;
import com.google.gson.JsonObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.Port;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.MembershipKey;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
public class CartController {


    CartService cartService;
    ProductService productService;

    @Autowired
    public CartController(CartService cartService, ProductService productService){
        this.cartService = cartService;
        this.productService = productService;
    }


    @PostMapping("/product/cart")
    public String showCart(HttpSession session, CartDTO cartDTO, Model model){
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        cartDTO.setMemberId(logIn.getId());

        CartDTO result = cartService.isExist(cartDTO);
        System.out.println("result = " + result);

        if(result == null){
            System.out.println(" 장바구니에 존재하지 않습니다. " );
            cartDTO.setPrice(cartDTO.getPrice() * cartDTO.getQuantity());
            cartService.insert(cartDTO);

        } else {//이미 존재함
            int quantity = cartService.getQuantity(cartDTO);
            quantity += cartDTO.getQuantity();
            cartDTO.setQuantity(quantity);
            cartDTO.setPrice(cartDTO.getPrice() * cartDTO.getQuantity());

            cartService.updateQuantity(cartDTO);
        }

        int total = 0;

//        현재 로그인한 회원의 모든 제품을 풀러서 리스트에 저장한다.
        List<CartDTO> cartList = cartService.showAllCart(logIn.getId());
        for(int i=0;i<cartList.size();i++){
            System.out.println("cartList.get(i) = " + cartList.get(i));
            ProductDTO tmp = productService.some(cartList.get(i).getProductId());

            cartList.get(i).setProductName(tmp.getName());
            cartList.get(i).setOriginalPrice(tmp.getPrice());
            cartList.get(i).setImg(tmp.getImg1());
            total += cartList.get(i).getPrice();

        }

        model.addAttribute("cartList", cartList);
        model.addAttribute("total", total);


        return "/product/cart";
    }


    @GetMapping("/product/deleteCart")
    public void deleteProduct(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        JsonObject obj = new JsonObject();
        String status = "";

        try {
            MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
            int memberId = logIn.getId();
            System.out.println("memberId = " + memberId);
            int productId = Integer.parseInt(request.getParameter("productId"));
            System.out.println("productId = " + productId);

            CartDTO c = new CartDTO();
            c.setMemberId(memberId);
            c.setProductId(productId);

            cartService.deleteProduct(c);
            status = "success";

        } catch (Exception e){
            status = "fail";
            e.printStackTrace();
        }

        obj.addProperty("status",status);
        writer.print(obj);
    }

    @GetMapping("/product/updatePrice")
    public void updatePrice(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter writer = response.getWriter();

        JsonObject obj = new JsonObject();
        String status = "";

        try{
            int cartId = Integer.parseInt(request.getParameter("cartId"));
            int originalPrice = Integer.parseInt(request.getParameter("originalPrice"));
            int productId = Integer.parseInt(request.getParameter("productId"));
            int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));


        }catch (Exception e){
            e.printStackTrace();
        }
    }


    @PostMapping("/product/checkout")
    public String checkout(HttpSession session){
        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
        cartService.checkout(logIn.getId());

        return "redirect:/";
    }





}

















