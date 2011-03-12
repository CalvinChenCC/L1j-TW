/**
 * 
 */
package net;

import java.io.IOException;


/** @author KIUSBT */
public class NetworkReceiver
{
	private final Network net;
	
	/**
	 * ��l�Ƴs���u�@��������
	 */
	public NetworkReceiver(Network net)
	{
		this.net = net; // ���o�s���u�@
		
		ThreadPool.execute(new client()); // �}�l�����Ȥ�ݫʥ]
		ThreadPool.execute(new server()); // �}�l�����A�Ⱥݫʥ]
	}
	
	// �Ȥ�ݫʥ]������
	private class client implements Runnable
	{
		@Override
		public void run()
		{
			while (!net.isClosed())
			{
				byte[] data;
				
				/* ���ݷs���ʥ] */
				try
				{
					data = net.nextCBytes();
				}
				catch (IOException e)
				{
					break;
				}
				
				Packet.show("Client", data);
				
				/* �N�s�ʥ]��X */
				net.outputCBytes(data);
			}
			
			System.gc();
		}
	}
	
	// �A�Ⱥݫʥ]������
	private class server implements Runnable
	{
		@Override
		public void run()
		{
			while (!net.isClosed())
			{
				byte[] data;
				
				/* ���ݷs���ʥ] */
				try
				{
					data = net.nextSBytes();
				}
				catch (IOException e)
				{
					break;
				}
				
				if (data == null)
					continue;
				
				Packet.show("Server", data);
				
				/* �N�s�ʥ]��X */
				net.outputSBytes(data);
			}
			
			System.gc();
		}
	}
}
