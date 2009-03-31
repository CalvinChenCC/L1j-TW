#----------------------------
# Table structure for spawnlist_boss
#----------------------------
CREATE TABLE `spawnlist_boss` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `location` varchar(45) NOT NULL default '',
  `cycle_type` varchar(20) NOT NULL default '',
  `count` int(10) unsigned NOT NULL default 0,
  `npc_id` int(10) unsigned NOT NULL default 0,
  `group_id` int(10) unsigned NOT NULL default 0,
  `locx` int(10) unsigned NOT NULL default 0,
  `locy` int(10) unsigned NOT NULL default 0,
  `randomx` int(10) unsigned NOT NULL default 0,
  `randomy` int(10) unsigned NOT NULL default 0,
  `locx1` int(10) unsigned NOT NULL default 0,
  `locy1` int(10) unsigned NOT NULL default 0,
  `locx2` int(10) unsigned NOT NULL default 0,
  `locy2` int(10) unsigned NOT NULL default 0,
  `heading` int(10) unsigned NOT NULL default 0,
  `mapid` int(10) unsigned NOT NULL default 0,
  `respawn_screen` tinyint(1) unsigned NOT NULL default 0,
  `movement_distance` int(10) unsigned NOT NULL default 0,
  `rest` tinyint(1) unsigned NOT NULL default 0,
  `spawn_type` tinyint unsigned NOT NULL default 0,
  `percentage` tinyint unsigned NOT NULL default 100,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#----------------------------
