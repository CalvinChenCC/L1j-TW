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
package l1j.server.server.items.actions;

import l1j.server.Config;
import l1j.server.server.datatables.NpcTable;
import l1j.server.server.model.Instance.L1DollInstance;
import l1j.server.server.model.Instance.L1PcInstance;
import l1j.server.server.serverpackets.S_OwnCharStatus;
import l1j.server.server.serverpackets.S_ServerMessage;
import l1j.server.server.serverpackets.S_SkillIconGFX;
import l1j.server.server.serverpackets.S_SkillSound;
import l1j.server.server.templates.L1Npc;

public class MagicDoll {

	/** 魔法娃娃使用動作 */
	public static void Use(L1PcInstance pc, int itemId, int itemObjectId) {
		boolean isAppear = true;
		L1DollInstance doll = null;
		Object[] dollList = pc.getDollList().values().toArray();
		for (Object dollObject : dollList) {
			doll = (L1DollInstance) dollObject;
			if (doll.getItemObjId() == itemObjectId) { // 既に引き出しているマジックドール
				isAppear = false;
				break;
			}
		}

		if (isAppear) {
			if (!pc.getInventory().checkItem(41246, 50)) {
				pc.sendPackets(new S_ServerMessage(337, "$5240")); // \f1%0が不足しています。
				return;
			}
			if (dollList.length >= Config.MAX_DOLL_COUNT) {
				// \f1これ以上のモンスターを操ることはできません。
				pc.sendPackets(new S_ServerMessage(319));
				return;
			}
			int npcId = 0;
			int dollType = 0;
			if (itemId == 41248) {
				npcId = 80106;
				dollType = L1DollInstance.DOLLTYPE_BUGBEAR;
			} else if (itemId == 41249) {
				npcId = 80107;
				dollType = L1DollInstance.DOLLTYPE_SUCCUBUS;
			} else if (itemId == 41250) {
				npcId = 80108;
				dollType = L1DollInstance.DOLLTYPE_WAREWOLF;
			} else if (itemId == 49037) {
				npcId = 80129;
				dollType = L1DollInstance.DOLLTYPE_ELDER;
			} else if (itemId == 49038) {
				npcId = 80130;
				dollType = L1DollInstance.DOLLTYPE_CRUSTANCEAN;
			} else if (itemId == 49039) {
				npcId = 80131;
				dollType = L1DollInstance.DOLLTYPE_GOLEM;
			} else if (itemId == 31001) {// 魔法娃娃：希爾黛絲
				npcId = 90001;
				dollType = L1DollInstance.DOLLTYPE_SEADANCER;
			} else if (itemId == 31002) {// 魔法娃娃：雪怪
				npcId = 90002;
				dollType = L1DollInstance.DOLLTYPE_SNOWMAN;
			} else if (itemId == 31003) {// 魔法娃娃：蛇女
				npcId = 90003;
				dollType = L1DollInstance.DOLLTYPE_SERPENTWOMAN;
			} else if (itemId == 31004) {// 魔法娃娃：亞力安
				npcId = 90004;
				dollType = L1DollInstance.DOLLTYPE_COCKATRICE;
			} else if (itemId == 31005) { // 魔法娃娃：木人
				npcId = 90005;
				dollType = L1DollInstance.DOLLTYPE_SCARECROW;
			} else if (itemId == 31006) { // 魔法娃娃：史巴托
				npcId = 90006;
				dollType = L1DollInstance.DOLLTYPE_SPARTOI;
			} else if (itemId == 31007) { // 魔法娃娃：巫妖
				npcId = 90007;
				dollType = L1DollInstance.DOLLTYPE_LICH;
			} else if (itemId == 31008) { // 鐵門公會 魔法娃娃：雪怪
				npcId = 90008;
				dollType = L1DollInstance.DOLLTYPE_IRONGATES_SNOWMAN;
			} else if (itemId == 31009) { // 魔法娃娃：公主
				npcId = 90009;
				dollType = L1DollInstance.DOLLTYPE_PRINCESS;
			}
			L1Npc template = NpcTable.getInstance().getTemplate(npcId);
			doll = new L1DollInstance(template, pc, dollType, itemObjectId);
			pc.sendPackets(new S_SkillSound(doll.getId(), 5935));
			pc.broadcastPacket(new S_SkillSound(doll.getId(), 5935));
			pc.sendPackets(new S_SkillIconGFX(56, 1800));
			pc.sendPackets(new S_OwnCharStatus(pc));
			pc.getInventory().consumeItem(41246, 50);
		} else {
			pc.sendPackets(new S_SkillSound(doll.getId(), 5936));
			pc.broadcastPacket(new S_SkillSound(doll.getId(), 5936));
			doll.deleteDoll();
			pc.sendPackets(new S_SkillIconGFX(56, 0));
			pc.sendPackets(new S_OwnCharStatus(pc));
		}
	}

}