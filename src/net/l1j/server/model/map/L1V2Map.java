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
package net.l1j.server.model.map;

import net.l1j.server.ActionCodes;
import net.l1j.server.datatables.DoorSpawnTable;
import net.l1j.server.model.instance.L1DoorInstance;
import net.l1j.server.types.Base;
import net.l1j.server.types.Point;

public class L1V2Map extends L1Map {
	private final int _id;
	private final int _xLoc;
	private final int _yLoc;
	private final int _width;
	private final int _height;
	private final byte _map[];
	private boolean _isUnderwater;
	private boolean _isMarkable;
	private boolean _isTeleportable;
	private boolean _isEscapable;
	private boolean _isUseResurrection;
	private boolean _isUsePainwand;
	private boolean _isEnabledDeathPenalty;
	private boolean _isTakePets;
	private boolean _isRecallPets;
	private boolean _isUsableItem;
	private boolean _isUsableSkill;
	// ■■■■■■■■■■■■■ 移動關連 ■■■■■■■■■■■
	private static final byte HEADING_TABLE_X[] = Base.HEADING_TABLE_X;
	private static final byte HEADING_TABLE_Y[] = Base.HEADING_TABLE_Y;


	/**
	 * Mobなどの通行不可能になるオブジェクトがタイル上に存在するかを示すビットフラグ
	 */
	private static final byte BITFLAG_IS_IMPASSABLE = (byte) 128; // 1000 0000

	private int offset(int x, int y) {
		return ((y - _yLoc) * _width * 2) + ((x - _xLoc) * 2);
	}

	private int accessOriginalTile(int x, int y) {
		return _map[offset(x, y)] & (~BITFLAG_IS_IMPASSABLE);
	}

	public L1V2Map(int id, byte map[], int xLoc, int yLoc, int width,
			int height, boolean underwater, boolean markable,
			boolean teleportable, boolean escapable, boolean useResurrection,
			boolean usePainwand, boolean enabledDeathPenalty, boolean takePets,
			boolean recallPets, boolean usableItem, boolean usableSkill) {
		_id = id;
		_map = map;
		_xLoc = xLoc;
		_yLoc = yLoc;
		_width = width;
		_height = height;

		_isUnderwater = underwater;
		_isMarkable = markable;
		_isTeleportable = teleportable;
		_isEscapable = escapable;
		_isUseResurrection = useResurrection;
		_isUsePainwand = usePainwand;
		_isEnabledDeathPenalty = enabledDeathPenalty;
		_isTakePets = takePets;
		_isRecallPets = recallPets;
		_isUsableItem = usableItem;
		_isUsableSkill = usableSkill;
	}

	@Override
	public int getHeight() {
		return _height;
	}

	@Override
	public int getId() {
		return _id;
	}

	@Override
	public int getOriginalTile(int x, int y) {
		int lo = _map[offset(x, y)];
		int hi = _map[offset(x, y) + 1];
		return (lo | ((hi << 8) & 0xFF00));
	}

	@Override
	public int getTile(int x, int y) {
		return _map[offset(x, y)];
	}

	@Override
	public int getWidth() {
		return _width;
	}

	@Override
	public int getX() {
		return _xLoc;
	}

	@Override
	public int getY() {
		return _yLoc;
	}

	@Override
	public boolean isArrowPassable(Point pt) {
		return isArrowPassable(pt.getX(), pt.getY());
	}

	@Override
	public boolean isArrowPassable(int x, int y) {
		return (accessOriginalTile(x, y) != 1);
	}

	@Override
	public boolean isArrowPassable(Point pt, int heading) {
		return isArrowPassable(pt.getX(), pt.getY(), heading);
	}

	@Override
	public boolean isArrowPassable(int x, int y, int heading) {
		if (heading == -1) { // -1 解
			return false;
		}
		int tile;
		// 移動予定の座標
		int newX = x + HEADING_TABLE_X[heading];
		int newY = y + HEADING_TABLE_Y[heading];
		tile = accessOriginalTile(newX, newY);

		if (isExistDoor(newX, newY)) {
			return false;
		} else {
			return (tile != 1);
		} // 5.20 End
	}

	@Override
	public boolean isCombatZone(Point pt) {
		return isCombatZone(pt.getX(), pt.getY());
	}

	@Override
	public boolean isCombatZone(int x, int y) {
		return (accessOriginalTile(x, y) == 8);
	}

	@Override
	public boolean isInMap(Point pt) {
		return isInMap(pt.getX(), pt.getY());
	}

	@Override
	public boolean isInMap(int x, int y) {
		return (_xLoc <= x && x < _xLoc + _width && _yLoc <= y && y < _yLoc
				+ _height);
	}

