package org.kliakhin.hometask.controller;

import org.kliakhin.hometask.entity.Customer;
import org.kliakhin.hometask.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/19/15 1:23 AM
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping({"", "/"})
    public String all(Model model) {
        model.addAttribute("customers", customerService.findAll());

        return "customer/customers";
    }

    @RequestMapping("/create")
    public String createCustomer() {
        return "customer/createCustomer";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addCustomer(@ModelAttribute Customer customer) {
        customerService.save(customer);
        return "redirect:/customer/";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeCustomer(String id) {
        customerService.remove(Integer.parseInt(id));
        return "redirect:/customer/";
    }
}
