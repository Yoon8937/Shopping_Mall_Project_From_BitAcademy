package com.bit.spring.service;

import com.bit.spring.model.CartDTO;
import com.bit.spring.model.ProductDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.sound.sampled.Port;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Handler;

@Service
public class ProductService {
    private final String NAMESPACE = "mapper.ProductMapper";
    private final int PAGE_SIZE = 12;
    private SqlSession session;

    @Autowired
    public ProductService(SqlSession session) {
        this.session = session;
    }

    public void register(ProductDTO productDTO){
        session.insert(NAMESPACE+".register", productDTO);
    }

    public ProductDTO selectOneTest(int num){
        return session.selectOne(NAMESPACE+".selectOneProdcut", num);
    }

    public List<ProductDTO> selectAll(int pageNo){
        HashMap<String, Integer> params = new HashMap<>();
        params.put("start", (pageNo-1)*PAGE_SIZE);
        params.put("size", PAGE_SIZE);

        return session.selectList(NAMESPACE+".selectAll", params);
    }

    public int selectLastPage(){
        int count = session.selectOne(NAMESPACE+".count");
        int total = count / PAGE_SIZE;
        if(count % PAGE_SIZE!=0){
            total +=1;
        }
        return total;
    }

    public ProductDTO selectOne(int id){
        return session.selectOne(NAMESPACE+".selectOne",id);
    }

    public ProductDTO some(int id){
        return session.selectOne(NAMESPACE+".addSome", id);
    }

}






















