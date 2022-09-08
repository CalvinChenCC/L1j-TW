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
	 * 初始化連結工作之接收者
	 */
	public NetworkReceiver(Network net)
	{
		this.net = net; // 取得連結工作
		
		ThreadPool.execute(new client()); // 開始接收客戶端封包
		ThreadPool.execute(new server()); // 開始接收服務端封包
	}
	
	// 客戶端封包接收者
	private class client implements Runnable
	{
		@Override
		public void run()
		{
			while (!net.isClosed())
			{
				byte[] data;
				
				/* 等待新的封包 */
				try
				{
					data = net.nextCBytes();
				}
				catch (IOException e)
				{
					break;
				}
				
				Packet.show("Client", data);
				
				/* 將新封包輸出 */
				net.outputCBytes(data);
			}
			
			System.gc();
		}
	}
	
	// 服務端封包接收者
	private class server implements Runnable
	{
		@Override
		public void run()
		{
			while (!net.isClosed())
			{
				byte[] data;
				
				/* 等待新的封包 */
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
				
				/* 將新封包輸出 */
				net.outputSBytes(data);
			}
			
			System.gc();
		}
	}
}
