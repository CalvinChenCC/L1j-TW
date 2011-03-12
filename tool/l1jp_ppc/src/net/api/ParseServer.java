package net.api;

import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

/**
 * �n�J�B�C�����A���ʥ]�ѪR�� (l1jp_ppc)
 * 
 * @author KIUSBT(RiShengLuo)
 */
public class ParseServer extends MemoryStream
{
	private boolean sflag; // true:���b�n�J���A��,false:���b�C�����A��
	private ParseClient pc;
	
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
	
	public ParseServer()
	{
		sflag = true;
		addr = new ConcurrentHashMap<String, Variable>();
		ref = new ConcurrentHashMap<Long, ArrayList<byte[]>>();
	}
	
	public void contains(int address, byte[] data, long timeMillis)
	{
		if (sflag)
		{
			if (query(address))
				return;
			
			read(data);
			int param8;
			String name = new String();
			
			if (query("S_OPCODE_INITPACKET", name))
				insert(name, address, "��l�ƫʥ]"); 
			
			else if (query("S_OPCODE_SERVERVERSION", name) &&
					 pc.query("C_OPCODE_CLIENTVERSION", ""))
				insert(name, address, "���A����T�ʥ] (���A�������ʥ])"); 
			
			// �x���S�����\��
			else if (query("S_OPCODE_CHANGEPASSWORD", name) &&
					 pc.query("C_OPCODE_CHANGEPASSWORD", ""))
				insert(name, address, "�ܧ�K�X�����ʥ]");
			
			else if (query("S_OPCODE_LOGINRESULT", name) &&
					 pc.query("C_OPCODE_LOGINPACKET", ""))
				insert(name, address, "�n�����A���ʥ]");
			
			else if (query("S_OPCODE_CHARAMOUNT", name))
				insert(name, address, "����ƶq�ʥ]");
			
			else if (query("S_OPCODE_CHARRESET", name))
				insert(name, address, "�I�ƭ��m�ʥ]");
			
			else if (query("S_OPCODE_NEWCHARWRONG", name) &&
					 pc.query("C_OPCODE_NEWCHAR", ""))
			{
				param8 = readByte();
				
				if (param8 == 0x02)
					insert(name, address, "�гy����ʥ]");
			}
			
			else if (query("S_OPCODE_NEWCHARPACK", name) &&
					 query("S_OPCODE_NEWCHARWRONG", ""))
				insert(name, address, "�[�J�s����ʥ]");
			
			else if (query("S_OPCODE_DETELECHAROK", name) &&
					 pc.query("C_OPCODE_DELETECHAR", "") &&
					 readByte() == 0x05)
			{
				param8 = readByte();
				
				if (param8 == 0x05 || param8 == 0x51)
					insert(name, address, "�R������ʥ]");
			}
			
			else if (query("S_OPCODE_UNKNOWN1", name) &&
					 pc.query("C_OPCODE_LOGINTOSERVER", ""))
				insert(name, address, "�n���C���ʥ]", (sflag = !sflag));
			
		}
		else
		{
			insert_ref(timeMillis, data);
		}
	}
	
	protected Variable insert(String name, int address, String note, boolean ref)
	{
		return insert(name, address, note);
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
	 * @param pc the pc to set
	 */
	public void setPc(ParseClient pc)
	{
		this.pc = pc;
	}

	/**
	 * @return the pc
	 */
	public ParseClient getPc()
	{
		return pc;
	}
}
