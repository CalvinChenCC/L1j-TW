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
package net.l1j.server.datatables;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;

import javolution.util.FastMap;

import net.l1j.L1DatabaseFactory;
import net.l1j.server.model.L1PolyMorph;
import net.l1j.util.SQLUtil;

public class PolyTable {
	private final static Logger _log = Logger.getLogger(PolyTable.class.getName());

	private static PolyTable _instance;

	private final FastMap<String, L1PolyMorph> _polymorphs = new FastMap<String, L1PolyMorph>();

	private final FastMap<Integer, L1PolyMorph> _polyIdIndex = new FastMap<Integer, L1PolyMorph>();

	public static PolyTable getInstance() {
		if (_instance == null) {
			_instance = new PolyTable();
		}
		return _instance;
	}

	private PolyTable() {
		loadPolymorphs();
	}

	private void loadPolymorphs() {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM polymorphs");
			rs = pstm.executeQuery();
			fillPolyTable(rs);
		} catch (SQLException e) {
			_log.log(Level.SEVERE, "error while creating polymorph table", e);
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
	}

	private void fillPolyTable(ResultSet rs) throws SQLException {
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			int polyId = rs.getInt("polyid");
			int minLevel = rs.getInt("minlevel");
			int weaponEquipFlg = rs.getInt("weaponequip");
			int armorEquipFlg = rs.getInt("armorequip");
			boolean canUseSkill = rs.getBoolean("isSkillUse");
			int causeFlg = rs.getInt("cause");

			L1PolyMorph poly = new L1PolyMorph(id, name, polyId, minLevel, weaponEquipFlg, armorEquipFlg, canUseSkill, causeFlg);

			_polymorphs.put(name, poly);
			_polyIdIndex.put(polyId, poly);
		}

		_log.config("變身清單 " + _polymorphs.size() + "件");
	}

	public L1PolyMorph getTemplate(String name) {
		return _polymorphs.get(name);
	}

	public L1PolyMorph getTemplate(int polyId) {
		return _polyIdIndex.get(polyId);
	}
}
