package com.norman.DTI_exercise.controller;


import com.norman.DTI_exercise.model.Product;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/products")
public class ProductController {

    @GetMapping
    public String getProducts() {
        return "Product endpoint working!";
    }

    @GetMapping("/{id}")
    public String getProductsByID(@PathVariable int id) {
        Product product = new Product();
        product.setId(id);
        product.setName("Product "+ id);
        product.setPrice(100000);
        return "Product detail for ID :" + id;
    }
}
