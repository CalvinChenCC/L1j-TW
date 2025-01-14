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
package net.l1j.server.command.executor;

import java.util.Map;
import java.util.StringTokenizer;

import javolution.util.FastMap;

import net.l1j.server.datatables.NpcSpawnTable;
import net.l1j.server.datatables.SpawnTable;
import net.l1j.server.model.L1Spawn;
import net.l1j.server.model.L1Teleport;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.serverpackets.S_SystemMessage;

public class L1ToSpawn implements L1CommandExecutor {
	private static final Map<Integer, Integer> _spawnId = new FastMap<Integer, Integer>();

	public static L1CommandExecutor getInstance() {
		return new L1ToSpawn();
	}

	@Override
	public void execute(L1PcInstance pc, String cmdName, String arg) {
		try {
			if (!_spawnId.containsKey(pc.getId())) {
				_spawnId.put(pc.getId(), 0);
			}
			int id = _spawnId.get(pc.getId());
			if (arg.isEmpty() || arg.equals("+")) {
				id++;
			} else if (arg.equals("-")) {
				id--;
			} else {
				StringTokenizer st = new StringTokenizer(arg);
				id = Integer.parseInt(st.nextToken());
			}
			L1Spawn spawn = NpcSpawnTable.getInstance().getTemplate(id);
			if (spawn == null) {
				spawn = SpawnTable.getInstance().getTemplate(id);
			}
			if (spawn != null) {
				L1Teleport.teleport(pc, spawn.getLocX(), spawn.getLocY(), spawn.getMapId(), 5, false);
				pc.sendPackets(new S_SystemMessage("移動到刷怪編號 spawnid(" + id + ")"));
			} else {
				pc.sendPackets(new S_SystemMessage("刷怪編號 spawnid(" + id + ")沒找到!!"));
			}
			_spawnId.put(pc.getId(), id);
		} catch (Exception exception) {
			pc.sendPackets(new S_SystemMessage("請輸入 " + cmdName + " spawnid|+|-"));
		}
	}
}
