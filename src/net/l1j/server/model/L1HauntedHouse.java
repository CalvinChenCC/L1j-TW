/*
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * http://www.gnu.org/copyleft/gpl.html
 */
package net.l1j.server.model;

import java.util.Timer;
import java.util.TimerTask;

import javolution.util.FastTable;

import net.l1j.server.model.L1Object;
import net.l1j.server.model.id.SystemMessageId;
import net.l1j.server.model.instance.L1DoorInstance;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.model.skill.SkillUse;
import net.l1j.server.serverpackets.S_ServerMessage;
import net.l1j.server.types.Base;

import static net.l1j.server.model.skill.SkillId.*;

public class L1HauntedHouse {
	private final FastTable<L1PcInstance> _members = new FastTable<L1PcInstance>();

	public static final int STATUS_NONE = 0;
	public static final int STATUS_READY = 1;
	public static final int STATUS_PLAYING = 2;

	private int _hauntedHouseStatus = STATUS_NONE;
	private int _winnersCount = 0;
	private int _goalCount = 0;

	private static L1HauntedHouse _instance;

	public static L1HauntedHouse getInstance() {
		if (_instance == null) {
			_instance = new L1HauntedHouse();
		}
		return _instance;
	}

	private void readyHauntedHouse() {
		setHauntedHouseStatus(STATUS_READY);
		L1HauntedHouseReadyTimer hhrTimer = new L1HauntedHouseReadyTimer();
		hhrTimer.begin();
	}

	private void startHauntedHouse() {
		setHauntedHouseStatus(STATUS_PLAYING);
		int membersCount = getMembersCount();
		if (membersCount <= 4) {
			setWinnersCount(1);
		} else if (5 >= membersCount && membersCount <= 7) {
			setWinnersCount(2);
		} else if (8 >= membersCount && membersCount <= 10) {
			setWinnersCount(3);
		}
		for (L1PcInstance pc : getMembersArray()) {
			SkillUse skilluse = new SkillUse();
			skilluse.handleCommands(pc, SKILL_CANCEL_MAGIC, pc.getId(), pc.getX(), pc.getY(), null, 0, Base.SKILL_TYPE[1]);
			L1PolyMorph.doPoly(pc, 6284, 300, L1PolyMorph.MORPH_BY_NPC);
		}

		for (L1Object object : L1World.getInstance().getObject()) {
			if (object instanceof L1DoorInstance) {
				L1DoorInstance door = (L1DoorInstance) object;
				if (door.getMapId() == 5140) {
					door.open();
				}
			}
		}
	}

	public void endHauntedHouse() {
		setHauntedHouseStatus(STATUS_NONE);
		setWinnersCount(0);
		setGoalCount(0);
		for (L1PcInstance pc : getMembersArray()) {
			if (pc.getMapId() == 5140) {
				SkillUse skilluse = new SkillUse();
				skilluse.handleCommands(pc, SKILL_CANCEL_MAGIC, pc.getId(), pc.getX(), pc.getY(), null, 0, Base.SKILL_TYPE[1]);
				L1Teleport.teleport(pc, 32624, 32813, (short) 4, 5, true);
			}
		}
		clearMembers();
		for (L1Object object : L1World.getInstance().getObject()) {
			if (object instanceof L1DoorInstance) {
				L1DoorInstance door = (L1DoorInstance) object;
				if (door.getMapId() == 5140) {
					door.close();
				}
			}
		}
	}

	public void removeRetiredMembers() {
		L1PcInstance[] temp = getMembersArray();
		for (int i = 0; i < temp.length; i++) {
			if (temp[i].getMapId() != 5140) {
				removeMember(temp[i]);
			}
		}
	}

	public void sendMessage(SystemMessageId type, String msg) {
		for (L1PcInstance pc : getMembersArray()) {
			pc.sendPackets(new S_ServerMessage(type, msg));
		}
	}

	public void addMember(L1PcInstance pc) {
		if (!_members.contains(pc)) {
			_members.add(pc);
		}
		if (getMembersCount() == 1 && getHauntedHouseStatus() == STATUS_NONE) {
			readyHauntedHouse();
		}
	}

	public void removeMember(L1PcInstance pc) {
		_members.remove(pc);
	}

	public void clearMembers() {
		_members.clear();
	}

	public boolean isMember(L1PcInstance pc) {
		return _members.contains(pc);
	}

	public L1PcInstance[] getMembersArray() {
		return _members.toArray(new L1PcInstance[_members.size()]);
	}

	public int getMembersCount() {
		return _members.size();
	}

	private void setHauntedHouseStatus(int i) {
		_hauntedHouseStatus = i;
	}

	public int getHauntedHouseStatus() {
		return _hauntedHouseStatus;
	}

	private void setWinnersCount(int i) {
		_winnersCount = i;
	}

	public int getWinnersCount() {
		return _winnersCount;
	}

	public void setGoalCount(int i) {
		_goalCount = i;
	}

	public int getGoalCount() {
		return _goalCount;
	}

	public class L1HauntedHouseReadyTimer extends TimerTask {

		public L1HauntedHouseReadyTimer() {
		}

		@Override
		public void run() {
			startHauntedHouse();
			L1HauntedHouseTimer hhTimer = new L1HauntedHouseTimer();
			hhTimer.begin();
		}

		public void begin() {
			Timer timer = new Timer();
			timer.schedule(this, 90000); // 90秒くらい？
		}

	}

	public class L1HauntedHouseTimer extends TimerTask {

		public L1HauntedHouseTimer() {
		}

		@Override
		public void run() {
			endHauntedHouse();
			this.cancel();
		}

		public void begin() {
			Timer timer = new Timer();
			timer.schedule(this, 300000); // 5分
		}

	}
}
