package org.kliakhin.hometask.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/19/15 1:50 AM
 */

@Controller
public class LoginPageController {

    @RequestMapping("/login")
    public String login() {
        return "login";
    }
}
