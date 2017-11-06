DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20171104225441');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20171104225441');
-- Add your query below.

-- This updates quest 3562 to be a minimum required level of 45
-- http://web.archive.org/web/20050117052220/http://wow.allakhazam.com:80/db/quest.html?wquest=3565
-- (Note archive for 3562 doesn't show a minimum level but it should be the same as 3565)

-- Update quest minimum levels
UPDATE quest_template SET minLevel = 45 WHERE entry = 3562;

-- End of migration.
END IF;
END??
delimiter ;
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
