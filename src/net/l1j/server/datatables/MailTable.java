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
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;

import javolution.util.FastTable;

import net.l1j.Config;
import net.l1j.L1DatabaseFactory;
import net.l1j.server.IdFactory;
import net.l1j.server.model.instance.L1PcInstance;
import net.l1j.server.templates.L1Mail;
import net.l1j.util.SQLUtil;

public class MailTable {
	private final static Logger _log = Logger.getLogger(MailTable.class.getName());

	private static MailTable _instance;

	private static FastTable<L1Mail> _allMail = new FastTable<L1Mail>();

	public static MailTable getInstance() {
		if (_instance == null) {
			_instance = new MailTable();
		}
		return _instance;
	}

	private MailTable() {
		loadMail();
	}

	private void loadMail() {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("SELECT * FROM mail");
			rs = pstm.executeQuery();
			while (rs.next()) {
				L1Mail mail = new L1Mail();
				mail.setId(rs.getInt("id"));
				mail.setType(rs.getInt("type"));
				mail.setSenderName(rs.getString("sender"));
				mail.setReceiverName(rs.getString("receiver"));
				mail.setDate(rs.getString("date"));
				mail.setReadStatus(rs.getInt("read_status"));
				mail.setSubject(rs.getBytes("subject"));
				mail.setContent(rs.getBytes("content"));

				_allMail.add(mail);
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, "error while creating mail table", e);
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
	}

	public void setReadStatus(int mailId) {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			rs = con.createStatement().executeQuery("SELECT * FROM mail WHERE id=" + mailId);
			if (rs != null && rs.next()) {
				pstm = con.prepareStatement("UPDATE mail SET read_status=? WHERE id=" + mailId);
				pstm.setInt(1, 1);
				pstm.execute();

				changeMailStatus(mailId);
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
	}

	public void setMailType(int mailId, int type) {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			rs = con.createStatement().executeQuery("SELECT * FROM mail WHERE id=" + mailId);
			if (rs != null && rs.next()) {
				pstm = con.prepareStatement("UPDATE mail SET type=? WHERE id=" + mailId);
				pstm.setInt(1, type);
				pstm.execute();

				changeMailType(mailId, type);
			}
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(rs, pstm, con);
		}
	}

	public void deleteMail(int mailId) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm = con.prepareStatement("DELETE FROM mail WHERE id=?");
			pstm.setInt(1, mailId);
			pstm.execute();

			delMail(mailId);
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm, con);
		}

	}

	public void writeMail(int type, String receiver, L1PcInstance writer, byte[] text) {
		int readStatus = 0;

		SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
		TimeZone tz = TimeZone.getTimeZone(Config.TIME_ZONE);
		String date = sdf.format(Calendar.getInstance(tz).getTime());

		// subjectとcontentの區切り(0x00 0x00)位置を見つける
		int spacePosition1 = 0;
		int spacePosition2 = 0;
		for (int i = 0; i < text.length; i += 2) {
			if (text[i] == 0 && text[i + 1] == 0) {
				if (spacePosition1 == 0) {
					spacePosition1 = i;
				} else if (spacePosition1 != 0 && spacePosition2 == 0) {
					spacePosition2 = i;
					break;
				}
			}
		}

		// mailテーブルに書き遣む
		int subjectLength = spacePosition1 + 2;
		int contentLength = spacePosition2 - spacePosition1;
		if (contentLength <= 0) {
			contentLength = 1;
		}
		byte[] subject = new byte[subjectLength];
		byte[] content = new byte[contentLength];
		System.arraycopy(text, 0, subject, 0, subjectLength);
		System.arraycopy(text, subjectLength, content, 0, contentLength);

		Connection con = null;
		PreparedStatement pstm2 = null;
		try {
			con = L1DatabaseFactory.getInstance().getConnection();
			pstm2 = con.prepareStatement("INSERT INTO mail SET id=?, type=?, sender=?, receiver=?, date=?, read_status=?, subject=?, content=?");
			int id = IdFactory.getInstance().nextId();
			pstm2.setInt(1, id);
			pstm2.setInt(2, type);
			pstm2.setString(3, writer.getName());
			pstm2.setString(4, receiver);
			pstm2.setString(5, date);
			pstm2.setInt(6, readStatus);
			pstm2.setBytes(7, subject);
			pstm2.setBytes(8, content);
			pstm2.execute();

			L1Mail mail = new L1Mail();
			mail.setId(id);
			mail.setType(type);
			mail.setSenderName(writer.getName());
			mail.setReceiverName(receiver);
			mail.setDate(date);
			mail.setSubject(subject);
			mail.setContent(content);
			mail.setReadStatus(readStatus);

			_allMail.add(mail);
		} catch (SQLException e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		} finally {
			SQLUtil.close(pstm2, con);
		}
	}

	public static FastTable<L1Mail> getAllMail() {
		return _allMail;
	}

	public static L1Mail getMail(int mailId) {
		for (L1Mail mail : _allMail) {
			if (mail.getId() == mailId) {
				return mail;
			}
		}
		return null;
	}

	private void changeMailStatus(int mailId) {
		for (L1Mail mail : _allMail) {
			if (mail.getId() == mailId) {
				L1Mail newMail = mail;
				newMail.setReadStatus(1);

				_allMail.remove(mail);
				_allMail.add(newMail);
				break;
			}
		}
	}

	private void changeMailType(int mailId, int type) {
		for (L1Mail mail : _allMail) {
			if (mail.getId() == mailId) {
				L1Mail newMail = mail;
				newMail.setType(type);

				_allMail.remove(mail);
				_allMail.add(newMail);
				break;
			}
		}
	}

	private void delMail(int mailId) {
		for (L1Mail mail : _allMail) {
			if (mail.getId() == mailId) {
				_allMail.remove(mail);
				break;
			}
		}
	}
}
