package com.like.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 封装layUI数据进行json响应给页面
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Page {
    private Integer code;
    private String msg;
    private Long count;
    private List<User> data;
}

