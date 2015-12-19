package org.kliakhin.hometask;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.kliakhin.hometask.entity.Merchant;
import org.kliakhin.hometask.service.MerchantService;
import org.kliakhin.hometask.entity.Payment;
import org.kliakhin.hometask.service.TransmoneyService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import org.kliakhin.hometask.entity.Customer;
import org.kliakhin.hometask.service.CustomerService;
import org.kliakhin.hometask.service.PaymentService;
import org.kliakhin.hometask.entity.Transmoney;

@Named
public class Application {
	@Inject
	MerchantService merchantService;
	@Inject
	CustomerService customerService;
	@Inject
	PaymentService paymentService;
	@Inject
	TransmoneyService transMoneyService;

	@SuppressWarnings("resource")
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("WEB-INF/spring/application-config.xml");
		Application application = (Application) context.getBean("application");

	}

	public void printMerchantName(int id) {
		Merchant m1 = merchantService.findById(id);
		System.out.println("name = " + m1.getName());
	}

	public void printCustomerName(int id) {
		Customer c1 = customerService.findById(id);
		System.out.println("name = " + c1.getName());
	}

	public void printPayment(int id) {
		Payment p1 = paymentService.findById(id);
		System.out.println("name = " + p1.getGoods());
	}

	public void printTransmoney(int id) {
		Transmoney t1 = transMoneyService.findById(id);
		System.out.println("name = " + t1.getMerchantId());
	}

	public int addMerchant(Merchant merchant) {
		merchantService.save(merchant);
		return merchant.getId();
	}

	public int addCustomer(Customer customer) {
		customerService.save(customer);
		return customer.getId();
	}

	public void printAllMerchants() {
		for (Merchant m : merchantService.findAll()) {
			System.out.println(m.getName());
		}
	}

	public void printAllCustomers() {
		for (Customer c : customerService.findAll()) {
			System.out.println(c.getName());
		}
	}

	public void printAllPayment() {
		for (Payment p : paymentService.findAll()) {
			System.out.println(p.getGoods());
		}
	}

	public void printAllTransMoney() {
		for (Transmoney tm : transMoneyService.findAll()) {
			System.out.println(tm.getSumSent());
		}
	}

	public void generateTransMoney() {
		List<Merchant> listOfMerchant = merchantService.findAll();
		for (Merchant merchant : listOfMerchant) {
			LocalDateTime today = LocalDateTime.now();
			LocalDate lastSent = LocalDate.of(2011, 11, 11);
			Timestamp timestamp = Timestamp.valueOf(today);
			if ((merchant.getNeedToSend() > merchant.getMinSum())
					&& (lastSent.plusDays(merchant.getPeriod() * 10).isBefore(today.toLocalDate()))) {
				Transmoney transMoney = new Transmoney();
				transMoney.setMerchantId(merchant.getId());
				transMoney.setSentDate(timestamp);
				transMoney.setStatus("F");
				transMoney.setSumSent(merchant.getNeedToSend());;
				transMoneyService.save(transMoney);
			}
		}
	}
}
