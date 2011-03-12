/**
 * 
 */
package net;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;

import net.world.World;

/* 2011/2/22��s */
/** @author KIUSBT(Ri Sheng) */
public class Network
{
	private final World world;
	private final Socket csocket, socket;
	private final BufferedInputStream cis, sis;
	private final BufferedOutputStream cos, sos;
	private final Object cLock, sLock;
	
	private Cipher sc, c;
	
	/** 
	 * ��l�Ƴs���u�@
	 * 
	 * @throws socket, 	�A�Ⱥ�
	 * @throws csocket,	�Ȥ��
	 */
	public Network(Socket socket, Socket csocket) throws IOException
	{
		this.csocket = csocket;
		this.socket = socket;
		this.sis = new BufferedInputStream(socket.getInputStream());
		this.cis = new BufferedInputStream(csocket.getInputStream());
		this.sos = new BufferedOutputStream(socket.getOutputStream());
		this.cos = new BufferedOutputStream(csocket.getOutputStream());
		this.cLock = new Object();
		this.sLock = new Object();
		this.world = new World(this);
		this.initialize();
		
		new NetworkReceiver(this);
	}
	
	private void initialize() throws IOException
	{
		byte[] data = new byte[18];
		sis.read(data);
		cos.write(data);
		cos.flush();
		
		// ��l�ƫʥ]��}
		int address = data[2] & 0xff;
		
		// ���o���_��
		int keycrypt =  ((data[6] & 0xFF) << 24) |
						((data[5] & 0xFF) << 16) |
						((data[4] & 0xFF) <<  8) |
						((data[3] & 0xFF));
		
		sc = new Cipher(keycrypt); // ��l�ƺt��k (�A�Ⱥ�)
		c = new Cipher(keycrypt); // ��l�ƺt��k (�Ȥ��)
	}
	
	/**
	 * <b>�Ȥ��</b> �U�@�Ӧ줸�հ}�C (�ʥ])
	 * 
	 * @return �줸�հ}�C
	 */
	public byte[] nextCBytes() throws IOException
	{
		byte[] data; // ��ƼȦs��
		int highByte, lowByte; // ���줸�աB�C�줸��
		
		try
		{
			highByte 	= cis.read(); // �����줸�� (8 bit)
			lowByte		= cis.read(); // �����줸�� (8 bit)
			
			// �˴��s���O�_���` (1)
			if (highByte == -1 || lowByte == -1)
				throw new IOException(getLocalAddress() + " �P�A�Ⱥݤ��_�s�u�I");
			
			// �]�w�����쪺��ƫʥ]�j�p
			data = new byte[(((lowByte & 0xFF) << 8) | (highByte & 0xFF)) - 2];
			
			// �˴��s���O�_���` (2)
			for (int i = 0; i < data.length; i++)
			{
				int check = cis.read();
				
				if (check == -1)
					throw new IOException(getLocalAddress() + " �P�A�Ⱥݸ�ƶǿ�o�Ϳ��~�I");
				
				data[i] = (byte) (check & 0xFF);
			}
			
			return c.decrypt(data); // �Ǧ^�ѽX����ƫʥ]
		}
		catch (IOException e)
		{
			throw e;
		}
		finally
		{
			data = null;
		}
	}
	
	/**
	 * <b>�A�Ⱥ�</b> �U�@�Ӧ줸�հ}�C (�ʥ])
	 * 
	 * @return �줸�հ}�C
	 */
	public byte[] nextSBytes() throws IOException
	{
		byte[] data; // ��ƼȦs��
		int highByte, lowByte; // ���줸�աB�C�줸��
		
		try
		{
			highByte 	= sis.read(); // �����줸�� (8 bit)
			lowByte		= sis.read(); // �����줸�� (8 bit)
			
			// �˴��s���O�_���` (1)
			if (highByte == -1 || lowByte == -1)
				throw new IOException("�A�ȺݻP " + getLocalAddress() + " ���_�s�u�I");
			
			// �]�w�����쪺��ƫʥ]�j�p
			data = new byte[((lowByte * 256) | highByte) - 2];
			
			// �˴��s���O�_���` (2)
			for (int i = 0; i < data.length; i++)
			{
				int check = sis.read();
				
				if (check == -1)
					throw new IOException("�A�ȺݻP�z��ƶǿ�o�Ϳ��~�I");
				
				data[i] = (byte) (check & 0xFF);
			}
			
			return sc.decrypt(data); // �Ǧ^�ѽX����ƫʥ]
		}
		catch (IOException e)
		{
			throw e;
		}
		finally
		{
			data = null;
		}
	}
	
	/**
	 * [�A�Ⱥ�] ��X�줸�հ}�C (�ʥ])<br>
	 *  �A�Ⱥ� -> �Ȥ�� �o�e
	 * 
	 * @param data
	 */
	public void outputSBytes(byte[] data)
	{
		synchronized (sLock)
		{
			try
			{
				int length = data.length + 2;
				
				if (length < 4)
					throw new Exception("��X���}�C���פp��4�I");
				
				cos.write(length & 0xFF);
				cos.write(length >> 8 & 0xFF);
				cos.write(sc.encrypt(data));
				cos.flush();
			}
			catch (Exception e)
			{
			}
		}
	}
	
	/**
	 * [�Ȥ��] ��X�줸�հ}�C (�ʥ])<br>
	 *  �Ȥ�� -> �A�Ⱥ� �o�e
	 * 
	 * @param data
	 */
	public void outputCBytes(byte[] data)
	{
		synchronized (cLock)
		{
			try
			{
				int length = data.length + 2;
				
				if (length < 4)
					throw new Exception("��X���}�C���פp��4�I");
				
				sos.write(length & 0xFF);
				sos.write(length >> 8 & 0xFF);
				sos.write(c.encrypt(data));
				sos.flush();
			}
			catch (Exception e)
			{
			}
		}
	}
	
	public void close()
	{
		if (!isClosed())
		{
			System.out.println(getLocalAddress() + " �w���}��ť�{�ǡI");
			world.delNetwork();
		}
		
		try
		{
			socket.close();
			csocket.close();
		}
		catch (IOException e)
		{
		}
	}

	/**
	 * @return
	 * @see java.net.Socket#getLocalAddress()
	 */
	public InetAddress getLocalAddress()
	{
		return csocket.getLocalAddress();
	}

	/**
	 * @see java.net.Socket#isClosed()
	 */
	public boolean isClosed()
	{
		return socket.isClosed() && csocket.isClosed();
	}
}
