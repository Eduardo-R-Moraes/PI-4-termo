CREATE DATABASE levelup;

USE levelup;

CREATE TABLE IF NOT EXISTS `chaves` (
	`cha_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`cha_chave` varchar(255) NOT NULL,
	PRIMARY KEY (`cha_id`)
);

CREATE TABLE IF NOT EXISTS `jogos` (
	`jog_id` int AUTO_INCREMENT NOT NULL,
	`jog_titulo` varchar(255) NOT NULL,
	`jog_descricao` varchar(255) NOT NULL,
	`jog_genero` varchar(255) NOT NULL,
	`jog_plataforma` varchar(255) NOT NULL,
	`jog_classificacao` varchar(3) NOT NULL,
	`jog_preco` int NOT NULL,
	PRIMARY KEY (`jog_id`)
);

CREATE TABLE IF NOT EXISTS `usuarios` (
	`usu_id` int AUTO_INCREMENT NOT NULL,
	`usu_nome` varchar(255) NOT NULL,
	`usu_email` varchar(255) NOT NULL,
	`usu_senha` varchar(255) NOT NULL,
	`usu_adm` bit(1) NOT NULL,
	PRIMARY KEY (`usu_id`)
);

CREATE TABLE IF NOT EXISTS `pedidos` (
	`ped_id` int AUTO_INCREMENT NOT NULL,
	`ped_data` datetime NOT NULL,
	`ped_preco` int NOT NULL,
	`ped_pago` bit(1) NOT NULL,
	`usu_id` int NOT NULL,
	PRIMARY KEY (`ped_id`)
);

CREATE TABLE IF NOT EXISTS `comentario` (
	`com_id` int AUTO_INCREMENT NOT NULL,
	`jog_id` int NOT NULL,
	`usu_id` int NOT NULL,
	`com_comentario` varchar(255) NOT NULL,
	`com_data` datetime NOT NULL,
	PRIMARY KEY (`com_id`)
);

CREATE TABLE IF NOT EXISTS `pedido_chaves` (
	`cha_id` int NOT NULL,
	`ped_id` int NOT NULL,
	PRIMARY KEY (`cha_id`)
);

ALTER TABLE `chaves` ADD CONSTRAINT `chaves_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);

ALTER TABLE `pedidos` ADD CONSTRAINT `pedidos_fk4` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk1` FOREIGN KEY (`jog_id`) REFERENCES `jogos`(`jog_id`);

ALTER TABLE `comentario` ADD CONSTRAINT `comentario_fk2` FOREIGN KEY (`usu_id`) REFERENCES `usuarios`(`usu_id`);
ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk0` FOREIGN KEY (`cha_id`) REFERENCES `chaves`(`cha_id`);

ALTER TABLE `pedido_chaves` ADD CONSTRAINT `pedido_chaves_fk1` FOREIGN KEY (`ped_id`) REFERENCES `pedidos`(`ped_id`);
