-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 06 2018 г., 21:16
-- Версия сервера: 10.1.35-MariaDB
-- Версия PHP: 7.2.9

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
  `id_item` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `ch`
--

INSERT INTO `ch` (`id`, `id_name_ch`, `id_item`, `value`) VALUES
(68, 1, 68, 19),
(69, 2, 68, 900),
(70, 3, 68, 6000),
(82, 1, 74, 2147483647),
(93, 1, 85, 5),
(124, 1, 116, 22333),
(125, 1, 118, 112333),
(126, 2, 118, 12333311),
(127, 3, 118, 56543),
(131, 1, 122, 234234),
(132, 2, 122, 2147483647),
(133, 3, 122, 123456),
(136, 2, 126, 2223),
(137, 1, 126, 343434334),
(138, 3, 126, 43422),
(139, 2, 127, 2223),
(140, 1, 127, 343434334),
(141, 3, 127, 43422),
(142, 1, 128, 54),
(143, 2, 128, 4545),
(144, 3, 128, 12346),
(145, 1, 129, 12),
(146, 2, 129, 18000),
(147, 3, 129, 3332),
(148, 1, 130, 12),
(149, 2, 130, 18000),
(150, 3, 130, 3332),
(157, 1, 154, 322332),
(158, 1, 154, 322332),
(169, 1, 169, 1),
(170, 2, 169, 2),
(171, 3, 169, 3),
(172, 1, 171, 3),
(173, 2, 171, 44),
(174, 3, 171, 5556),
(175, 1, 172, 235250),
(176, 2, 172, 235520),
(177, 3, 172, 2147483647),
(179, 3, 174, 0),
(184, 1, 178, 232323),
(185, 2, 178, 2147483647),
(186, 3, 178, 23),
(187, 1, 179, 1),
(188, 2, 179, 2),
(189, 3, 179, 3),
(190, 1, 180, 4334301),
(191, 2, 180, 1),
(192, 3, 180, 11),
(193, 1, 181, 1),
(194, 2, 181, 2),
(195, 3, 181, 3),
(196, 1, 203, 123),
(197, 2, 203, 321),
(198, 3, 203, 111),
(199, 1, 204, 1),
(200, 2, 204, 2),
(201, 3, 204, 3);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `ch_full`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `ch_full`;
CREATE TABLE `ch_full` (
`id` int(11)
,`id_item` int(11)
,`name_ch` varchar(50)
,`value` int(11)
,`id_type` int(11)
);

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id_item` int(10) NOT NULL,
  `inv_num` int(6) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `id_type` int(10) DEFAULT NULL,
  `id_provider` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_cab` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id_item`, `inv_num`, `price`, `id_type`, `id_provider`, `id_user`, `id_cab`) VALUES
(68, 2147483647, 2200, 1, 1, 0, 6),
(72, 111111111, 0, NULL, NULL, NULL, NULL),
(73, 11111111, 0, NULL, NULL, NULL, NULL),
(74, 111111111, 111111111, NULL, NULL, NULL, NULL),
(85, 565656565, 555, NULL, NULL, NULL, NULL),
(116, 2147483647, 343434, 1, 1, 5, 2),
(118, 2147483647, 1200, 1, 1, 5, 8),
(119, 123, 1200, NULL, NULL, NULL, NULL),
(120, 1234, 1200, NULL, NULL, NULL, NULL),
(121, 123, 343434, NULL, NULL, NULL, NULL),
(122, 345345333, 334444, 1, 1, 5, 2),
(123, 123, 334444, NULL, NULL, NULL, NULL),
(124, 345345333, 334444, 1, NULL, NULL, NULL),
(125, 12345, 23000, 1, 1, 1, 2),
(126, 12345, 23000, 1, 1, 1, 2),
(127, 12345, 23000, 1, 1, 1, 2),
(128, 1234567, 23059, 1, 2, 4, 10),
(129, 2323421, 12000, 1, 1, 4, 6),
(130, 2323421, 12000, 1, 1, 4, 6),
(133, 0, 0, NULL, NULL, NULL, NULL),
(134, 0, 0, NULL, NULL, NULL, NULL),
(135, 123456, 2300, 1, 1, 1, 1),
(136, 123456, 2147483647, 1, 1, 1, 1),
(137, 123456, 2147483647, 1, 1, 1, 1),
(138, 3334, 443, 1, 1, 1, 1),
(139, 123456, 2147483647, 1, 1, 1, 1),
(140, 123456, 2147483647, 1, 1, 1, 1),
(141, 3334, 443, 1, 1, 1, 1),
(142, 0, 0, NULL, NULL, NULL, NULL),
(143, 23423, 234234, 1, 1, 1, 1),
(144, 23423, 234234, 1, 1, 1, 1),
(145, 23423, 234234, 1, 1, 1, 1),
(146, 23423, 234234, 1, 1, 1, 1),
(147, 0, 233232, 1, 1, 1, 1),
(148, 0, 233232, 1, 1, 1, 1),
(149, 0, 233232, 1, 1, 1, 1),
(150, 0, 233232, 1, 1, 1, 1),
(154, 353343, 3322332, 1, 1, 1, 1),
(155, 344232, 3244444, 1, 1, 1, 1),
(156, 344232, 3244444, 1, 1, 1, 1),
(157, 344232, 3244444, 1, 1, 1, 1),
(158, 344232, 3244444, 1, 1, 1, 1),
(159, 344232, 3244444, 1, 1, 1, 1),
(169, 123456, 123334450, 1, 1, 1, 1),
(170, 3345, 333334, 1, 1, 1, 1),
(171, 3345, 333334, 1, 1, 1, 1),
(172, 232353250, 2147483647, 1, 1, 1, 1),
(173, 0, 0, 1, 1, 1, 1),
(174, 0, 0, 1, 1, 1, 1),
(178, 222121, 322323, 2, 1, 4, 5),
(179, 433434, 34433434, 1, 1, 1, 1),
(180, 434553, 34343443, 3, 1, 1, 1),
(181, 101, 1, 3, 1, 4, 12),
(182, NULL, NULL, 1, NULL, NULL, NULL),
(183, NULL, NULL, 1, NULL, NULL, NULL),
(184, NULL, NULL, 2, NULL, NULL, NULL),
(185, NULL, NULL, 2, NULL, NULL, NULL),
(186, NULL, NULL, 1, NULL, NULL, NULL),
(187, NULL, NULL, 1, NULL, NULL, NULL),
(188, NULL, NULL, 1, NULL, NULL, NULL),
(189, NULL, NULL, 1, NULL, NULL, NULL),
(190, NULL, NULL, 1, NULL, NULL, NULL),
(191, NULL, NULL, 2, NULL, NULL, NULL),
(192, NULL, NULL, 3, NULL, NULL, NULL),
(193, NULL, NULL, 1, NULL, NULL, NULL),
(194, NULL, NULL, 1, NULL, NULL, NULL),
(195, NULL, NULL, 1, NULL, NULL, NULL),
(196, NULL, NULL, 1, NULL, NULL, NULL),
(197, NULL, NULL, 1, NULL, NULL, NULL),
(198, NULL, NULL, 2, NULL, NULL, NULL),
(199, NULL, NULL, 3, NULL, NULL, NULL),
(200, NULL, NULL, 2, NULL, NULL, NULL),
(201, NULL, NULL, 1, NULL, NULL, NULL),
(202, NULL, NULL, 1, NULL, NULL, NULL),
(203, 2322201, 101010, 1, 3, 5, 5),
(204, 123401, 7000, 1, 1, 1, 1),
(207, 0, 0, NULL, NULL, NULL, NULL),
(208, 0, 0, NULL, NULL, NULL, NULL),
(209, 0, 0, NULL, NULL, NULL, NULL),
(210, 0, 0, NULL, NULL, NULL, NULL),
(211, 0, 0, NULL, NULL, NULL, NULL),
(212, 0, 0, NULL, NULL, NULL, NULL),
(213, 223232, 3232, NULL, NULL, NULL, NULL),
(214, 323232, 2222222, NULL, NULL, NULL, NULL),
(215, 232332, 32323232, NULL, NULL, NULL, NULL),
(216, 223232, 32323232, 1, 1, 5, 2),
(217, 223232, 32323232, 1, 1, 5, 2),
(218, 223232, 32323232, 1, 1, 5, 2),
(219, 223232, 322332, 1, 2, 1, 1),
(220, 223232, 232232323, 1, 2, 5, 2),
(221, 433432, 23432, NULL, NULL, NULL, NULL),
(222, 434334, 2147483647, NULL, NULL, NULL, NULL),
(223, 222222, 222222, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `main_view`
-- (См. Ниже фактическое представление)
--
DROP VIEW IF EXISTS `main_view`;
CREATE TABLE `main_view` (
`id_item` int(10)
,`inv_num` int(6)
,`price` int(11)
,`num_cab` varchar(5)
,`name_provider` varchar(15)
,`user_name` varchar(100)
);

-- --------------------------------------------------------

--
-- Структура таблицы `name_ch`
--

DROP TABLE IF EXISTS `name_ch`;
CREATE TABLE `name_ch` (
  `id_name_ch` int(11) NOT NULL,
  `name_ch` varchar(50) NOT NULL,
  `id_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `name_ch`
