package org.kliakhin.hometask.controller;

import org.kliakhin.hometask.entity.Merchant;
import org.kliakhin.hometask.entity.Transmoney;
import org.kliakhin.hometask.service.MerchantService;
import org.kliakhin.hometask.service.TransmoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author kliakhin.yevgen
 * @version 1.0 Create: 12/20/15 12:09 AM
 */

@Controller
@RequestMapping("/transmoney")
public class TransmoneyController {

    @Autowired
    private TransmoneyService transmoneyService;
    @Autowired
    private MerchantService merchantService;

    @RequestMapping({"", "/"})
    public String all(Model model) {
        model.addAttribute("transmoneys", transmoneyService.findAll());
        return "transmoney/transmoneys";
    }

    @RequestMapping("/generate")
    public String generateTransmoney() {
        merchantService.findMerchantListForTrans().forEach(merchant -> {
            Transmoney transmoney = new Transmoney();
            transmoney.setMerchantId(merchant.getId());
            transmoney.setSentDate(Timestamp.valueOf(LocalDateTime.now()));
            transmoney.setStatus("F");
            transmoney.setSumSent(merchant.getNeedToSend());
            transmoneyService.save(transmoney);
            merchantService.updateLastSent(merchant.getId(), java.sql.Date.valueOf(LocalDate.now()));
        });
        return "redirect:/transmoney/";
    }

    @RequestMapping(value ="/dotransmoney", method = RequestMethod.POST)
    public String doTransmoney(String cash) {
        int limit = Integer.parseInt(cash);
        List<Transmoney> list = transmoneyService.findWithFalseStatus();
        for (Transmoney transmoney : list){
            double sumSent = transmoney.getSumSent();
            if (limit - sumSent < 0)
                continue;
            transmoneyService.doTransaction(transmoney.getId());
            limit -= sumSent;
            merchantService.updateForTrans(transmoney.getMerchantId(), Date.valueOf(LocalDate.now()), transmoney.getSumSent(), transmoney.getSumSent());
        }
        return  "redirect:/transmoney/";
    }

    @RequestMapping("/clear")
    public String clear() {
        transmoneyService.findAll().forEach(transmoney -> {
            if (transmoney.getStatus().equals("T")) {
                transmoneyService.remove(transmoney.getId());
            }
        });
        return "redirect:/transmoney/";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeTransmoney(String id) {
        int transmoneyId = Integer.parseInt(id);
        Transmoney transmoney = transmoneyService.findById(transmoneyId);
        Merchant merchant = merchantService.findById(transmoney.getMerchantId());
        LocalDate backDate = merchant.getLastSent().toLocalDate().minusMonths(1);
        merchantService.updateLastSent(merchant.getId(), Date.valueOf(backDate));
        transmoneyService.remove(Integer.parseInt(id));
        return "redirect:/transmoney/";
    }
}