# Records for table spawnlist_boss
#----------------------------
INSERT INTO `spawnlist_boss` VALUES
(1, 'シーシンガー', 'Caspa', 1, 45228, 0, 32804, 32869, 0, 0, 32576, 32640, 32895, 32959, 5, 63, 1, 0, 0, 0, 100),
(2, 'タイガー Lv5', 'Unknown', 1, 45313, 0, 32767, 32899, 0, 0, 32660, 32791, 32875, 33007, 0, 480, 0, 0, 0, 0, 100),
(3, 'バンディット(トライ ソウル)', 'DK', 1, 45317, 0, 32770, 32730, 0, 0, 32704, 32704, 32831, 32831, 5, 56, 1, 0, 0, 0, 100),
(4, 'クロコダイル Lv32', 'Caspa', 1, 45338, 0, 33503, 33205, 0, 0, 33485, 33185, 33522, 33227, 0, 4, 0, 100, 0, 0, 100),
(5, 'バンディット ボス', 'etc1', 1, 45370, 0, 33878, 32749, 10, 10, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(6, 'バンディット ボス', 'etc1', 1, 45370, 0, 33859, 32766, 10, 10, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(7, 'バンディット ボス', 'etc1', 1, 45370, 0, 33781, 32681, 10, 10, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(8, 'バンディット ボス', 'etc1', 1, 45370, 0, 33841, 32778, 10, 10, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(9, 'バンディット ボス', 'etc1', 1, 45370, 0, 33820, 32664, 10, 10, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(10, 'ネクロマンサー', 'etc1', 1, 45456, 15, 32727, 32751, 0, 0, 32704, 32704, 32831, 32831, 0, 12, 0, 0, 0, 0, 100),
(11, 'ドレイク', 'Oren', 1, 45458, 0, 32764, 32837, 0, 0, 0, 0, 0, 0, 5, 443, 0, 0, 0, 0, 100),
(17, 'カスパー', 'Caspa', 1, 45488, 14, 32762, 32768, 0, 0, 32704, 32704, 32831, 32831, 0, 9, 1, 0, 0, 0, 100),
(18, 'シュノーヴァ Lv44', 'etc1', 1, 45492, 49, 32767, 32899, 0, 0, 32660, 32791, 32875, 33007, 0, 480, 0, 0, 0, 0, 100),
(19, 'マンボ ラビット 海賊島', 'Caspa', 1, 45534, 20, 32594, 33009, 0, 0, 32581, 32993, 32654, 33044, 0, 440, 1, 100, 0, 0, 100),
(21, 'ゼニス クイーン', 'Oren', 1, 45513, 0, 32798, 32798, 0, 0, 32704, 32704, 32895, 32895, 6, 110, 1, 0, 0, 0, 100),
(22, 'イフリート', '1Drake', 1, 45516, 0, 33644, 32269, 0, 0, 33635, 32232, 33659, 32300, 0, 4, 1, 0, 0, 0, 100),
(23, 'イフリート', '1Drake', 1, 45516, 0, 33672, 32311, 0, 0, 33655, 32288, 33690, 32335, 0, 4, 1, 0, 0, 0, 100),
(24, 'イフリート', '1Drake', 1, 45516, 0, 33719, 32269, 0, 0, 33697, 32237, 33740, 32283, 0, 4, 1, 0, 0, 0, 100),
(25, 'イフリート', '1Drake', 1, 45516, 0, 33737, 32281, 0, 0, 33723, 32270, 33765, 32329, 0, 4, 1, 0, 0, 0, 100),
(26, 'ドレイク', '2Drake', 1, 45529, 17, 33406, 32412, 0, 0, 33398, 32403, 33410, 32415, 5, 4, 1, 100, 0, 0, 100),
(27, 'ドレイク', '1Drake', 1, 45529, 0, 33355, 32353, 0, 0, 33339, 32348, 33354, 32363, 5, 4, 1, 100, 0, 0, 100),
(28, 'ドレイク', '1Drake', 1, 45529, 0, 33389, 32336, 0, 0, 33382, 32330, 33397, 32345, 5, 4, 1, 100, 0, 0, 100),
(29, 'ドレイク', '2Drake', 1, 45529, 17, 33365, 32384, 0, 0, 33356, 32375, 33371, 32390, 5, 4, 1, 100, 0, 0, 100),
(30, 'マンボ ラビット', 'Caspa', 1, 45535, 21, 32799, 32839, 0, 0, 32723, 32787, 32875, 32892, 0, 430, 1, 0, 0, 0, 100),
(31, 'ブラック エルダー', 'Caspa', 1, 45545, 16, 33385, 32349, 1, 1, 0, 0, 0, 0, 0, 4, 1, 100, 0, 0, 100),
(32, 'ブラック エルダー', 'Caspa', 1, 45545, 16, 33271, 32394, 1, 1, 0, 0, 0, 0, 0, 4, 1, 100, 0, 0, 100),
(33, 'ドッペルゲンガー', 'Aden', 1, 45546, 0, 33709, 33307, 0, 0, 33698, 33281, 33745, 33328, 0, 4, 1, 100, 0, 0, 100),
(34, 'シアー', 'Oren', 1, 45547, 0, 32800, 32799, 0, 0, 32722, 32722, 32877, 32877, 0, 120, 1, 0, 0, 0, 100),
(35, 'バフォメット', 'Oren', 1, 45573, 0, 32706, 32846, 0, 0, 32704, 32842, 32711, 32849, 5, 2, 1, 0, 0, 0, 100),
(36, 'ベレス', 'Oren', 1, 45583, 0, 32768, 32768, 0, 0, 32758, 32758, 32777, 32777, 0, 24, 1, 0, 0, 0, 100),
(37, 'グレート ミノタウルス', 'Aden', 1, 45584, 0, 32652, 32726, 0, 0, 32640, 32713, 32676, 32761, 0, 70, 1, 0, 0, 0, 100),
(38, 'カーツ', 'Night', 1, 45600, 13, 32635, 32959, 0, 0, 32621, 32951, 32640, 32971, 0, 0, 1, 0, 0, 0, 100),
(39, 'デスナイト', 'DK', 1, 45601, 0, 32799, 32804, 0, 0, 32704, 32704, 32831, 32831, 0, 11, 1, 0, 0, 0, 100),
(42, 'バンパイア', 'Oren', 1, 45606, 0, 32799, 32799, 0, 0, 32722, 32722, 32877, 32877, 6, 130, 1, 0, 0, 0, 100),
(43, 'アイス クイーン', 'Oren', 1, 45609, 0, 32767, 32900, 0, 0, 32763, 32886, 32783, 32910, 5, 74, 1, 0, 0, 0, 100),
(44, 'エンシェント ジャイアント', 'Aden', 1, 45610, 0, 34230, 33369, 0, 0, 34238, 33383, 34254, 33406, 0, 4, 1, 100, 0, 0, 100),
(45, 'ジャイアント アント クイーン', 'DK', 1, 45614, 0, 32742, 32856, 12, 12, 0, 0, 0, 0, 4, 543, 1, 0, 0, 0, 100),
(46, 'フェニックス', 'DK', 1, 45617, 0, 33723, 32255, 0, 0, 33718, 32240, 33725, 32268, 0, 4, 1, 100, 0, 0, 100),
(47, 'ナイトバルド', 'Oren', 1, 45618, 0, 32724, 32822, 0, 0, 32576, 32768, 32767, 32959, 5, 180, 1, 0, 0, 0, 100),
(48, '混沌', 'DK', 1, 45625, 0, 32734, 32895, 6, 6, 0, 0, 0, 0, 0, 522, 1, 0, 0, 0, 100),
(49, 'ユニコーン', 'Caspa', 3, 45640, 0, 32740, 32735, 0, 0, 32728, 32717, 32752, 32753, 4, 303, 1, 0, 0, 0, 100),
(50, '地の大精靈', 'Caspa', 3, 45642, 0, 32727, 32749, 0, 0, 32685, 32701, 32770, 32798, 4, 303, 1, 0, 0, 0, 100),
(51, '水の大精靈', 'Caspa', 3, 45643, 0, 32762, 32616, 0, 0, 32717, 32593, 32808, 32640, 4, 303, 1, 0, 0, 0, 100),
(52, '風の大精靈', 'Caspa', 3, 45644, 0, 32624, 32807, 0, 0, 32588, 32739, 32660, 32876, 4, 303, 1, 0, 0, 0, 100),
(53, '火の大精靈', 'Caspa', 3, 45645, 0, 32833, 32778, 0, 0, 32798, 32738, 32869, 32818, 4, 303, 1, 0, 0, 0, 100),
(54, '深淵の主', 'Oren', 1, 45646, 22, 32824, 32815, 0, 0, 32704, 32768, 32959, 33023, 0, 430, 1, 0, 0, 0, 100),
(55, 'デーモン', 'Oren', 1, 45649, 0, 32698, 32823, 0, 0, 32640, 32768, 32767, 32895, 0, 82, 1, 0, 0, 0, 100),
(56, 'ゾンビ ロード', 'Oren', 1, 45650, 0, 32800, 32797, 0, 0, 32722, 32722, 32877, 32877, 0, 140, 1, 0, 0, 0, 100),
(57, 'バランカ', 'Aden', 0, 45651, 19, 32915, 32896, 0, 0, 32964, 32881, 32998, 32915, 0, 320, 0, 0, 0, 0, 100),
(58, 'クーガー', 'Oren', 1, 45652, 0, 32794, 32800, 0, 0, 32722, 32722, 32877, 32877, 5, 150, 1, 0, 0, 0, 100),
(59, 'マミーロード', 'Oren', 1, 45653, 0, 32721, 32822, 0, 0, 32576, 32768, 32767, 32959, 3, 160, 1, 0, 0, 0, 100),
(60, 'アイリス', 'Oren', 1, 45654, 0, 32721, 32822, 0, 0, 32576, 32768, 32767, 32959, 0, 170, 1, 0, 0, 0, 100),
(61, 'アリオク', 'Aden', 1, 45671, 0, 32681, 32947, 0, 0, 32678, 32937, 32692, 32948, 5, 243, 1, 0, 0, 0, 100),
(62, 'リッチ', 'Oren', 1, 45672, 0, 32716, 32817, 0, 0, 32576, 32768, 32767, 32959, 0, 190, 1, 0, 0, 0, 100),
(63, 'グリムリーパー', 'Oren', 1, 45673, 0, 32784, 32806, 0, 0, 32576, 32768, 32831, 33023, 6, 200, 1, 0, 0, 0, 100),
(64, '死', 'DK', 1, 45674, 0, 32746, 32897, 0, 0, 0, 0, 0, 0, 0, 523, 1, 0, 0, 0, 100),
(65, 'ヤヒ', 'DK', 1, 45675, 0, 32733, 32894, 0, 0, 0, 0, 0, 0, 0, 524, 1, 0, 0, 0, 100),
(68, 'ケンラウヘル', 'Aden', 1, 45680, 18, 34092, 33262, 0, 0, 34079, 33250, 34100, 33271, 0, 4, 0, 100, 0, 0, 100),
(69, 'リンドビオル', 'Dragon', 1, 45681, 0, 34041, 33007, 3, 3, 0, 0, 0, 0, 0, 4, 0, 100, 0, 0, 100),
(70, 'アンタラス', 'Dragon', 1, 45682, 0, 32697, 32823, 3, 3, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 100),
(71, 'パプリオン', 'Dragon', 1, 45683, 0, 32771, 32831, 3, 3, 0, 0, 0, 0, 0, 65, 0, 0, 0, 0, 100),
(72, 'ヴァラカス', 'Dragon', 1, 45684, 0, 32725, 32800, 3, 3, 0, 0, 0, 0, 0, 67, 0, 0, 0, 0, 100),
(73, '墮落', 'DK', 1, 45685, 0, 32904, 32801, 0, 0, 32889, 32788, 32916, 32810, 0, 410, 1, 0, 0, 0, 100),
(74, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32511, 33024, 0, 0, 32276, 32785, 32746, 33263, 0, 440, 0, 0, 0, 0, 100),
(75, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32767, 32899, 0, 0, 32660, 32791, 32875, 33007, 0, 480, 0, 0, 0, 0, 100),
(76, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32796, 32863, 0, 0, 32629, 32692, 32964, 32978, 0, 70, 0, 0, 0, 0, 100),
(77, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32671, 32862, 0, 0, 32527, 32718, 32815, 33007, 0, 69, 0, 0, 0, 0, 100),
(78, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32522, 33013, 0, 0, 32299, 32787, 32745, 33240, 0, 0, 0, 0, 0, 0, 100),
(79, '紀州犬の子犬 Lv5', 'Unknown', 1, 45711, 0, 32804, 32734, 0, 0, 32654, 32591, 32955, 32878, 0, 68, 0, 0, 0, 0, 100),
(80, '紀州犬の子犬 Lv5', 'Unknown', 5, 45711, 0, 33408, 32834, 0, 0, 32528, 32200, 34288, 33519, 0, 4, 0, 0, 0, 0, 100),
(81, '大王イカ', 'Unknown', 1, 45734, 0, 32781, 32799, 0, 0, 32704, 32768, 33215, 33279, 0, 558, 1, 0, 0, 0, 100),
(82, '半魚人の長', 'Unknown', 1, 45735, 0, 32781, 32799, 0, 0, 32704, 32768, 33215, 33279, 0, 558, 1, 0, 0, 0, 100),
(83, 'バルログ', 'DK', 1, 45752, 0, 32726, 32832, 0, 0, 0, 0, 0, 0, 0, 603, 1, 0, 0, 0, 100),
(84, '污れたオーク ウォリアー', 'Unknown', 1, 45772, 0, 32729, 32792, 0, 0, 32729, 32792, 32809, 32930, 5, 244, 1, 100, 0, 0, 100),
(85, 'スピリッド', 'Unknown', 1, 45795, 0, 32841, 32913, 0, 0, 32841, 32913, 32880, 32947, 5, 244, 1, 0, 0, 0, 100),
(86, 'マイノ シャーマンのダイア ゴーレム', 'Unknown', 1, 45801, 0, 32778, 32797, 0, 0, 0, 0, 0, 0, 5, 255, 1, 0, 0, 0, 100),
(87, 'マイノ シャーマン', 'Unknown', 1, 45802, 0, 32696, 32793, 0, 0, 32640, 32768, 32895, 33023, 5, 256, 1, 0, 0, 0, 100),
(88, 'バルバドス', 'Unknown', 1, 45829, 0, 32675, 32860, 0, 0, 0, 0, 0, 0, 0, 254, 1, 0, 0, 0, 100),
(89, 'パプリオンの信奉者', 'Caspa', 1, 81081, 0, 32727, 32808, 0, 0, 32640, 32768, 32767, 32895, 5, 60, 1, 0, 0, 0, 100),
(90, 'パプリオンの信奉者', 'Caspa', 1, 81081, 0, 32727, 32808, 0, 0, 32640, 32768, 32767, 32895, 5, 61, 1, 0, 0, 0, 100),
(91, 'ホセ', 'Oren', 1, 45548, 0, 32775, 32849, 0, 0, 32710, 32770, 32830, 32895, 5, 484, 0, 0, 0, 0, 100),
(92, '暗殺團長 ブレイズ', 'Unknown', 1, 45585, 0, 32785, 32837, 0, 0, 0, 0, 0, 0, 5, 495, 1, 0, 0, 0, 100),
(93, '親衛隊長 カイト', 'Unknown', 1, 45574, 0, 32831, 32762, 0, 0, 0, 0, 0, 0, 5, 494, 1, 0, 0, 0, 100),
(94, '暗殺軍王 スレイヴ', 'Unknown', 1, 45648, 0, 32853, 32863, 0, 0, 0, 0, 0, 0, 5, 492, 1, 0, 0, 0, 100),
(95, '旅團長 ダークパンサー', 'Unknown', 1, 45577, 0, 32783, 32837, 0, 0, 0, 0, 0, 0, 5, 452, 1, 0, 0, 0, 100),
(96, '魔獸軍王 バランカ', 'Unknown', 1, 45844, 0, 32838, 32758, 0, 0, 0, 0, 0, 0, 5, 453, 1, 0, 0, 0, 100),
(97, '師團長 シンクレア', 'Unknown', 1, 45588, 0, 32745, 32823, 0, 0, 0, 0, 0, 0, 5, 456, 1, 0, 0, 0, 100),
(98, '魔獸團長 カイバール', 'Unknown', 1, 45607, 0, 32758, 32823, 0, 0, 0, 0, 0, 0, 5, 455, 1, 0, 0, 0, 100),
(99, '神官長 バウンティ', 'Unknown', 1, 45612, 0, 32770, 32829, 0, 0, 0, 0, 0, 0, 5, 466, 1, 0, 0, 0, 100),
(100, '魔法團長 カルミエル', 'Unknown', 1, 45602, 0, 32842, 32821, 0, 0, 0, 0, 0, 0, 5, 461, 1, 0, 0, 0, 100),
(101, '魔靈軍王 ライア', 'Unknown', 1, 45863, 0, 32805, 32839, 0, 0, 0, 0, 0, 0, 5, 462, 1, 0, 0, 0, 100),
(102, '傭兵隊長 メファイスト', 'Unknown', 1, 45608, 0, 32791, 32815, 0, 0, 0, 0, 0, 0, 5, 471, 1, 0, 0, 0, 100),
(103, '冥法團長 クリファス', 'Unknown', 1, 45615, 0, 32922, 32846, 0, 0, 0, 0, 0, 0, 5, 473, 1, 0, 0, 0, 100),
(104, '冥法軍王 ヘルバイン', 'Unknown', 1, 45676, 0, 32785, 32844, 0, 0, 0, 0, 0, 0, 5, 475, 1, 0, 0, 0, 100),
(105, '伯爵親衛隊長', 'Unknown', 1, 46024, 51, 32737, 32827, 0, 0, 0, 0, 0, 0, 5, 250, 1, 0, 0, 0, 100),
(106, 'タロス伯爵', 'Unknown', 1, 46025, 0, 32809, 32796, 0, 0, 0, 0, 0, 0, 5, 251, 1, 0, 0, 0, 100),
(107, 'マモン', 'Unknown', 1, 46026, 0, 32797, 32790, 0, 0, 0, 0, 0, 0, 5, 251, 1, 0, 0, 0, 100),
(108, '黑魔術師 マヤ', 'Unknown', 1, 46037, 0, 32796, 33072, 0, 0, 0, 0, 0, 0, 6, 258, 1, 0, 0, 0, 100),
(109, '咒われたメデューサ', '1Drake', 1, 45935, 0, 32700, 32830, 0, 0, 32640, 32768, 32767, 32895, 0, 60, 1, 0, 0, 0, 100),
(110, '咒われた水の大精靈', '1Drake', 1, 45942, 0, 32700, 32830, 0, 0, 32640, 32768, 32767, 32895, 0, 61, 1, 0, 0, 0, 100),
(111, '咒われた巫女 サエル', '1Drake', 1, 45941, 0, 32735, 32799, 0, 0, 32576, 32640, 32895, 32959, 0, 63, 1, 0, 0, 0, 100),
(112, '水の精靈', '1Drake', 1, 45931, 0, 32735, 32799, 0, 0, 32576, 32640, 32895, 32959, 0, 63, 1, 0, 1, 0, 100),
(113, 'カープ', '1Drake', 1, 45943, 0, 32735, 32799, 0, 0, 32576, 32640, 32895, 32959, 0, 63, 1, 0, 0, 0, 100),
(114, 'ジャイアント ワーム', '1Drake', 1, 45944, 0, 32735, 32799, 0, 0, 32576, 32640, 32895, 32959, 0, 63, 1, 0, 0, 0, 100),
(115, '大法官 ケイナ', 'Unknown', 1, 45955, 0, 32862, 32840, 0, 0, 0, 0, 0, 0, 5, 530, 1, 0, 0, 0, 100),
(116, '大法官 ビアタス', 'Unknown', 1, 45956, 0, 32757, 32744, 0, 0, 0, 0, 0, 0, 5, 531, 1, 0, 0, 0, 100),
(117, '大法官 バロメス', 'Unknown', 1, 45957, 0, 32791, 32786, 0, 0, 0, 0, 0, 0, 5, 531, 1, 0, 0, 0, 100),
(118, '大法官 エンディアス', 'Unknown', 1, 45958, 0, 32845, 32857, 0, 0, 0, 0, 0, 0, 5, 531, 1, 0, 0, 0, 100),
(119, '大法官 イデア', 'Unknown', 1, 45959, 0, 32789, 32812, 0, 0, 0, 0, 0, 0, 5, 532, 1, 0, 0, 0, 100),
(120, '大法官 ティアメス', 'Unknown', 1, 45960, 0, 32859, 32897, 0, 0, 0, 0, 0, 0, 5, 533, 1, 0, 0, 0, 100),
(121, '大法官 ラミアス', 'Unknown', 1, 45961, 0, 32789, 32891, 0, 0, 0, 0, 0, 0, 5, 533, 1, 0, 0, 0, 100),
(122, '大法官 バロード', 'Unknown', 1, 45962, 0, 32753, 32811, 0, 0, 0, 0, 0, 0, 5, 533, 1, 0, 0, 0, 100),
(123, '副祭祀長 カサンドラ', 'Unknown', 1, 45963, 0, 32858, 32821, 0, 0, 0, 0, 0, 0, 5, 534, 1, 0, 0, 0, 100);