--

INSERT INTO `name_ch` (`id_name_ch`, `name_ch`, `id_type`) VALUES
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
  `id` int(11) NOT NULL,
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
(4, 'test@example.com', 'fg5mfj4zBp5II0i9fsgiChV3o4zEyle+AauGiTtTLIxcyYj8RcSKDiOOigUAaTlYmfaXHOrUvuU/ba9YXIAlyg==', 'eip2rhin4goc8ccgk4s8cwcg0kcog08', 'ROLE_USER', 'Иванов Админ Админович', 1526399504, NULL, 1, NULL, NULL),
(5, 'philips@example.com', 'leHv+kmozi3OXHzdW8RAv2fPb2cBxuMtnCNgKYZc7hZRU16Ai1NxTybLzW6pG64oNuqHHmjUGOFM1S+d6AKwUg==', '9g3h8yvs7280gcc8ogwo00s84sgs040', 'ROLE_USER', 'Пилипчук Сергій Григорович', 1530273438, NULL, 1, NULL, NULL),
(6, 'bogdan@gmail.com', 'vtcWSHaa8UJ6x2YfvS7KFZTj2qGSdnDXuhNra4KNko2iDW7vONyH/ezAuapOXXt684Y6CPpINSsYDWmnrtZ98w==', 'tkychjuak2s0k0ssskwg88ksokcgcow', 'ROLE_ADMIN', 'Admin', 1538209787, NULL, 1, NULL, NULL);

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ch_full`  AS  select `ch`.`id_name_ch` AS `id`,`ch`.`id_item` AS `id_item`,`name_ch`.`name_ch` AS `name_ch`,`ch`.`value` AS `value`,`name_ch`.`id_type` AS `id_type` from (`ch` join `name_ch` on((`ch`.`id_name_ch` = `name_ch`.`id_name_ch`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `main_view`
--
DROP TABLE IF EXISTS `main_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `main_view`  AS  select `item`.`id_item` AS `id_item`,`item`.`inv_num` AS `inv_num`,`item`.`price` AS `price`,`cb`.`num_cab` AS `num_cab`,`pr`.`name_provider` AS `name_provider`,`users`.`name` AS `user_name` from (((`item` join `cab` `cb` on((`item`.`id_cab` = `cb`.`id_cab`))) join `provider` `pr` on((`item`.`id_provider` = `pr`.`id_provider`))) join `users` on((`item`.`id_user` = `users`.`id`))) ;

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_name_ch` (`id_name_ch`),
  ADD KEY `id_item` (`id_item`);

--
-- Индексы таблицы `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `id_provider` (`id_provider`),
  ADD KEY `id_cab` (`id_cab`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `name_ch`
--
ALTER TABLE `name_ch`
  ADD PRIMARY KEY (`id_name_ch`),
  ADD KEY `id_type` (`id_type`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT для таблицы `item`
--
ALTER TABLE `item`
  MODIFY `id_item` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT для таблицы `name_ch`
--
ALTER TABLE `name_ch`
  MODIFY `id_name_ch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ch`
--
ALTER TABLE `ch`
  ADD CONSTRAINT `ch_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id_item`),
  ADD CONSTRAINT `ch_ibfk_2` FOREIGN KEY (`id_name_ch`) REFERENCES `name_ch` (`id_name_ch`);

--
-- Ограничения внешнего ключа таблицы `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_provider`) REFERENCES `provider` (`id_provider`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`id_cab`) REFERENCES `cab` (`id_cab`);

--
-- Ограничения внешнего ключа таблицы `name_ch`
--
ALTER TABLE `name_ch`
  ADD CONSTRAINT `name_ch_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
