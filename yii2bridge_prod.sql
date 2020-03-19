-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 19 2020 г., 14:17
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yii2bridge_prod`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1584429839);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1584429839, 1584429839);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `status` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `text`, `date`, `status`) VALUES
(5, 1, 2, '1112', '2020-03-17', 1),
(6, 1, 3, '555', '2020-03-17', 0),
(7, 1, 2, '1112', '2020-03-17', 0),
(8, 1, 2, '222', '2020-03-17', 0),
(9, 1, 2, '12341', '2020-03-17', 0),
(10, 1, 2, '1234134324', '2020-03-17', 0),
(11, 1, 2, '1234134324', '2020-03-17', 0),
(12, 1, 2, 'Ок!', '2020-03-18', 0),
(13, 1, 1, '123', '2020-03-18', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(255) NOT NULL DEFAULT '',
  `translation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('Da\\User\\Migration\\m000000_000001_create_user_table', 1584429708),
('Da\\User\\Migration\\m000000_000002_create_profile_table', 1584429709),
('Da\\User\\Migration\\m000000_000003_create_social_account_table', 1584429709),
('Da\\User\\Migration\\m000000_000004_create_token_table', 1584429710),
('Da\\User\\Migration\\m000000_000005_add_last_login_at', 1584429710),
('Da\\User\\Migration\\m000000_000006_add_two_factor_fields', 1584429711),
('Da\\User\\Migration\\m000000_000007_enable_password_expiration', 1584429711),
('Da\\User\\Migration\\m000000_000008_add_last_login_ip', 1584429711),
('Da\\User\\Migration\\m000000_000009_add_gdpr_consent_fields', 1584429712),
('m000000_000000_base', 1584428963),
('m140506_102106_rbac_init', 1584429713),
('m140609_093837_addI18nTables', 1584428964),
('m170613_185652_create_settings_table', 1584429729),
('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1584429713),
('m180325_173325_create_settings_group_table', 1584429730),
('m180327_163555_add_key_column_to_settings_group_table', 1584429730),
('m180523_151638_rbac_updates_indexes_without_prefix', 1584429713),
('m200314_052213_create_post_table', 1584429757),
('m200316_053959_create_comment_table', 1584429758),
('m200318_094659_add_image_column_to_post_table', 1584598989);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `post_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `title`, `content`, `date`, `post_image`) VALUES
(1, 'Новость 1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum quas repudiandae doloribus reprehenderit quis cupiditate molestias explicabo fugiat corporis. Error tenetur velit minus laborum alias eum praesentium, aut dolor iure, harum quasi omnis ut saepe iste labore optio sed, deleniti voluptates! Reprehenderit, tenetur. Praesentium recusandae sint dolore a distinctio quibusdam. Porro fugit labore minus amet in, culpa optio, rerum. Dicta autem, soluta dolores nulla, velit quo maxime! In, sit cupiditate vitae, aut quis, ea minus alias quasi ducimus eum sunt? Sint quisquam commodi officiis modi temporibus recusandae pariatur quas consequatur voluptatibus, vitae quia iste minima explicabo sunt veritatis dolorum ut fuga saepe, ullam odit maxime similique natus vero facere rerum! Impedit quis voluptatum, expedita iusto. Obcaecati repudiandae inventore quia illo consequuntur explicabo harum eligendi et vero, expedita eius nihil nemo voluptates, veniam accusamus ullam, quam quisquam excepturi iste dolores alias neque. Voluptatibus neque laudantium minima est modi veniam sequi omnis natus voluptatem doloribus autem quis facere fugit magnam impedit possimus, atque dolore velit repellat sapiente, accusantium fugiat? Amet id sed qui saepe iure dolores ex exercitationem explicabo commodi esse ipsa vel consequuntur culpa, modi nulla, perferendis voluptates voluptatum aspernatur. Laudantium, dicta, repellendus. Voluptatem beatae amet atque, fugiat nesciunt. Natus dolorum dolorem amet, voluptatum perferendis ducimus illum ex facilis et autem quidem aliquam ipsum laborum maxime esse laboriosam doloremque repellendus nemo excepturi, dolores quam deserunt adipisci! In deleniti vitae provident iusto, autem magnam. Architecto inventore quo, fuga dolore illo ullam dolores assumenda error laboriosam alias provident eligendi sequi ipsum autem, omnis, dolorum. Ratione quidem corporis inventore rerum magnam pariatur animi, eum. Quas cumque odit illum, est repellat, nostrum perspiciatis! Quos consectetur maiores similique placeat possimus, ipsam sed animi, eaque odio dolor id non ut, nulla ullam in temporibus optio et omnis error sunt ducimus quas dolore voluptas minima! Provident enim voluptatem voluptates quasi maxime nihil nobis reprehenderit exercitationem, laudantium, numquam commodi excepturi recusandae? Consequatur doloribus blanditiis molestiae delectus, nam incidunt tempora consectetur unde id sit dolor commodi, qui pariatur repellat, officia dolore, maiores! Quasi quidem quos, minus, sequi pariatur quia ab maxime est dolore labore aspernatur ex nam vero deleniti beatae, unde. Eos, at, debitis porro ipsa quisquam nesciunt vitae minus aut fuga sapiente maxime enim incidunt, natus commodi minima velit quas voluptatum modi aliquid eaque iusto excepturi distinctio, cupiditate temporibus! Temporibus praesentium facilis quam voluptatum, nobis aliquid repellendus. Quis adipisci cum ducimus? Velit dolor maiores tenetur excepturi repellendus accusantium. Fugiat commodi totam velit iusto accusamus placeat voluptas cupiditate minus. Ut explicabo doloremque, repudiandae aliquid magnam facere ex veniam impedit, mollitia, voluptatum quis tempore dolorum adipisci perferendis repellendus qui alias earum at, laborum illum. Ratione laborum, commodi aut, distinctio quos odio. Nesciunt cumque magnam, unde quod officia animi laborum dolorem, cum odit error. Reiciendis sit a odio ab quod ex? Enim ullam ex porro quasi sunt dolor vel atque aliquid ut facilis debitis molestiae unde assumenda fugit voluptates sed, odio velit dolorem sint odit, placeat error? Quod ex fugiat, minima deleniti ratione minus, nihil tempora eaque? Id sequi ex odio architecto.</p>\r\n', '2020-03-16', '5e73100d24ddd.jpg'),
(2, 'Новость 2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum quas repudiandae doloribus reprehenderit quis cupiditate molestias explicabo fugiat corporis. Error tenetur velit minus laborum alias eum praesentium, aut dolor iure, harum quasi omnis ut saepe iste labore optio sed, deleniti voluptates! Reprehenderit, tenetur. Praesentium recusandae sint dolore a distinctio quibusdam. Porro fugit labore minus amet in, culpa optio, rerum. Dicta autem, soluta dolores nulla, velit quo maxime! In, sit cupiditate vitae, aut quis, ea minus alias quasi ducimus eum sunt? Sint quisquam commodi officiis modi temporibus recusandae pariatur quas consequatur voluptatibus, vitae quia iste minima explicabo sunt veritatis dolorum ut fuga saepe, ullam odit maxime similique natus vero facere rerum! Impedit quis voluptatum, expedita iusto. Obcaecati repudiandae inventore quia illo consequuntur explicabo harum eligendi et vero, expedita eius nihil nemo voluptates, veniam accusamus ullam, quam quisquam excepturi iste dolores alias neque. Voluptatibus neque laudantium minima est modi veniam sequi omnis natus voluptatem doloribus autem quis facere fugit magnam impedit possimus, atque dolore velit repellat sapiente, accusantium fugiat? Amet id sed qui saepe iure dolores ex exercitationem explicabo commodi esse ipsa vel consequuntur culpa, modi nulla, perferendis voluptates voluptatum aspernatur. Laudantium, dicta, repellendus. Voluptatem beatae amet atque, fugiat nesciunt. Natus dolorum dolorem amet, voluptatum perferendis ducimus illum ex facilis et autem quidem aliquam ipsum laborum maxime esse laboriosam doloremque repellendus nemo excepturi, dolores quam deserunt adipisci! In deleniti vitae provident iusto, autem magnam. Architecto inventore quo, fuga dolore illo ullam dolores assumenda error laboriosam alias provident eligendi sequi ipsum autem, omnis, dolorum. Ratione quidem corporis inventore rerum magnam pariatur animi, eum. Quas cumque odit illum, est repellat, nostrum perspiciatis! Quos consectetur maiores similique placeat possimus, ipsam sed animi, eaque odio dolor id non ut, nulla ullam in temporibus optio et omnis error sunt ducimus quas dolore voluptas minima! Provident enim voluptatem voluptates quasi maxime nihil nobis reprehenderit exercitationem, laudantium, numquam commodi excepturi recusandae? Consequatur doloribus blanditiis molestiae delectus, nam incidunt tempora consectetur unde id sit dolor commodi, qui pariatur repellat, officia dolore, maiores! Quasi quidem quos, minus, sequi pariatur quia ab maxime est dolore labore aspernatur ex nam vero deleniti beatae, unde. Eos, at, debitis porro ipsa quisquam nesciunt vitae minus aut fuga sapiente maxime enim incidunt, natus commodi minima velit quas voluptatum modi aliquid eaque iusto excepturi distinctio, cupiditate temporibus! Temporibus praesentium facilis quam voluptatum, nobis aliquid repellendus. Quis adipisci cum ducimus? Velit dolor maiores tenetur excepturi repellendus accusantium. Fugiat commodi totam velit iusto accusamus placeat voluptas cupiditate minus. Ut explicabo doloremque, repudiandae aliquid magnam facere ex veniam impedit, mollitia, voluptatum quis tempore dolorum adipisci perferendis repellendus qui alias earum at, laborum illum. Ratione laborum, commodi aut, distinctio quos odio. Nesciunt cumque magnam, unde quod officia animi laborum dolorem, cum odit error. Reiciendis sit a odio ab quod ex? Enim ullam ex porro quasi sunt dolor vel atque aliquid ut facilis debitis molestiae unde assumenda fugit voluptates sed, odio velit dolorem sint odit, placeat error? Quod ex fugiat, minima deleniti ratione minus, nihil tempora eaque? Id sequi ex odio architecto.</p>\r\n', '2020-03-16', '5e731034bee98.jpg'),
(3, 'Новость 3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum quas repudiandae doloribus reprehenderit quis cupiditate molestias explicabo fugiat corporis. Error tenetur velit minus laborum alias eum praesentium, aut dolor iure, harum quasi omnis ut saepe iste labore optio sed, deleniti voluptates! Reprehenderit, tenetur. Praesentium recusandae sint dolore a distinctio quibusdam. Porro fugit labore minus amet in, culpa optio, rerum. Dicta autem, soluta dolores nulla, velit quo maxime! In, sit cupiditate vitae, aut quis, ea minus alias quasi ducimus eum sunt? Sint quisquam commodi officiis modi temporibus recusandae pariatur quas consequatur voluptatibus, vitae quia iste minima explicabo sunt veritatis dolorum ut fuga saepe, ullam odit maxime similique natus vero facere rerum! Impedit quis voluptatum, expedita iusto. Obcaecati repudiandae inventore quia illo consequuntur explicabo harum eligendi et vero, expedita eius nihil nemo voluptates, veniam accusamus ullam, quam quisquam excepturi iste dolores alias neque. Voluptatibus neque laudantium minima est modi veniam sequi omnis natus voluptatem doloribus autem quis facere fugit magnam impedit possimus, atque dolore velit repellat sapiente, accusantium fugiat? Amet id sed qui saepe iure dolores ex exercitationem explicabo commodi esse ipsa vel consequuntur culpa, modi nulla, perferendis voluptates voluptatum aspernatur. Laudantium, dicta, repellendus. Voluptatem beatae amet atque, fugiat nesciunt. Natus dolorum dolorem amet, voluptatum perferendis ducimus illum ex facilis et autem quidem aliquam ipsum laborum maxime esse laboriosam doloremque repellendus nemo excepturi, dolores quam deserunt adipisci! In deleniti vitae provident iusto, autem magnam. Architecto inventore quo, fuga dolore illo ullam dolores assumenda error laboriosam alias provident eligendi sequi ipsum autem, omnis, dolorum. Ratione quidem corporis inventore rerum magnam pariatur animi, eum. Quas cumque odit illum, est repellat, nostrum perspiciatis! Quos consectetur maiores similique placeat possimus, ipsam sed animi, eaque odio dolor id non ut, nulla ullam in temporibus optio et omnis error sunt ducimus quas dolore voluptas minima! Provident enim voluptatem voluptates quasi maxime nihil nobis reprehenderit exercitationem, laudantium, numquam commodi excepturi recusandae? Consequatur doloribus blanditiis molestiae delectus, nam incidunt tempora consectetur unde id sit dolor commodi, qui pariatur repellat, officia dolore, maiores! Quasi quidem quos, minus, sequi pariatur quia ab maxime est dolore labore aspernatur ex nam vero deleniti beatae, unde. Eos, at, debitis porro ipsa quisquam nesciunt vitae minus aut fuga sapiente maxime enim incidunt, natus commodi minima velit quas voluptatum modi aliquid eaque iusto excepturi distinctio, cupiditate temporibus! Temporibus praesentium facilis quam voluptatum, nobis aliquid repellendus. Quis adipisci cum ducimus? Velit dolor maiores tenetur excepturi repellendus accusantium. Fugiat commodi totam velit iusto accusamus placeat voluptas cupiditate minus. Ut explicabo doloremque, repudiandae aliquid magnam facere ex veniam impedit, mollitia, voluptatum quis tempore dolorum adipisci perferendis repellendus qui alias earum at, laborum illum. Ratione laborum, commodi aut, distinctio quos odio. Nesciunt cumque magnam, unde quod officia animi laborum dolorem, cum odit error. Reiciendis sit a odio ab quod ex? Enim ullam ex porro quasi sunt dolor vel atque aliquid ut facilis debitis molestiae unde assumenda fugit voluptates sed, odio velit dolorem sint odit, placeat error? Quod ex fugiat, minima deleniti ratione minus, nihil tempora eaque? Id sequi ex odio architecto.</p>\r\n', '2020-03-16', '5e7310a5556e8.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `timezone`, `bio`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `key` varchar(75) NOT NULL,
  `value` text,
  `type` int(11) NOT NULL,
  `type_settings` text,
  `group_id` int(11) DEFAULT NULL COMMENT 'Settings group',
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `title`, `key`, `value`, `type`, `type_settings`, `group_id`, `position`) VALUES
(1, 'Admin title', 'admin-header', 'Bridge', 1, NULL, NULL, 0),
(2, 'Footer-copyright', 'footer-copyright', '&beta;ridge © 2020 by <a href=\"https://github.com/naffiq\" target=\"_blank\">naffiq</a>', 2, NULL, NULL, 0),
(3, 'Заголовок на главной', 'banner_site_index_title', '<p>Персональный блог</p>\r\n', 2, '', NULL, 0),
(4, 'Текст на главной', 'banner_site_index_text', '<h1>Все самое интересное здесь и сейчас</h1>\r\n', 2, '', NULL, 0),
(5, 'Фон на главной', 'main_image_1', '5e719ee494653.jpg', 3, '', NULL, 0),
(6, 'Заголовок контента на главной', 'main_content_title', '<h1>Наши последние новости</h1>\r\n', 2, '', NULL, 0),
(7, 'Текст о нас', 'about_us_text', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum quas repudiandae doloribus reprehenderit quis cupiditate molestias explicabo fugiat corporis. Error tenetur velit minus laborum alias eum praesentium, aut dolor iure, harum quasi omnis ut saepe iste labore optio sed, deleniti voluptates! Reprehenderit, tenetur. Praesentium recusandae sint dolore a distinctio quibusdam. Porro fugit labore minus amet in, culpa optio, rerum. Dicta autem, soluta dolores nulla, velit quo maxime! In, sit cupiditate vitae, aut quis, ea minus alias quasi ducimus eum sunt? Sint quisquam commodi officiis modi temporibus recusandae pariatur quas consequatur voluptatibus, vitae quia iste minima explicabo sunt veritatis dolorum ut fuga saepe, ullam odit maxime similique natus vero facere rerum! Impedit quis voluptatum, expedita iusto. Obcaecati repudiandae inventore quia illo consequuntur explicabo harum eligendi et vero, expedita eius nihil nemo voluptates, veniam accusamus ullam, quam quisquam excepturi iste dolores alias neque. Voluptatibus neque laudantium minima est modi veniam sequi omnis natus voluptatem doloribus autem quis facere fugit magnam impedit possimus, atque dolore velit repellat sapiente, accusantium fugiat? Amet id sed qui saepe iure dolores ex exercitationem explicabo commodi esse ipsa vel consequuntur culpa, modi nulla, perferendis voluptates voluptatum aspernatur. Laudantium, dicta, repellendus. Voluptatem beatae amet atque, fugiat nesciunt. Natus dolorum dolorem amet, voluptatum perferendis ducimus illum ex facilis et autem quidem aliquam ipsum laborum maxime esse laboriosam doloremque repellendus nemo excepturi, dolores quam deserunt adipisci! In deleniti vitae provident iusto, autem magnam. Architecto inventore quo, fuga dolore illo ullam dolores assumenda error laboriosam alias provident eligendi sequi ipsum autem, omnis, dolorum. Ratione quidem corporis inventore rerum magnam pariatur animi, eum. Quas cumque odit illum, est repellat, nostrum perspiciatis! Quos consectetur maiores similique placeat possimus, ipsam sed animi, eaque odio dolor id non ut, nulla ullam in temporibus optio et omnis error sunt ducimus quas dolore voluptas minima!</p>\r\n\r\n<p>Provident enim voluptatem voluptates quasi maxime nihil nobis reprehenderit exercitationem, laudantium, numquam commodi excepturi recusandae? Consequatur doloribus blanditiis molestiae delectus, nam incidunt tempora consectetur unde id sit dolor commodi, qui pariatur repellat, officia dolore, maiores! Quasi quidem quos, minus, sequi pariatur quia ab maxime est dolore labore aspernatur ex nam vero deleniti beatae, unde. Eos, at, debitis porro ipsa quisquam nesciunt vitae minus aut fuga sapiente maxime enim incidunt, natus commodi minima velit quas voluptatum modi aliquid eaque iusto excepturi distinctio, cupiditate temporibus!</p>\r\n\r\n<p>Temporibus praesentium facilis quam voluptatum, nobis aliquid repellendus. Quis adipisci cum ducimus? Velit dolor maiores tenetur excepturi repellendus accusantium. Fugiat commodi totam velit iusto accusamus placeat voluptas cupiditate minus. Ut explicabo doloremque, repudiandae aliquid magnam facere ex veniam impedit, mollitia, voluptatum quis tempore dolorum adipisci perferendis repellendus qui alias earum at, laborum illum.</p>\r\n\r\n<p>Ratione laborum, commodi aut, distinctio quos odio. Nesciunt cumque magnam, unde quod officia animi laborum dolorem, cum odit error. Reiciendis sit a odio ab quod ex? Enim ullam ex porro quasi sunt dolor vel atque aliquid ut facilis debitis molestiae unde assumenda fugit voluptates sed, odio velit dolorem sint odit, placeat error? Quod ex fugiat, minima deleniti ratione minus, nihil tempora eaque? Id sequi ex odio architecto.</p>\r\n', 2, '', NULL, 0),
(8, 'Заголовок на странице о нас', 'banner_site_about_text', '<h1>Мы любим свою работу</h1>\r\n\r\n', 2, '', NULL, 0),
(9, 'Текст на странице о нас', 'banner_site_about_title', '<p>О нас</p>\r\n\r\n', 2, '', NULL, 0),
(11, 'Заголовок на странице контакты', 'banner_site_contact_text', '<h1>Напишите нам и мы обязательно ответим</h1>\r\n', 2, '', NULL, 0),
(12, 'Заголовок на странице контакты', 'banner_site_contact_title', '<p>Наши контакты</p>', 2, '', NULL, 9),
(13, 'Заголовок на странице новости', 'banner_post_title', '<p>Новости</p>', 2, '', NULL, 15),
(14, 'Текст на странице новости', 'banner_post_text', '<h1>Будь в курсе последних событий</h1>', 2, '', NULL, 0),
(15, 'Тест1', 'banner_site_error_title', '', 2, NULL, NULL, 13),
(16, 'Тест2', 'banner_site_error_text', '', 2, NULL, NULL, 14),
(17, 'Тест3', 'setting3', '', 2, NULL, NULL, 16),
(18, 'Тест4', 'setting4', '', 2, NULL, NULL, 17),
(19, 'Заголовок на странице авторизации', 'banner_site_login_title', '<p>Персональный блог</p>', 2, NULL, NULL, 18),
(20, 'Текст на странице авторизации', 'banner_site_login_text', '<h1>Все самое интересное здесь и сейчас</h1>', 2, NULL, NULL, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `settings_group`
--

CREATE TABLE `settings_group` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT 'Group name',
  `description` text COMMENT 'Group description',
  `icon` varchar(255) DEFAULT NULL COMMENT 'Group icon',
  `position` int(11) DEFAULT NULL COMMENT 'Order',
  `key` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `source_message`
--

CREATE TABLE `source_message` (
  `id` int(11) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `message` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `token`
--

CREATE TABLE `token` (
  `user_id` int(11) DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `confirmed_at` int(11) DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `updated_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `last_login_at` int(11) DEFAULT NULL,
  `last_login_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_key` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_tf_enabled` tinyint(1) DEFAULT '0',
  `password_changed_at` int(11) DEFAULT NULL,
  `gdpr_consent` tinyint(1) DEFAULT '0',
  `gdpr_consent_date` int(11) DEFAULT NULL,
  `gdpr_deleted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `unconfirmed_email`, `registration_ip`, `flags`, `confirmed_at`, `blocked_at`, `updated_at`, `created_at`, `last_login_at`, `last_login_ip`, `auth_tf_key`, `auth_tf_enabled`, `password_changed_at`, `gdpr_consent`, `gdpr_consent_date`, `gdpr_deleted`) VALUES
