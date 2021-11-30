-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Nov-2021 às 05:49
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `petvoce2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agenda`
--

CREATE TABLE `agenda` (
  `ag_id` bigint(20) NOT NULL,
  `cli_id` bigint(20) NOT NULL,
  `ps_id` bigint(20) NOT NULL,
  `ps_observacao` text COLLATE utf32_unicode_ci NOT NULL,
  `ag_dt_agendamento` datetime NOT NULL,
  `pet_id` int(11) NOT NULL,
  `ag_situacao` enum('0','1') COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `ava_id` bigint(20) NOT NULL,
  `cli_id` bigint(20) NOT NULL,
  `ava_qtd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `cat_id` int(11) NOT NULL,
  `cat_nome` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`cat_id`, `cat_nome`) VALUES
(1, 'Antipulgas'),
(2, 'Ração'),
(3, 'Medicamentos');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` bigint(20) NOT NULL,
  `cli_nome` varchar(60) NOT NULL,
  `cli_email` varchar(80) NOT NULL,
  `cli_endereco` varchar(255) DEFAULT NULL,
  `cli_usuario` varchar(80) NOT NULL,
  `cli_senha` varchar(100) NOT NULL,
  `cli_celular` varchar(20) DEFAULT NULL,
  `cli_situacao` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_nome`, `cli_email`, `cli_endereco`, `cli_usuario`, `cli_senha`, `cli_celular`, `cli_situacao`) VALUES
(1, 'Raicley Santana da Silva', 'raicleysantana1@gmail.com', 'Rua padre ramin, Zumbi dos palmares 2', 'raicley.santana', '123', '(92) 994212871', '1'),
(14, 'Teste', 'teste@gmail.com', 'Krkekek', 'teste', '123', '92994212871', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `destaques`
--

CREATE TABLE `destaques` (
  `des_id` int(11) NOT NULL,
  `ps_id` bigint(11) NOT NULL,
  `des_banner` varchar(250) DEFAULT NULL,
  `des_situacao` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `fp_id` int(11) NOT NULL,
  `fp_descricao` int(11) NOT NULL,
  `fp_situacao` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`fp_id`, `fp_descricao`, `fp_situacao`) VALUES
(1, 0, '1'),
(2, 0, '1'),
(3, 0, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pet`
--

CREATE TABLE `pet` (
  `pet_id` int(11) NOT NULL,
  `pet_nome` varchar(60) NOT NULL,
  `pet_observacao` varchar(300) DEFAULT NULL,
  `cli_id` bigint(11) NOT NULL COMMENT 'Proprietário',
  `tp_id` int(11) NOT NULL,
  `pet_raca` varchar(60) DEFAULT NULL,
  `pet_foto` varchar(200) DEFAULT NULL,
  `pet_situacao` enum('0','1') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_servicos`
--

CREATE TABLE `produtos_servicos` (
  `ps_id` bigint(20) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `ps_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ps_tipo` enum('produto','servico') COLLATE utf8_unicode_ci NOT NULL,
  `ps_descricao` text COLLATE utf8_unicode_ci,
  `ps_foto` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ps_valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ps_situacao` enum('0','1') COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtos_servicos`
--

INSERT INTO `produtos_servicos` (`ps_id`, `cat_id`, `ps_nome`, `ps_tipo`, `ps_descricao`, `ps_foto`, `ps_valor`, `ps_situacao`) VALUES
(1, 1, 'Antipulgas e Carrapatos Bravecto MSD para Cães de 4,5 a 10 k', 'produto', '- Indicado para cães;\r\n- Acaba com a infestação de carrapatos e pulgas;\r\n- Rápida ação;\r\n- Efeito prolongado por 12 semanas;\r\n- Comprimidos mastigáveis,\r\n- Disponível em embalagem com 1 comprimido de 250 mg.', 'https://staticpetz.stoom.com.br/fotos/1575296646776.jpg', '192.61', '1'),
(2, 1, 'Ração Golden Power Training para Cães Adultos Sabor Frango e Arroz - 15kg', 'produto', '- Indicada para cães adultos;\r\n- Ideal para os pets que participam de competições ou que praticam atividades físicas intensas;\r\n- Contém Condroitina e Glicosamina que auxiliam na manutenção das articulações;\r\n- Proporciona maior disposição e rápido restabelecimento físico após exercícios,\r\n- Disponível em embalagens de 15 kg.', 'https://staticpetz.stoom.com.br/fotos/1614090862519_mini.jpg', '153.99', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_pet`
--

CREATE TABLE `tipo_pet` (
  `tp_id` int(11) NOT NULL,
  `tp_nome` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` bigint(20) NOT NULL,
  `usu_nome` varchar(60) NOT NULL,
  `usu_email` varchar(60) NOT NULL,
  `usu_usuario` varchar(60) NOT NULL,
  `usu_senha` varchar(100) NOT NULL,
  `usu_nivel_acesso` enum('administrator','manager','user') DEFAULT NULL,
  `usu_situacao` enum('0','1') DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nome`, `usu_email`, `usu_usuario`, `usu_senha`, `usu_nivel_acesso`, `usu_situacao`) VALUES
(1, 'webmaster', 'webmaster@gmail.com', 'webmaster', 'webmaster', 'administrator', '1'),
(2, 'Teste', '', 'Teste', '123', 'user', '1'),
(3, 'Teste', '', 'Teste', '123', 'administrator', '1'),
(4, 'Kdskh', '', 'Jddjh', 'W16', 'manager', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `ven_id` bigint(20) NOT NULL,
  `ven_data_criacao` datetime DEFAULT CURRENT_TIMESTAMP,
  `cli_id` bigint(20) NOT NULL,
  `ven_data_venda` datetime DEFAULT NULL,
  `ven_forma_pagamento` int(11) DEFAULT NULL,
  `ven_taxa_entrega` decimal(20,2) DEFAULT NULL,
  `ven_total` decimal(20,2) DEFAULT NULL,
  `ven_situacao` enum('PAGO','PENDENTE','CANCELADO','AGUARDANDO') CHARACTER SET latin1 NOT NULL DEFAULT 'AGUARDANDO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`ven_id`, `ven_data_criacao`, `cli_id`, `ven_data_venda`, `ven_forma_pagamento`, `ven_taxa_entrega`, `ven_total`, `ven_situacao`) VALUES
(15, '2021-11-25 00:46:12', 1, NULL, NULL, NULL, NULL, 'AGUARDANDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas_produtos`
--

CREATE TABLE `vendas_produtos` (
  `vp_id` bigint(20) NOT NULL,
  `vp_chave` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `cli_id` bigint(20) NOT NULL,
  `ven_id` bigint(20) NOT NULL,
  `ps_id` bigint(20) NOT NULL,
  `vp_valor_unitario` decimal(20,2) NOT NULL,
  `vp_quantidade` int(11) NOT NULL,
  `vp_observacao` text COLLATE utf8_unicode_ci,
  `vp_data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `vendas_produtos`
--

INSERT INTO `vendas_produtos` (`vp_id`, `vp_chave`, `cli_id`, `ven_id`, `ps_id`, `vp_valor_unitario`, `vp_quantidade`, `vp_observacao`, `vp_data_criacao`) VALUES
(1, '1152', 1, 15, 2, '153.99', 1, NULL, '2021-11-27 02:32:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`ag_id`),
  ADD KEY `FK_AGENDA_CLIENTES` (`cli_id`),
  ADD KEY `FK_AGENDA_PET` (`pet_id`),
  ADD KEY `FK_AGENDA_PRODUTOS_SERVICOS` (`ps_id`);

--
-- Indexes for table `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`ava_id`),
  ADD KEY `FK_AVALIACAO_CLIENTES` (`cli_id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indexes for table `destaques`
--
ALTER TABLE `destaques`
  ADD PRIMARY KEY (`des_id`),
  ADD KEY `FK_DESTAQUES_PRODUTOS_SERVICOS` (`ps_id`);

--
-- Indexes for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`fp_id`);

--
-- Indexes for table `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `FK_PET_CLIENTES` (`cli_id`),
  ADD KEY `FK_PET_TIPO_PET` (`tp_id`);

--
-- Indexes for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  ADD PRIMARY KEY (`ps_id`),
  ADD KEY `FK_PRODUTOS_SERVICOS_CATEGORIAS` (`cat_id`);

--
-- Indexes for table `tipo_pet`
--
ALTER TABLE `tipo_pet`
  ADD PRIMARY KEY (`tp_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`ven_id`);

--
-- Indexes for table `vendas_produtos`
--
ALTER TABLE `vendas_produtos`
  ADD PRIMARY KEY (`vp_id`),
  ADD UNIQUE KEY `vp_chave` (`vp_chave`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agenda`
--
ALTER TABLE `agenda`
  MODIFY `ag_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `ava_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `destaques`
--
ALTER TABLE `destaques`
  MODIFY `des_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `fp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pet`
--
ALTER TABLE `pet`
  MODIFY `pet_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  MODIFY `ps_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipo_pet`
--
ALTER TABLE `tipo_pet`
  MODIFY `tp_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `ven_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `vendas_produtos`
--
ALTER TABLE `vendas_produtos`
  MODIFY `vp_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `agenda`
--
ALTER TABLE `agenda`
  ADD CONSTRAINT `FK_AGENDA_CLIENTES` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AGENDA_PET` FOREIGN KEY (`pet_id`) REFERENCES `pet` (`pet_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_AGENDA_PRODUTOS_SERVICOS` FOREIGN KEY (`ps_id`) REFERENCES `produtos_servicos` (`ps_id`);

--
-- Limitadores para a tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `FK_AVALIACAO_CLIENTES` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `destaques`
--
ALTER TABLE `destaques`
  ADD CONSTRAINT `FK_DESTAQUES_PRODUTOS_SERVICOS` FOREIGN KEY (`ps_id`) REFERENCES `produtos_servicos` (`ps_id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pet`
--
ALTER TABLE `pet`
  ADD CONSTRAINT `FK_PET_CLIENTES` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_PET_TIPO_PET` FOREIGN KEY (`tp_id`) REFERENCES `tipo_pet` (`tp_id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  ADD CONSTRAINT `FK_PRODUTOS_SERVICOS_CATEGORIAS` FOREIGN KEY (`cat_id`) REFERENCES `categorias` (`cat_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