	@Override
	public boolean isNormalZone(Point pt) {
		return isNormalZone(pt.getX(), pt.getY());
	}

	@Override
	public boolean isNormalZone(int x, int y) {
		return (!isCombatZone(x, y) && !isSafetyZone(x, y));
	}

	@Override
	public boolean isPassable(Point pt) {
		return isPassable(pt.getX(), pt.getY());
	}

	@Override
	public boolean isPassable(int x, int y) {
		int tile = accessOriginalTile(x, y);
		if (tile == 1 || tile == 9 || tile == 65 || tile == 69 || tile == 73) {
			return false;
		} else if (0 != (_map[offset(x, y)] & BITFLAG_IS_IMPASSABLE)) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public boolean isPassable(Point pt, int heading) {
		return isPassable(pt.getX(), pt.getY(), heading);
	}

	@Override
	public boolean isPassable(int x, int y, int heading) {
		if (heading == -1) { // -1 解
			return false;
		}
		int tile;
		tile = accessOriginalTile(x + HEADING_TABLE_X[heading], y + HEADING_TABLE_Y[heading]); // 5.10 End

		if (tile == 1 || tile == 9 || tile == 65 || tile == 69 || tile == 73) { // 5.20 Start
			return false;
		} else if (0 != (_map[offset(x, y)] & BITFLAG_IS_IMPASSABLE)) {
			return false;
		} else {
			return true; // 5.20 End
		}
	}

	@Override
	public boolean isSafetyZone(Point pt) {
		return isSafetyZone(pt.getX(), pt.getY());
	}

	@Override
	public boolean isSafetyZone(int x, int y) {
		return accessOriginalTile(x, y) == 4;
	}

	@Override
	public void setPassable(Point pt, boolean isPassable) {
		setPassable(pt.getX(), pt.getY(), isPassable);
	}

	@Override
	public void setPassable(int x, int y, boolean isPassable) {
		if (isPassable) {
			_map[offset(x, y)] &= (~BITFLAG_IS_IMPASSABLE);
		} else {
			_map[offset(x, y)] |= BITFLAG_IS_IMPASSABLE;
		}
	}

	@Override
	public boolean isUnderwater() {
		return _isUnderwater;
	}

	@Override
	public boolean isMarkable() {
		return _isMarkable;
	}

	@Override
	public boolean isTeleportable() {
		return _isTeleportable;
	}

	@Override
	public boolean isEscapable() {
		return _isEscapable;
	}

	@Override
	public boolean isUseResurrection() {
		return _isUseResurrection;
	}

	@Override
	public boolean isUsePainwand() {
		return _isUsePainwand;
	}

	@Override
	public boolean isEnabledDeathPenalty() {
		return _isEnabledDeathPenalty;
	}

	@Override
	public boolean isTakePets() {
		return _isTakePets;
	}

	@Override
	public boolean isRecallPets() {
		return _isRecallPets;
	}

	@Override
	public boolean isUsableItem() {
		return _isUsableItem;
	}

	@Override
	public boolean isUsableSkill() {
		return _isUsableSkill;
	}

	@Override
	public boolean isFishingZone(int x, int y) {
		return accessOriginalTile(x, y) == 16;
	}

	@Override
	public boolean isExistDoor(int x, int y) {
		for (L1DoorInstance door : DoorSpawnTable.getInstance().getDoorList()) {
			if (door.getOpenStatus() == ActionCodes.ACTION_Open) {
				continue;
			}
			if (door.isDead()) {
				continue;
			}
			int leftEdgeLocation = door.getLeftEdgeLocation();
			int rightEdgeLocation = door.getRightEdgeLocation();
			int size = rightEdgeLocation - leftEdgeLocation;
			if (size == 0) { // 1マス分の幅のドア
				if (x == door.getX() && y == door.getY()) {
					return true;
				}
			} else { // 2マス分以上の幅があるドア
				if (door.getDirection() == 0) { // ／向き
					for (int doorX = leftEdgeLocation;
							doorX <= rightEdgeLocation; doorX++) {
						if (x == doorX && y == door.getY()) {
							return true;
						}
					}
				} else { // ＼向き
					for (int doorY = leftEdgeLocation;
							doorY <= rightEdgeLocation; doorY++) {
						if (x == door.getX() && y == doorY) {
							return true;
						}
					}
				}
			}
		}
		return false;
	}

	@Override
	public String toString(Point pt) {
		int tile = getOriginalTile(pt.getX(), pt.getY());

		return (tile & 0xFF) + " " + ((tile >> 8) & 0xFF);
	}
}