-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 18-Out-2021 às 06:52
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
-- Database: `petvoce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendas`
--

CREATE TABLE `agendas` (
  `codigo` bigint(20) NOT NULL,
  `cadastro` bigint(20) NOT NULL,
  `cliente` bigint(20) NOT NULL,
  `produto_servico` bigint(20) NOT NULL,
  `tipo_bicho` bigint(20) NOT NULL,
  `raca_bicho` bigint(20) NOT NULL,
  `data` datetime NOT NULL,
  `descricao` text NOT NULL,
  `situacao` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bichos`
--

CREATE TABLE `bichos` (
  `codigo` bigint(20) NOT NULL,
  `tipo` bigint(20) NOT NULL,
  `raca` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `foto` varchar(255) NOT NULL,
  `observacoes` text NOT NULL,
  `situacao` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastros`
--

CREATE TABLE `cadastros` (
  `cad_id` bigint(20) NOT NULL,
  `cad_tipo` enum('cv','ps','pv','cl') NOT NULL DEFAULT 'cv' COMMENT 'cv = Clínica Viterinária,ps = Pet Shopping,pv = Profissional Viterinário, cl = Cliente',
  `cad_cpf_cnpj` char(20) NOT NULL,
  `cad_nome` varchar(255) NOT NULL,
  `cad_senha` varchar(255) NOT NULL,
  `cad_endereco` varchar(255) NOT NULL,
  `cad_telefone` char(20) NOT NULL,
  `cad_email` varchar(255) NOT NULL,
  `cad_perfil` text NOT NULL,
  `cad_logo` varchar(255) NOT NULL,
  `cad_data` datetime NOT NULL,
  `cad_situacao` enum('0','1') NOT NULL DEFAULT '1',
  `cad_qtd_curtidas` bigint(20) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cadastros`
--

INSERT INTO `cadastros` (`cad_id`, `cad_tipo`, `cad_cpf_cnpj`, `cad_nome`, `cad_senha`, `cad_endereco`, `cad_telefone`, `cad_email`, `cad_perfil`, `cad_logo`, `cad_data`, `cad_situacao`, `cad_qtd_curtidas`) VALUES
(23, 'ps', '', 'petamazon', '', 'sao jorge 575', '92984236418', 'petamazon@gmail.com', '', '', '2020-10-13 11:23:13', '1', 1),
(25, 'pv', '', 'teste', '', 'teste', 'teste', 'teste@gmial.com', '', '', '2020-12-06 17:06:16', '1', 0),
(27, 'cv', '', 'Cat Dog Pet Shop e Clínica Veterinária', '', 'Av. Gov. José Lindoso, 04', '(92) 99261-2006', '', '', '', '2020-12-06 20:00:05', '1', 1),
(29, 'cv', '', 'Mc Dog Pet Shop e Clínica Veterinária', '', 'Av. Autaz Mirim, 5566 - Térreo', ' (92) 98825-9913', '', '', '', '2020-12-06 20:18:50', '1', 0),
(31, 'pv', '', 'Raicley Santana da silva', '', 'Rua teste', '92994212871', 'raicleysantana39494@gmail.com', 'Teste', '', '0000-00-00 00:00:00', '1', 0),
(33, '', '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '1', 0),
(35, 'pv', '', 'Jaqueline Heloisa', '', 'Rua Willian masksoud', '67982691048', 'jaquelineheloisa@doublesp.com.br', 'Teste', '', '0000-00-00 00:00:00', '1', 0),
(37, 'ps', '', 'Per shop bicho sapeca', '', 'Av. Cosme Ferreira', '9230889785', '', 'Teste', '', '0000-00-00 00:00:00', '1', 1),
(63, 'cl', '037.821.052-14', 'Raicley Santana da silva', '202cb962ac59075b964b07152d234b70', 'Rua padre ramin', '(92) 99421-2871', 'raicleysantana1@gmail.com', '', '', '0000-00-00 00:00:00', '1', 0),
(69, 'pv', '417.654.192-04', 'Anne Profissional', 'e10adc3949ba59abbe56e057f20f883e', '', '(55) 92988-5549', 'leidemr177@gmail.com', 'Teste profissional', '', '0000-00-00 00:00:00', '1', 0),
(65, 'cl', '139.235.105-78', 'RAICLEY', '202cb962ac59075b964b07152d234b70', '', '(92) 99421-2871', 'raicley@gmmai.com', 'Xk', '', '0000-00-00 00:00:00', '1', 0),
(67, 'cl', '747.370.902-04', 'Anne', 'e10adc3949ba59abbe56e057f20f883e', '', '(92) 99450-4161', 'comercial@mohatron.com.br', 'Teste', '', '0000-00-00 00:00:00', '1', 0),
(71, 'cv', '10.158.735/0001-00', 'Anne clinica', 'e10adc3949ba59abbe56e057f20f883e', '', '(55) 92988-5549', 'leidemr@gmail.com', 'Teste clinica', '', '0000-00-00 00:00:00', '1', 0),
(73, 'cl', '601.109.702-25', 'Tamer', '202cb962ac59075b964b07152d234b70', 'Rua', '(92) 99188-6570', 'tamer@mohatron.com.br', 'Teste', '', '0000-00-00 00:00:00', '1', 0),
(75, 'cl', '999.999.999-99', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'endereço teste', '(99)9999-9999', 'email@gmail.com', '', '', '0000-00-00 00:00:00', '1', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `codigo` bigint(20) NOT NULL,
  `cadastro` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `telefone` char(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `situacao` enum('0','1') NOT NULL DEFAULT '1',
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`codigo`, `nome`, `telefone`, `email`, `endereco`, `situacao`, `createdAt`, `updatedAt`) VALUES
(2, 'Raicley santana', '92994212871', 'raicleysantana1@gmail', '', '1', '2021-10-12 02:45:27', '2021-10-12 02:45:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `curtidas`
--

CREATE TABLE `curtidas` (
  `codigo` bigint(20) NOT NULL,
  `cadastro_id` bigint(20) NOT NULL,
  `cliente_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `codigo` bigint(20) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `login` char(100) NOT NULL,
  `senha` char(100) NOT NULL,
  `situacao` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_servicos`
--

CREATE TABLE `produtos_servicos` (
  `ps_codigo` bigint(20) NOT NULL,
  `cad_codigo` bigint(20) NOT NULL,
  `cat_codigo` bigint(11) NOT NULL,
  `ps_nome` varchar(255) NOT NULL,
  `ps_descricao` text NOT NULL,
  `ps_foto` varchar(255) NOT NULL,
  `ps_valor` decimal(20,2) NOT NULL,
  `ps_situacao` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos_servicos`
--

INSERT INTO `produtos_servicos` (`ps_codigo`, `cad_codigo`, `cat_codigo`, `ps_nome`, `ps_descricao`, `ps_foto`, `ps_valor`, `ps_situacao`) VALUES
(37, 27, 23, 'Banho e tosa', 'Serviço de banho e tosa a domicílio, em Manaus.', '', '100.00', '1'),
(39, 37, 25, 'Hotelzinho pet', 'Um serviço que vem crescendo na área pet são os hotéis para animais de estimação. É cada vez maior o número de pessoas que decidem deixar o pet num local estruturado especialmente para eles enquanto a família viaja.\n\nIsso se deve, muitas vezes, ao fato de as pessoas nem sempre poderem levar o animal no passeio (infelizmente, nem todas as hospedagens são pet-friendly), ou de não terem com que deixá-lo durante a ausência.\n\nSe o seu pet shop tem infraestrutura para receber alguns animais para passar uma noite, ou até mesmo uns dias, essa é uma boa opção de serviço para lucrar mais. Lembre-se que é necessário ter um espaço para os animais ficarem soltos durante o dia, além de um espaço fechado e protegido para passarem a noite.\n\nMas lembre-se: sempre verifique na sua cidade quais são as necessidades legais e técnicas que devem ser seguidas antes de oferecer esse serviço.\n\nUma boa ideia também é oferecer o hotel durante o dia, como se fosse uma ?creche animal?. Muitas famílias têm investido nesse tipo de serviço pensando no bem-estar do animal, para evitar que ele fique sozinho trancado em casa ou apartamento. Levá-lo à ?creche? é uma forma de ele estar ativo durante o dia e de conviver com mais animais.', '', '250.00', '1'),
(41, 29, 27, 'Consultas veterinárias', 'As consultas veterinárias são serviços naturalmente oferecidos em Pet Shops ou Banho e Tosa, principalmente quando o dono do estabelecimento é um veterinário.\n\nSe o seu caso não for esse, você pode fazer uma parceria com um veterinário da sua confiança para que ele atenda os animais na sua loja mesmo, ou para que animais que precisem de atenção médica sejam levados até o consultório desse médico.', '', '79.00', '1'),
(43, 29, 27, 'Tratamentos alternativos', 'Outros tipos de serviços que estão em alta no mundo pet são alguns tratamentos alternativos de estética e de saúde para animais.\n\nUm exemplo disso é a acupuntura, técnica oriental já popular entre os humanos e que foi adaptada para cães e gatos. Na verdade, na China, de onde ela é originária, usar agulhas em animais já é comum há mais de 1000 anos, mas aqui no Brasil essa técnica começou a se popularizar mais recentemente.\n\nA acupuntura pode ser usada quando os animais tiverem problemas musculares ou respiratórios, doenças relacionadas à estrutura óssea, ao sistema gastrointestinal e ao sistema reprodutivo, doenças neurológicas e urogenitais e questões dermatológicas.', '', '120.00', '1'),
(45, 23, 29, 'Serviço de Babá', 'Consideramos aqui os serviços que possuem o intuito de oferecer um melhor comportamento através dos serviços oferecidos na pet shop.', '', '120.00', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `racas`
--

CREATE TABLE `racas` (
  `codigo` bigint(20) NOT NULL,
  `tipo` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipos`
--

CREATE TABLE `tipos` (
  `codigo` bigint(20) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agendas`
--
ALTER TABLE `agendas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `bichos`
--
ALTER TABLE `bichos`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `cadastros`
--
ALTER TABLE `cadastros`
  ADD PRIMARY KEY (`cad_id`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `curtidas`
--
ALTER TABLE `curtidas`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `cadastro_id` (`cadastro_id`,`cliente_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  ADD PRIMARY KEY (`ps_codigo`);

--
-- Indexes for table `racas`
--
ALTER TABLE `racas`
  ADD PRIMARY KEY (`codigo`);

--
-- Indexes for table `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agendas`
--
ALTER TABLE `agendas`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `bichos`
--
ALTER TABLE `bichos`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cadastros`
--
ALTER TABLE `cadastros`
  MODIFY `cad_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `curtidas`
--
ALTER TABLE `curtidas`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `produtos_servicos`
--
ALTER TABLE `produtos_servicos`
  MODIFY `ps_codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `racas`
--
ALTER TABLE `racas`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `tipos`
--
ALTER TABLE `tipos`
  MODIFY `codigo` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
