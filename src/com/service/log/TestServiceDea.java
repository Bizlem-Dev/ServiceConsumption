package com.service.log;

import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.jindal.auction.auctionServies.Auctions_WSDLPortTypeProxy;
import com.jindal.auction.domain.xsd.CustomerServiceStatus;


public class TestServiceDea 
{
	

	public List<CustomerServiceStatus> getCustomerServiceStatus(java.lang.String customerId, java.lang.String productId, java.lang.String fromDate, java.lang.String toDate, java.lang.String status)
	{
		try 
		{
			Auctions_WSDLPortTypeProxy ap = new Auctions_WSDLPortTypeProxy();

			CustomerServiceStatus [] cs =ap.getCustomerServiceStatus(customerId, productId, fromDate, toDate, status);

			List<CustomerServiceStatus> gg = new ArrayList<CustomerServiceStatus>();
			if(cs!=null){
				gg = new ArrayList<CustomerServiceStatus>(Arrays.asList(cs));
			}

			return gg;
		} catch (RemoteException e) {
			
			e.printStackTrace();
			return null;
		}
	}
}
