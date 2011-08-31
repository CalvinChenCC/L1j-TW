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

public class S_Disconnect extends ServerBasePacket {

	public S_Disconnect() {
		int content = 500;

		writeC(Opcodes.S_OPCODE_DISCONNECT);
		writeH(content);
		writeD(0x00000000);
	}

	/**
	 *   0~21, 連線中斷
	 *     22, 有人以同樣的帳號登入，請注意，您的密碼可能已經外洩
	 */

	public S_Disconnect(int id) {
		writeC(Opcodes.S_OPCODE_DISCONNECT);
		writeC(id);
		writeD(0x00000000);
	}

	@Override
	public byte[] getContent() {
		return getBytes();
	}
}
