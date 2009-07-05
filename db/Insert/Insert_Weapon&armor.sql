/* 20090506 台版活動與商城道具 不建議使用*/
/* 20090626 武器新增距離資訊 */
INSERT INTO `weapon` VALUES 
('500', '艾爾摩短劍', '$5828', 'dagger', 'iron', '30000', '3139', '68', '0', '5', '6', '1', '-1', '1', '1', '1', '1', '1', '0', '0', '3', '8', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('501', '艾爾摩單手劍', '$5829', 'sword', 'iron', '40000', '3133', '26', '0', '13', '15', '1', '-1', '1', '1', '1', '1', '1', '0', '0', '5', '6', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('502', '艾爾摩雙手劍', '$5830', 'tohandsword', 'iron', '60000', '3135', '59', '0', '17', '1', '20', '-1', '1', '1', '0', '0', '0', '1', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('503', '艾爾摩弩槍', '$5831', 'singlebow', 'iron', '30000', '3141', '4761', '0', '3', '2', '-1', '-1', '0', '0', '0', '1', '1', '0', '1', '4', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('504', '艾爾摩鋼爪', '$5832', 'claw', 'iron', '60000', '3145', '2911', '0', '17', '16', '1', '-1', '0', '0', '0', '0', '1', '0', '0', '4', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '360000'),
('505', '艾爾摩魔杖', '$5833', 'staff', 'iron', '75000', '3143', '781', '0', '7', '4', '1', '-1', '0', '0', '1', '0', '0', '0', '1', '5', '7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '3', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('506', '天雷劍', '$5905', 'dagger', 'iron', '20000', '3213', '68', '0', '8', '8', '1', '6', '1', '1', '1', '1', '1', '0', '0', '3', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
('507', '玄冰弓', '$5906', 'bow', 'wood', '40000', '3216', '7023', '0', '2', '2', '-1', '6', '1', '1', '1', '1', '1', '1', '1', '4', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '1', '0'),
('508', '艾爾摩鎖鏈劍', '$6405', 'chainsword', 'iron', '60000', '3301', '6946', '0', '17', '15', '1', '-1', '0', '0', '0', '0', '0', '1', '0', '0', '7', '0', '0', '1', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000'),
('509', '艾爾摩奇古獸', '$6406', 'kiringku', 'gemstone', '20000', '3303', '6967', '0', '33', '33', '1', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '35', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '360000');

/* 20090629 新增庫庫爾坎武器 */
INSERT INTO `weapon` VALUES 
('510', '庫庫爾坎鐵手甲', '庫庫爾坎鐵手甲', 'gauntlet', 'wood', '20000', '3324', '2921', '0', '3', '3', '-1', '6', '0', '0','0', '0', '1', '1', '0', '0', '4', '0', '0', '1', '0', '0', '0', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0'),
('511', '庫庫爾坎之矛', '庫庫爾坎之矛', 'spear', 'copper', '100000', '3330', '5', '0', '24', '20', '2', '6', '1', '1', '0', '0', '0', '0', '0', '5', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0');

INSERT INTO `weapon_skill` VALUES 
('506', '天雷劍', '8', '35', '25', '0', '0', '0', '34', '0', '0', '0'),
('507', '玄冰弓', '8', '35', '25', '2', '0', '0', '22', '0', '1', '0');

INSERT INTO `armor` VALUES ('21500', '殷海薩的智力腰帶', '$6395', 'belt', 'leather', '50000', '636', '1165', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21501', '殷海薩的力量腰帶', '$6393', 'belt', 'leather', '50000', '636', '1165', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21502', '殷海薩的敏捷腰帶', '$6394', 'belt', 'leather', '50000', '636', '1165', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21503', '殷海薩的魅力腰帶', '$6396', 'belt', 'leather', '50000', '636', '1165', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21504', '10週年紀念耳環', '$5507', 'earring', 'gold', '5000', '2891', '3963', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21505', '殷海薩耳環', '$6397', 'earring', 'iron', '0', '2664', '3963', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21506', '10週年紀念項鍊', '$5506', 'amulet', 'gold', '5000', '2893', '8', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0'),
('21507', '10週年紀念戒指', '$5505', 'ring', 'gold', '5000', '2895', '21', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '10', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21508', '聖光戒指', '聖光戒指', 'ring', 'gemstone', '10000', '1518', '3793', '0', '-3', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '30', '30', '30', '30', '0', '0', '0', '0', '0', '0'),
('21509', '8週年紀念戒指', '8週年紀念戒指', 'ring', 'gold', '3000', '2921', '21', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '3', '3', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21510', 'ID．信任戒指', 'ID．信任戒指', 'ring', 'gemstone', '1000', '3501', '21', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21511', 'ID．勇氣戒指', 'ID．勇氣戒指', 'ring', 'gemstone', '1000', '3503', '21', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21512', 'ID．信賴戒指', 'ID．信賴戒指', 'ring', 'gemstone', '1000', '3505', '21', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '50', '10', '0', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21513', 'ID．友情戒指', 'ID．友情戒指', 'ring', 'gemstone', '1000', '3507', '21', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '20', '30', '0', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21514', 'ID．永恆戒指', 'ID．永恆戒指', 'ring', 'gemstone', '1000', '3509', '21', '0', '-1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21515', 'ID．愛情戒指', 'ID．愛情戒指', 'ring', 'gemstone', '1000', '3499', '21', '0', '-2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '8', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21516', '艾爾摩皮盔甲', '$5834', 'armor', 'iron', '120000', '3131', '3770', '0', '-10', '-1', '1', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '25', '3', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '360000'),
('21517', '艾爾摩金屬盔甲', '$5835', 'armor', 'leather', '270000', '3137', '3768', '0', '-13', '-1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '25', '0', '6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '10', '0', '0', '360000'),
('21518', '艾爾摩法袍', '$5836', 'armor', 'cloth', '35000', '3132', '9', '0', '-10', '-1', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '30', '1', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '360000'),
('21519', '智力長靴(風)', '智力長靴(風)', 'boots', 'leather', '15000', '2863', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0'),
('21520', '智力長靴(水)', '智力長靴(水)', 'boots', 'leather', '15000', '2861', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21521', '智力長靴(火)', '智力長靴(火)', 'boots', 'leather', '15000', '2859', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0'),
('21522', '智力長靴(地)', '智力長靴(地)', 'boots', 'leather', '15000', '2865', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0'),
('21523', '敏捷長靴(風)', '敏捷長靴(風)', 'boots', 'leather', '15000', '2847', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0'),
('21524', '敏捷長靴(水)', '敏捷長靴(水)', 'boots', 'leather', '15000', '2849', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21525', '敏捷長靴(火)', '敏捷長靴(火)', 'boots', 'leather', '15000', '2843', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0'),
('21526', '敏捷長靴(地)', '敏捷長靴(地)', 'boots', 'leather', '15000', '2845', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0'),
('21527', '力量長靴(風)', '力量長靴(風)', 'boots', 'leather', '15000', '2857', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0'),
('21528', '力量長靴(水)', '力量長靴(水)', 'boots', 'leather', '15000', '2855', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21529', '力量長靴(火)', '力量長靴(火)', 'boots', 'leather', '15000', '2853', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0'),
('21530', '力量長靴(地)', '力量長靴(地)', 'boots', 'leather', '15000', '2851', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0'),
('21531', '魅力長靴(風)', '魅力長靴(風)', 'boots', 'leather', '15000', '2841', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0'),
('21532', '魅力長靴(水)', '魅力長靴(水)', 'boots', 'leather', '15000', '2839', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21533', '魅力長靴(火)', '魅力長靴(火)', 'boots', 'leather', '15000', '2837', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0'),
('21534', '魅力長靴(地)', '魅力長靴(地)', 'boots', 'leather', '15000', '2835', '25', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0'),
('21535', '強化抗魔斗篷', '$6453', 'cloak', 'cloth', '15000', '2562', '6126', '0', '-2', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '30', '0', '0', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21536', '強化屬性斗篷(火)', '$6454', 'cloak', 'cloth', '15000', '2562', '6126', '0', '-2', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '30', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0'),
('21537', '強化屬性斗篷(風)', '$6455', 'cloak', 'cloth', '15000', '2562', '6126', '0', '-2', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '30', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0'),
('21538', '強化屬性斗篷(水)', '$6456', 'cloak', 'cloth', '15000', '2562', '6126', '0', '-2', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '30', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21539', '強化屬性斗篷(地)', '$6457', 'cloak', 'cloth', '15000', '2562', '6126', '0', '-2', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '30', '0', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '20', '0', '0', '0', '0', '0', '0');
('21546', '九週年紀念耳環', '九週年紀念耳環', 'earring', 'gold', '1000', '3590', '3963', '0', '-3', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '50', '0', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21547', '九週年紀念項鍊', '九週年紀念項鍊', 'amulet', 'gold', '5000', '3592', '8', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '10', '30', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '10', '10', '10', '10', '0', '0', '0', '0', '0', '0'),
('21548', '九週年紀念戒', '九週年紀念戒', 'ring', 'gold', '3000', '3594', '21', '0', '0', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '20', '0', '2', '3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

/* 20090629 新增庫庫爾坎防具 */
INSERT INTO `armor` VALUES 
('21540', '庫庫爾坎面具', '庫庫爾坎面具', 'helm', 'wood', '5000', '3326', '18', '0', '-3', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '5', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21541', '庫庫爾坎之盾', '庫庫爾坎之盾', 'shield', 'wood', '30000', '3328', '23', '0', '-3', '6', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0'),
('21542', '傑弗雷庫之牙', '傑弗雷庫之牙', 'amulet', 'bone', '1000', '3332', '8', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '0', '0', '30', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21543', '傑弗雷庫之眼', '傑弗雷庫之眼', 'amulet', 'gemstone', '1000', '3334', '8', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '1', '0', '1', '0', '0', '0', '10', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21544', '奧拉奇里亞的頭盔', '奧拉奇里亞的頭盔', 'helm', 'dragonscale', '9000', '3283', '7131', '0', '-2', '6', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21545', '堅固的奧拉奇里亞頭盔', '堅固的奧拉奇里亞頭盔', 'helm', 'dragonscale', '9000', '3283', '7131', '0', '-2', '6', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21108', '不可思議的抗魔T恤', '不可思議的抗魔T恤', 'T', 'cloth', '10000', '2663', '24', '0', '0', '4', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

/* 以下目前正服無圖檔 */
INSERT INTO `weapon` VALUES 
('512', '祭司魔杖', '祭司魔杖', 'staff', 'mineral', '90000', '3534', '781', '0', '1', '1', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '15', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800'),
('513', '戰士巨劍', '戰士巨劍', 'tohandsword', 'mineral', '110000', '3524', '59', '0', '3', '38', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '3', '4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800'),
('514', '戰士之劍', '戰士之劍', 'sword', 'mineral', '70000', '3530', '26', '0', '25', '3', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800'),
('515', '戰士之弓', '戰士之弓', 'bow', 'mineral', '60000', '3532', '4761', '0', '3', '3', '-1', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800'),
('516', '戰士雙刀', '戰士雙刀', 'edoryu', 'mineral', '60000', '3526', '2923', '0', '16', '13', '1', '-1', '1', '1', '1', '1', '1', '1', '1', '1', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800'),
('517', '戰士之矛', '戰士之矛', 'spear', 'mineral', '100000', '3528', '5', '0', '30', '30', '2', '-1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1800');
INSERT INTO `armor` VALUES 
('21549', '席琳樹葉冠冕', '席琳樹葉冠冕', 'helm', 'vegetation', '5000', '3290', '7135', '0', '-2', '6', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('21550', '光輝席琳樹葉冠冕', '光輝席琳樹葉冠冕', 'helm', 'vegetation', '5000', '3290', '7135', '0', '-2', '6', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');