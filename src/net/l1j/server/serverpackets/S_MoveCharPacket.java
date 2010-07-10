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
package net.l1j.server.serverpackets;

import net.l1j.server.Opcodes;
import net.l1j.server.model.L1Character;
import net.l1j.server.types.Base;

public class S_MoveCharPacket extends ServerBasePacket {
	private static final String S_MOVE_CHAR_PACKET = "[S] S_MoveCharPacket";

	private byte[] _byte = null;

	// ■■■■■■■■■■■■■ 移動關連 ■■■■■■■■■■■
	private static final int HEADING_TABLE_X[] = Base.HEADING_TABLE_X;
	private static final int HEADING_TABLE_Y[] = Base.HEADING_TABLE_Y;

	public S_MoveCharPacket(L1Character cha) {
		int x = cha.getX() - HEADING_TABLE_X[cha.getHeading()];
		int y = cha.getY() - HEADING_TABLE_Y[cha.getHeading()];

		writeC(Opcodes.S_OPCODE_MOVEOBJECT);
		writeD(cha.getId());
		writeH(x);
		writeH(y);
		writeC(cha.getHeading());
		writeC(129);
		writeD(0);
	}

	@Override
	public byte[] getContent() {
		if (_byte == null) {
			_byte = getBytes();
		}
		return _byte;
	}

	@Override
	public String getType() {
		return S_MOVE_CHAR_PACKET;
	}
}
