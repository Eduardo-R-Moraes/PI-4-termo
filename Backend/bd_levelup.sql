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

INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Forza Horizon 5", "jogo de corrida de mundo aberto", "corrida", "pc e xbox", "12", 149.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Forza Horizon 4", "jogo de corrida de mundo aberto", "corrida", "pc e xbox", "10", 99.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Horizon Zero Down", "jogo de aventura de mundo aberto", "aventura", "pc, PS4 e PS5", "16", 129.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("The Last Of Us", "jogo de sobrevivencia de mundo aberto", "aventura", "pc, PS4 e PS5", "16", 119.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("Mario Kart 8", "jogo de corrida", "corrida", "Nintendo Switch", "L", 249.90);
INSERT INTO jogos (jog_titulo, jog_descricao, jog_genero, jog_plataforma, jog_classificacao, jog_preco) VALUES ("The Legend Of Zelda", "jogo de aventura de mundo aberto", "aventura", "Nintendo Switch", "L", 249.90);