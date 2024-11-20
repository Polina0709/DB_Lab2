-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: instagram_db
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `userfollowers`
--

DROP TABLE IF EXISTS `userfollowers`;
/*!50001 DROP VIEW IF EXISTS `userfollowers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userfollowers` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `follower_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `usermessages`
--

DROP TABLE IF EXISTS `usermessages`;
/*!50001 DROP VIEW IF EXISTS `usermessages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usermessages` AS SELECT 
 1 AS `sender_id`,
 1 AS `receiver_id`,
 1 AS `content`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `useractivity`
--

DROP TABLE IF EXISTS `useractivity`;
/*!50001 DROP VIEW IF EXISTS `useractivity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `useractivity` AS SELECT 
 1 AS `user_id`,
 1 AS `action_type`,
 1 AS `action_description`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `postsharestats`
--

DROP TABLE IF EXISTS `postsharestats`;
/*!50001 DROP VIEW IF EXISTS `postsharestats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `postsharestats` AS SELECT 
 1 AS `post_id`,
 1 AS `share_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `postlikes`
--

DROP TABLE IF EXISTS `postlikes`;
/*!50001 DROP VIEW IF EXISTS `postlikes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `postlikes` AS SELECT 
 1 AS `post_id`,
 1 AS `like_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `postswithcomments`
--

DROP TABLE IF EXISTS `postswithcomments`;
/*!50001 DROP VIEW IF EXISTS `postswithcomments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `postswithcomments` AS SELECT 
 1 AS `post_id`,
 1 AS `caption`,
 1 AS `comment_content`,
 1 AS `comment_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `userfollowers`
--

/*!50001 DROP VIEW IF EXISTS `userfollowers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userfollowers` AS select `u`.`id` AS `user_id`,`u`.`username` AS `username`,count(`f`.`follower_id`) AS `follower_count` from (`users` `u` left join `followers` `f` on((`u`.`id` = `f`.`followed_id`))) group by `u`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usermessages`
--

/*!50001 DROP VIEW IF EXISTS `usermessages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usermessages` AS select `m`.`sender_id` AS `sender_id`,`m`.`receiver_id` AS `receiver_id`,`m`.`content` AS `content`,`m`.`created_at` AS `created_at` from ((`messages` `m` join `users` `u1` on((`m`.`sender_id` = `u1`.`id`))) join `users` `u2` on((`m`.`receiver_id` = `u2`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `useractivity`
--

/*!50001 DROP VIEW IF EXISTS `useractivity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `useractivity` AS select `a`.`user_id` AS `user_id`,`a`.`action_type` AS `action_type`,`a`.`action_description` AS `action_description`,`a`.`created_at` AS `created_at` from (`activity_logs` `a` join `users` `u` on((`a`.`user_id` = `u`.`id`))) order by `a`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `postsharestats`
--

/*!50001 DROP VIEW IF EXISTS `postsharestats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `postsharestats` AS select `p`.`id` AS `post_id`,count(`ps`.`id`) AS `share_count` from (`posts` `p` left join `post_shares` `ps` on((`p`.`id` = `ps`.`post_id`))) group by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `postlikes`
--

/*!50001 DROP VIEW IF EXISTS `postlikes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `postlikes` AS select `p`.`id` AS `post_id`,count(`l`.`id`) AS `like_count` from (`posts` `p` left join `likes` `l` on((`p`.`id` = `l`.`post_id`))) group by `p`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `postswithcomments`
--

/*!50001 DROP VIEW IF EXISTS `postswithcomments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `postswithcomments` AS select `p`.`id` AS `post_id`,`p`.`caption` AS `caption`,`c`.`content` AS `comment_content`,`c`.`created_at` AS `comment_date` from (`posts` `p` left join `comments` `c` on((`p`.`id` = `c`.`post_id`))) where (`p`.`deleted_at` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-20 13:08:30
