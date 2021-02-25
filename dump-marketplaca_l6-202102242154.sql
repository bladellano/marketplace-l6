-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: marketplaca_l6
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Games Pc','Categoria para games','games-pc','2021-02-09 15:20:11','2021-02-18 01:52:09'),(2,'Notebooks Dell','Categoria para notebooks','notebooks-dell','2021-02-09 15:20:11','2021-02-18 01:52:21'),(3,'Celular','Categorias para smartphones','celular','2021-02-15 03:10:10','2021-02-16 02:55:01'),(4,'Estabilizadores',NULL,'estabilizadores','2021-02-16 03:36:44','2021-02-16 03:36:44');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product`
--

DROP TABLE IF EXISTS `category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_product` (
  `product_id` bigint(20) unsigned NOT NULL,
  `category_id` bigint(20) unsigned NOT NULL,
  KEY `category_product_product_id_foreign` (`product_id`),
  KEY `category_product_category_id_foreign` (`category_id`),
  CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product`
--

LOCK TABLES `category_product` WRITE;
/*!40000 ALTER TABLE `category_product` DISABLE KEYS */;
INSERT INTO `category_product` VALUES (46,1),(46,2),(46,3),(10,1),(10,2),(22,2),(22,1),(45,1),(45,2),(47,2),(48,2),(49,2),(50,2),(50,3),(51,1),(51,2),(53,1),(53,2),(52,3),(44,1);
/*!40000 ALTER TABLE `category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_02_08_165604_create_table_store',1),(5,'2021_02_08_192012_create_products_table',1),(6,'2021_02_09_004608_create_categories_table',1),(7,'2021_02_09_005249_create_category_product_table',1),(8,'2021_02_15_235951_create_product_photos_table',2),(9,'2021_02_16_000217_alter_table_stores_add_column_logo',2),(10,'2021_02_24_010536_create_user_order_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_photos`
--

DROP TABLE IF EXISTS `product_photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_photos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_photos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_photos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_photos`
--

LOCK TABLES `product_photos` WRITE;
/*!40000 ALTER TABLE `product_photos` DISABLE KEYS */;
INSERT INTO `product_photos` VALUES (1,49,'products/bWuB6k8hLCV8ZmLX5SUuzwBSOQ7ngRZMF76XW7yw.jpg','2021-02-16 03:34:05','2021-02-16 03:34:05'),(2,49,'products/qzUMjq8q2Np47eUdUliBqKNHhu1gL41ibVMgsT0L.jpg','2021-02-16 03:34:05','2021-02-16 03:34:05'),(6,49,'products/T0a4DyfS8HU0HOp71o5F3WmWN3KCPRYmlGjHZKfP.jpg','2021-02-17 15:25:04','2021-02-17 15:25:04'),(16,53,'products/xDiU7LcO9rBrxjy5064e2EcRXluqpIqzv0kxFHYb.jpg','2021-02-20 21:29:12','2021-02-20 21:29:12'),(18,53,'products/qrCrqEDjNsfOqGLPYYVdjRJ43efmLxOlwH6yxijC.jpg','2021-02-20 21:29:12','2021-02-20 21:29:12'),(19,52,'products/yj3mCZMxWwA5NpA6edHUcOYH8sJEGrGbDHJIXbv1.jpg','2021-02-20 21:29:23','2021-02-20 21:29:23'),(20,52,'products/fddLZFj2p8vLiYZ7fLxtGSbsiauRfRQERJeExo2o.jpg','2021-02-20 21:29:38','2021-02-20 21:29:38'),(21,52,'products/zCTd8uk1uqqTHmDTRk4RkTdW3FMvA10b1R9au8jK.png','2021-02-20 21:29:38','2021-02-20 21:29:38'),(22,53,'products/FWxzfw08qgIkaqacbSPv30awaMULpODp1mGoxafl.jpg','2021-02-20 21:31:23','2021-02-20 21:31:23'),(23,53,'products/JbxXY3rOTG1DrfBzEfyFvD4Bd3nSNrBzNPKhuRJB.png','2021-02-20 21:31:23','2021-02-20 21:31:23'),(24,44,'products/qll7aDI6k6sHWVt9dk18EWXmu3cagQ9k69kZILpi.jpg','2021-02-20 21:32:36','2021-02-20 21:32:36'),(25,44,'products/ubodoufpaDeYHYJQOHvtwVk7O6OJaGXiETBBKTiz.jpg','2021-02-20 21:32:36','2021-02-20 21:32:36'),(26,50,'products/97VImj5EylZbyPfOjboVQEFSeb8a9YzOviYDCCPW.jpg','2021-02-20 21:32:54','2021-02-20 21:32:54'),(27,50,'products/XwQgjIABhbb8dQppYu4bX6K4G85shp8MYdtMHR4n.png','2021-02-20 21:32:54','2021-02-20 21:32:54'),(28,50,'products/GFtu0mma4cdjfYJJ31fuEGxoeJpOYgQfq56XjQl7.png','2021-02-20 21:32:54','2021-02-20 21:32:54'),(29,51,'products/CRYzvBv2C8w7ZyzF70lgK3vxmoWagMrbpwZdUyYC.jpg','2021-02-20 21:33:11','2021-02-20 21:33:11'),(30,51,'products/65h5duJ6DfVwxhvf4S0QVl3LAxCiObXmtGpMWNQE.png','2021-02-20 21:33:11','2021-02-20 21:33:11');
/*!40000 ALTER TABLE `product_photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_store_id_foreign` (`store_id`),
  CONSTRAINT `products_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,4,'Casey Erdman Editado','In ut ea ipsam itaque.','Suscipit et magni cumque enim eos optio laboriosam. Est ducimus et magnam consequatur. Sed non illo quisquam tempora aliquam nostrum perspiciatis. Ut voluptatibus nihil nemo minus. Et ducimus provident distinctio deserunt eligendi reiciendis sit occaecati. Repellat et rerum accusantium minima harum qui est.',1.49,'delectus-veritatis-at-magni-voluptatem','2021-02-09 14:48:53','2021-02-13 05:13:45'),(5,5,'Prof. Delores Balistreri V','Et dolores et quia impedit saepe.','Ut ut voluptas amet aspernatur. Soluta maxime minus non ducimus ex odit reprehenderit. Tempora ipsa sunt veritatis velit quod cumque. Natus blanditiis sint inventore rerum nam ratione. Quas id similique et sint voluptate. Cupiditate voluptatem explicabo sunt laborum. Harum eius dicta libero non necessitatibus.',9.86,'quibusdam-neque-consectetur-maiores-sed-at-sunt-molestiae','2021-02-09 14:48:53','2021-02-09 14:48:53'),(6,6,'Maria Feest','Voluptatibus velit voluptatum qui voluptatibus quod qui praesentium.','Commodi sed eveniet voluptatem laborum ratione dolorum. Dolores autem assumenda delectus similique. Et accusantium culpa aut veritatis eos veritatis consequatur. Neque harum quod nihil libero adipisci possimus.',8.62,'autem-pariatur-rerum-nisi-dolor','2021-02-09 14:48:53','2021-02-09 14:48:53'),(7,7,'Alfreda Reynolds DDS','Fugiat vitae cum asperiores minus.','Voluptatem voluptatibus ratione saepe quod ab cumque. Ut quo aliquam reprehenderit quisquam a. Occaecati animi vel amet culpa harum ipsum officia. Eius esse reiciendis in et. Incidunt quia ipsam quos explicabo corporis recusandae rerum.',7.08,'fuga-a-sunt-in-nostrum-incidunt-eius','2021-02-09 14:48:53','2021-02-09 14:48:53'),(8,8,'Edd Stamm','Et molestiae minima sit fugit eum quo.','Dolorem maxime omnis qui. Aliquid quibusdam architecto adipisci facere deserunt id dolore. Quo minima vero atque eos qui sunt. Delectus atque voluptas cupiditate.',8.52,'ut-repudiandae-ea-doloremque-officiis-est-quis-excepturi','2021-02-09 14:48:53','2021-02-09 14:48:53'),(9,9,'Stephania Muller','Iusto exercitationem cumque veritatis veritatis alias.','Aut excepturi enim perspiciatis suscipit eaque atque. Hic deleniti magnam voluptatibus velit possimus amet. Corrupti sapiente qui enim deserunt vero minus nulla. Aliquam minima esse fugit voluptatibus ut adipisci. Tenetur consequatur similique officiis sint cupiditate sapiente quia. Quis unde modi et maiores est nemo. In quo nesciunt id perferendis voluptatem sequi unde.',4.03,'et-qui-facilis-dicta-ipsam-quia-molestiae','2021-02-09 14:48:54','2021-02-09 14:48:54'),(10,10,'Prof. Rodrick Boehm','Molestiae necessitatibus explicabo sunt quaerat pariatur culpa aut.','Ad impedit eligendi illo amet error quis cumque. Sed omnis nobis officia incidunt. Ut ut velit fugit omnis dolores vitae vero. Dolorum sed eos eum in at voluptas.',2.67,'inventore-reiciendis-sint-incidunt','2021-02-09 14:48:54','2021-02-09 14:48:54'),(11,11,'Terry Veum DVM','Voluptatem velit debitis vel asperiores voluptas.','Quod consectetur dolorum consequatur quos voluptas. Velit voluptates voluptatem hic fugiat a ab et commodi. Velit sed et porro. Ipsa aut est recusandae dolores neque ut dolores.',9.37,'fuga-omnis-aspernatur-perspiciatis-quia','2021-02-09 14:48:54','2021-02-09 14:48:54'),(12,12,'Dr. Freddy Ratke V','Eum culpa velit eos.','Ipsum saepe qui et voluptatem dolorem et. Voluptatum corrupti molestiae asperiores officiis ducimus sit voluptatem. Rem neque qui laboriosam hic. Fugit et beatae et inventore rem. Hic architecto adipisci molestiae autem vitae.',4.39,'et-ipsum-odit-est-quaerat','2021-02-09 14:48:54','2021-02-09 14:48:54'),(13,13,'Janiya Baumbach','Quod consequatur eligendi id ullam dolore.','Corrupti natus ut quasi. Facilis hic maiores harum. Placeat occaecati et placeat architecto non voluptates. Qui doloribus distinctio sed ducimus explicabo. Fugit dolorum ad quis praesentium.',6.05,'veniam-autem-quia-dicta-tempore-veritatis-in-eius-quae','2021-02-09 14:48:54','2021-02-09 14:48:54'),(14,14,'Kurtis Nikolaus','Est possimus iure et dolor quia excepturi.','Iste quia debitis ullam illum libero dolore. Quia soluta atque rerum qui placeat. Facere eaque et consequuntur saepe consequatur. Non iusto ducimus consequatur perspiciatis accusantium consectetur eligendi.',4.47,'et-repudiandae-excepturi-cum-voluptas','2021-02-09 14:48:54','2021-02-09 14:48:54'),(15,15,'Van Hahn','Illo ipsa impedit odio et eum eaque.','Mollitia doloremque omnis voluptas et eum. Ut incidunt illo et recusandae cum. Quae facere eos tenetur id nobis aperiam velit. Tempore odio et et id incidunt. Sint praesentium voluptas sunt qui delectus dolores vero eum. Ab est quidem quidem optio qui corrupti. Delectus quae sit esse id soluta earum eos.',4.28,'qui-fugit-adipisci-quia-expedita-cum-iusto','2021-02-09 14:48:54','2021-02-09 14:48:54'),(16,16,'Amina Hauck','Quaerat nemo corrupti quas suscipit tempora.','Nam repudiandae ducimus quo. Architecto quisquam voluptatem illum ea. Quis aut et facilis molestiae quibusdam. In provident nisi doloribus consequatur sint sed. Est voluptatibus quos assumenda dolores qui. At voluptate quae laborum magni explicabo.',4.81,'delectus-quis-consectetur-earum-rem','2021-02-09 14:48:54','2021-02-09 14:48:54'),(17,17,'Jacey Beer','Temporibus corrupti laboriosam vitae ab.','Architecto eius et sunt est sit est sed. Aut suscipit porro consequatur nesciunt minus. Vero est natus voluptates accusantium ea architecto. Quia placeat qui voluptatem ea dolorum. Ut aut nihil occaecati voluptas tempore.',6.82,'odit-est-temporibus-adipisci-blanditiis','2021-02-09 14:48:54','2021-02-09 14:48:54'),(18,18,'Salvador Williamson','Ut minus ex a architecto libero.','Voluptate impedit voluptatem accusamus nihil. Autem itaque repellat accusamus. Totam odit est maiores voluptatibus ab in maxime. Est nostrum omnis quia corporis ut. Illum adipisci voluptates maxime aut. Est sunt accusamus et illo velit est maiores.',1.08,'eveniet-consequatur-et-voluptas-quos-placeat-possimus','2021-02-09 14:48:54','2021-02-09 14:48:54'),(19,19,'Dexter Deckow','Dolorum consequuntur molestias nulla quia ullam.','Voluptates eum consequatur qui totam. Reiciendis esse aliquid alias nemo. Repudiandae nemo commodi sunt earum. Nesciunt quia vitae esse dolore voluptas et veniam. Commodi est nihil aliquid. Cum error suscipit dolorem ut sunt.',2.89,'id-tempore-veniam-cupiditate-voluptatem-illo','2021-02-09 14:48:54','2021-02-09 14:48:54'),(20,20,'Dr. Ona Hickle','Error et eum ut ut veniam quos.','Dignissimos quidem quia voluptas temporibus. Beatae earum voluptate voluptate soluta. Consequatur et architecto nesciunt itaque eos magnam qui hic. Praesentium pariatur consequatur minima. Minus omnis sed dolor quasi. Magni aut molestiae eum velit quae aut sed rem. Aut dolores sapiente consequatur.',8.87,'quia-eos-officia-qui-saepe-qui-accusantium-exercitationem','2021-02-09 14:48:54','2021-02-09 14:48:54'),(21,21,'Vena Hartmann','Voluptas earum iste iure suscipit.','A occaecati quod et ea quo. Nesciunt officiis enim sed veniam pariatur debitis voluptatem. Ut distinctio vero sed adipisci. Dolorem ipsum excepturi consectetur modi dolor aut incidunt.',5.52,'non-alias-rerum-corrupti-qui-tempore-perspiciatis','2021-02-09 14:48:54','2021-02-09 14:48:54'),(22,22,'Marques Wunschc','Fugit et rerum libero delectus deleniti error. Culpa facilis voluptatem sed','Fugit et rerum libero delectus deleniti error. Culpa facilis voluptatem sed quam suscipit cum autem. Dicta quia veritatis rerum commodi eius. Accusantium qui adipisci rerum voluptates quas.',5.33,'dicta-sint-voluptas-iure-non-dolor','2021-02-09 14:48:55','2021-02-15 15:05:18'),(23,23,'Prof. Bonita Hartmann','Ut expedita unde quia porro perferendis molestias.','Eaque voluptas qui non qui sit. Quidem reiciendis veritatis quod a. Non vel ut voluptas nulla dolor. Aspernatur facilis consequuntur possimus eius ea dolor ut. Qui odit omnis et quia incidunt incidunt. Pariatur earum quis qui dolores.',6.02,'autem-quis-qui-explicabo-perspiciatis-soluta-optio-numquam','2021-02-09 14:48:55','2021-02-09 14:48:55'),(24,24,'Deborah Bechtelar','Fugit aspernatur quod dolor.','Perferendis perferendis sit provident harum. Atque blanditiis omnis non. Dolores explicabo totam similique. Qui necessitatibus est tempore autem qui eum repellendus cupiditate. Quaerat enim omnis architecto natus architecto voluptatem sunt. Consequatur at enim excepturi qui aspernatur possimus eum. Sapiente quam voluptas ullam et sit.',7.25,'in-temporibus-quis-consequatur-dolores','2021-02-09 14:48:55','2021-02-09 14:48:55'),(25,25,'Marcellus Mohr','Nemo possimus eos tempora voluptatum officiis dolorem.','Necessitatibus eius ipsam dolorem sit excepturi. Distinctio quam soluta sed cum. Molestias consequuntur molestias fuga incidunt. Quia maxime eaque voluptatibus officia culpa porro sunt. Totam assumenda ab voluptatum sit consequatur. Voluptatem pariatur libero tenetur amet aliquid natus et. Sunt numquam consequatur aliquid.',1.05,'qui-vitae-assumenda-in-voluptatem-quam','2021-02-09 14:48:55','2021-02-09 14:48:55'),(26,26,'Tara Glover','Voluptatibus expedita aliquam qui rerum sunt.','Reprehenderit est blanditiis ipsum sequi dolores ipsum. Ut blanditiis modi eos incidunt eveniet asperiores nihil. Inventore recusandae vel minima at ea officiis. Dolor optio quia qui at officiis velit.',4.09,'voluptas-ullam-dolorem-repellat','2021-02-09 14:48:55','2021-02-09 14:48:55'),(27,27,'Dr. Burnice Sauer','Harum eos quaerat delectus unde sapiente aut maiores aperiam.','Est velit a architecto ut quia fugiat. Quis placeat recusandae minima est id vitae et. Tenetur ipsam sequi temporibus quis. Ipsam voluptas tempora et aspernatur repudiandae.',6.08,'provident-voluptates-beatae-rem-perferendis','2021-02-09 14:48:55','2021-02-09 14:48:55'),(28,28,'Paxton Rolfson','Aliquid pariatur explicabo veniam necessitatibus ut et sit.','Modi fugit dolore recusandae impedit corporis. Cupiditate distinctio quia blanditiis aut magnam consequatur. Consequuntur aut non dicta. Molestiae inventore voluptas consequatur earum ut voluptas ipsum non. Accusamus fuga et sunt. Quia et nihil alias nam quam esse.',1.13,'magnam-aspernatur-incidunt-doloremque-illo','2021-02-09 14:48:55','2021-02-09 14:48:55'),(29,29,'Camilla Waelchi','Quos neque autem repellat consectetur in.','Dolorem qui officiis in non voluptatem. Omnis saepe aut illum nihil dolorem ipsa quia doloremque. Delectus dicta quia iusto quis ut occaecati. Accusamus perspiciatis tempore maxime. In perferendis quia sed quod voluptatum. Soluta dolores illum ut ratione quia non. Totam quisquam cumque officia quis porro perspiciatis.',8.11,'totam-neque-labore-aliquid-eos-molestiae','2021-02-09 14:48:55','2021-02-09 14:48:55'),(30,30,'Raina Gaylord','Dolorem rerum magnam ea aliquam facere.','Quia omnis ut veritatis est expedita eaque. Sapiente tenetur ipsa aut. Perferendis et et dicta molestias. Vitae sequi id assumenda voluptate. Vel commodi atque eveniet temporibus amet aut. Ut id et aliquam ipsam dicta reiciendis. Quo delectus inventore aut laborum debitis minus.',4.95,'possimus-vitae-nisi-quisquam-cupiditate','2021-02-09 14:48:55','2021-02-09 14:48:55'),(31,31,'Burnice Effertz','Corrupti vitae debitis et et.','Quis qui qui rerum molestias molestiae aperiam dolores. Ipsum rem pariatur ea laboriosam eligendi ratione unde. Nihil libero voluptas fugiat quo. In sed velit non numquam qui consequatur enim. Illo consequatur sit maiores voluptatem eaque quibusdam. Voluptatem ullam numquam rerum delectus aliquam. Iste est quis ea asperiores explicabo adipisci autem.',8.83,'asperiores-fugiat-dicta-est-hic-blanditiis-deserunt','2021-02-09 14:48:55','2021-02-09 14:48:55'),(32,32,'Idell Paucek','Sit et qui asperiores iure.','Rerum repellendus dolor autem necessitatibus eaque fuga illo eum. Consectetur sint ad consequatur qui et. Aut qui nisi harum fuga quas. Suscipit dolorum qui ad ullam esse. Eius ea quod aut distinctio quia voluptatem.',4.67,'consectetur-ut-ut-dolores-non-numquam-alias-et','2021-02-09 14:48:55','2021-02-09 14:48:55'),(33,33,'Jovan Goyette','Velit est eos sint tenetur.','Explicabo asperiores illum nihil soluta praesentium. Quia iusto quibusdam provident ea. Dolorem enim perspiciatis magnam. Impedit incidunt ut nemo ea voluptatem.',6.48,'ea-blanditiis-sit-fuga','2021-02-09 14:48:55','2021-02-09 14:48:55'),(34,34,'Wilhelm Bauch','Porro repudiandae ut sint.','In culpa error neque rerum nisi amet magnam. Voluptatem unde quam architecto porro quisquam. Est provident corporis aut et at quis tempore. Ut quibusdam maxime incidunt id sed non ut ipsam.',8.49,'omnis-aliquam-voluptas-a-nemo','2021-02-09 14:48:55','2021-02-09 14:48:55'),(35,35,'Kay Dicki','Quod quod et eum et quod ut.','Error excepturi veritatis a cumque quo quo. Excepturi tempora sit exercitationem est sit quia similique. Dignissimos incidunt magni rerum quis. Fugit aspernatur aliquam eum neque omnis.',7.34,'sunt-eveniet-ipsam-ex-repellendus-earum','2021-02-09 14:48:55','2021-02-09 14:48:55'),(36,36,'Marcellus Hegmann','Eaque pariatur quibusdam sed consequuntur maxime.','Beatae ex cumque odio eos provident modi. Deserunt harum in temporibus et dolorem reprehenderit. Mollitia dolores ea vel voluptates enim repellat. Ipsum accusantium hic est. Libero at et ea placeat fugit quia qui sint. Magni qui quasi necessitatibus accusantium et. Similique quam corrupti in.',5.93,'ea-quis-nobis-voluptatum-repudiandae-quis','2021-02-09 14:48:56','2021-02-09 14:48:56'),(37,37,'Lera Carroll','Doloribus velit facilis quos.','Voluptatem consectetur et voluptatibus harum nemo culpa accusantium. Dolore ratione facere ut soluta enim consequuntur. Voluptas molestiae quia inventore in iure. Consequuntur pariatur nesciunt quasi saepe et. Sit et magnam omnis porro eum alias vero vero. Repellat minus accusantium ducimus et qui temporibus beatae.',8.17,'velit-aut-impedit-natus-est-asperiores','2021-02-09 14:48:56','2021-02-09 14:48:56'),(38,38,'Dr. Anita Ryan','Illo ab officia ut repellat.','Nam et iusto dolor quae corrupti eos. Dolorum omnis id incidunt cupiditate autem nihil omnis nostrum. Non fugiat quasi consequatur aut. Dolor expedita sit ullam vero eum. Sit unde fugiat repellendus aut consectetur.',4.34,'sunt-consectetur-minima-facilis-maxime-excepturi-id-eum-deleniti','2021-02-09 14:48:56','2021-02-09 14:48:56'),(39,39,'Chelsey Fisher','Deleniti quod repellat consequuntur quidem ipsam optio esse.','Repellat ut possimus aliquam esse animi sunt. Quia modi eligendi et sit sint impedit. Voluptatem harum neque corporis magnam similique similique qui sapiente. Perferendis deleniti nemo corporis est qui. Esse recusandae et dolores saepe magnam rerum ab alias. Molestiae consequuntur illo aut provident sed ut.',8.91,'molestias-sunt-numquam-dicta-omnis-eveniet-ratione-fugiat-exercitationem','2021-02-09 14:48:56','2021-02-09 14:48:56'),(40,40,'Jason Will','Odit optio consequuntur voluptatem assumenda nam optio.','Doloribus eum ipsam voluptas autem ad facere. Laboriosam quia placeat labore repudiandae id fuga. Id eum quaerat sint ad. Aperiam accusantium sed ut cum optio velit. Saepe alias eos et laudantium debitis autem placeat. Atque qui rerum molestiae tempora delectus enim. Assumenda voluptatem corporis odit.',5.13,'assumenda-sit-optio-odio-sequi-quis-est','2021-02-09 14:48:56','2021-02-09 14:48:56'),(41,4,'Kölnisch Wasser','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Lorem ipsum is simply',2999.90,'notebook-dell','2021-02-09 15:17:38','2021-02-09 15:17:38'),(42,17,'La Vie Est Belle L\'Eau','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto TesteProduto TesteProduto TesteProduto TesteProduto Teste',1.00,'dia-da-catastracao-de-gatos-1','2021-02-13 04:39:14','2021-02-13 04:39:14'),(43,17,'La Vie Est Belle L\'Eau','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto TesteProduto TesteProduto TesteProduto TesteProduto Teste',1.00,'dia-da-catastracao-de-gatos','2021-02-13 04:40:36','2021-02-13 04:40:36'),(44,42,'La Vie Est Belle L\'Eau','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Testando Produto com Ligação Testando Produto com Ligação Testando Produto com Ligação',10.00,'testando-produto-com-ligacao','2021-02-15 02:20:22','2021-02-15 02:20:22'),(45,22,'Olympéa Eau de Parfum','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto com Categoria Produto com Categoria Produto com Categoria',150.00,'produto-com-categoria-1','2021-02-15 03:14:45','2021-02-15 03:14:45'),(46,22,'Parfum Carolina Herrera','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto com Categoria Produto com Categoria',100.00,'testando-produto-com-ligacao-1','2021-02-15 03:15:26','2021-02-15 03:15:26'),(47,22,'Kölnisch Wasser','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto com Imagem Produto com Imagem Produto com Imagem Produto com Imagem',100.00,'produto-com-imagem-1','2021-02-16 03:32:58','2021-02-16 03:32:58'),(48,22,'Johann Maria Farina','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto com Imagem Produto com Imagem Produto com Imagem Produto com Imagem',100.00,'produto-com-imagem-2','2021-02-16 03:33:46','2021-02-16 03:33:46'),(49,22,'Farina Eau de Cologne','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto com Imagem Produto com Imagem Produto com Imagem Produto com Imagem',100.00,'produto-com-imagem','2021-02-16 03:34:05','2021-02-16 03:34:05'),(50,42,'Maris Lusitani','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',150.00,'produto-testado-com-imagem-ii','2021-02-17 23:02:14','2021-02-20 04:44:55'),(51,42,'Fiori di Capri','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Produto testando validade de imagemProduto testando validade de imagemProduto testando validade de imagem',150.00,'produto-com-categoria','2021-02-17 23:14:50','2021-02-17 23:14:50'),(52,47,'Perfume Divertidos','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século',120.00,'perfume-divertidos','2021-02-18 01:11:19','2021-02-20 21:31:05'),(53,47,'Eternity De Calvin Klein','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século','Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século',60.00,'perfume-normal','2021-02-18 01:45:18','2021-02-20 21:31:23');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stores` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stores_user_id_foreign` (`user_id`),
  CONSTRAINT `stores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (4,4,'Jonatan Ferry','Aut et aut temporibus repudiandae.','1-250-800-7135','963.214.8831','et-non-voluptatem-aut-velit-dignissimos-qui-qui-quia','2021-02-09 04:28:49','2021-02-12 23:51:43',NULL),(5,5,'Iliana Botsfordd','Sunt ratione esse reiciendis esse vero repellat temporibus suscipit.','+1.674.288.7123','+1 (816) 273-4956','vel-sed-quia-sint-repellat-magni-porro','2021-02-09 04:28:49','2021-02-13 01:45:36',NULL),(6,6,'Cecelia Douglas I','Quia hic dolores est.','281-839-5696','+14074451067','culpa-et-illum-dicta-eos-doloribus-dolorum','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(7,7,'Jamey Johns','Quo quas vel est.','443.838.9261','+1 (370) 913-0657','adipisci-repellendus-eos-ad','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(8,8,'Miss Clotilde Bahringer','Officia nihil quia rerum quo enim.','+1.365.691.8696','+1 (705) 818-5450','quas-sint-minus-recusandae-sint-molestias-molestiae','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(9,9,'Mrs. Elena Miller IV','Iste ea facere sed dolores saepe aut.','(853) 646-8497','759.651.1884','tempore-alias-non-dolor-ut-et-doloribus','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(10,10,'Editado Ryleigh Mohr','Quo sed facilis velit.','760-946-6957','+1-682-603-4492','deserunt-in-accusantium-nemo-ratione-qui-qui','2021-02-09 04:28:49','2021-02-12 04:43:08',NULL),(11,11,'Arch Feeney','Quasi facere dolor molestias ipsam.','869-581-2201','1-743-490-5889','maxime-quia-unde-ipsam-qui-sed','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(12,12,'Keyshawn Ryan','Cum molestiae eum temporibus dolorem quaerat sit.','+1 (770) 786-0339','554.905.3945','quod-aut-reprehenderit-hic-voluptate-cupiditate-doloremque-et-soluta','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(13,13,'Dr. Wilfred Reinger V','Architecto delectus repellendus dolores et consequatur odio enim.','1-986-814-2498','(717) 956-6463','voluptatem-molestiae-molestias-ut-tempore-ut-occaecati-id','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(14,14,'Opal Predovic II','Vel natus enim fugit accusamus dolorem quod quia magni.','+1.641.275.2724','608.452.7158','vel-excepturi-ad-inventore-perferendis','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(15,15,'Mr. William Rohan','Voluptatum aperiam corrupti nihil iusto rerum corrupti impedit.','+1-471-297-3936','+1.261.840.5958','magni-dolore-delectus-rerum-et-recusandae','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(16,16,'Edmund Keebler','Et qui voluptatibus aliquid rerum quam qui.','(969) 297-2223','670.910.3704','error-deleniti-aliquam-et-nisi-similique-eius','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(17,17,'Cordie Swaniawski','Dolorum id vitae quam impedit quod similique.','1-368-524-7676','+1-760-620-4538','modi-dolorem-id-nihil-eos-iure-repudiandae-debitis','2021-02-09 04:28:49','2021-02-09 04:28:49',NULL),(18,18,'Rebekah Kub','Natus et beatae et nihil at voluptates delectus.','671.369.6894','+1 (398) 983-4407','nemo-totam-laudantium-vel-aperiam-at','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(19,19,'Thomas Fritsch PhD','Repellendus quo fugiat distinctio quisquam est.','904.757.8827','391.615.6836','inventore-nihil-perspiciatis-illo-nesciunt-velit-rerum-aut','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(20,20,'Roberto Hayes','Velit officia et aut totam.','1-423-930-5370','838.449.9136','voluptatem-veniam-similique-mollitia-quod-velit-veritatis','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(21,21,'Shanelle Hickle','Quam consectetur saepe facere consequatur ratione quia.','875-779-7548','1-501-628-9383','sapiente-deserunt-sed-atque-in-quis','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(22,22,'Casper Torphy','Aperiam aut eveniet quod voluptatem commodi ut non.','+19063618483','854-697-4363','produto-com-categoria-s','2021-02-09 04:28:50','2021-02-16 02:52:50',NULL),(23,23,'Michaela Runolfsdottir IV','Quas voluptatibus dolor sunt soluta odit at.','+1-723-769-0664','739.947.2568','velit-iste-optio-dolor-adipisci-molestiae','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(24,24,'Deanna Hermiston','Consequatur veritatis quibusdam eos eaque minima natus.','383.838.2599','+1.792.719.7125','sed-voluptatem-qui-sunt-minima','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(25,25,'Josianne Balistreri','Porro et esse accusamus labore.','+1-931-548-1242','372-539-9775','aut-inventore-vero-qui-provident-ab','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(26,26,'Zackary Flatley','Sit corporis debitis natus reiciendis.','773-317-2671','(969) 713-8546','illo-error-reprehenderit-nihil-corrupti-facere-officia-nemo-harum','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(27,27,'Dr. Mabel Schimmel','Fugit distinctio ut quia impedit.','+1 (320) 395-4164','1-370-794-0164','et-qui-quasi-rerum-ipsa-at-sit-possimus-sed','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(28,28,'Miss Hertha Brakus','Ea eius voluptas nisi explicabo.','634-540-1131','1-427-524-0782','placeat-voluptas-tempore-at-quidem-qui-aut','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(29,29,'Ernest Rempel','Hic deleniti exercitationem at.','+1 (418) 391-0174','+1-756-238-1085','est-sequi-voluptate-consequatur-blanditiis-dicta-et-praesentium','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(30,30,'Ransom Gottlieb','Non ipsa aut non commodi repudiandae quia.','+1-309-948-7997','207.493.4115','et-omnis-et-quisquam','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(31,31,'Rachel Adams','In nesciunt magni quas repudiandae.','(930) 702-9771','+14639283014','vel-dignissimos-ex-et-et-qui-voluptatem-consequatur','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(32,32,'Seamus Pfeffer','Doloremque ipsum quis error et odit.','+12479603949','746-650-4237','quasi-deleniti-facilis-repellat','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(33,33,'Kieran Boyle','Expedita totam voluptate qui quia.','958.988.8105','+1 (826) 460-9599','maxime-itaque-molestiae-non-omnis-minima-eligendi-autem','2021-02-09 04:28:50','2021-02-09 04:28:50',NULL),(34,34,'Constantin Bechtelar','Illo est quia praesentium facilis error impedit provident.','(204) 950-3975','369-664-2501','omnis-eos-voluptas-consequatur-placeat-ut-temporibus','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(35,35,'Kraig Lockman','Illo architecto amet in qui voluptas doloribus odit consequatur.','+1 (251) 467-0901','1-304-881-5449','voluptatem-laudantium-voluptatem-suscipit-voluptate-hic-delectus','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(36,36,'Rosina Hamill','Minus quia eveniet ut accusamus at impedit.','+1.236.820.2638','865-856-9549','earum-vero-deleniti-ullam-esse','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(37,37,'Miss Ardella Connelly','Voluptas enim velit magni et odit suscipit.','848-861-8657','+13455120266','consequuntur-tempora-quia-asperiores-amet-illum-quo','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(38,38,'Ocie Johnston','Veniam animi autem eum est nulla harum exercitationem cum.','+18795407572','371-216-5828','facilis-illo-minima-omnis-maxime-itaque-mollitia','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(39,39,'Kelsie Homenick','Ea debitis omnis voluptatibus eligendi quia aut qui.','408.966.6630','+1.746.306.6552','unde-qui-omnis-ea-voluptatem-sit-minima','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(40,40,'Meredith Willms','Fugit incidunt aut libero eum error.','(927) 453-4563','+1.405.458.2076','ut-aut-fuga-quo-eveniet-voluptatibus-totam-consequatur','2021-02-09 04:28:51','2021-02-09 04:28:51',NULL),(41,10,'Croi Informatica','Produtos de informática','91-9999-88888','91-9999-88888','croi-informatica','2021-02-09 15:12:14','2021-02-09 15:12:14',NULL),(42,1,'Loja Via Form','Loja Via Form','91982650277','91982650277','loja-via-form','2021-02-12 04:10:22','2021-02-17 22:56:01','logo/AOVvPNl6j4TUgKY2pGMka9xazRMbWBReQaa38EiT.jpg'),(43,1,'Loja Com Route','Loja Com Route','9199999999','91982650277','loja-com-route','2021-02-12 22:29:49','2021-02-12 22:29:49',NULL),(44,1,'Alprazolam Alprazolam','Loja Com Route','(91) 99999-9999','91982650277','dia-da-catastracao-de-gatos','2021-02-13 01:45:47','2021-02-13 01:45:47',NULL),(45,1,'Loja Teste sem Select','Loja Teste sem Select','91982650277','91982650277','loja-teste-sem-select','2021-02-14 15:25:06','2021-02-14 15:25:06',NULL),(46,22,'Nova loja com foto','Nova loja com fotoNova loja com foto','91982650277','91982650277','nova-loja-com-foto','2021-02-17 15:46:50','2021-02-17 15:46:50','logo/osbJo2czzWCRN8ZBKOFlg0OmgcxRt6lT6PwRJEJB.jpg'),(47,42,'Code Experts Store','Loja de cursos Online','91982650277','91982650277','code-expert-store','2021-02-17 23:26:01','2021-02-17 23:26:01','logo/S7pAgVrchebPrhHpAEcrn6ltor8kKv6cheVbQZ7t.png');
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_orders`
--

