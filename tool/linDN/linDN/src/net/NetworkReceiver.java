/**
 * 
 */
package net;

import java.io.IOException;

import net.packet.Packet;
import net.packet.ServerHandler;
import net.util.ThreadPool;

/** @author KIUSBT */
public class NetworkReceiver
{
	private final Network net;
	private final ServerHandler sh;
	
	/**
	 * ��l�Ƴs���u�@��������
	 */
	public NetworkReceiver(Network net)
	{
		this.net = net; // ���o�s���u�@
		//this.net.getWorld().addNetwork(); // �N�s���u�@�[�J�s�դ�
		this.sh = new ServerHandler(net);
		
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
				
				data = sh.Respon(data);
				
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
