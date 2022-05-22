/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.33 : Database - booking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `abouts` */

DROP TABLE IF EXISTS `abouts`;

CREATE TABLE `abouts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_header` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fb` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ig` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tw` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `abouts` */

insert  into `abouts`(`id`,`title`,`desc`,`image`,`image_header`,`video`,`address`,`address_url`,`phone`,`wa`,`email`,`fb`,`ig`,`yt`,`tw`,`created_at`,`updated_at`) values 
(1,'Make Your Tour Memorable and Safe With Us','Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.',NULL,NULL,'https://www.youtube.com/watch?v=9NnAoSOm5-E','198 West 21th Street, Suite 721 New York NY 10016','#','0812 0000 1111','+62 822 7454 3802','admin@site.com','@fbusername','@igusername','@youtubechannel','@twitter','2022-02-08 14:17:57','2022-02-08 14:17:57');

/*Table structure for table `bookings` */

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `destination_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_destination_id_foreign` (`destination_id`),
  CONSTRAINT `bookings_destination_id_foreign` FOREIGN KEY (`destination_id`) REFERENCES `destinations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `bookings` */

/*Table structure for table `contacts` */

DROP TABLE IF EXISTS `contacts`;

CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `contacts` */

/*Table structure for table `destinations` */

DROP TABLE IF EXISTS `destinations`;

CREATE TABLE `destinations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `destinations` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `galleries` */

DROP TABLE IF EXISTS `galleries`;

CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `galleries` */

/*Table structure for table `headers` */

DROP TABLE IF EXISTS `headers`;

CREATE TABLE `headers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `caption` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `headers` */

insert  into `headers`(`id`,`title`,`caption`,`video_url`,`created_at`,`updated_at`) values 
(1,'Welcome to Pacific','<h1 class=\"mb-4\">Discover Your Favorite Place with Us</h1>\r\n                                <p class=\"caps\">Travel to the any corner of the world, without going around in circles</p>','https://www.youtube.com/watch?v=9NnAoSOm5-E','2022-02-08 14:17:58','2022-02-08 14:17:58');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

