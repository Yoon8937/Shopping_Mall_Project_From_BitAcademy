package com.bit.spring.service;

import com.bit.spring.controller.CartController;
import com.bit.spring.model.CartDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import javax.print.attribute.standard.MediaSize;
import java.util.List;

@Service
public class CartService {
    private final String NAMESPACE = "mapper.CartMapper";
    private SqlSession session;

    @Autowired
    public CartService(SqlSession session){
        this.session = session;
    }

    public void insert(CartDTO cartDTO) {
        session.insert(NAMESPACE+".insert", cartDTO);
    }

//    public int isExist(CartDTO cartDTO){
    public CartDTO isExist(CartDTO cartDTO){
        return session.selectOne(NAMESPACE+".isExist",cartDTO);
    }

    public int getQuantity(CartDTO cartDTO){
        return session.selectOne(NAMESPACE+".getQuantity", cartDTO);
    }

    public void updateQuantity(CartDTO cartDTO){
        session.update(NAMESPACE+".updateQuantity", cartDTO);
    }

    public List<CartDTO> showAllCart(int id){

        return session.selectList(NAMESPACE+".showAllCart",id);
    }

    public void deleteProduct(CartDTO cartDTO){
        session.delete(NAMESPACE+".deleteProduct", cartDTO);
    }

    public void checkout(int id) {
        session.delete(NAMESPACE+".checkout", id);
    }
}
