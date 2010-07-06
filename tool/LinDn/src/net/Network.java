/**
 * 
 */
package net;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;

/** @author KIUSBT */
public class Network
{
	private Socket csocket, socket;
	private BufferedInputStream cis, sis;
	private BufferedOutputStream cos, sos;
	private NetworkCipher snc, cnc;
	private Object cLock, sLock;
	
	/** 
	 * ��l�Ƴs���u�@
	 * 
	 * @throws socket, 	�A�Ⱥ�
	 * @throws csocket,	�Ȥ��
	 */
	public Network(Socket socket, Socket csocket) throws IOException
	{
		// -- �q�T���� --
		this.csocket = csocket; // ���o�A�Ⱥ�
		this.socket = socket;	// ���o���A��
		// -- ���o��J�׬y�� --
		sis = new BufferedInputStream(socket.getInputStream());		// �A�Ⱥ�
		cis = new BufferedInputStream(csocket.getInputStream()); 	// �Ȥ��
		// -- ���o��X�׬y�� --
		sos = new BufferedOutputStream(socket.getOutputStream());	// �A�Ⱥ�
		cos = new BufferedOutputStream(csocket.getOutputStream());	// �Ȥ��
		// -- ��l�ƿ�X�� --
		cLock = new Object();
		sLock = new Object();
		// ------------------
		new NetworkReceiver(this);
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
			
			return cnc.decrypt(data); // �Ǧ^�ѽX����ƫʥ]
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
			data = new byte[(((lowByte & 0xFF) << 8) | (highByte & 0xFF)) - 2];
			
			// �˴��s���O�_���` (2)
			for (int i = 0; i < data.length; i++)
			{
				int check = sis.read();
				
				if (check == -1)
					throw new IOException("�A�ȺݻP�z��ƶǿ�o�Ϳ��~�I");
				
				data[i] = (byte) (check & 0xFF);
			}
			
			if (snc == null)
				return data; // �Ǧ^���s�X����ƫʥ]
			
			return snc.decrypt(data); // �Ǧ^�ѽX����ƫʥ]
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
				if (data == null)
					throw new Exception("�}�C���šI");
				
				int length = data.length + 2;
				
				if (length < 4)
					throw new Exception("��X���}�C���פp��4�I");
				
				cos.write(length & 0xFF);
				cos.write(length >> 8 & 0xFF);
				
				if (snc == null)
					cos.write(initialize(data));
				else
					cos.write(snc.encrypt(data));
				
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
				if (data == null)
					throw new Exception("�}�C���šI");
				
				int length = data.length + 2;
				
				if (length < 4)
					throw new Exception("��X���}�C���פp��4�I");
				
				sos.write(length & 0xFF);
				sos.write(length >> 8 & 0xFF);
				sos.write(cnc.encrypt(data));
				sos.flush();
			}
			catch (Exception e)
			{
			}
		}
	}
	
	public void close()
	{
		try
		{
			socket.close();
			csocket.close();
			sis = null;
			cis = null;
			sos = null;
			cos = null;
		}
		catch (IOException e)
		{
		}
	}
	
	private byte[] initialize(byte[] data)
	{
		// ���o���_��
		long keycrypt = ((data[4] & 0xFF) << 24) |
						((data[3] & 0xFF) << 16) |
						((data[2] & 0xFF) <<  8) |
						((data[1] & 0xFF));
		
		snc = NetworkCipher.initialize(keycrypt); // ��l�ƺt��k (�A�Ⱥ�)
		cnc = NetworkCipher.initialize(keycrypt); // ��l�ƺt��k (�Ȥ��)
		return data;
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
