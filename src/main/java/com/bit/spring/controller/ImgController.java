package com.bit.spring.controller;

import com.bit.spring.model.Product;
import com.bit.spring.model.ProductDTO;
import com.bit.spring.service.MemberService;
import com.bit.spring.service.ProductService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

//import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.commons.codec.binary.Base64;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ImgController {
//    @Autowired
//    private StudyDao dao;


    /**
     * 파일태그를 위한 폼태그
     * @return
     */
    @RequestMapping(value="/image")
    public String formFile() {
        return "/image/image";
    }


    /**
     * 파일처리 컨트롤러
     * @param
     * * @return
     */


//    @RequestMapping(value="/product-registration", method = RequestMethod.POST)
    @RequestMapping(value="/saveImage",  method = RequestMethod.POST)
    public String insertProductInfo(@ModelAttribute Product productInfo, @RequestParam(value="imgFile",required=false) MultipartFile file, Model model) {
        productInfo.setUploadFile(file);

        try{
            byte[] image = Base64.encodeBase64(productInfo.getUploadFile().getBytes());
            String result = new String(image);
//            System.out.println(result+"무야호");
//            productInfo.setProductImg(image);

            insertImg(result);

            model.addAttribute("imgStr",result);

            int num = 2;
            ProductDTO p = test(num);
            model.addAttribute("productDTO",p);



            return "/image/result";
        } catch(Exception e) {
            e.printStackTrace();
        }



//        return "redirect:/result";
        return "/image/result";
    }

    public ProductDTO test(int num){
        return session.selectOne("mapper.ProductMapper"+".selectOneProdcut", num);
    }


    public void insertImg(String str){
        session.insert("mapper.ImgMapper."+"insertImg", str);
    }

    private SqlSession session;

    @Autowired
    public ImgController(SqlSession session) {
        this.session = session;
    }

//    @RequestMapping("result")
//    public String result(){
//        ModelAndView mav = new ModelAndView();
//        mav.addObject()
//
//        return "/image/result";
//    }

//    @RequestMapping(value="/saveImage")
//    public String saveImage(@ModelAttribute Product , @RequestParam(value="imgFile", required=false) MultipartFile multipartFile) throws Exception{

//        System.out.println("tlqkf : " + multipartFile.getBytes());
//        productInfo.setUploadFile(file);



//        try {
//            Map<String, Object> hmap = new HashMap<String, Object>();
//            hmap.put("img", vo.getImgFile().getBytes());
//            System.out.println("vo.getImgFile().getBytes() = " + vo.getImgFile().getBytes());
//            dao.saveImage(hmap);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return "redirect:/image";
//        return "";
//    }


}

