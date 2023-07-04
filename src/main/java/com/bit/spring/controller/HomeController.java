package com.bit.spring.controller;

import com.bit.spring.model.MemberDTO;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String showIndex(Authentication authentication, Model model, HttpSession session){
//        System.out.println("authentication.getName() = " + authentication.getName());
//        MemberDTO logIn = (MemberDTO) session.getAttribute("logIn");
//        model.addAttribute("logIn", logIn);

//        return "member/index";
        return "redirect:/product/showAll/1";
    }


}
