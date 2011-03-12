package net.api;

import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

/** @author KIUSBT(RiShengLuo) */
public class ParseClient extends MemoryStream
{
	private boolean cflag; // true:���b�n�J���A��,false:���b�C�����A��
	private ParseServer ps;
	
	/**
	 * �ʥ]��}�M��
	 * String, �ʥ]-�W��
	 * Variable, �ʥ]-�Ȧs��
	 */
	private final ConcurrentHashMap<String, Variable> addr;
	
	/**
	 * �ѼƲM��
	 * Long, �d�I�쪺�ɶ� (�t�ήɶ�)
	 * ArrayList<byte[]>, �ѦҸ��-�Ȧs��
	 */
	private final ConcurrentHashMap<Long, ArrayList<byte[]>> ref;
	
	public ParseClient()
	{
		this.cflag = true;
		this.addr = new ConcurrentHashMap<String, Variable>();
		this.ref = new ConcurrentHashMap<Long, ArrayList<byte[]>>();
	}

	public void contains(int address, byte[] data, long timeMillis)
	{
		if (cflag)
		{
			if (query(address))
				return;
			
			String name = new String();
			String note = new String();
			
			if (query("C_OPCODE_CLIENTVERSION", name) && data.length == 12)
				note = "�Ȥ�ݪ����ʥ]";
			else if (query("C_OPCODE_LOGINPACKET", name))
				note = "�Τ�n���ʥ]";
			else if (query("C_OPCODE_COMMONCLICK", name) && 
					 ps.query("S_OPCODE_COMMONNEWS", ""))
				note = "���i�T�{�ʥ]";
			else if (query("C_OPCODE_NEWCHAR", name))
				note = "�гy����ʥ]";
			else if (query("C_OPCODE_DELETECHAR", name))
				note = "�R������ʥ]";
			else if (query("C_OPCODE_LOGINTOSERVER", name))
				note = "�n���C���ʥ]";
			
			insert(name, address, note); 
		}
		else
		{
			insert_ref(timeMillis, data);
		}
	}
	
	protected Variable insert(String name, int address, String note)
	{
		Variable var = addr.get(name);
		
		if (var == null)
		{
			var = new Variable();
			var.setName(name);
			var.setNote(note);
			var.setAddress(address);
			addr.put(name, var);
		}
		
		return var;
	}
	
	protected boolean query(String name, String ref)
	{
		ref = name;
		return addr.containsKey(name);
	}
	
	protected boolean query(int address)
	{
		for (Variable var : addr.values())
			if (var.getAddress() == address)
				return true;
		
		return false;
	}
	
	protected void insert_ref(long timeMillis, byte[] data)
	{
		ArrayList<byte[]> data_list = ref.get(timeMillis);
		
		if (data_list == null)
		{
			data_list = new ArrayList<byte[]>();
			ref.put(timeMillis, data_list);
		}
		
		data_list.add(data);
	}
	
	/**
	 * @return the ps
	 */
	public ParseServer getPs()
	{
		return ps;
	}

	/**
	 * @param ps the ps to set
	 */
	public void setPs(ParseServer ps)
	{
		this.ps = ps;
	}
}
