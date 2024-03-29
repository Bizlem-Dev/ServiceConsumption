package com.service.log;
import java.util.*;
import java.io.*;

import org.jivesoftware.smack.Chat;
import org.jivesoftware.smack.ConnectionConfiguration;
import org.jivesoftware.smack.MessageListener;
import org.jivesoftware.smack.Roster;
import org.jivesoftware.smack.RosterEntry;
import org.jivesoftware.smack.XMPPConnection;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.packet.Message;

public class XMppConnection{

	XMPPConnection connection;

	public void login(String userName, String password) throws XMPPException
	{
		// turn on the enhanced debugger
		ConnectionConfiguration config = new ConnectionConfiguration("110.172.129.187",5222);
		connection = new XMPPConnection(config);

		connection.connect();
		connection.login(userName, password);
	}


	public void displayBuddyList()
	{
		try
		{
			Roster roster = connection.getRoster();
			Collection<RosterEntry> entries = roster.getEntries();

			System.out.println("\n\n" + entries.size() + " buddy(ies):");
			for(RosterEntry r:entries)
			{
				try {
					roster.removeEntry(r);
				} catch (XMPPException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	public void disconnect()
	{
		connection.disconnect();
	}




}