(1, 'admin', 'katerina.pak94@mail.ru', '$2y$10$Zd3P.qIJ7I5XotirXmshlOMZrB3HRnL68aJ7Zb3tmFQVk/eMAtrVm', 'R9a_uVX1WoOD3FIotnFyENPRzc0Qpfw3', NULL, NULL, 0, 1584429839, NULL, 1584429839, 1584429839, NULL, NULL, '', 0, 1584429839, 0, NULL, 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`),
  ADD KEY `idx-auth_assignment-user_id` (`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-user_id` (`user_id`),
  ADD KEY `idx-post_id` (`post_id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`,`language`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD UNIQUE KEY `unq_settings_key` (`key`),
  ADD KEY `fk_settings_to_settings_group` (`group_id`);

--
-- Индексы таблицы `settings_group`
--
ALTER TABLE `settings_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Индексы таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_social_account_provider_client_id` (`provider`,`client_id`),
  ADD UNIQUE KEY `idx_social_account_code` (`code`),
  ADD KEY `fk_social_account_user` (`user_id`);

--
-- Индексы таблицы `source_message`
--
ALTER TABLE `source_message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `idx_token_user_id_code_type` (`user_id`,`code`,`type`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_user_username` (`username`),
  ADD UNIQUE KEY `idx_user_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `settings_group`
--
ALTER TABLE `settings_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `source_message`
--
ALTER TABLE `source_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk-comment-post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-comment-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_source_message_message` FOREIGN KEY (`id`) REFERENCES `source_message` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `fk_settings_to_settings_group` FOREIGN KEY (`group_id`) REFERENCES `settings_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `social_account`
--
ALTER TABLE `social_account`
  ADD CONSTRAINT `fk_social_account_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_token_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
