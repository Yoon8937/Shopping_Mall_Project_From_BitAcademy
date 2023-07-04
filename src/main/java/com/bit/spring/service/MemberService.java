package com.bit.spring.service;

import com.bit.spring.model.MemberCustomDetails;
import com.bit.spring.model.MemberDTO;
import com.bit.spring.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class MemberService implements UserDetailsService {
    private final String NAMESPACE = "mapper.MemberMapper";
    private SqlSession session;
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public MemberService(SqlSession session, BCryptPasswordEncoder passwordEncoder) {
        this.session = session;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String s) throws UsernameNotFoundException {
        MemberDTO memberDTO = session.selectOne(NAMESPACE+".validate", s);
        System.out.println("memberDTO = " + memberDTO+" by MemberService method");
        if(memberDTO != null){
            return new MemberCustomDetails(memberDTO);
        }
        return null;
    }

    public boolean validate(String attempt){
        MemberDTO memberDTO = session.selectOne(NAMESPACE+".validate",attempt);
        if(memberDTO == null){//if it doesnt exist
             return false;
        } else {
            return true;
        }
    }

    public void register(MemberDTO memberDTO) {
        session.insert(NAMESPACE+".register",memberDTO);
    }

//    public void insertImg(Product product){
//        session.insert("mapper.ImgMapper."+"insertImg", product);
//    }

}
