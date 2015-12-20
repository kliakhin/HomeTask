package org.kliakhin.hometask.controller;

import org.kliakhin.hometask.entity.Payment;
import org.kliakhin.hometask.service.MerchantService;
import org.kliakhin.hometask.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/20/15 12:09 AM
 */

@Controller
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;
    @Autowired
    private MerchantService merchantService;

    @RequestMapping({"", "/"})
    public String all(Model model) {
        model.addAttribute("payments", paymentService.findAll());
        return "payment/payments";
    }

    @RequestMapping("/create")
    public String createPayment() {
        return "payment/createPayment";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addMerchant(@ModelAttribute Payment payment) {
        int merchantID = payment.getMerchantId();
        double merchantChargePayed = merchantService.findById(merchantID).getCharge();
        payment.setDt(Timestamp.valueOf(LocalDateTime.now()));
        payment.setChargePayed(payment.getSumPayed() * merchantChargePayed / 100);
        paymentService.save(payment);
        merchantService.updateNeddToSend(merchantID, payment.getSumPayed() - payment.getChargePayed());
        return "redirect:/payment/";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removePayment(String id) {
        Payment payment = paymentService.findById(Integer.parseInt(id));
        merchantService.updateNeddToSend(payment.getMerchantId(), payment.getSumPayed() * (-1));
        paymentService.remove(Integer.parseInt(id));
        return "redirect:/payment/";
    }

}

