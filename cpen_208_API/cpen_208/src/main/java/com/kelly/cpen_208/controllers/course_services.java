package com.kelly.cpen_208.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kelly.cpen_208.conn_class.db_settings;
import com.kelly.cpen_208.models.cls_courses;

@RestController
@RequestMapping("/course_services")
public class course_services {
  cls_courses course_l = new cls_courses();

  @Autowired
  private db_settings cls_db_config;

  @GetMapping("/outstanding_fees")
  public String outstanding_fees(@RequestParam int s_id) {
    course_l.con = cls_db_config.getCon();
    String result = course_l.outstanding_fees(s_id);
    return result;
  }

  @PostMapping("/delete_courses")
  public String delete_courses(@RequestBody String json_request) {
    course_l.con = cls_db_config.getCon();
    String result = course_l.delete_courses(json_request);
    return result;
  }
  @PostMapping("/add_courses")
  public String add_courses(@RequestBody String json_request) {
    course_l.con = cls_db_config.getCon();
    String result = course_l.add_courses(json_request);
    return result;
  }
}