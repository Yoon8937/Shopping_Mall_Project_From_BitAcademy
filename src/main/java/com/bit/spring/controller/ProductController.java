package com.bit.spring.controller;

import com.bit.spring.model.MemberCustomDetails;
import com.bit.spring.model.MemberDTO;
import com.bit.spring.model.Product;
import com.bit.spring.model.ProductDTO;
import com.bit.spring.service.MemberService;
import com.bit.spring.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
//@RequestMapping("/product")
public class ProductController {

    ProductService productService;

    @Autowired
    public ProductController(ProductService productService){
        this.productService = productService;
    }

    @GetMapping("/product/showAll/{pageNo}")
    public String showAll(Authentication authentication, Model model, @PathVariable int pageNo){

        model.addAttribute("list", productService.selectAll(pageNo));
        model.addAttribute("paging", setPage(pageNo, productService.selectLastPage()));
        model.addAttribute("pagingAddr", "/product/showAll");

        return "/product/showAll";
    }

    private HashMap setPage(int pageNo, int totalPage){
        HashMap<String, Integer> paging = new HashMap();
        int start = 0;
        int end = 0;

        if (totalPage < 5) {
            start = 1;
            end = totalPage;
        } else if (pageNo < 3) {
            start = 1;
            end = 5;
        } else if (pageNo > totalPage - 3) {
            start = totalPage - 4;
            end = totalPage;
        } else {
            start = pageNo - 2;
            end = pageNo + 2;
        }

        paging.put("start", start);
        paging.put("end", end);
        paging.put("totalPage", totalPage);
        paging.put("current", pageNo);

        return paging;
    }

    @GetMapping("/product/showOne/{id}")
    public String showOne(HttpSession session, RedirectAttributes redirectAttributes, Model model, @PathVariable int id){
//        if(session.getAttribute("logIn") == null){
//            redirectAttributes.addFlashAttribute("message", "다시 로그인 해주세요");
//            return "redirect:/member/login";
//        }
//
//        ProductDTO p = productService.selectOne(id);
//        if(p == null) {
//            redirectAttributes.addFlashAttribute("message", "존재하지 않은 글입니다.");
//            return "redirect:/product/showAll/1";
//        }

        ProductDTO p = productService.selectOne(id);
        model.addAttribute("result",p);

//        흠으으으으으ㅡ으음
//        int logInId = ((MemberDTO)session.getAttribute("logIn")).getId();
//        model.addAttribute("logInId", logInId);

        return "/product/showOne";

    }

    @GetMapping("/product/register")
    public String showProduct(){

        return "/product/register";
    }

//    @PostMapping("/register")
    @RequestMapping(value="/product/register",  method = RequestMethod.POST)
    public void registerProduct(HttpSession session, String name, String price, String quantity, String info, @ModelAttribute Product productInfo,
                                @RequestParam(value="imgFile1", required=false) MultipartFile file1,
                                @RequestParam(value="imgFile2", required=false) MultipartFile file2,
                                @RequestParam(value="imgFile3", required=false) MultipartFile file3) {

        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");

        ProductDTO productDTO = new ProductDTO();
        productDTO.setSellerId(logIn.getId());
        productDTO.setName(name);
        productDTO.setPrice(Integer.parseInt(price));
        productDTO.setQuantity(Integer.parseInt(quantity));
        productDTO.setInfo(info);



        try{
            productInfo.setUploadFile(file1);
            byte[] image = Base64.encodeBase64(productInfo.getUploadFile().getBytes());
             productDTO.setImg1(new String(image));

            productInfo.setUploadFile(file2);
            image = Base64.encodeBase64(productInfo.getUploadFile().getBytes());
            productDTO.setImg2(new String(image));


            productInfo.setUploadFile(file3);
            image = Base64.encodeBase64(productInfo.getUploadFile().getBytes());
            productDTO.setImg3(new String(image));

            productService.register(productDTO);



        } catch (Exception e){
            e.printStackTrace();
        }
    }




//    @PostMapping("/product/cart")
//    public String showCart(){
//
//        return "/product/cart";
//    }



}
