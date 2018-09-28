-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 29 2018 г., 18:19
-- Версия сервера: 10.1.31-MariaDB
-- Версия PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id5441110_db`
--
CREATE DATABASE IF NOT EXISTS `id5441110_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `id5441110_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `cab`
--

DROP TABLE IF EXISTS `cab`;
CREATE TABLE `cab` (
  `id_cab` int(11) NOT NULL,
  `cab_head` int(11) DEFAULT NULL,
  `num_cab` varchar(5) DEFAULT NULL,
  `hous` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `cab`
--

INSERT INTO `cab` (`id_cab`, `cab_head`, `num_cab`, `hous`) VALUES
(1, NULL, '201-1', 1),
(2, NULL, '202-1', 1),
(3, NULL, '203-1', 1),
(4, NULL, '204-1', 1),
(5, NULL, '205-1', 1),
(6, NULL, '206-1', 1),
(7, NULL, '201-2', 2),
(8, NULL, '202-2', 2),
(9, NULL, '203-2', 2),
(10, NULL, '204-2', 2),
(11, NULL, '205-2', 2),
(12, NULL, '206-2', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ch`
--

DROP TABLE IF EXISTS `ch`;
CREATE TABLE `ch` (
  `id` int(11) NOT NULL,
  `id_name_ch` int(11) DEFAULT NULL,
  `id_matworth` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `ch`
--

INSERT INTO `ch` (`id`, `id_name_ch`, `id_matworth`, `value`) VALUES
(21, 1, 51, 19),
(22, 2, 51, NULL),
(23, 3, 51, NULL),
(24, 1, 52, 77546),
(25, 2, 52, NULL),
(26, 3, 52, NULL),
(27, 1, 53, 4654),
(28, 2, 53, NULL),
(29, 3, 53, NULL),
(30, 1, 54, 19),
(31, 2, 54, NULL),
(32, 3, 54, NULL),
(33, 1, 55, 19),
(34, 2, 55, 800),
(35, 3, 55, 6000),
(36, 1, 56, 19),
(37, 2, 56, 800),
(38, 3, 56, 6000),
(39, 1, 57, 19),
(40, 2, 57, 800),
(41, 3, 57, 6000),
(42, 1, 58, 19),
(43, 2, 58, 800),
(44, 3, 58, 9000),
(45, 1, 59, 25),
(46, 2, 59, 1200),
(47, 3, 59, 6000),
(48, 1, 60, 23),
(49, 2, 60, 400),
(50, 3, 60, 7000),
(51, 1, 61, 20),
(52, 2, 61, 800),
(53, 3, 61, 2000),
(54, 1, 62, 19),
(55, 2, 62, 800),
(56, 3, 62, 12000),
(57, 1, 63, 0),
(58, 1, 64, 0),
(59, 1, 65, 16),
(60, 2, 65, 900),
(61, 3, 65, 6000);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ch_full`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `ch_full`;
CREATE TABLE `ch_full` (
`id` int(11)
,`id_matworth` int(11)
,`name_ch` varchar(50)
,`value` int(11)
,`id_type` int(11)
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `main_view`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `main_view`;
CREATE TABLE `main_view` (
`id_matworth` int(10)
,`inventory_num` int(6)
,`price` int(11)
,`num_cab` varchar(5)
,`name_provider` varchar(15)
,`user_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура таблицы `material_worth`
--

DROP TABLE IF EXISTS `material_worth`;
CREATE TABLE `material_worth` (
  `id_matworth` int(10) NOT NULL,
  `inventory_num` int(6) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `id_type` int(10) DEFAULT NULL,
  `id_provider` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_cab` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `material_worth`
--

INSERT INTO `material_worth` (`id_matworth`, `inventory_num`, `price`, `id_type`, `id_provider`, `id_user`, `id_cab`) VALUES
(51, 2147483647, 2500, 1, 2, NULL, 6),
(52, 445556, 4600, 2, NULL, NULL, 3),
(53, 33445566, 2200, 1, 1, NULL, 11),
(54, 12345678, 3600, 1, 2, NULL, 12),
(55, 12345678, 3600, 1, 2, NULL, 10),
(56, 12345678, 3600, 1, 2, NULL, 10),
(57, 12345678, 3700, 1, 2, NULL, 10),
(58, 2147483647, 8000, 1, 1, 1, 8),
(59, 564353534, 10500, 1, 3, 5, 12),
(60, 2147483647, 3400, 1, 1, NULL, 3),
(61, 2147483647, 1200, 1, 1, 1, 4),
(62, 678687298, 2300, 1, 1, 1, 10),
(63, 0, 0, NULL, NULL, NULL, NULL),
(64, 32233223, 0, 1, NULL, NULL, NULL),
(65, 456456464, 2200, 1, 1, 5, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `name_ch`
--

DROP TABLE IF EXISTS `name_ch`;
CREATE TABLE `name_ch` (
  `id` int(11) NOT NULL,
  `name_ch` varchar(50) NOT NULL,
  `id_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `name_ch`
--

INSERT INTO `name_ch` (`id`, `name_ch`, `id_type`) VALUES
(1, 'Диагональ монитора', 1),
(2, 'Частота процессора', 1),
(3, 'Обьем оперативной памяти', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `provider`
--

DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `id_provider` int(11) NOT NULL,
  `name_provider` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `provider`
--

INSERT INTO `provider` (`id_provider`, `name_provider`) VALUES
(1, 'БанкАваль'),
(2, 'ПриватБанк'),
(3, 'Райфайзенбанк');

-- --------------------------------------------------------

--
-- Структура таблицы `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id_type` int(15) NOT NULL,
  `name_type` varchar(15) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251 COLLATE=cp1251_ukrainian_ci;

--
-- Дамп данных таблицы `type`
--

INSERT INTO `type` (`id_type`, `name_type`) VALUES
(1, 'Комп\'ютер'),
(2, 'Стілець офісний'),
(3, 'Парта');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL DEFAULT '',
  `roles` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `time_created` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `username` varchar(100) DEFAULT NULL,
  `isEnabled` tinyint(1) NOT NULL DEFAULT '1',
  `confirmationToken` varchar(100) DEFAULT NULL,
  `timePasswordResetRequested` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `salt`, `roles`, `name`, `time_created`, `username`, `isEnabled`, `confirmationToken`, `timePasswordResetRequested`) VALUES
(1, 'bogdangaybura@gmail.com', '9FDYEmw2f+Z2lTRvU+7icXdDY1DxAcGW6abWeTJWGOcYSwhFybTWReEQaps4ToAsND8Pyo2cjlCyQPM5uyQ8Xg==', '72iqurm0ia04gwo8s484k00gw0wcww8', 'ROLE_USER', 'Гайбура Богдан Олександрович', 1525959199, NULL, 1, NULL, NULL),
(4, 'test@example.com', 'fg5mfj4zBp5II0i9fsgiChV3o4zEyle+AauGiTtTLIxcyYj8RcSKDiOOigUAaTlYmfaXHOrUvuU/ba9YXIAlyg==', 'eip2rhin4goc8ccgk4s8cwcg0kcog08', 'ROLE_ADMIN', 'Иванов Админ Админович', 1526399504, NULL, 1, NULL, NULL),
(5, 'philips@example.com', 'leHv+kmozi3OXHzdW8RAv2fPb2cBxuMtnCNgKYZc7hZRU16Ai1NxTybLzW6pG64oNuqHHmjUGOFM1S+d6AKwUg==', '9g3h8yvs7280gcc8ogwo00s84sgs040', 'ROLE_USER', 'Пилипчук Сергій Григорович', 1530273438, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `user_custom_fields`
--

DROP TABLE IF EXISTS `user_custom_fields`;
CREATE TABLE `user_custom_fields` (
  `user_id` int(11) UNSIGNED NOT NULL,
  `attribute` varchar(50) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура для представления `ch_full`
--
DROP TABLE IF EXISTS `ch_full`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ch_full`  AS  select `ch`.`id` AS `id`,`ch`.`id_matworth` AS `id_matworth`,`name_ch`.`name_ch` AS `name_ch`,`ch`.`value` AS `value`,`name_ch`.`id_type` AS `id_type` from (`ch` join `name_ch` on((`ch`.`id_name_ch` = `name_ch`.`id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `main_view`
--
DROP TABLE IF EXISTS `main_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `main_view`  AS  select `mw`.`id_matworth` AS `id_matworth`,`mw`.`inventory_num` AS `inventory_num`,`mw`.`price` AS `price`,`cb`.`num_cab` AS `num_cab`,`pr`.`name_provider` AS `name_provider`,`users`.`name` AS `user_name` from (((`material_worth` `mw` join `cab` `cb` on((`mw`.`id_cab` = `cb`.`id_cab`))) join `provider` `pr` on((`mw`.`id_provider` = `pr`.`id_provider`))) join `users` on((`mw`.`id_user` = `users`.`id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cab`
--
ALTER TABLE `cab`
  ADD PRIMARY KEY (`id_cab`);

--
-- Индексы таблицы `ch`
--
ALTER TABLE `ch`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `material_worth`
--
ALTER TABLE `material_worth`
  ADD PRIMARY KEY (`id_matworth`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_provider` (`id_provider`),
  ADD KEY `id_cab` (`id_cab`);

--
-- Индексы таблицы `name_ch`
--
ALTER TABLE `name_ch`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`id_provider`);

--
-- Индексы таблицы `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `user_custom_fields`
--
ALTER TABLE `user_custom_fields`
  ADD PRIMARY KEY (`user_id`,`attribute`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cab`
--
ALTER TABLE `cab`
  MODIFY `id_cab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `ch`
--
ALTER TABLE `ch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `material_worth`
--
ALTER TABLE `material_worth`
  MODIFY `id_matworth` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `name_ch`
--
ALTER TABLE `name_ch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `provider`
--
ALTER TABLE `provider`
  MODIFY `id_provider` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
