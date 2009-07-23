/* 20090615 rev1865  npc 修改部份海底NPC速度資料 */
delete from npc where npcid = '45726' ;
delete from npc where npcid = '45727' ;
delete from npc where npcid = '45728' ;
delete from npc where npcid = '45729' ;
delete from npc where npcid = '45730' ;
delete from npc where npcid = '45731' ;
delete from npc where npcid = '45732' ;
delete from npc where npcid = '45734' ;
delete from npc where npcid = '45735' ;

INSERT INTO `npc` VALUES
(45726, 'スケルトン イール', '$4294', '', 'L1Monster', 5405, 36, 600, 300, -30, 18, 16, 15, 8, 8, 40, 1297, -200, 'large', 8, 2, 0, 720, 1000, 1000, 1000, 1, 0, 0, 0, 1, 0, 'skeletoneel', 1, -1, -1, 0, 0, 0, 5000, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45727, '深海のシーダンサー', '$4314', '', 'L1Monster', 1603, 45, 540, 800, -36, 10, 14, 10, 18, 18, 60, 2026, -30, 'small', 8, 1, 0, 960, 1440, 1440, 1440, 0, 0, 0, 1, 1, 0, 'seadancer', 1, -1, -1, 0, 0, 0, 5000, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45728, '深海魚', '$4292', '', 'L1Monster', 5289, 45, 1000, 0, -35, 18, 18, 10, 6, 6, 40, 2026, -100, 'large', 8, 1, 0, 640, 1040, 640, 640, 0, 0, 0, 0, 0, 0, 'deepseafish', 1, -1, -1, 0, 0, 0, 5000, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45729, '気弱な深海魚', '$4655', '', 'L1Monster', 5289, 45, 1000, 0, -35, 18, 18, 10, 6, 6, 40, 2026, -100, 'large', 8, 1, 0, 640, 1040, 640, 640, 0, 0, 0, 0, 0, 0, 'deepseafish', 1, -1, -1, 0, 0, 0, 5000, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45730, '半魚人', '$4291', '', 'L1Monster', 5554, 45, 800, 200, -35, 18, 18, 15, 12, 14, 70, 2026, -300, 'large', 8, 2, 0, 800, 720, 1440, 1440, 0, 1, 0, 0, 1, 1, 'fishman', 1, -1, -1, 0, 0, 0, 5000, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45731, '隠れている半魚人', '$4654', '', 'L1Monster', 5554, 45, 800, 200, -35, 18, 18, 15, 12, 14, 70, 2026, -300, 'large', 8, 2, 0, 800, 720, 1440, 1440, 0, 1, 0, 0, 0, 0, 'fishmaninv', 1, -1, -1, 0, 0, 0, 5000, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45732, '深海のイレッカドム', '$4317', '', 'L1Monster', 1616, 48, 1500, 300, -40, 20, 15, 17, 18, 15, 65, 2305, -60, 'large', 8, 2, 0, 960, 1240, 1240, 1240, 0, 0, 0, 0, 0, 0, 'angler', 1, -1, -1, 0, 0, 0, 5000, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 0, 0, 0),
(45734, '大王イカ', '$4293', '', 'L1Monster', 5547, 58, 4000, 500, -55, 18, 18, 16, 10, 12, 60, 3365, -200, 'large', 8, 2, 0, 960, 960, 1440, 1440, 0, 0, 0, 0, 0, 0, 'cuttlefish', 1, -1, -1, 0, 0, 0, 5000, 50, 5000, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 1),
(45735, '半魚人の長', '$4309', '', 'L1Monster', 5708, 60, 3000, 600, -50, 18, 18, 23, 12, 12, 80, 3601, -500, 'large', 8, 2, 0, 800, 720, 1440, 1440, 0, 1, 0, 0, 0, 0, 'fishman', 1, -1, -1, 0, 0, 0, 5000, 81, 5000, 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 1, 0, 1);