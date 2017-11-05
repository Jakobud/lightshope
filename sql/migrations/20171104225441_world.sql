DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171104225441');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171104225441');
-- Add your query below.

--This update brings the following quests minimum level inline with eachother according to:
-- http://web.archive.org/web/20050117052220/http://wow.allakhazam.com:80/db/quest.html?wquest=3565

-- Update quest minimum levels
UPDATE quest_template SET minLevel = 48 WHERE entry IN (3562,3563,3564,3565);

-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
