/*
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */
package net.l1j.gui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.swing.DefaultListModel;
import javax.swing.JFrame;
import javax.swing.JLayeredPane;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;

import net.l1j.gui.images.ImagesTable;

import com.nilo.plaf.nimrod.NimRODLookAndFeel;
import com.nilo.plaf.nimrod.NimRODTheme;

/**
 * L1J-TW 伺服器管理器
 * 
 * @author impreza8837
 */
public class ServerManager extends JFrame {
	private static final long serialVersionUID = 1L;

	private static final Logger _log = Logger.getLogger(ServerManager.class.getName());

	private static int mousePointX, mousePointY;

	private static ServerManager _instance;

	private NimRODTheme themeNimROD;
	private NimRODLookAndFeel lookNimROD;

	private JLayeredPane layeredPanel;
	private JPanel contentPanel;

	private JTabbedPane tabbedPanelList;

	public static DefaultListModel listModelPlayer;
	private JScrollPane scrollPanelPlayer;
	private JList listPlayer;

//	public static DefaultListModel listModelIp;
//	private JScrollPane scrollPanelIp;
//	private JList listIp;

	private JTabbedPane tabbedPanelMessage;

	private JScrollPane scrollPanelSystem;
	private JTextArea textAreaSystem;

	private JPanel panelMemory;

	public static ServerManager getInstance() {
		if (_instance == null) {
			_instance = new ServerManager();
		}
		return _instance;
	}

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					ServerManager frame = new ServerManager();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public ServerManager() {
		initComponents();
	}

	private void initComponents() {
		setIconImage(ImagesTable.getImage("servermanager.ico"));
		setTitle("L1J-TW Server Manager");
		setTheme("DarkGrey");
		setResizable(false);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(0, 0, 680, 300);
		setLocationRelativeTo(null);
		setVisible(false);

		contentPanel = new JPanel();
		contentPanel.setBorder(null);
		contentPanel.setLayout(new BorderLayout(0, 0));
		contentPanel.addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent evt) {
				panelMousePressed(evt);
			}
		});
		contentPanel.addMouseMotionListener(new MouseMotionAdapter() {
			public void mouseDragged(MouseEvent evt) {
				panelMouseDragged(evt);
			}
		});
		setContentPane(contentPanel);

		layeredPanel = new JLayeredPane();
		contentPanel.add(layeredPanel, BorderLayout.CENTER);

		tabbedPanelList = new JTabbedPane();
		tabbedPanelList.setAutoscrolls(true);
		tabbedPanelList.setBounds(10, 11, 154, 253);
		layeredPanel.add(tabbedPanelList);

		listModelPlayer = new DefaultListModel();

		listPlayer = new JList(listModelPlayer);

		scrollPanelPlayer = new JScrollPane();
		scrollPanelPlayer.setViewportView(listPlayer);
		tabbedPanelList.add(scrollPanelPlayer, "玩家");

//		listModelIp = new DefaultListModel();
//
//		listIp = new JList(listModelIp);
//
//		scrollPanelIp = new JScrollPane();
//		scrollPanelIp.setViewportView(listIp);
//		tabbedPanelList.add(scrollPanelIp, "連線");

		tabbedPanelMessage = new JTabbedPane();
		tabbedPanelMessage.setAutoscrolls(true);
		tabbedPanelMessage.setBounds(174, 11, 370, 253);
		layeredPanel.add(tabbedPanelMessage);

		textAreaSystem = new JTextArea();
		textAreaSystem.setFont(new Font(null, Font.PLAIN, 11));
		textAreaSystem.setEditable(false);

		scrollPanelSystem = new JScrollPane();
		scrollPanelSystem.setViewportView(textAreaSystem);
		tabbedPanelMessage.add(scrollPanelSystem, "系統");

		panelMemory = MemoryMonitor.getInstance();
		panelMemory.setBounds(554, 35, 110, 225);
		layeredPanel.add(panelMemory);
	}

	private void panelMousePressed(MouseEvent evt) {
		mousePointX = evt.getX();
		mousePointY = evt.getY();
	}

	private void panelMouseDragged(MouseEvent evt) {
		setLocation(getX() - (mousePointX - evt.getX()), getY() - (mousePointY - evt.getY()));
	}

	private void setTheme(String theme) {
		themeNimROD = new NimRODTheme("./data/theme/" + theme + ".theme");
		lookNimROD = new NimRODLookAndFeel();

		NimRODLookAndFeel.setCurrentTheme(themeNimROD);
		try {
			UIManager.setLookAndFeel(lookNimROD);
		} catch (Exception e) {
			_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
		}
	}

	public void setPrintStream() {
		OutputStream output = new OutputStream() {
			@Override
			public void write(int b) throws IOException {
				textAreaSystem.append(String.valueOf((char) b));
				int length = textAreaSystem.getText().length();
				textAreaSystem.setCaretPosition(length);
			}

			@Override
			public void write(byte b[]) throws IOException {
				textAreaSystem.append(new String(b));
				int length = textAreaSystem.getText().length();
				textAreaSystem.setCaretPosition(length);
			}

			@Override
			public void write(byte b[], int off, int len) throws IOException {
				textAreaSystem.append(new String(b, off, len));
				int length = textAreaSystem.getText().length();
				textAreaSystem.setCaretPosition(length);
			}
		};

		PrintStream print = new PrintStream(output);
		System.setOut(print);
		System.setErr(print);
	}
}