insert  into `jobs`(`id`,`queue`,`payload`,`attempts`,`reserved_at`,`available_at`,`created_at`) values 
(1,'default','{\"uuid\":\"273ac598-3574-47dd-92eb-6db84017212e\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:21;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(2,'default','{\"uuid\":\"b422fa62-57ab-406c-bca2-9c3524daaf43\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:22;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(3,'default','{\"uuid\":\"077d9b33-f483-404e-a538-3d0d51800f11\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:23;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(4,'default','{\"uuid\":\"3f842dd8-fa61-482e-9bbf-d9b6c2670767\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:24;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(5,'default','{\"uuid\":\"d6526a09-3c06-450c-a307-054221a6506a\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:25;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(6,'default','{\"uuid\":\"22ff6702-fb3c-42f8-bd28-16ef7dbdfc22\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:26;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(7,'default','{\"uuid\":\"70bd75ad-fe80-43f6-8f62-9d2dce8f833a\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:27;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(8,'default','{\"uuid\":\"78ccc467-d48c-4623-a915-5966d1475236\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:28;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(9,'default','{\"uuid\":\"b6e39890-191a-4d59-a0d0-b3aee80c5651\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:29;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(10,'default','{\"uuid\":\"baf24fb0-80c8-45ff-b52c-70a629d6aae2\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:30;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644297922,1644297922),
(11,'default','{\"uuid\":\"12b1196b-3bf6-4059-9b4c-6476627f29f7\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:36;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(12,'default','{\"uuid\":\"f0284e4a-6bc4-4006-b1d4-941d6beba64f\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:37;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(13,'default','{\"uuid\":\"91176869-1a53-49aa-8c9d-10d3d74d87ae\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:38;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(14,'default','{\"uuid\":\"60297ff4-5baf-40bb-8ecc-8fb71caf9d49\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:39;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(15,'default','{\"uuid\":\"1651bbe4-518b-4a72-a4c2-e06b8574f651\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:40;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(16,'default','{\"uuid\":\"d7530a81-dfc7-4234-b463-2a7c1d231484\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:41;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(17,'default','{\"uuid\":\"ade1f5b5-543a-467c-9cff-af813d379b7d\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:42;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298033,1644298033),
(18,'default','{\"uuid\":\"b00c73e7-bf90-4332-a79d-be3662fbdbc8\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:43;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298034,1644298034),
(19,'default','{\"uuid\":\"04345b80-a58e-4f76-b14c-5650bf0882fa\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:44;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298034,1644298034),
(20,'default','{\"uuid\":\"b994a4e2-97ea-4c01-9e00-1d2003d8789d\",\"displayName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\",\"command\":\"O:58:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Jobs\\\\PerformConversionsJob\\\":14:{s:23:\\\"deleteWhenMissingModels\\\";b:1;s:14:\\\"\\u0000*\\u0000conversions\\\";O:52:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\ConversionCollection\\\":2:{s:8:\\\"\\u0000*\\u0000items\\\";a:1:{i:0;O:42:\\\"Spatie\\\\MediaLibrary\\\\Conversions\\\\Conversion\\\":10:{s:7:\\\"\\u0000*\\u0000name\\\";s:5:\\\"thumb\\\";s:12:\\\"\\u0000*\\u0000fileNamer\\\";O:54:\\\"Spatie\\\\MediaLibrary\\\\Support\\\\FileNamer\\\\DefaultFileNamer\\\":0:{}s:28:\\\"\\u0000*\\u0000extractVideoFrameAtSecond\\\";d:0;s:16:\\\"\\u0000*\\u0000manipulations\\\";O:26:\\\"Spatie\\\\Image\\\\Manipulations\\\":1:{s:23:\\\"\\u0000*\\u0000manipulationSequence\\\";O:33:\\\"Spatie\\\\Image\\\\ManipulationSequence\\\":1:{s:9:\\\"\\u0000*\\u0000groups\\\";a:1:{i:0;a:4:{s:8:\\\"optimize\\\";s:436:\\\"{\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Jpegoptim\\\":[\\\"-m85\\\",\\\"--force\\\",\\\"--strip-all\\\",\\\"--all-progressive\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Pngquant\\\":[\\\"--force\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Optipng\\\":[\\\"-i0\\\",\\\"-o2\\\",\\\"-quiet\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Svgo\\\":[\\\"--disable=cleanupIDs\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Gifsicle\\\":[\\\"-b\\\",\\\"-O3\\\"],\\\"Spatie\\\\\\\\ImageOptimizer\\\\\\\\Optimizers\\\\\\\\Cwebp\\\":[\\\"-m 6\\\",\\\"-pass 10\\\",\\\"-mt\\\",\\\"-q 90\\\"]}\\\";s:6:\\\"format\\\";s:3:\\\"jpg\\\";s:5:\\\"width\\\";s:3:\\\"368\\\";s:7:\\\"sharpen\\\";s:2:\\\"10\\\";}}}}s:23:\\\"\\u0000*\\u0000performOnCollections\\\";a:0:{}s:17:\\\"\\u0000*\\u0000performOnQueue\\\";b:1;s:26:\\\"\\u0000*\\u0000keepOriginalImageFormat\\\";b:0;s:27:\\\"\\u0000*\\u0000generateResponsiveImages\\\";b:0;s:24:\\\"\\u0000*\\u0000loadingAttributeValue\\\";N;s:16:\\\"\\u0000*\\u0000pdfPageNumber\\\";i:1;}}s:28:\\\"\\u0000*\\u0000escapeWhenCastingToString\\\";b:0;}s:8:\\\"\\u0000*\\u0000media\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:49:\\\"Spatie\\\\MediaLibrary\\\\MediaCollections\\\\Models\\\\Media\\\";s:2:\\\"id\\\";i:45;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000onlyMissing\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:0:\\\"\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}',0,NULL,1644298034,1644298034);

/*Table structure for table `media` */

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `media` */

insert  into `media`(`id`,`model_type`,`model_id`,`uuid`,`collection_name`,`name`,`file_name`,`mime_type`,`disk`,`conversions_disk`,`size`,`manipulations`,`custom_properties`,`generated_conversions`,`responsive_images`,`order_column`,`created_at`,`updated_at`) values 
(6,'App\\Models\\Testimony',1,'3ac61ac8-74f9-4786-b0c2-deb54b20bbec','image','person-2','person-2.jpg','image/jpeg','public','public',47939,'[]','[]','{\"thumb\": true}','[]',6,'2022-02-08 09:12:09','2022-02-08 09:12:17'),
(7,'App\\Models\\Testimony',2,'2ad01f05-ce32-47d8-92a0-31287749266f','image','person-3','person-3.jpg','image/jpeg','public','public',35096,'[]','[]','{\"thumb\": true}','[]',7,'2022-02-08 09:12:17','2022-02-08 09:12:18'),
(8,'App\\Models\\Testimony',3,'f554edec-01c7-4a2c-880d-41b00cd3dacf','image','person-1','person-1.jpg','image/jpeg','public','public',36090,'[]','[]','{\"thumb\": true}','[]',8,'2022-02-08 09:12:18','2022-02-08 09:12:19'),
(9,'App\\Models\\Testimony',4,'5b3a204d-ff54-4271-8e7a-ef6b7099eda1','image','person-3','person-3.jpg','image/jpeg','public','public',35096,'[]','[]','{\"thumb\": true}','[]',9,'2022-02-08 09:12:19','2022-02-08 09:12:20'),
(10,'App\\Models\\Testimony',5,'a79d3f0a-7667-4e4a-aa24-9c54d4e186a9','image','person-3','person-3.jpg','image/jpeg','public','public',35096,'[]','[]','{\"thumb\": true}','[]',10,'2022-02-08 09:12:20','2022-02-08 09:12:22'),
(11,'App\\Models\\Testimony',6,'6260b286-fd8d-4a9c-917f-6adbebc40bf2','image','person-3','person-3.jpg','image/jpeg','public','public',35096,'[]','[]','{\"thumb\": true}','[]',11,'2022-02-08 09:12:22','2022-02-08 09:12:23'),
(12,'App\\Models\\Testimony',7,'5e7ae844-7cb6-41cb-befe-946e2447a2a7','image','person-1','person-1.jpg','image/jpeg','public','public',36090,'[]','[]','{\"thumb\": true}','[]',12,'2022-02-08 09:12:23','2022-02-08 09:12:24'),
(13,'App\\Models\\Testimony',8,'7317b201-a665-43bc-b95d-42304847bc8c','image','person-1','person-1.jpg','image/jpeg','public','public',36090,'[]','[]','{\"thumb\": true}','[]',13,'2022-02-08 09:12:24','2022-02-08 09:12:25'),
(14,'App\\Models\\Testimony',9,'620b8741-f359-4413-89e2-3136caa135f5','image','person-1','person-1.jpg','image/jpeg','public','public',36090,'[]','[]','{\"thumb\": true}','[]',14,'2022-02-08 09:12:25','2022-02-08 09:12:26'),
(15,'App\\Models\\Testimony',10,'ecf105a8-1a65-4047-813f-ce5a488d448b','image','person-2','person-2.jpg','image/jpeg','public','public',47939,'[]','[]','{\"thumb\": true}','[]',15,'2022-02-08 09:12:26','2022-02-08 09:12:27'),
(36,'App\\Models\\Post',1,'07e79602-0fbe-4851-a3fd-d3243b7cb767','image','post_image_1','post_image_1.jpg','image/jpeg','public','public',20160,'[]','[]','[]','[]',36,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(37,'App\\Models\\Post',2,'e044f29a-920a-4a74-92e4-d34fe30f40b8','image','post_image_2','post_image_2.jpg','image/jpeg','public','public',40302,'[]','[]','[]','[]',37,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(38,'App\\Models\\Post',3,'e689e249-2b8f-4918-9dda-ea1ad09426be','image','post_image_3','post_image_3.jpg','image/jpeg','public','public',18688,'[]','[]','[]','[]',38,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(39,'App\\Models\\Post',4,'41846f5d-ac1e-4d05-bc24-f2bdb6c523ba','image','post_image_1','post_image_1.jpg','image/jpeg','public','public',20160,'[]','[]','[]','[]',39,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(40,'App\\Models\\Post',5,'b39aa970-099e-48dd-a983-81a184c8c18d','image','post_image_5','post_image_5.jpg','image/jpeg','public','public',18797,'[]','[]','[]','[]',40,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(41,'App\\Models\\Post',6,'6eef82d0-bb05-4e51-9b99-090ced48a2c8','image','post_image_1','post_image_1.jpg','image/jpeg','public','public',20160,'[]','[]','[]','[]',41,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(42,'App\\Models\\Post',7,'2a8b31d2-601c-4094-9ea7-b188e70cf4df','image','post_image_5','post_image_5.jpg','image/jpeg','public','public',18797,'[]','[]','[]','[]',42,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(43,'App\\Models\\Post',8,'7ba359cd-622a-452e-82ed-f1887d7f4627','image','post_image_4','post_image_4.jpg','image/jpeg','public','public',18534,'[]','[]','[]','[]',43,'2022-02-08 12:27:13','2022-02-08 12:27:13'),
(44,'App\\Models\\Post',9,'71d0d89f-a334-4bb3-ba58-44ac09407009','image','post_image_4','post_image_4.jpg','image/jpeg','public','public',18534,'[]','[]','[]','[]',44,'2022-02-08 12:27:14','2022-02-08 12:27:14'),
(45,'App\\Models\\Post',10,'c9c89b82-b861-4ec2-ad41-781a7886923c','image','post_image_1','post_image_1.jpg','image/jpeg','public','public',20160,'[]','[]','[]','[]',45,'2022-02-08 12:27:14','2022-02-08 12:27:14'),
(46,'App\\Models\\Welcome',1,'a5312691-ab80-4328-808e-80c5357d88df','image','image','image.jpg','image/jpeg','public','public',115001,'[]','[]','[]','[]',46,'2022-02-08 14:17:57','2022-02-08 14:17:57'),
(47,'App\\Models\\About',1,'c243b61a-5c7f-46c4-b54e-bfb684c883cd','image','image','image.jpg','image/jpeg','public','public',427359,'[]','[]','[]','[]',47,'2022-02-08 14:17:57','2022-02-08 14:17:57'),
(48,'App\\Models\\About',1,'a3269986-160f-4660-9a15-26391b1e5bbf','image_header','image-header','image-header.jpg','image/jpeg','public','public',617805,'[]','[]','[]','[]',48,'2022-02-08 14:17:58','2022-02-08 14:17:58'),
(49,'App\\Models\\Header',1,'13247645-c686-4c5d-8654-342ae80aa7c3','image','image','image.jpg','image/jpeg','public','public',1004001,'[]','[]','[]','[]',49,'2022-02-08 14:17:58','2022-02-08 14:17:58'),
(50,'App\\Models\\Header',1,'f0a00977-4b5c-4d2a-9332-83a80f4f2e92','image_other','image-other','image-other.jpg','image/jpeg','public','public',916293,'[]','[]','[]','[]',50,'2022-02-08 14:17:58','2022-02-08 14:17:58');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),
(4,'2019_08_19_000000_create_failed_jobs_table',1),
(5,'2021_04_20_062456_create_profiles_table',1),
(6,'2021_04_20_062823_create_profile_contacts_table',1),
(7,'2021_04_20_062850_create_product_categories_table',1),
(8,'2021_04_20_062903_create_products_table',1),
(9,'2021_04_20_062945_create_product_types_table',1),
(10,'2021_11_11_022912_create_post_categories_table',1),
(11,'2021_11_11_022913_create_posts_table',1),
(12,'2021_11_13_063450_create_views_table',1),
(13,'2021_11_28_225632_create_roles_table',1),
(14,'2021_11_28_225933_add_role_id_colums_to_users_table',1),
(15,'2021_12_09_101521_create_tags_table',1),
(16,'2021_12_09_101624_create_post_tag_table',1),
(17,'2021_12_15_231638_create_rooms_table',1),
(18,'2021_12_16_144848_create_abouts_table',1),
(19,'2021_12_18_094939_create_testimonies_table',1),
(20,'2021_12_19_140118_create_headers_table',1),
(21,'2021_12_21_092101_create_bookings_table',1),
(22,'2021_12_24_114823_create_contacts_table',1),
(23,'2022_01_06_160603_create_media_table',1),
(24,'2022_01_11_143818_create_galleries_table',1),
(25,'2022_01_12_214522_create_jobs_table',1),
(26,'2022_01_18_203204_create_welcomes_table',1),
(27,'2022_01_22_162418_create_destinations_table',1),
(28,'2022_01_22_171259_add_destination_to_booking',1),
(29,'2022_01_27_222142_create_web_settings_table',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `post_categories` */

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_categories` */

insert  into `post_categories`(`id`,`title`,`slug`,`created_at`,`updated_at`) values 
(1,'Uncategorized','uncategorized','2022-02-08 14:17:58','2022-02-08 14:17:58');

/*Table structure for table `post_tag` */

DROP TABLE IF EXISTS `post_tag`;

CREATE TABLE `post_tag` (
  `post_id` bigint(20) unsigned NOT NULL,
  `tag_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_tag` */

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` bigint(20) unsigned NOT NULL,
  `post_category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_author_id_foreign` (`author_id`),
  KEY `posts_post_category_id_foreign` (`post_category_id`),
  CONSTRAINT `posts_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_post_category_id_foreign` FOREIGN KEY (`post_category_id`) REFERENCES `post_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

insert  into `posts`(`id`,`author_id`,`post_category_id`,`title`,`slug`,`excerpt`,`body`,`published_at`,`deleted_at`,`created_at`,`updated_at`) values 
(1,5,4,'Possimus minima dolorem esse et sint consectetur.','possimus-minima-dolorem-esse-et-sint-consectetur','Et distinctio qui porro minima. At omnis dolores ut amet corrupti. Iste velit labore vel aut ducimus.','<p> Et et ipsum dolorum eligendi tempore natus. Necessitatibus et nobis voluptatem qui minima animi. Natus commodi velit doloremque possimus error sunt. Velit assumenda ut velit voluptatem animi qui quisquam. </p><p> Expedita beatae tempora fugiat odit autem voluptatem consequuntur. Laudantium sit recusandae corporis praesentium expedita. Minima reiciendis est illo omnis veniam. Atque adipisci omnis itaque consectetur temporibus consectetur. </p><p> Sunt sapiente iure corrupti est. Veritatis et impedit a aut cumque mollitia. Expedita et temporibus corrupti odit. Similique sapiente aut qui quis ea porro expedita. </p><p> Sed aut repellat et iure. Est reiciendis qui molestiae qui mollitia nihil animi similique. Animi est sint enim beatae numquam quisquam. Fugit ut voluptate voluptatum qui. </p><p> Quis laborum ipsam qui aut. Error in ullam corporis velit. Soluta omnis et ducimus unde. </p><p> Voluptas odit voluptas dolorum perferendis eligendi ut. Deleniti aut praesentium aut praesentium ea. Voluptas quas consequuntur omnis voluptatem vitae est. </p><p> Quae consequatur exercitationem tempore voluptatum consectetur reprehenderit corporis labore. Odio esse quia autem qui qui ut. </p><p> Autem architecto non delectus inventore consequuntur. Nam nostrum molestiae dignissimos. Possimus quae et consequuntur quas veritatis quia adipisci. Nostrum fugiat nulla dolores maxime. </p><p> Est facere exercitationem repellat facere placeat aut minima. Sint odit sit sint consequatur. Voluptatibus quia sint tempora. Corrupti ut sunt atque eum in. </p><p> Esse veritatis sunt neque ipsum aut qui qui. Quo ea ea laborum impedit. Maiores repellat error sunt nemo. Dolor repellat et enim neque rerum doloremque mollitia. Nemo possimus aut ut ea consequatur blanditiis earum. </p><p> Maiores quia quis aliquam rem est sunt aperiam magnam. Id aspernatur voluptatum pariatur odio sed quam impedit. Alias doloremque sequi et sapiente. Vel et reprehenderit adipisci velit veritatis. Aut repellendus voluptatem adipisci. </p><p> Velit vel accusantium sequi dicta dignissimos alias. Sunt magnam vitae nisi culpa. </p>','2021-11-30 12:25:16',NULL,'2021-11-02 14:46:47','2022-02-08 12:27:13'),
(2,10,3,'Incidunt laboriosam sed natus omnis.','incidunt-laboriosam-sed-natus-omnis','Est in enim maxime saepe nihil quo ut sit. Pariatur deleniti quis quis. Sunt accusantium est assumenda.','<p> Tempora repellendus aut temporibus molestiae aut eaque esse. Eum non deleniti ducimus id. Voluptatem quia voluptatem et aut qui. </p><p> Eaque vero exercitationem libero sint explicabo ratione sit veniam. Sunt eligendi non quia qui est accusamus porro molestiae. Omnis sed nulla esse natus consequatur et quis. At earum pariatur tempora non nesciunt. </p><p> Corrupti et vero similique aut. Est aut sunt neque qui dolorem. Non eius voluptatem est illo. </p><p> Molestias rerum libero ipsum culpa. Beatae voluptatum quibusdam dicta ut fugit iure eos. Natus commodi maxime eveniet commodi et. Reiciendis vel enim facere excepturi consectetur. Eligendi impedit numquam corporis magnam veniam optio est. </p><p> Optio ipsam ut quis explicabo cum eos sunt. Occaecati et qui inventore rerum autem esse molestiae. Vitae et ut voluptas accusantium soluta. </p><p> Voluptatem ut aperiam facilis qui quisquam. Optio vitae dolorem impedit mollitia corporis. Quia quidem voluptates iusto vero veritatis excepturi pariatur. Qui quas rem voluptatum ut. </p><p> Consectetur qui et reiciendis nihil qui. Dolores minima eaque et reiciendis consectetur. Ea illo ducimus soluta in suscipit sunt possimus. Cumque magnam impedit qui sint unde sed. </p><p> Dolorem voluptatem voluptatibus est sed sit neque. Eos laudantium ab suscipit praesentium aspernatur quidem odio. Eveniet rerum dicta debitis quia. Autem earum nisi ut est cupiditate rerum. Officia dolor dolores id nihil officiis excepturi aspernatur. </p><p> Aut quia sint ut incidunt a qui incidunt. Veritatis voluptatum excepturi sunt quibusdam. Quia voluptates totam ab exercitationem quo dolores expedita. </p><p> Qui quis corporis velit repellendus. Ratione ipsa deleniti quam quia similique illum quibusdam. Qui et voluptatem laudantium quas. </p><p> Quo nisi autem voluptatibus qui qui qui. Dignissimos aut blanditiis autem sunt numquam quia. Vitae repudiandae aut aliquam quisquam ex dignissimos. Similique voluptas veritatis omnis. </p><p> Asperiores sit expedita quis unde quo culpa quidem. Velit omnis quas voluptas consequatur aut voluptas error dicta. Ut labore sit aut consectetur sed eos at aut. </p><p> Et dolores sed ratione non fugiat consectetur aut. Qui aperiam veritatis aperiam inventore error. Ratione sit eos commodi molestias et. Illo laboriosam nobis quis at. </p>','2021-11-30 12:25:16',NULL,'2021-12-19 12:31:55','2022-02-08 12:27:13'),
(3,8,4,'Et eum nihil explicabo delectus ad.','et-eum-nihil-explicabo-delectus-ad','Ut neque laborum repellat autem architecto voluptatem eos. Numquam consequatur non dolorem cumque eos voluptatum aliquam dicta. Dolorum est sunt eligendi rerum. Velit cum natus quisquam corporis ipsa ut eos numquam. Corporis cupiditate veniam enim aut.','<p> Odio omnis quo eos. Ut et velit in sit voluptas. Animi saepe voluptas praesentium repellendus similique quibusdam. Delectus in minima hic sunt amet. </p><p> Ipsam eius perspiciatis facere consequatur et. Odio sunt et facere ea repellendus totam odio. Consequatur fugiat quae architecto iste dolores totam. Dolorem enim at harum sunt voluptate. </p><p> Consectetur natus voluptatem repudiandae veritatis dicta doloribus sed eos. Architecto non aut sit eaque quo officiis et. Aperiam nisi nobis rerum odit. </p><p> Aut dolores fugiat officia impedit laudantium minus atque quibusdam. Ut occaecati quaerat impedit qui rem. Officia doloremque est similique sit. </p><p> Alias ut aut et dolore animi dolorem quas. Non eum sit delectus minus recusandae enim est. Delectus consequatur dignissimos alias reprehenderit et labore adipisci. Quisquam laboriosam minima laboriosam voluptatum. Similique ipsa quibusdam asperiores autem repudiandae deleniti voluptatibus. </p><p> Necessitatibus ex beatae repellendus sunt tempore non ab. Est et et ex rerum repudiandae aliquam maiores alias. Voluptatem sed vero adipisci. Rem et maiores rem laudantium. </p><p> Distinctio eum magni voluptatem illum. Est ipsa possimus et possimus ipsam. Sunt quis iste qui id omnis commodi a modi. Voluptatem temporibus nobis dolorem. </p><p> Perspiciatis sit velit sequi harum velit et voluptatem. Maiores possimus sequi provident aliquam. </p><p> Sunt quae earum consequuntur aut quos et. Sequi debitis dolorem sit est ut. Dolorum eaque accusantium aut libero. </p><p> Cupiditate ut quasi facilis dignissimos culpa sapiente. Dolorem aperiam sint sunt pariatur aliquam ex minima. Corrupti omnis ducimus cupiditate sint maiores quaerat. </p><p> Numquam eum molestias rerum rerum. Nostrum non est veritatis sed consequatur et. Inventore minus vel perferendis totam laborum ut. </p><p> Quia molestiae recusandae nam et cumque. Cumque sapiente quia consequatur nihil et. Suscipit cupiditate rerum praesentium reiciendis. Sint accusantium vitae quam hic. Delectus provident dolorem aliquam voluptatem consequatur ea ea id. </p><p> Cum adipisci non est vel. Officia aut quisquam distinctio cum officiis libero. Tempora aut soluta pariatur qui occaecati. </p><p> Et aliquam illum sit et. Consequatur ipsum eligendi hic ut. Eum dignissimos vel voluptas enim velit aspernatur. Fuga iusto sed soluta autem ipsum accusantium voluptatem. Provident sint nemo esse ducimus. </p><p> Error exercitationem voluptas dolorem illum et possimus quia. Fuga rerum ea ipsam id dolor voluptatibus. Consequatur eaque voluptatem temporibus aliquid ad culpa at. Consequatur numquam qui aliquid rem est eligendi ut. </p>','2021-11-30 12:25:16',NULL,'2022-01-08 00:48:06','2022-02-08 12:27:13'),
(4,2,5,'Iste excepturi dolor molestias ratione.','iste-excepturi-dolor-molestias-ratione','Rem repellendus nam quis. Sapiente autem corporis et et. Id ea quaerat aspernatur porro. Consectetur repudiandae excepturi nesciunt porro. Officiis aut modi non non nulla aut optio.','<p> Aperiam velit corporis dolorum dolorem. Aut ut est corporis itaque rerum enim voluptatem. Maiores ex rerum earum sequi. Accusamus perferendis adipisci adipisci consectetur nihil et. Dolorum suscipit quos qui maxime omnis beatae. </p><p> Ducimus earum velit ipsam ut aut numquam. Ut tenetur tempora quae ut in voluptatem recusandae. Necessitatibus velit alias sequi rerum iusto quaerat repellat quidem. Non et voluptatem quis et facere facere excepturi. </p><p> Voluptatem ipsum nemo ut libero nulla id. Ut officia quo nihil tempore sint quia. </p><p> Non ea dolor exercitationem inventore assumenda culpa. Architecto aspernatur quos nisi deleniti. Dolorem aut magni aut sed non voluptate sed. Laborum asperiores quod autem possimus voluptatibus quaerat. Quidem dignissimos itaque ut ad. </p><p> Perspiciatis vitae necessitatibus similique iusto. Esse commodi animi vitae itaque quo. </p><p> Eaque veritatis dolore occaecati. Cupiditate dolorem quia repellendus facere eos. Inventore alias praesentium optio qui distinctio nobis. Libero est et voluptates aut. Possimus perspiciatis quis a recusandae. </p><p> Illum nesciunt sequi voluptatibus eos aut qui eveniet. Dolore voluptates et ab quod. Voluptas qui numquam enim et aspernatur quas. Commodi aut dolorem aut saepe autem aut. </p><p> Explicabo id impedit et animi. Nulla vitae perferendis cupiditate ea numquam occaecati quos. Consectetur corrupti totam at ex sed. </p><p> Provident ea voluptas excepturi. Cumque molestiae dolores ratione quo sunt et in. Et possimus cupiditate facere sit. Aut sit ipsa aut ea harum eveniet eligendi ullam. </p><p> Officiis soluta est numquam ullam vel. Repellat repellat eos totam minima numquam esse. Incidunt mollitia quas totam asperiores at. Dolorem amet iure dolor. </p><p> Animi eum sequi minus voluptate sed dicta. Aut inventore expedita et ea asperiores numquam recusandae. Alias dolor dolores nostrum eveniet itaque. Iure quibusdam amet dolores sunt explicabo et deserunt. </p><p> Illo excepturi et officia iusto. Ea beatae totam voluptatem nesciunt error repellat magni. Aperiam ut perferendis numquam corrupti. </p><p> Blanditiis et aut vero et. Possimus nobis quia nobis reprehenderit alias. Harum quia optio eius consequuntur neque perspiciatis. Sit ab aut vel est pariatur tenetur nobis. </p>',NULL,NULL,'2022-01-21 02:55:55','2022-02-08 12:27:13'),
(5,10,5,'Inventore porro tenetur amet.','inventore-porro-tenetur-amet','Reprehenderit expedita officiis porro molestias asperiores quasi accusantium. Voluptatum voluptatem et tempore neque quod. Molestiae consequatur dolorum doloribus qui nihil ipsum enim.','<p> Aut minus sit ad in error inventore. Optio vel similique consequuntur hic est libero. </p><p> Omnis consequatur impedit in enim. Ab quia ducimus explicabo deserunt excepturi. Molestias non eius aliquid. Reprehenderit est at porro cumque. </p><p> Veritatis ipsa dicta consectetur culpa doloribus explicabo. Quaerat doloribus eligendi ad dicta. Velit dolorem rerum sint minima facilis incidunt. Est in consectetur et est tempore commodi sint. </p><p> Inventore in doloribus consequatur voluptatum voluptates. Repudiandae odio qui quas in et esse quo. Rerum voluptatem nam veritatis quaerat quia culpa sunt quia. </p><p> Est natus ut omnis. Explicabo temporibus laboriosam vitae illo. Sit explicabo delectus sint ab ipsam consequatur. Ut quia temporibus quibusdam veritatis maiores accusamus. </p><p> Dignissimos non distinctio distinctio exercitationem. Quibusdam enim quis et optio. Ducimus iste et placeat. </p><p> Nulla eos id nisi voluptatum ut ad dolorem tenetur. Et suscipit corrupti dolor adipisci occaecati quia. Sed ut deleniti adipisci corporis magni qui. </p><p> Provident hic et voluptate fuga. Fuga odio illum quae voluptatum in dolore incidunt. Quaerat quo incidunt est corporis ut eveniet soluta. Expedita explicabo ut est. </p><p> Dolor repellat velit est. Qui vel autem est amet culpa. Sit voluptatibus mollitia sapiente illo tenetur repellat id tenetur. Et et molestias provident. </p><p> Quidem molestiae ullam ea omnis voluptas est non. Cupiditate culpa nihil veniam voluptas asperiores. Consequatur unde illo eaque velit voluptas corporis. Et rem voluptas est consectetur. Et quidem necessitatibus et incidunt aut. </p><p> Omnis recusandae alias laborum aliquam. Exercitationem laborum ut repellendus qui. Cum a aut iure et quasi eius ea voluptates. Eos qui dolorem consequuntur cupiditate qui at aliquam. Sed aut est deserunt illo. </p>',NULL,NULL,'2021-12-21 13:17:36','2022-02-08 12:27:13'),
(6,2,5,'A dolorem amet sunt facere aspernatur.','a-dolorem-amet-sunt-facere-aspernatur','Accusamus dolorum sit qui necessitatibus corporis quasi suscipit. Quisquam nemo consequatur aut quidem. Tempora eligendi voluptas repellat nulla rerum reprehenderit tenetur nisi. Non minus quia ut aut consequatur quia.','<p> Est tenetur voluptas ipsum expedita non et. Ut doloremque itaque omnis aperiam quae. </p><p> Aperiam a dolore vel laborum voluptas nobis voluptas. Explicabo inventore aut et possimus accusantium. Debitis accusamus totam exercitationem natus sapiente. Occaecati eos quia illum aut consectetur. Placeat veritatis id possimus officiis deleniti. </p><p> Blanditiis odit officiis non velit. Consectetur non sequi ut at inventore et autem illum. Eius exercitationem excepturi qui fuga nihil. </p><p> Cumque numquam quo autem aut eos ipsam. Ex voluptas consectetur omnis non ea sint. Ipsa praesentium qui autem amet. </p><p> Distinctio non enim aut nisi enim. Beatae vel quo quia atque. Consequatur saepe dignissimos dolores velit. </p><p> Quod odio quasi qui similique aut dolor. Dignissimos quia nulla ut id sequi fugiat sequi dolorum. Ut ullam laudantium ipsum sint temporibus officia aspernatur. </p><p> Et quasi accusantium veniam ut quia. Nam et aspernatur officiis neque. Quis voluptas sunt debitis sit ullam quia sequi. Aliquid eum cumque dicta consequatur qui et. Impedit corrupti nihil corrupti. </p><p> Unde nam voluptatem esse minima sed. Qui optio ullam voluptates aliquam. Vero ipsa sed quia ut neque. Velit cumque debitis cumque ratione. Non vero sit aut. </p><p> Provident earum vel et rerum consequatur. Numquam natus sapiente qui natus id expedita aliquid reprehenderit. Vel possimus impedit voluptatem exercitationem. Soluta impedit eius perspiciatis quo sit reprehenderit minus. Numquam provident deleniti esse vitae aut quis ut. </p>','2021-11-30 12:25:16','2022-02-08 12:36:02','2022-02-05 05:57:42','2022-02-08 12:36:02'),
(7,1,5,'Quos pariatur sit nemo saepe laboriosam.','quos-pariatur-sit-nemo-saepe-laboriosam','Id in minima voluptatem nam qui. Minus quis esse magnam accusantium libero consequatur. Est sit quis molestias qui.','<p> Sint eum adipisci voluptatem. Atque necessitatibus accusamus perferendis ullam qui suscipit eligendi nulla. Nemo et molestias sint dolore culpa corporis quod aut. Aliquid nulla aliquid ex. </p><p> Ut sunt nobis dolorem. Cum quae eius et nemo reiciendis et atque. Vel placeat odio et molestiae eveniet rerum quia. Officiis doloribus nobis laudantium sed numquam iure deleniti a. </p><p> Eum ducimus inventore fuga cum architecto sequi hic. Unde repudiandae earum eligendi impedit. Qui eum eos ratione sunt unde ut. </p><p> Sunt facilis sed facilis nulla voluptatem aut. Quisquam laboriosam omnis animi. Fugit ut eaque a corrupti. Repellat necessitatibus maxime quo amet. </p><p> Placeat voluptas magnam ratione qui. Qui rerum temporibus vel harum. Voluptatem cumque aliquam dolores velit. Velit temporibus sit officiis ullam illum distinctio aut. Iste quaerat molestias saepe illo. </p><p> Est iusto explicabo nesciunt libero deserunt ab accusamus. Ut repellat dolor temporibus laudantium sapiente nisi. Dolore est explicabo voluptatem quod. Excepturi fuga aut corrupti voluptates dolores. </p><p> Praesentium consequuntur aut blanditiis voluptate laborum. Iure nisi dolorem consequatur qui et non ipsa. Est rerum et aspernatur sed. Unde sit voluptatibus ut ea nihil vel dolor. Aliquam rem nihil incidunt a cumque esse. </p>',NULL,NULL,'2022-01-12 01:31:38','2022-02-08 12:27:13'),
(8,1,5,'Consequatur labore esse placeat quae unde commodi odit.','consequatur-labore-esse-placeat-quae-unde-commodi-odit','Voluptas autem dolor dolor quas illo quam. Officia aut odit eveniet. Harum dolores neque autem ipsum sequi. Blanditiis provident blanditiis quas.','<p> Ipsam expedita magnam accusantium id debitis. Labore accusantium et aliquam eligendi eum non non. Vero quasi enim aut atque dolorum inventore ullam dolorem. </p><p> Minus modi at ullam quia voluptas. Eos voluptas vitae totam dolor tenetur voluptatibus aut. Unde magnam ratione assumenda velit cumque nobis. Est expedita quisquam sit accusantium qui voluptatibus. Et perspiciatis quo pariatur ut at quia mollitia. </p><p> Nesciunt non quis qui expedita et in. Ullam dolore ex corrupti doloribus est nam iure placeat. Corporis beatae illum eum molestiae dolores et. Non sit voluptatibus sunt voluptatem. </p><p> Temporibus sit omnis consequatur et rem ut debitis. Architecto cupiditate voluptatem nam voluptas. Et molestiae enim voluptatibus explicabo. Temporibus quia quaerat accusamus laudantium fuga libero. </p><p> Soluta et et voluptatem pariatur ea nihil. Et dolor ex neque dolores commodi autem voluptates magni. Quibusdam mollitia quaerat officiis non velit aut. </p><p> Neque magni nihil occaecati voluptates architecto quo doloremque. Asperiores illo ipsa voluptatem est similique consequatur eligendi. Consequuntur ut perspiciatis et. In ut consequatur libero harum aut eum. </p><p> Maiores doloribus nihil quis quia quia. Quaerat fugiat dolor corrupti quae. Ullam harum qui soluta officia. Eos rerum maiores odio qui neque eum. </p><p> Officiis debitis aliquam rerum commodi. Cupiditate incidunt tenetur repellendus rem deleniti quia adipisci voluptatem. Dolore quae nostrum et minus. Ea illum mollitia deleniti voluptas non. </p><p> Delectus non omnis a temporibus. Velit distinctio dolore laudantium repellat totam impedit. </p><p> Voluptate et quae voluptas voluptate. Libero velit incidunt voluptas est eum sint ducimus. Perferendis fugit quas nulla possimus veritatis nisi eos. </p><p> Praesentium suscipit ratione harum. Totam quas rerum alias porro nemo. Ut veniam aliquid optio modi dolor. Voluptas rerum laudantium facilis enim odio aliquam amet. </p><p> Voluptatum beatae expedita repellendus rerum placeat. Distinctio ut tempore assumenda quidem esse facere iure iure. Sit nisi beatae numquam veniam. Culpa dolor atque repellat expedita nihil. </p><p> Perspiciatis maiores quo quibusdam necessitatibus. Tempora saepe maxime cupiditate ipsa dignissimos eos minus. Quos consequuntur veritatis vero voluptatum perferendis. </p><p> Praesentium labore rerum excepturi tenetur voluptatibus dolorem. Accusamus sed et eius hic earum sequi. Enim voluptatem non et totam temporibus. Nulla non ullam consequatur ullam nisi. </p><p> Repudiandae commodi fugiat numquam sapiente qui libero facere. Vitae recusandae id reprehenderit ut. Beatae nihil facilis aperiam adipisci aut ea quos nostrum. </p>',NULL,NULL,'2022-01-01 21:56:43','2022-02-08 12:27:13'),
(9,3,2,'Minus voluptates nam possimus ullam.','minus-voluptates-nam-possimus-ullam','Odio dolorum autem facilis similique. Molestiae laudantium libero rerum error delectus voluptas est. Ut necessitatibus reiciendis quis quod. Et ut natus sed voluptatem.','<p> Eum ipsa eveniet et nam ea reprehenderit quas quibusdam. Soluta aut voluptatem expedita. Et molestiae aliquid eos impedit odit assumenda illo tempora. </p><p> Inventore non est officiis sapiente dignissimos. Libero reprehenderit tempora aliquid blanditiis inventore ut. Asperiores accusamus culpa nemo. Quas vero dignissimos blanditiis ut amet odio vel. </p><p> Ipsum enim quasi qui voluptas qui quaerat placeat. Rerum aut nisi corrupti vitae repudiandae blanditiis quisquam. Quisquam et sequi architecto. </p><p> Autem aut occaecati aut et tempore aut omnis. Itaque et asperiores nihil soluta et quibusdam debitis. Temporibus et nobis ut minima iusto et nesciunt consectetur. </p><p> Omnis officia omnis aliquam doloremque. Quidem eveniet deserunt sunt deleniti. Tenetur mollitia nobis rerum molestias. </p><p> Impedit minima dolorem error odio provident. Nam asperiores dolorem distinctio. Porro tenetur et dignissimos voluptatem vero aut vel. Nam eos sit sint rerum. </p><p> Sequi modi non nulla voluptatum. Exercitationem laborum reprehenderit saepe provident recusandae eaque optio. Provident velit nesciunt velit quibusdam quia quam sit. Dolor rerum sequi tempore velit quo neque illo. </p><p> Est vero beatae dolorum dolore voluptas eaque et et. Laudantium saepe et asperiores non omnis minima non. Aut rerum nam vero aut et nihil. Ab cum in quam dolores perferendis quod facere et. Molestiae dolorem illo facilis dolores. </p><p> Aliquam eligendi dolorum sit laboriosam. Rem laudantium dolorum est possimus. Deserunt qui nostrum earum aliquid et nobis placeat. Consequatur ut sed ut et atque praesentium dignissimos. </p><p> Quis sequi ipsum sequi et enim eos. Et ut error est nihil aut. Ut dolorem ipsam aut magnam nobis vero. </p><p> Aut et sint qui aut repudiandae saepe. Nisi laudantium voluptatem omnis et velit vero aspernatur occaecati. Blanditiis pariatur incidunt fugit ea velit odio et. </p><p> Dolores ea voluptatem vel eaque itaque non. Voluptatem et aliquid qui praesentium. </p><p> Expedita molestias ex doloribus temporibus voluptatem quas. Officiis minus aut sapiente aliquam in. Atque perspiciatis enim qui asperiores rem alias. </p>','2021-11-30 12:25:16',NULL,'2021-12-19 03:19:42','2022-02-08 12:27:14'),
(10,6,3,'Maxime hic enim praesentium labore.','maxime-hic-enim-praesentium-labore','Dolor distinctio quos quae. Debitis eum voluptas laudantium maiores et. Vitae sapiente unde assumenda repellendus porro non.','<p> Sapiente consequuntur odit eius voluptas. Quos cupiditate tempora officiis delectus ut. Pariatur vitae quam itaque veniam. Maiores expedita odio unde magnam sit suscipit. </p><p> Aut cumque temporibus eligendi occaecati nam ipsam veritatis amet. Fugiat maxime provident consequatur sequi et corrupti. Quo repellat enim libero occaecati labore delectus. Quod eaque libero voluptas dignissimos voluptate est beatae nihil. Eum consequuntur vel autem aspernatur qui temporibus. </p><p> Accusamus non qui debitis et facilis. Vel qui nihil sint adipisci. Voluptatem sed architecto quia qui ad. Libero cumque consequatur quidem ex. </p><p> Neque dolores illum vitae. Est inventore sunt et quis sequi non. Enim natus quia repellendus consequatur. Itaque placeat alias maxime ab ipsa quia. Doloribus laboriosam voluptas fugit. </p><p> Molestias assumenda iure vel saepe velit rem. Qui repellat numquam quia ut. Expedita et officiis commodi culpa adipisci. </p><p> Unde aut animi officia nihil quisquam. Blanditiis minima saepe autem voluptatum. Quam quam est libero aspernatur qui voluptate omnis magnam. </p><p> Quam recusandae sit est rem explicabo ut labore. Necessitatibus perspiciatis omnis impedit et exercitationem. Id dolores dignissimos reiciendis molestiae nesciunt cupiditate sed. Temporibus saepe harum qui voluptas illo. </p><p> Tenetur sed explicabo debitis quibusdam occaecati deleniti saepe. Aut vel qui quos consequatur delectus praesentium. </p><p> In at est architecto consectetur. Voluptatem iusto error et vitae iste totam et. Quia tenetur quibusdam aperiam. Dolorem quo odio molestias quasi fuga et ut. Omnis pariatur debitis sequi repudiandae repudiandae et. </p><p> Occaecati reprehenderit suscipit commodi vel ipsa ipsum. Est officia consectetur dolorem magnam perspiciatis et. Eum vitae perspiciatis laudantium delectus quis quia voluptatibus. </p><p> Sapiente veniam autem nulla voluptatem molestiae. Unde iusto et architecto nam in. Similique hic ea debitis quo quia tempore. </p>',NULL,NULL,'2022-01-26 14:46:49','2022-02-08 12:27:14');

/*Table structure for table `product_categories` */

DROP TABLE IF EXISTS `product_categories`;

CREATE TABLE `product_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_categories` */

/*Table structure for table `product_types` */

DROP TABLE IF EXISTS `product_types`;

CREATE TABLE `product_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_types` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

/*Table structure for table `profile_contacts` */

DROP TABLE IF EXISTS `profile_contacts`;

CREATE TABLE `profile_contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `profile_contacts` */

/*Table structure for table `profiles` */

DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `profiles` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`role`,`created_at`,`updated_at`) values 
(1,'admin',NULL,NULL),
(2,'editor',NULL,NULL),
(3,'author',NULL,NULL);

/*Table structure for table `rooms` */

DROP TABLE IF EXISTS `rooms`;

CREATE TABLE `rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `bed` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facility` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rooms` */

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tags` */

/*Table structure for table `testimonies` */

DROP TABLE IF EXISTS `testimonies`;

CREATE TABLE `testimonies` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `star` tinyint(4) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `testimonies` */

insert  into `testimonies`(`id`,`name`,`job`,`star`,`message`,`created_at`,`updated_at`) values 
(1,'Gasti Safitri','Karyawan BUMN',5,'Iure voluptas quos modi dolor corporis quia ipsum qui sit vel.','2022-02-08 09:12:08','2022-02-08 09:12:08'),
(2,'Hasim Wibowo','Pastor',2,'Odit voluptatem eveniet alias aut nostrum omnis et cum temporibus velit in at quia est quia dolorem voluptates.','2022-02-08 09:12:17','2022-02-08 09:12:17'),
(3,'Makuta Iswahyudi S.Ked','Seniman',3,'Saepe esse itaque est illum occaecati asperiores cum totam eaque amet ut maiores.','2022-02-08 09:12:18','2022-02-08 09:12:18'),
(4,'Mustika Marbun','Pelajar / Mahasiswa',5,'Neque omnis quia consequatur et laborum excepturi commodi aut ex laborum odit sit autem consequatur dolor in in unde sed a quod quia rerum deserunt rem dolorem.','2022-02-08 09:12:19','2022-02-08 09:12:19'),
(5,'Puti Yuliarti','Pemandu Wisata',4,'Eum reiciendis non quas assumenda et eaque quidem qui et rem omnis possimus temporibus atque quia dolor eum voluptates ab.','2022-02-08 09:12:20','2022-02-08 09:12:20'),
(6,'Irfan Darmaji Gunawan S.Ked','Petani / Pekebun',4,'Laborum numquam eligendi voluptatem similique nam autem nihil eum odit iusto voluptas animi iusto consequatur nesciunt at doloribus.','2022-02-08 09:12:22','2022-02-08 09:12:22'),
(7,'Silvia Ella Haryanti M.M.','Wiraswasta',5,'Est praesentium dolores repellat sed rerum corrupti rerum at aliquam autem exercitationem tenetur vitae inventore sit dolorem placeat velit ipsa fuga occaecati doloribus.','2022-02-08 09:12:23','2022-02-08 09:12:23'),
(8,'Halima Rahayu','Pendeta',3,'Animi est reprehenderit reprehenderit aliquid sint aut sint provident consequuntur nostrum rem impedit officiis qui.','2022-02-08 09:12:24','2022-02-08 09:12:24'),
(9,'Mustika Saefullah','Pelajar / Mahasiswa',2,'Voluptas nam aut ut illum dignissimos quasi porro et quaerat fuga rerum et quas.','2022-02-08 09:12:25','2022-02-08 09:12:25'),
(10,'Ian Jono Hidayanto S.E.I','Guru',3,'Tenetur sint cumque cupiditate eum deleniti vel corrupti ullam et qui.','2022-02-08 09:12:26','2022-02-08 09:12:26');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_slug_unique` (`slug`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`email`,`password`,`two_factor_secret`,`two_factor_recovery_codes`,`slug`,`email_verified_at`,`remember_token`,`created_at`,`updated_at`,`role_id`) values 
(1,'Ramous Peppy','mouska','ramouspeppy@gmail.com','$2y$10$CRAqdPkR2wNieCvVQ5iudeFhNwlv9s7Z3FTfTZ5yxRLaSl/iGVc.q',NULL,NULL,'ramous-peppy','2022-02-08 14:17:57',NULL,'2022-02-08 14:17:57','2022-02-08 14:17:57',1);

/*Table structure for table `views` */

DROP TABLE IF EXISTS `views`;

CREATE TABLE `views` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `viewable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewable_id` bigint(20) unsigned NOT NULL,
  `visitor` text COLLATE utf8mb4_unicode_ci,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `views_viewable_type_viewable_id_index` (`viewable_type`,`viewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `views` */

insert  into `views`(`id`,`viewable_type`,`viewable_id`,`visitor`,`collection`,`viewed_at`) values 
(1,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:10:14'),
(2,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:10:58'),
(3,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:12:39'),
(4,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:12:52'),
(5,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:21:10'),
(6,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:31:28'),
(7,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:40:38'),
(8,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 09:47:41'),
(9,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:12:27'),
(10,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:41:00'),
(11,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:44:34'),
(12,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:47:11'),
(13,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:47:43'),
(14,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 11:48:41'),
(15,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:00:05'),
(16,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:01:00'),
(17,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:04:05'),
(18,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:04:45'),
(19,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:08:33'),
(20,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:10:57'),
(21,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:12:10'),
(22,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:13:02'),
(23,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:13:26'),
(24,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:14:02'),
(25,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:18:16'),
(26,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:19:15'),
(27,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:50:34'),
(28,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:53:21'),
(29,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:53:52'),
(30,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:56:40'),
(31,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:56:56'),
(32,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 12:56:58'),
(33,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:03:57'),
(34,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:04:04'),
(35,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:06:09'),
(36,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:06:24'),
(37,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:10:06'),
(38,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:15:47'),
(39,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:16:15'),
(40,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:17:21'),
(41,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:17:42'),
(42,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:18:40'),
(43,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:25:18'),
(44,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:25:48'),
(45,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:30:06'),
(46,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 13:59:02'),
(47,'App\\Models\\About',1,'aHmSgqYevOgplt5JVZBXxaDo9mT5S5suWaDhDnrfnZYEJw04sPxLmTlzcO8ZSZExoee5fgolJLX7YBCs',NULL,'2022-02-08 14:00:39');

/*Table structure for table `web_settings` */

DROP TABLE IF EXISTS `web_settings`;

CREATE TABLE `web_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `web_settings_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `web_settings` */

insert  into `web_settings`(`id`,`name`,`value`,`created_at`,`updated_at`) values 
(1,'site_name','Site Name',NULL,NULL),
(2,'site_title','Most awesome website in the world',NULL,NULL),
(3,'site_desc','Congratulation,you have found the most awesome website in the world',NULL,NULL),
(4,'site_logo','data/setting/logo.png',NULL,NULL),
(5,'favicon','images/data/setting/favicon.ico',NULL,NULL),
(6,'g_verif','',NULL,NULL),
(7,'g_tag','',NULL,NULL),
(8,'script','',NULL,NULL),
(9,'og_image','og-image.jpg',NULL,NULL),
(10,'bg_footer','data/setting/footer.jpg',NULL,NULL),
(11,'bg_header_other','data/header/image-other.jpg',NULL,NULL),
(12,'bg_testimony','data/testimony/bg.jpg',NULL,NULL);

/*Table structure for table `welcomes` */

DROP TABLE IF EXISTS `welcomes`;

CREATE TABLE `welcomes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `welcomes` */

insert  into `welcomes`(`id`,`title`,`subtitle`,`message`,`created_at`,`updated_at`) values 
(1,'Welcome to Pacific','It\'s time to start your adventure','<p> A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p> <p> Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>','2022-02-08 14:17:57','2022-02-08 14:17:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
