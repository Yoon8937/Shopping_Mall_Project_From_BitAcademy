package com.bit.spring.controller;

import com.bit.spring.model.MemberDTO;
import com.bit.spring.service.MemberService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.crypto.RsaKeyConversionServicePostProcessor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
    private MemberService memberService;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;


//    private SqlSession session; //테스트임

    @Autowired
    public MemberController(MemberService memberService){
        this.memberService = memberService;
//        this.session = session; //테스트 지우기 나중에
    }

    @RequestMapping("login")
    public String login(Model model){
//        System.out.println("num = " + num);
//        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
//        String AfterNum = bCryptPasswordEncoder.encode(num);
//        System.out.println("AfterNum = " + AfterNum);

        String str = "12345";
        String encodingStr = passwordEncoder.encode(str);
        boolean result = passwordEncoder.matches(str,encodingStr);
//        System.out.println("result = " + result);

//        사진 불러오기
//        String imgStr = session.selectOne("mapper.ImgMapper."+"getimg");
//        model.addAttribute("imgStr", imgStr);



        return "/member/login";
    }



    @RequestMapping("auth")
    public void auth(){

    }

    @RequestMapping("logout")
    public String logout(){
        return "member/index";
    }

    @GetMapping("register")
    public String showRegisterPage(){
        return "/member/register";
    }

    @PostMapping("register")
    public String register(MemberDTO memberDTO) {
        System.out.println("memberDTO = " + memberDTO);
        System.out.println(memberDTO.getRank());
        boolean isExist = memberService.validate(memberDTO.getUsername());
        memberDTO.setPassword(passwordEncoder.encode(memberDTO.getPassword()));
        if(isExist == false){
            memberService.register(memberDTO);
            return "redirect:/member/login";
//            return "/member/login";//이건 왜 이캐 되노
        } else {
            System.out.println("이미 존재하는 아이디입니다.");
            return "/member/register";
        }
    }

    @RequestMapping("admin")
//    @PreAuthorize("hasRole('관리자')")
    public String admin(){

        return "/member/admin";
    }

}
