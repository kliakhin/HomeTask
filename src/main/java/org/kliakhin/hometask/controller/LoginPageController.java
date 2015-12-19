package org.kliakhin.hometask.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/19/15 1:50 AM
 */

@Controller
public class LoginPageController {

    @RequestMapping(value = "/login")
    public String login(@RequestParam("cash")int cash) {
        return "login";
    }
}