DROP TABLE IF EXISTS `user_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `store_id` bigint(20) unsigned NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pagseguro_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_orders_user_id_foreign` (`user_id`),
  KEY `user_orders_store_id_foreign` (`store_id`),
  CONSTRAINT `user_orders_store_id_foreign` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
  CONSTRAINT `user_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_orders`
--

LOCK TABLES `user_orders` WRITE;
/*!40000 ALTER TABLE `user_orders` DISABLE KEYS */;
INSERT INTO `user_orders` VALUES (1,1,42,'XPTO','5C852FE7-9122-4FD2-B9EC-E82E3641CB50','1','a:2:{i:0;a:4:{s:4:\"name\";s:18:\"Perfume Divertidos\";s:5:\"price\";s:6:\"120.00\";s:4:\"slug\";s:18:\"perfume-divertidos\";s:6:\"amount\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:24:\"Eternity De Calvin Klein\";s:5:\"price\";s:5:\"60.00\";s:4:\"slug\";s:14:\"perfume-normal\";s:6:\"amount\";s:1:\"1\";}}','2021-02-24 04:37:45','2021-02-24 04:37:45'),(2,1,42,'XPTO','88728445-6A2E-43AC-8C79-3A774F24D328','1','a:2:{i:0;a:4:{s:4:\"name\";s:24:\"Eternity De Calvin Klein\";s:5:\"price\";s:5:\"60.00\";s:4:\"slug\";s:14:\"perfume-normal\";s:6:\"amount\";s:1:\"1\";}i:1;a:4:{s:4:\"name\";s:14:\"Fiori di Capri\";s:5:\"price\";s:6:\"150.00\";s:4:\"slug\";s:21:\"produto-com-categoria\";s:6:\"amount\";s:1:\"2\";}}','2021-02-25 03:47:47','2021-02-25 03:47:47');
/*!40000 ALTER TABLE `user_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dr. Elton Dooley MD','veum.lonny@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CifPIztVjJq3NkfD2eg12RB2AypVkgXDPIdKHJkXGDSwxNcRQhwCnJdpOIW5','2021-02-09 04:28:45','2021-02-09 04:28:45'),(2,'Dr. Wilfred Dibbert Sr.','rohan.perry@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bU3v8bxfRE','2021-02-09 04:28:45','2021-02-09 04:28:45'),(3,'Ashlynn Padberg','kobe66@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vmuwrbwjbR','2021-02-09 04:28:45','2021-02-09 04:28:45'),(4,'Dagmar Lowe','deron.aufderhar@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zqmGr5cMPa','2021-02-09 04:28:45','2021-02-09 04:28:45'),(5,'Iva Friesen','rmurphy@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','7tMDkSuEtq','2021-02-09 04:28:45','2021-02-09 04:28:45'),(6,'Miss Alycia Trantow PhD','pthompson@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Q1Je9JP0Xf','2021-02-09 04:28:45','2021-02-09 04:28:45'),(7,'Louvenia Gleichner','raul.pouros@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zjbvrhRQOU','2021-02-09 04:28:45','2021-02-09 04:28:45'),(8,'Devante Schoen DVM','lauer@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','gyJqJnO8ka','2021-02-09 04:28:46','2021-02-09 04:28:46'),(9,'Dr. Jimmy Bashirian','lrippin@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','LAR9VXrsMG','2021-02-09 04:28:46','2021-02-09 04:28:46'),(10,'Samantha Emmerich','luz78@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','OdOyqpDtFM','2021-02-09 04:28:46','2021-02-09 04:28:46'),(11,'Diego Greenholt','gpouros@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','bBiMXD9bsn','2021-02-09 04:28:46','2021-02-09 04:28:46'),(12,'Dr. Julien Schiller V','saul.hammes@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ga3zMeOeFo','2021-02-09 04:28:46','2021-02-09 04:28:46'),(13,'Elenor Stokes I','wanda06@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Xx2ZkFeR0X','2021-02-09 04:28:46','2021-02-09 04:28:46'),(14,'Dr. Miracle Weber','mosciski.roma@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','mMC3Gvn6WW','2021-02-09 04:28:46','2021-02-09 04:28:46'),(15,'Prof. Sigurd Keeling','larkin.kadin@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','aJVqiiVJs5','2021-02-09 04:28:46','2021-02-09 04:28:46'),(16,'Carroll McClure MD','elody00@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','8Y8aB6pdj4','2021-02-09 04:28:46','2021-02-09 04:28:46'),(17,'Angelita Jacobs','wilford.wintheiser@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','z6IDyp5iVQ','2021-02-09 04:28:46','2021-02-09 04:28:46'),(18,'Yvette Hilpert','mcrooks@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','E0usTeP5dz','2021-02-09 04:28:46','2021-02-09 04:28:46'),(19,'Marisa Jaskolski','jmosciski@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','c60kpzX8TD','2021-02-09 04:28:46','2021-02-09 04:28:46'),(20,'Bernard Koepp','ruecker.jeffery@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MSorVNQtl9','2021-02-09 04:28:46','2021-02-09 04:28:46'),(21,'Freeman Wilderman','frami.oliver@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Ht2G8z5pKd','2021-02-09 04:28:46','2021-02-09 04:28:46'),(22,'Emilie Von DDS','muller.salma@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','zZhpEP8R7u4Qqf4WTaP2J6pxydmFYtvqkMXL5drwhmftPdSIcNT18zMXZWyW','2021-02-09 04:28:47','2021-02-09 04:28:47'),(23,'Arnulfo Armstrong DDS','kris.naomie@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rBLsKqRbMp','2021-02-09 04:28:47','2021-02-09 04:28:47'),(24,'Gaetano VonRueden','donnelly.brandt@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','MrOQ4ne01n','2021-02-09 04:28:47','2021-02-09 04:28:47'),(25,'Damian Jaskolski II','mario17@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','pcrpLD2mjM','2021-02-09 04:28:47','2021-02-09 04:28:47'),(26,'Kristofer Goyette','ykoss@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','rzNI9vqZmz','2021-02-09 04:28:47','2021-02-09 04:28:47'),(27,'Dr. Gwendolyn Abbott DVM','zschulist@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','qJAieiaTA8','2021-02-09 04:28:47','2021-02-09 04:28:47'),(28,'Shaun Swaniawski','reece.price@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','fy51MemA1A','2021-02-09 04:28:47','2021-02-09 04:28:47'),(29,'Dr. Ike Kovacek III','feichmann@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','vcqHJps2zD','2021-02-09 04:28:47','2021-02-09 04:28:47'),(30,'Telly Prosacco PhD','laura.bogan@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5mMxkJ8DE4','2021-02-09 04:28:47','2021-02-09 04:28:47'),(31,'August Ryan I','cbednar@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','0auJcOnDSN','2021-02-09 04:28:47','2021-02-09 04:28:47'),(32,'Damien Keebler','rice.preston@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','K0WdXvy2S5','2021-02-09 04:28:48','2021-02-09 04:28:48'),(33,'Dr. Mark Tillman II','fernando.langosh@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','5f0lcTuONZ','2021-02-09 04:28:48','2021-02-09 04:28:48'),(34,'Aracely Bradtke','zratke@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Yv7DF1gJCR','2021-02-09 04:28:48','2021-02-09 04:28:48'),(35,'Heber Bogisich','kovacek.audie@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','UmwiSWGUhx','2021-02-09 04:28:48','2021-02-09 04:28:48'),(36,'Kariane Kohler','golden.larson@example.com','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','PK2bJzDcTw','2021-02-09 04:28:48','2021-02-09 04:28:48'),(37,'Catherine Zieme','reymundo77@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','CgcGEf67s2','2021-02-09 04:28:48','2021-02-09 04:28:48'),(38,'Nova Labadie','jakubowski.eda@example.net','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','wtKxBDnpee','2021-02-09 04:28:48','2021-02-09 04:28:48'),(39,'Sydnee Goldner','esmeralda94@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','eD7zQsWG8j','2021-02-09 04:28:48','2021-02-09 04:28:48'),(40,'Al West IV','moore.arturo@example.org','2021-02-09 04:28:45','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','4WcncY5Vlb','2021-02-09 04:28:48','2021-02-09 04:28:48'),(41,'bladlelano','bladellano@gmail.com',NULL,'$2y$10$ddb4lN20XTD9ARNTKXCMX.sBzu29v9/Euxi.HSuz6wIrAiZTXx1iK',NULL,'2021-02-14 15:28:20','2021-02-14 15:28:20'),(42,'Nanderson Teste','teste@email.com',NULL,'$2y$10$yXi9u515eArPSaVivHRhQukHVH/ylbWFrPdDiW6zRxAZeboLTuM4K',NULL,'2021-02-17 23:21:54','2021-02-17 23:21:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'marketplaca_l6'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-24 21:54:04
