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

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import net.l1j.log.LogTradeAddItem;
import net.l1j.log.LogTradeComplete;
import net.l1j.server.model.instance.L1ItemInstance;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.serverpackets.S_TradeAddItem;
import net.l1j.server.serverpackets.S_TradeStatus;

// Referenced classes of package net.l1j.server.model:
// L1Trade

public class L1Trade {
	private static L1Trade _instance;

	public L1Trade() {
	}

	public static L1Trade getInstance() {
		if (_instance == null) {
			_instance = new L1Trade();
		}
		return _instance;
	}

	public void TradeAddItem(L1PcInstance player, int itemid, int itemcount) {
		L1PcInstance trading_partner = (L1PcInstance) L1World.getInstance()
				.findObject(player.getTradeID());
		L1ItemInstance l1iteminstance = player.getInventory().getItem(itemid);
		if (l1iteminstance != null && trading_partner != null) {
			if (!l1iteminstance.isEquipped()) {
				int itembefore = player.getInventory().countItems(l1iteminstance.getItem().getItemId());
				if (l1iteminstance.getCount() < itemcount || 0 > itemcount) {
					player.sendPackets(new S_TradeStatus(1));
					trading_partner.sendPackets(new S_TradeStatus(1));
					player.setTradeOk(false);
					trading_partner.setTradeOk(false);
					player.setTradeID(0);
					trading_partner.setTradeID(0);
					return;
				}
				player.getInventory().tradeItem(l1iteminstance, itemcount,
						player.getTradeWindowInventory());
				player.sendPackets(new S_TradeAddItem(l1iteminstance,
						itemcount, 0));
				trading_partner.sendPackets(new S_TradeAddItem(l1iteminstance,
						itemcount, 1));
				int itemafter = player.getInventory().countItems(l1iteminstance.getItem().getItemId());
				LogTradeAddItem ltai = new LogTradeAddItem();
				ltai.storeLogTradeAddItem(player, trading_partner, l1iteminstance, itembefore, itemafter, itemcount);
			}
		}
	}

	public void TradeOK(L1PcInstance player) {
		int cnt;
		L1PcInstance trading_partner = (L1PcInstance) L1World.getInstance()
				.findObject(player.getTradeID());
		if (trading_partner != null) {
			List player_tradelist = player.getTradeWindowInventory().getItems();
			int player_tradecount = player.getTradeWindowInventory().getSize();

			List trading_partner_tradelist = trading_partner
					.getTradeWindowInventory().getItems();
			int trading_partner_tradecount = trading_partner
					.getTradeWindowInventory().getSize();

			for (cnt = 0; cnt < player_tradecount; cnt++) {
				L1ItemInstance l1iteminstance1 = (L1ItemInstance) player_tradelist
						.get(0);
				int itembeforeinven = player.getInventory().countItems(l1iteminstance1.getItem().getItemId());
				player.getTradeWindowInventory().tradeItem(l1iteminstance1,
						l1iteminstance1.getCount(),
						trading_partner.getInventory());
				int itemafter = player.getInventory().countItems(l1iteminstance1.getItem().getItemId());
				LogTradeComplete ltc = new LogTradeComplete();
				ltc.storeLogTradeComplete(player, trading_partner, l1iteminstance1, player_tradecount, itembeforeinven, itemafter, player_tradecount);
			}
			for (cnt = 0; cnt < trading_partner_tradecount; cnt++) {
				L1ItemInstance l1iteminstance2 = (L1ItemInstance) trading_partner_tradelist
						.get(0);
				int itembeforeinven = player.getInventory().countItems(l1iteminstance2.getItem().getItemId());
				trading_partner.getTradeWindowInventory().tradeItem(
						l1iteminstance2, l1iteminstance2.getCount(),
						player.getInventory());
				int itemafter = player.getInventory().countItems(l1iteminstance2.getItem().getItemId());
				LogTradeComplete ltc = new LogTradeComplete();
				ltc.storeLogTradeComplete(trading_partner, player, l1iteminstance2, trading_partner_tradecount, itembeforeinven, itemafter, trading_partner_tradecount);
			}

			player.sendPackets(new S_TradeStatus(0));
			trading_partner.sendPackets(new S_TradeStatus(0));
			player.setTradeOk(false);
			trading_partner.setTradeOk(false);
			player.setTradeID(0);
			trading_partner.setTradeID(0);
			player.turnOnOffLight();
			trading_partner.turnOnOffLight();
		}
	}

	// waja add 交易紀錄 文件版 寫入檔案
	public static void trade(String info) {
		try {
			BufferedWriter out = new BufferedWriter(new FileWriter(
					"log/trade.log", true));
			out.write(info + "\r\n");
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// add end
	public void TradeCancel(L1PcInstance player) {
		int cnt;
		L1PcInstance trading_partner = (L1PcInstance) L1World.getInstance()
				.findObject(player.getTradeID());
		if (trading_partner != null) {
			List player_tradelist = player.getTradeWindowInventory().getItems();
			int player_tradecount = player.getTradeWindowInventory().getSize();

			List trading_partner_tradelist = trading_partner
					.getTradeWindowInventory().getItems();
			int trading_partner_tradecount = trading_partner
					.getTradeWindowInventory().getSize();

			for (cnt = 0; cnt < player_tradecount; cnt++) {
				L1ItemInstance l1iteminstance1 = (L1ItemInstance) player_tradelist
						.get(0);
				player.getTradeWindowInventory().tradeItem(l1iteminstance1,
						l1iteminstance1.getCount(), player.getInventory());
			}
			for (cnt = 0; cnt < trading_partner_tradecount; cnt++) {
				L1ItemInstance l1iteminstance2 = (L1ItemInstance) trading_partner_tradelist
						.get(0);
				trading_partner.getTradeWindowInventory().tradeItem(
						l1iteminstance2, l1iteminstance2.getCount(),
						trading_partner.getInventory());
			}

			player.sendPackets(new S_TradeStatus(1));
			trading_partner.sendPackets(new S_TradeStatus(1));
			player.setTradeOk(false);
			trading_partner.setTradeOk(false);
			player.setTradeID(0);
			trading_partner.setTradeID(0);
		}
	}
}