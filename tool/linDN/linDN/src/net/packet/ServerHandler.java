/**
 * 
 */
package net.packet;

import net.Network;

/** @author KIUSBT */
public class ServerHandler extends MemoryStream
{
	private final Network net;
	//private final World world;
	
	//private int address;
	//private int map;
	//private boolean hasload;
	
	public ServerHandler(Network net)
	{
		this.net = net;
		//this.world = net.getWorld();
	}
	
	public byte[] Respon(byte[] data)
	{
		//address = data[0] & 0xFF; // ���o�ʥ]��}
		read(data); // �N��ƶפJ�ܰO����׬y�Ƥ�
		return data;
	}
}