/**
 * 
 */
package net;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Properties;

/** @author KIUSBT */
public class Listener extends Thread
{
	public static String Host;
	public static int Port;
	public static final int Size = 1440;
	public static final boolean NoDelay = true;
	
	/**
	 * ���{�ǳQ�B���
	 * 
	 * @param args
	 */
	public static void main(String[] args) throws Exception
	{
		Properties p = null;
		FileInputStream is = null;
		Listener listener = null;
		
		try
		{
			p = new Properties();
			is = new FileInputStream("./Config.ini"); // ��l�ƿ�X�׬y��
			p.load(is); // Ū���]�w�]�w��
			Host = p.getProperty("host"); // ���o�ؼХD���W��
			Port = Integer.parseInt(p.getProperty("port")); // ���o�ؼХD���ݤf
			listener = new Listener(); // ��l�ƺ�ť��
		}
		catch (IOException e)
		{
			throw e;
		}
		finally
		{
			is.close(); // ������J�׬y��
			is = null;  // �N����]����
			p.clear();	// �N�Q�n������ƲM��
			p = null;	// �N����]����
		}
		
		System.out.println(Listener.class.getName() + "(2000)" + " �Ұʦ��\�I\r\n");
		listener.start(); // �}�l�i���ť�@�~
	}
	
	private final ServerSocket serverSocket; // ���A���q�T�ݤf
	
	public Listener() throws IOException
	{
		super("Linsten_Server");
		
		serverSocket = new ServerSocket(2000); // �w�]�ݤf2000
	}
	
	@Override
	public void run()
	{
		System.out.println(Listener.class.getName() + "(2000)" + " �}�l�i���ť�@�~�C\r\n");
		
		/* �}�l��ť�ϥΪ� */
		while (true)
		{
			try
			{
				Socket csocket = serverSocket.accept(); // �����s���ϥΪ̳s�u
				Socket socket = new Socket(Host, Port); // �P�ؼХD���إ߳s��
				
				// �s���ϥΪ̰ѼƳ]�w
				csocket.setTcpNoDelay(NoDelay);
				csocket.setSendBufferSize(Size);
				csocket.setReceiveBufferSize(Size);
				// �P���A���pô���ѼƳ]�w
				socket.setTcpNoDelay(NoDelay);
				socket.setSendBufferSize(Size);
				socket.setReceiveBufferSize(Size);
				
				// -- �T���i�� --
				System.out.println(csocket.getInetAddress() + " �w�s����ť���A���A�ûP���A���إ߳s�u�C");
				
				// �إ߳s���u�@
				new Network(socket, csocket); // ��l�Ƴs���u�@
			}
			catch (IOException e)
			{
				System.out.println(e.getMessage());
				break;
			}
		}
	}
}
