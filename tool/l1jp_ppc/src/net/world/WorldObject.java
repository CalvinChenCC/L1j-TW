package net.world;

/** @author KIUSBT */
public class WorldObject
{
	private int id; // ����N��
	private int x, y, mapid; // ����y�СB�a��
	private int Gfxid; // ����~��
	private int Actid; // ����ʧ@
	private int Dir; // �����V
	private int Light; // ����P��G��
	private int Haste; // ����[�t�ĪG
	private int Exp; // ����g���
	private int Lawful;	// ���󥿸q��
	private String Name; // ����W��
	private String Title; // ����ʸ�
	private int Attr; // �����ݩ�
	private int Clanid; // �������N��
	private String Clan; // �������W��
	private String Master; // ����D�H
	private int State; // ���󪬺A
	private int Hpbar; // ������
	private int Wave; // �����{��
	private int Level; // ���󵥯�
	private String Shop; // �ө��W��
	
	/**
	 * @return the id
	 */
	public int getId()
	{
		return id;
	}
	
	/**
	 * @param id the id to set
	 */
	public void setId(int id)
	{
		this.id = id;
	}
	
	/**
	 * @return the x
	 */
	public int getX()
	{
		return x;
	}
	
	/**
	 * @param x the x to set
	 */
	public void setX(int x)
	{
		this.x = x;
	}
	
	/**
	 * @return the y
	 */
	public int getY()
	{
		return y;
	}
	
	/**
	 * @param y the y to set
	 */
	public void setY(int y)
	{
		this.y = y;
	}
	
	/**
	 * @return the mapid
	 */
	public int getMapid()
	{
		return mapid;
	}
	
	/**
	 * @param mapid the mapid to set
	 */
	public void setMapid(int mapid)
	{
		this.mapid = mapid;
	}
	
	/**
	 * @return the Name
	 */
	public String getName()
	{
		return Name;
	}
	
	/**
	 * @param Name the Name to set
	 */
	public void setName(String Name)
	{
		this.Name = Name;
	}
	
	/**
	 * @param gfxid the gfxid to set
	 */
	public void setGfxid(int gfxid)
	{
		this.Gfxid = gfxid;
	}

	/**
	 * @return the gfxid
	 */
	public int getGfxid()
	{
		return Gfxid;
	}
	
	/**
	 * @param actid the actid to set
	 */
	public void setActid(int actid)
	{
		this.Actid = actid;
	}
	
	/**
	 * @return the actid
	 */
	public int getActid()
	{
		return Actid;
	}
	
	/**
	 * @param lawful the lawful to set
	 */
	public void setLawful(int Lawful)
	{
		this.Lawful = Lawful;
	}
	
	/**
	 * @return the lawful
	 */
	public int getLawful()
	{
		return Lawful;
	}

	/**
	 * @param dir the dir to set
	 */
	public void setDir(int dir)
	{
		Dir = dir;
	}

	/**
	 * @return the dir
	 */
	public int getDir()
	{
		return Dir;
	}

	/**
	 * @param light the light to set
	 */
	public void setLight(int light)
	{
		Light = light;
	}

	/**
	 * @return the light
	 */
	public int getLight()
	{
		return Light;
	}

	/**
	 * @param haste the haste to set
	 */
	public void setHaste(int haste)
	{
		Haste = haste;
	}

	/**
	 * @return the haste
	 */
	public int getHaste()
	{
		return Haste;
	}

	/**
	 * @param exp the exp to set
	 */
	public void setExp(int exp)
	{
		Exp = exp;
	}

	/**
	 * @return the exp
	 */
	public int getExp()
	{
		return Exp;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title)
	{
		Title = title;
	}

	/**
	 * @return the title
	 */
	public String getTitle()
	{
		return Title;
	}

	/**
	 * @param attr the attr to set
	 */
	public void setAttr(int attr)
	{
		Attr = attr;
	}

	/**
	 * @return the attr
	 */
	public int getAttr()
	{
		return Attr;
	}

	/**
	 * @param clanid the clanid to set
	 */
	public void setClanid(int clanid)
	{
		Clanid = clanid;
	}

	/**
	 * @return the clanid
	 */
	public int getClanid()
	{
		return Clanid;
	}

	/**
	 * @param clan the clan to set
	 */
	public void setClan(String clan)
	{
		Clan = clan;
	}

	/**
	 * @return the clan
	 */
	public String getClan()
	{
		return Clan;
	}

	/**
	 * @param master the master to set
	 */
	public void setMaster(String master)
	{
		Master = master;
	}

	/**
	 * @return the master
	 */
	public String getMaster()
	{
		return Master;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(int state)
	{
		State = state;
	}

	/**
	 * @return the state
	 */
	public int getState()
	{
		return State;
	}

	/**
	 * @param hpbar the hpbar to set
	 */
	public void setHpbar(int hpbar)
	{
		Hpbar = hpbar;
	}

	/**
	 * @return the hpbar
	 */
	public int getHpbar()
	{
		return Hpbar;
	}

	/**
	 * @param wave the wave to set
	 */
	public void setWave(int wave)
	{
		Wave = wave;
	}

	/**
	 * @return the wave
	 */
	public int getWave()
	{
		return Wave;
	}

	/**
	 * @param shop the shop to set
	 */
	public void setShop(String shop)
	{
		Shop = shop;
	}

	/**
	 * @return the shop
	 */
	public String getShop()
	{
		return Shop;
	}

	/**
	 * @param level the level to set
	 */
	public void setLevel(int level)
	{
		Level = level;
	}

	/**
	 * @return the level
	 */
	public int getLevel()
	{
		return Level;
	}
	
	public boolean isPlayer()
	{
		return (getAttr() & 4) == 4;
	}
}