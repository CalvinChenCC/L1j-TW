/* 20090412 waja add 新手村 正義者 邪惡者正義值*/
Update npc Set lawful = '65535' Where npcid = '70503';
Update npc Set lawful = '-65535' Where npcid = '70511';

/* 守護神行走速度降低 */
Update npc Set passispeed = '1700' Where npcid = '70848'; /* 安特 */
Update npc Set passispeed = '1500' Where npcid = '70850'; /* 潘 */
Update npc Set passispeed = '1500' Where npcid = '70846'; /* 芮克妮 */
Update npc Set passispeed = '1200' Where npcid = '70851'; /* 精靈 */

/* 20090506 刪除日版專用NPC分佈 */
delete from spawnlist_npc where npc_templateid = 71035 ;