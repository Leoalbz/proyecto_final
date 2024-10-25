-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add articulo',7,'add_articulo'),(26,'Can change articulo',7,'change_articulo'),(27,'Can delete articulo',7,'delete_articulo'),(28,'Can view articulo',7,'view_articulo'),(29,'Can add comentario',8,'add_comentario'),(30,'Can change comentario',8,'change_comentario'),(31,'Can delete comentario',8,'delete_comentario'),(32,'Can view comentario',8,'view_comentario'),(33,'Can add contacto',9,'add_contacto'),(34,'Can change contacto',9,'change_contacto'),(35,'Can delete contacto',9,'delete_contacto'),(36,'Can view contacto',9,'view_contacto'),(37,'Can add perfil',10,'add_perfil'),(38,'Can change perfil',10,'change_perfil'),(39,'Can delete perfil',10,'delete_perfil'),(40,'Can view perfil',10,'view_perfil');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$MCbPgOg6Id6g7Zlr9CqEmS$dI383m3s98BEJEcqB6F3FiMx3dQ+yFQvN6VXymH4DI8=','2024-10-25 12:57:12.673189',1,'admin','','','admin@admin.com',1,1,'2024-10-15 09:46:29.056667');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-10-15 09:53:40.838772','1','Creación de imágenes dinámicas con PHP',1,'[{\"added\": {}}]',7,1),(2,'2024-10-15 10:10:21.228739','2','Manejo de arrays con Javascript',1,'[{\"added\": {}}]',7,1),(3,'2024-10-15 10:20:59.194968','3','Bucle Do... While - Javascript',1,'[{\"added\": {}}]',7,1),(4,'2024-10-15 10:39:21.010847','4','Switch - Javascript',1,'[{\"added\": {}}]',7,1),(5,'2024-10-15 10:43:38.726778','5','Manejo de fechas con PHP',1,'[{\"added\": {}}]',7,1),(6,'2024-10-15 10:47:11.600590','6','Funciones para manejo de archivos en PHP',1,'[{\"added\": {}}]',7,1),(7,'2024-10-15 10:52:17.181366','7','Introduccion a programación funcional en Python',1,'[{\"added\": {}}]',7,1),(8,'2024-10-15 10:58:23.425439','8','Métodos más comunes para listas en Python',1,'[{\"added\": {}}]',7,1),(9,'2024-10-15 11:02:03.186692','9','Variables en Java',1,'[{\"added\": {}}]',7,1),(10,'2024-10-15 11:03:57.226220','10','Expresiones - Java',1,'[{\"added\": {}}]',7,1),(11,'2024-10-25 11:08:41.071518','3','LeoAlbornoz',3,'',4,1),(12,'2024-10-25 11:09:10.730416','2','PabloAlvarez',3,'',4,1),(13,'2024-10-25 11:09:15.427170','4','VictorLopez',3,'',4,1),(14,'2024-10-25 11:29:03.309224','4','Mensaje de Pablo Alvarez',3,'',9,1),(15,'2024-10-25 11:29:03.309224','3','Mensaje de Pablo Alvarez',3,'',9,1),(16,'2024-10-25 11:29:03.309224','2','Mensaje de Leonardo Albornoz',3,'',9,1),(17,'2024-10-25 11:29:03.309224','1','Mensaje de Leonardo Albornoz',3,'',9,1),(18,'2024-10-25 11:29:13.506792','5','PabloAlvarez',3,'',4,1),(19,'2024-10-25 11:36:00.628517','6','PabloAlvarez',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(20,'2024-10-25 11:37:38.154266','6','PabloAlvarez',3,'',4,1),(21,'2024-10-25 12:54:34.689766','7','PabloAlvarez',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(22,'2024-10-25 12:57:21.531421','8','LeoAlbornoz',3,'',4,1),(23,'2024-10-25 12:57:21.531421','7','PabloAlvarez',3,'',4,1),(24,'2024-10-25 12:57:31.712907','2','admin: Muy buenoo',3,'',8,1),(25,'2024-10-25 12:57:36.324193','5','Mensaje de Pablo Alvarez',3,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'blog_auth','perfil'),(5,'contenttypes','contenttype'),(7,'post','articulo'),(8,'post','comentario'),(9,'post','contacto'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-10-15 01:58:18.101493'),(2,'auth','0001_initial','2024-10-15 01:58:27.888951'),(3,'admin','0001_initial','2024-10-15 01:58:30.426278'),(4,'admin','0002_logentry_remove_auto_add','2024-10-15 01:58:30.579290'),(5,'admin','0003_logentry_add_action_flag_choices','2024-10-15 01:58:30.631295'),(6,'contenttypes','0002_remove_content_type_name','2024-10-15 01:58:32.180145'),(7,'auth','0002_alter_permission_name_max_length','2024-10-15 01:58:33.290592'),(8,'auth','0003_alter_user_email_max_length','2024-10-15 01:58:33.974648'),(9,'auth','0004_alter_user_username_opts','2024-10-15 01:58:34.085122'),(10,'auth','0005_alter_user_last_login_null','2024-10-15 01:58:35.212584'),(11,'auth','0006_require_contenttypes_0002','2024-10-15 01:58:35.246589'),(12,'auth','0007_alter_validators_add_error_messages','2024-10-15 01:58:35.313592'),(13,'auth','0008_alter_user_username_max_length','2024-10-15 01:58:36.398993'),(14,'auth','0009_alter_user_last_name_max_length','2024-10-15 01:58:37.285406'),(15,'auth','0010_alter_group_name_max_length','2024-10-15 01:58:37.417416'),(16,'auth','0011_update_proxy_permissions','2024-10-15 01:58:37.454420'),(17,'auth','0012_alter_user_first_name_max_length','2024-10-15 01:58:38.052849'),(18,'post','0001_initial','2024-10-15 01:58:39.938442'),(19,'sessions','0001_initial','2024-10-15 01:58:40.470860'),(20,'post','0002_contacto','2024-10-16 10:46:23.268172'),(21,'post','0002_alter_articulo_imagen','2024-10-25 10:49:42.327218');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_articulo`
--

DROP TABLE IF EXISTS `post_articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_articulo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `contenido` longtext NOT NULL,
  `lenguaje` varchar(20) NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `autor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_articulo_autor_id_a5b1ffc5_fk_auth_user_id` (`autor_id`),
  CONSTRAINT `post_articulo_autor_id_a5b1ffc5_fk_auth_user_id` FOREIGN KEY (`autor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_articulo`
--

LOCK TABLES `post_articulo` WRITE;
/*!40000 ALTER TABLE `post_articulo` DISABLE KEYS */;
INSERT INTO `post_articulo` VALUES (1,'Creación de imágenes dinámicas con PHP','articulos/article_02020_.png','Una imagen dinámica es un fichero PHP que contiene las instrucciones para su creación. Para visualizar una imagen dinámica desde una página web basta con invocar desde la etiqueta\r\nclásica de inserción de imágenes de HTML:\r\n<img src=\"nombre del fichero PHP que la genera\">\r\nPrimera etiqueta\r\nUna vez conocidos los formatos que soporta nuestra versión ya podemos generar imágenes en\r\ncualquiera de esos formatos.\r\nVimos un script que nos permite saber esto en la unidad anterior. Para el ejemplo, trabajaremos\r\ncon dos formatos: JPG y PNG.\r\nCabe aclarar desde el principio, que en algunas versiones de servidor local, se han comprobado\r\nproblemas al mostrar ciertas imágenes dinámicas en formato PNG, cosa que no sucede una vez\r\ncolocado on-line el script, sobre todo cuando el PNG no posee color de fondo.\r\nLa primera instrucción de un fichero de creación de imágenes dinámicas ha de ser:\r\nheader(\"Content-type: image/jpeg\")\r\nsi se trata de crear una imagen JPG o:\r\nheader(\"Content-type: image/png\")\r\nsi pretendemos que la imagen tenga formato PNG\r\nFunciones PHP para esos procesos:\r\n$nombre = imagecreate(ancho,alto)\r\nCon esta función creamos una imagen con el tamaño especificado (ancho y alto) en pixeles que es\r\nrecogida en la variable nombre. Esta función es idéntica para cualquier formato de imagen.\r\nEnvío de imágenes al navegador \r\nEjemplo: imagejpeg($nombre) \r\nEliminar imágenes de la memoria\r\nIndependientemente del formato utilizado para borrar imágenes de la memoria (no del\r\nnavegador) se utiliza la siguiente sintaxis:\r\nimagedestroy($nombre)  y se utiliza al final del codigo sin excepción','PHP','2024-10-15 09:53:40.836770',1),(2,'Manejo de arrays con Javascript','articulos/METODOS_DE_ARRAYS_EN_JS.jpg','Los Arrays en JavaScript son objetos global que es usado en la construcción de arrays, que son objetos tipo lista de alto nivel.\r\n\r\n\r\nDescripción\r\nLos arrays son objetos similares a una lista cuyo prototipo proporciona métodos para efectuar operaciones de recorrido y de mutación. Tanto la longitud como el tipo de los elementos de un array son variables. Dado que la longitud de un array puede cambiar en cualquier momento, y los datos se pueden almacenar en ubicaciones no contiguas, no hay garantía de que los arrays de JavaScript sean densos; esto depende de cómo el programador elija usarlos. En general estas características son cómodas, pero si, en su caso particular, no resultan deseables, puede considerar el uso de arrays con tipo.\r\n\r\nOperaciones habituales\r\nCrear un Array\r\nlet frutas = [\"Manzana\", \"Banana\"];\r\n\r\nconsole.log(frutas.length);\r\n// 2\r\n\r\nAcceder a un elemento de Array mediante su índice\r\n\r\nlet primero = frutas[0];\r\n// Manzana\r\n\r\nlet ultimo = frutas[frutas.length - 1];\r\n// Banana\r\n\r\nRecorrer un Array\r\nfrutas.forEach(function (elemento, indice, array) {\r\n  console.log(elemento, indice);\r\n});\r\n// Manzana 0\r\n// Banana 1\r\n\r\nAñadir un elemento al final de un Array\r\nlet nuevaLongitud = frutas.push(\"Naranja\"); // Añade \"Naranja\" al final\r\n// [\"Manzana\", \"Banana\", \"Naranja\"]\r\nEliminar el último elemento de un Array\r\njs\r\nCopy to Clipboard\r\nlet ultimo = frutas.pop(); // Elimina \"Naranja\" del final\r\n// [\"Manzana\", \"Banana\"]\r\n\r\nAñadir un elemento al principio de un Array\r\nlet nuevaLongitud = frutas.unshift(\"Fresa\"); // Añade \"Fresa\" al inicio\r\n// [\"Fresa\" ,\"Manzana\", \"Banana\"]\r\n\r\nEliminar el primer elemento de un Array\r\nlet primero = frutas.shift(); // Elimina \"Fresa\" del inicio\r\n// [\"Manzana\", \"Banana\"]\r\n\r\nEncontrar el índice de un elemento del Array\r\nfrutas.push(\"Fresa\");\r\n// [\"Manzana\", \"Banana\", \"Fresa\"]\r\n\r\nlet pos = frutas.indexOf(\"Banana\"); // (pos) es la posición para abreviar\r\n// 1','Javascript','2024-10-15 10:10:21.176735',1),(3,'Bucle Do... While - Javascript','articulos/1-52.jpg','La sentencia (hacer mientras) crea un bucle que ejecuta una sentencia especificada, hasta que la condición de comprobación se evalúa como falsa. La condición se evalúa después de ejecutar la sentencia, dando como resultado que la sentencia especificada se ejecute al menos una vez.\r\n\r\nSintaxis\r\ndo\r\n  sentencia\r\nwhile (condición);\r\nsentencia\r\nUna sentencia que se ejecuta al menos una vez y es reejecutada cada vez que la condición se evalúa a verdadera. Para ejecutar múltiples sentencias dentro de un bucle, utilice la sentencia block ({ ... }) para agrupar aquellas sentencias.\r\n\r\ncondición\r\nUna expresión se evalúa después de cada pase del bucle. Si condición se evalúa como verdadera, la sentencia se re-ejecuta. Cuando condición se evalúa como falsa, el control pasa a la siguiente sentencia hacer mientras.\r\n\r\nEjemplos\r\nUsando hacer mientras\r\nEn el siguiente ejemplo, el bucle hacer mientras itera al menos una vez y se reitera hasta que i ya no sea menor que 5.\r\n\r\ndo {\r\n  i += 1;\r\n  document.write(i);\r\n} while (i < 5);','Javascript','2024-10-15 10:20:59.155965',1),(4,'Switch - Javascript','articulos/que-es-javascript-descubre-sus-5-principales-usos.jpg','La declaración switch evalúa una expresión, comparando el valor de esa expresión con una instancia case, y ejecuta declaraciones asociadas a ese case, así como las declaraciones en los case que siguen.\r\n\r\nSyntaxis\r\nswitch (expresión) {\r\n  case valor1:\r\n    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1\r\n    [break;]\r\n  case valor2:\r\n    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor2\r\n    [break;]\r\n  ...\r\n  case valorN:\r\n    //Declaraciones ejecutadas cuando el resultado de expresión coincide con valorN\r\n    [break;]\r\n  default:\r\n    //Declaraciones ejecutadas cuando ninguno de los valores coincide con el valor de la expresión\r\n    [break;]\r\n}\r\nexpresión\r\nEs una expresión que es comparada con el valor de cada instancia case.\r\n\r\ncase valorN\r\nUna instancia case valorN es usada para ser comparada con la expresión. Si la expresión coincide con el valorN, las declaraciones dentro de la instancia case se ejecutan hasta que se encuentre el final de la declaración switch o hasta encontrar una interrupción break.\r\n\r\ndefault\r\nUna instancia default, cuando es declarada, es ejecutada si el valor de la expresión no coincide con cualquiera de las otras instancias case valorN.\r\n\r\nDescripción\r\nSi ocurre una coincidencia, el programa ejecuta las declaraciones asociadas correspondientes. Si la expresión coincide con múltiples entradas, la primera será la seleccionada, incluso si las mayúsculas son tenidas en cuenta.\r\n\r\nEl programa primero busca la primer instacia case cuya expresión se evalúa con el mismo valor de la expresión de entrada (usando comparación estricta, ===) y luego transfiere el control a esa cláusula, ejecutando las declaraciones asociadas. Si no se encuentra una cláusula de case coincidente, el programa busca la cláusula default opcional, y si se encuentra, transfiere el control a esa instancia, ejecutando las declaraciones asociadas. Si no se encuentra una instancia default el programa continúa la ejecución en la instrucción siguiente al final del switch. Por convención, la instancia default es la última cláusula, pero no tiene que ser así.\r\n\r\nLa declaración break es opcional y está asociada con cada etiqueta de case y asegura que el programa salga del switch una vez que se ejecute la instrucción coincidente y continúe la ejecución en la instrucción siguiente. Si se omite el break el programa continúa la ejecución en la siguiente instrucción en la declaración de switch .','Javascript','2024-10-15 10:39:20.948843',1),(5,'Manejo de fechas con PHP','articulos/fecha_hora_php.png','Introducción\r\nEstas funciones le permiten obtener la fecha y hora del servidor en donde están siendo ejecutados\r\nlos scripts PHP. Podemos usar estas funciones para dar formato a las fechas y horas en muchas\r\nmaneras diferentes.\r\n\r\nVeremos algunas de las mas importantes con ejemplos en este apunte. Pueden encontrar la lista\r\ncompleta de funciones de fecha y hora en el manual de PHP\r\nhttp://php.net/manual/es/ref.datetime.php\r\n\r\nFunción date()\r\nEl manejo de fechas es un tema muy importante. Manejar esta función es bastante sencillo,\r\npodemos usarla añadiendo su valor a una variable y además especificando el tiempo que\r\nqueremos manejar, es decir, año, mes, día etc.\r\n\r\nEjemplo:\r\n<?php\r\n$prueba = date(\"Y/m/d\");\r\nEcho \"Hoy es: \".date(\"d/m/Y\");\r\necho \"<br/>\";\r\nif ($prueba < \"2020/11/01\")\r\n{\r\necho \"Sitio web en mantenimiento hasta el 01/11/2020\";\r\n}\r\nelse\r\n{\r\necho \"Bienvenido a nuestro sitio!\";\r\n}\r\n?>\r\nComo verán esto es un simple programa que efectúa un condicional, si la fecha es menor al año\r\n2020, mes de Noviembre, día 1, mostrará un mensaje por pantalla: “Sitio web en mantenimiento“, de lo contrario muestra un mensaje de bienvenida.\r\n\r\nFunción time()\r\nPara mostrar la hora en PHP además de la propia función date(), podemos utilizar la función\r\ntime().\r\nLa función time() nos devolverá la hora de la fecha actual en el formato timestamp.\r\nEl término timestamp en PHP sirve para llevar un registro de la fecha y hora. Y lo que hace\r\nexactamente para ello es calcular el tiempo transcurrido en segundos desde la fecha que toma por referencia, el 1 de Enero de 1970. Así que por ejemplo el numero 86400, correspondería al día\r\n2 de Enero de 1970 a las 00:00, ya que 86400 son los segundos que tiene un día.\r\n\r\nfunción date_default_timezone_set()\r\nEstablece el huso horario que utilizan las funciones de fecha y hora.\r\nEl manual de PHP contiene la lista de identificadores de zonas horarias válidas.\r\nVer: http://www.php.net/manual/es/timezones.php','PHP','2024-10-15 10:43:38.711778',1),(6,'Funciones para manejo de archivos en PHP','articulos/article_02020_.png','FUNCIONES PARA EL MANEJO DE ARCHIVOS\r\nAbrir Archivos\r\nPara abrir archivos, se utiliza la función fopen, cuya sintaxis es la siguiente:\r\nfopen (nombre_archivo, modo);\r\n\r\nEn donde, nombre_archivo es el nombre del archivo que se quiere abrir o crear y el modo indica\r\nde qué forma se procederá a la apertura del archivo. Los distintos modos se comentan en los\r\nejemplos siguientes:\r\n\r\nfopen (archivo.txt, ‘a’)\r\nAbre el archivo en modo de agregar información. Los datos que se ingresen se agregarán al final\r\ndel mismo, sin eliminar el contenido que tuviera. En este modo, si el archivo no existe, lo creará\r\nen ese momento.\r\n\r\nfopen (archivo.txt, ‘a+’)\r\nAbre el archivo en modo de agregar información y además leerlo. Los datos que se ingresen se\r\nagregarán al final del mismo, sin eliminar el contenido que tuviera. En este modo, si el archivo no\r\nexiste, lo creará en ese momento.\r\n\r\nfopen (archivo.txt, ‘r’)\r\nAbre el archivo en modo lectura solamente. El archivo debe existir.\r\n\r\nfopen (archivo.txt, ‘r+’)\r\nAbre el archivo en modo lectura y escritura. La información que se agregue, será insertada al\r\nprincipio del archivo.\r\n\r\nfopen (archivo.txt, ‘w’)\r\nAbre el archivo en modo escritura solamente. Si el archivo no existe, lo crea, y si existe con algún\r\ncontenido, elimina toda su información, dejándolo en blanco.\r\n\r\nfopen (archivo.txt, ‘w+’)\r\nAbre el archivo en modo escritura y lectura. Si el archivo no existe, lo crea, y si existe con algún\r\ncontenido, elimina toda su información, dejándolo en blanco.\r\n\r\nUnidad 3 – Ficheros y directorios\r\nCerrar Archivos\r\nLuego de abrir un archivo y realizar las operaciones necesarias en él, se debe cerrarlo. Para cerrar\r\nun archivo se utiliza la función fclose() que recibe como parámetro la variable del archivo que se\r\nestá utilizando.\r\nEjemplo:\r\n$f = fopen(\"archi.txt\", ‘r’);\r\nfclose($f);','PHP','2024-10-15 10:47:11.581584',1),(7,'Introduccion a programación funcional en Python','articulos/5-tips-to-make-your-python-code-more-functional.jpg','Una función es un bloque de código diseñado para realizar una tarea específica. Una función toma una entrada, realiza una operación y puede devolver un valor. Nos ayuda a evitar la repetición de código y a descomponer programas complejos en tareas más simples y manejables.\r\n\r\nPrincipios de la programación funcional\r\nInmutabilidad: Los datos no se modifican después de\r\nser creados. En su lugar, se crean nuevas versiones de\r\nlos datos.\r\n\r\nFunciones puras: Las funciones no tienen efectos\r\nsecundarios, es decir, no modifican el estado externo.\r\nComposición de funciones: Las funciones pueden ser\r\ncombinadas para crear funciones más complejas.\r\n\r\nRecursión: Se utiliza en lugar de bucles para repetir\r\noperaciones.\r\nFunciones de alto orden: Pueden tomar funciones\r\ncomo argumentos o devolver funciones como resultado.\r\n\r\nAhora que comenzamos a cambiar el paradigma, veremos\r\nque los códigos se pueden mejorar aún más, y el uso de la\r\nprogramación funcional nos ayuda:\r\n\r\nCódigo más limpio y conciso: Al evitar efectos secundarios, el código es más fácil de entender y mantener.\r\n\r\nMayor seguridad: La inmutabilidad reduce la posibilidad de\r\nerrores causados por modificaciones accidentales de\r\ndatos.\r\n\r\nFácil de probar: Las funciones puras son más fáciles de\r\nprobar de forma aislada.\r\n\r\nParalelismo y concurrencia: La programación funcional se\r\nadapta bien a la ejecución en paralelo, ya que las funciones\r\npuras no comparten estado.','Python','2024-10-15 10:52:17.171367',1),(8,'Métodos más comunes para listas en Python','articulos/1366_2000.jpg','Específicamente las listas son colecciones ordenadas y\r\nmutables de elementos, donde cada elemento puede\r\nser de cualquier tipo de dato (números, cadenas de\r\ncaracteres, booleanos, etc). Son ideales para almacenar\r\ny gestionar conjuntos de datos relacionados.\r\nAlgo importante a aclarar es que, un método no es lo\r\nmismo que una función ya que, una función puede usarse de\r\nmanera global, pero un método sólo puede llamarse desde\r\nun objeto específico.\r\n\r\nMétodo append(parámetro) : Este método sirve\r\npara agregar un elemento al final de la lista.\r\n\r\nMétodo remove(parámetro) : Mediante este\r\nmétodo, se buscará y se eliminará, dentro de la lista,\r\nel primer elemento que se encuentre con el valor del\r\nparámetro que le asignemos.\r\n\r\nclear() : Elimina todos los elementos de la lista.\r\n\r\ninsert(posición, parámetro) : Inserta un elemento\r\nen una posición determinada. Posición llevará el\r\nnúmero de la posición del índice donde se quiere\r\ninsertar el argumento.\r\n\r\nindex(parámetro) : Devuelve el número de\r\níndice en el que se encuentra el argumento.\r\n\r\ncount(parámetro) : Devuelve el número de\r\nelementos con el valor del argumento pasado.\r\n\r\nRecuerda que puedes encontrar mas métodos en la documentación oficial de python.','Python','2024-10-15 10:58:23.410439',1),(9,'Variables en Java','articulos/Razones-para-aprender-a-programar-con-Java-1200x675.jpg','El lenguaje de programación Java define los siguientes tipos de variables:\r\n\r\nVariables de instancia (campos no estáticos) Técnicamente hablando, los objetos almacenan sus estados individuales en \"campos no estáticos\", es decir, campos declarados sin la staticpalabra clave. Los campos no estáticos también se conocen como variables de instancia porque sus valores son únicos para cada instancia de una clase (para cada objeto, en otras palabras); el currentSpeed de una bicicleta es independiente del currentSpeed de otra.\r\nVariables de clase (campos estáticos) Una variable de clase es cualquier campo declarado con el staticmodificador ; esto le dice al compilador que existe exactamente una copia de esta variable, independientemente de cuántas veces se haya instanciado la clase. Un campo que define la cantidad de marchas para un tipo particular de bicicleta podría marcarse como staticya que conceptualmente se aplicará la misma cantidad de marchas a todas las instancias. El código static int numGears = 6;crearía un campo estático de este tipo. Además, finalse podría agregar la palabra clave para indicar que la cantidad de marchas nunca cambiará.\r\nVariables locales De manera similar a cómo un objeto almacena su estado en campos, un método a menudo almacenará su estado temporal en variables locales . La sintaxis para declarar una variable local es similar a la de declarar un campo (por ejemplo, int count = 0;). No existe una palabra clave especial que designe una variable como local; esa determinación proviene completamente de la ubicación en la que se declara la variable, que está entre las llaves de apertura y cierre de un método. Como tal, las variables locales solo son visibles para los métodos en los que se declaran; no son accesibles desde el resto de la clase.\r\nParámetros Ya has visto ejemplos de parámetros, tanto en la Bicycleclase como en el mainmétodo de la aplicación \"Hello World!\". Recuerda que la firma del mainmétodo es public static void main(String[] args). Aquí, la argsvariable es el parámetro de este método. Lo importante que hay que recordar es que los parámetros siempre se clasifican como \"variables\", no como \"campos\". Esto también se aplica a otras construcciones que aceptan parámetros (como constructores y controladores de excepciones) que aprenderás más adelante en el tutorial.\r\nDicho esto, el resto de este tutorial utiliza las siguientes pautas generales al analizar campos y variables. Si hablamos de \"campos en general\" (excluyendo variables locales y parámetros), podemos decir simplemente \"campos\". Si la discusión se aplica a \"todo lo anterior\", podemos decir simplemente \"variables\". Si el contexto requiere una distinción, utilizaremos términos específicos (campo estático, variables locales, etc.) según corresponda. Es posible que también vea ocasionalmente el término \"miembro\". Los campos, métodos y tipos anidados de un tipo se denominan colectivamente miembros .','Java','2024-10-15 11:02:03.137688',1),(10,'Expresiones - Java','articulos/Logo6.png','Una expresión es una construcción formada por variables, operadores e invocaciones de métodos, que se construyen según la sintaxis del lenguaje y que dan como resultado un único valor. Ya has visto ejemplos de expresiones, ilustrados en negrita a continuación:\r\n\r\nint cadence = 0;\r\nanArray[0] = 100;\r\nSystem.out.println(\"Element 1 at index 0: \" + anArray[0]);\r\n\r\nint result = 1 + 2; // result is now 3\r\nif (value1 == value2) \r\n    System.out.println(\"value1 == value2\");\r\nEl tipo de datos del valor devuelto por una expresión depende de los elementos utilizados en la expresión. La expresión cadence = 0devuelve un intporque el operador de asignación devuelve un valor del mismo tipo de datos que su operando de la izquierda; en este caso, cadencees un int. Como puede ver en las otras expresiones, una expresión también puede devolver otros tipos de valores, como booleano String.\r\n\r\nEl lenguaje de programación Java permite construir expresiones compuestas a partir de varias expresiones más pequeñas, siempre que el tipo de datos requerido por una parte de la expresión coincida con el tipo de datos de la otra. A continuación, se muestra un ejemplo de una expresión compuesta:\r\n\r\n \r\n1 * 2 * 3\r\nEn este ejemplo en particular, el orden en el que se evalúa la expresión no es importante porque el resultado de la multiplicación es independiente del orden; el resultado siempre es el mismo, sin importar en qué orden se apliquen las multiplicaciones. Sin embargo, esto no es cierto para todas las expresiones.','Java','2024-10-15 11:03:57.212222',1);
/*!40000 ALTER TABLE `post_articulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_comentario`
--

DROP TABLE IF EXISTS `post_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_comentario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `contenido` longtext NOT NULL,
  `fecha_publicacion` datetime(6) NOT NULL,
  `articulo_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comentario_articulo_id_1cf4dc1d_fk_post_articulo_id` (`articulo_id`),
  KEY `post_comentario_usuario_id_87b0f08d_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `post_comentario_articulo_id_1cf4dc1d_fk_post_articulo_id` FOREIGN KEY (`articulo_id`) REFERENCES `post_articulo` (`id`),
  CONSTRAINT `post_comentario_usuario_id_87b0f08d_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_comentario`
--

LOCK TABLES `post_comentario` WRITE;
/*!40000 ALTER TABLE `post_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_contacto`
--

DROP TABLE IF EXISTS `post_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha_contacto` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_contacto`
--

LOCK TABLES `post_contacto` WRITE;
/*!40000 ALTER TABLE `post_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_contacto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 10:02:57
