package net.l1j.server.model.instance;

import java.util.logging.Logger;

import javolution.util.FastTable;

import net.l1j.server.model.L1Attack;
import net.l1j.server.serverpackets.S_ChangeHeading;
import net.l1j.server.templates.L1Npc;
import net.l1j.server.utils.CalcExp;

public class L1ScarecrowInstance extends L1NpcInstance {

	private static final long serialVersionUID = 1L;

	private static Logger _log = Logger.getLogger(L1ScarecrowInstance.class
			.getName());

	public L1ScarecrowInstance(L1Npc template) {
		super(template);
	}

	@Override
	public void onAction(L1PcInstance player) {
		L1Attack attack = new L1Attack(player, this);
		if (attack.calcHit()) {
			if (player.getLevel() < 5) { // ＬＶ制限もうける場合はここを變更
				FastTable<L1PcInstance> targetList = new FastTable<L1PcInstance>();

				targetList.add(player);
				FastTable<Integer> hateList = new FastTable<Integer>();
				hateList.add(1);
				CalcExp.calcExp(player, getId(),
						targetList, hateList, getExp());
			}
			if (getHeading() < 7) { // 今の向きを取得
				setHeading(getHeading() + 1); // 今の向きを設定
			} else {
				setHeading(0); // 今の向きが7 以上になると今の向きを0に戾す
			}
			broadcastPacket(new S_ChangeHeading(this)); // 向きの變更
		}
		attack.action();
	}

	@Override
	public void onTalkAction(L1PcInstance l1pcinstance) {

	}

	public void onFinalAction() {

	}

	public void doFinalAction() {}
}