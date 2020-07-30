package com.like.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Integer id;
    private String username;
    private boolean gender;
    //json时间请求格式
    @JsonFormat(pattern = "yyyy-MM-dd")
    //正常请求时间格式
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date registerTime;
}
