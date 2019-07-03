package com.jindal.auction.configDomain;

import java.util.ResourceBundle;

import javax.jms.*;

import org.apache.activemq.ActiveMQConnectionFactory;

public class ConfigDomain {

	
	public String saveConfigDomain(String customerId, String domainName)
	{
		
		System.out.println("calling save config name");
		
		
		//////////////////////////
		
		try {
			
		/*	ResourceBundle resourceBundle=ResourceBundle.getBundle("serverConfig");
			
			String activemqIP=resourceBundle.getString("activeMqConnectionIp");
			
			System.out.println("activemqIP=="+activemqIP);
			
			//ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://10.36.76.185:61616");
			ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(activemqIP);
			
			Connection connection = connectionFactory.createConnection();
			 connection.start();
      Session session = connection.createSession(false,
			       Session.AUTO_ACKNOWLEDGE);

      Topic topic = session.createTopic("ecommerceService");

      MessageProducer producer = session.createProducer(topic);
     TextMessage message = session.createTextMessage();
      //String customerId="779887";
      //String domainName="DEMO10091";
      message.setStringProperty("customerId", customerId);
      message.setStringProperty("domainName", domainName);
      
      System.out.println("customerId="+customerId);
      System.out.println("domainName="+domainName);
      
      
     producer.setDeliveryMode(DeliveryMode.PERSISTENT);
      // Here we are sending the message!
      System.out.println("producer");
      producer.send(message);
      System.out.println("Sent message '" + message.getText() + "'");

      connection.close();*/
			
			
			
				ResourceBundle resourceBundle=ResourceBundle.getBundle("serverConfig");
			
				String activemqIP=resourceBundle.getString("activeMqConnectionIp");
		       ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(activemqIP);
		      
		       Connection connection = connectionFactory.createConnection();
		     
		       connection.start();

		       // JMS messages are sent and received using a Session. We will
		       // create here a non-transactional session object. If you want
		       // to use transactions you should set the first parameter to 'true'
		       Session session = connection.createSession(false,
		               Session.AUTO_ACKNOWLEDGE);

		       Topic topic = session.createTopic("ecommerceService");

		       MessageProducer producer = session.createProducer(topic);

		       // We will send a small text message saying 'Hello'

		       TextMessage message = session.createTextMessage();

		       //String shipmentId="779887";
		      // String orderId="DEMO10091";
		       message.setStringProperty("domainName", domainName);
		       message.setStringProperty("vendorId", customerId);
		           
		       message.setText("vinod...hiiii again its a new message for myself");
		       
		       producer.setDeliveryMode(DeliveryMode.PERSISTENT);
		       // Here we are sending the message!
		       System.out.println("producer");
		       producer.send(message);
		       System.out.println("Sent message '" + message.getText() + "'");

		       connection.close();
			
		} catch (JMSException e) {
		
			e.printStackTrace();
		}
		
		
		///////////////////////////
		
		return "saved";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
