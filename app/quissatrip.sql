-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 16-Maio-2018 às 17:45
-- Versão do servidor: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quissatrip`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `circuit`
--

CREATE TABLE `circuit` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `circuit`
--

INSERT INTO `circuit` (`id`, `name`, `description`, `image`) VALUES
(1, 'Circuito Étnico', 'Circuito baseado em locais que são importantes para a identificação da etnia local', 'https://turismo-quissama.000webhostapp.com/uploads/circuitos/imagens/c-e5173.jpg'),
(2, 'Circuito Ecologico', 'Locais de fauna e flora do municipio', 'https://turismo-quissama.000webhostapp.com/uploads/circuitos/imagens/c-d9b1f.jpg'),
(3, 'Circuito Histórico', 'Locais com importancia historica para o municipio', 'https://turismo-quissama.000webhostapp.com/uploads/circuitos/imagens/c-51639.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `commerce_category`
--

CREATE TABLE `commerce_category` (
  `id` int(255) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(500) NOT NULL,
  `imagem` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `commerce_category`
--

INSERT INTO `commerce_category` (`id`, `nome`, `descricao`, `imagem`) VALUES
(1, 'Lanchonetes', '', ''),
(2, 'Hotéis', '', ''),
(3, 'Postos de Gasolina', '', ''),
(5, 'Diversão', '', ''),
(6, 'Banco', '', ''),
(7, 'Mercado', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entity`
--

CREATE TABLE `entity` (
  `name` varchar(300) NOT NULL,
  `address` varchar(300) NOT NULL,
  `address_extra` varchar(300) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `info` varchar(1000) NOT NULL,
  `is_commerce` tinyint(1) NOT NULL,
  `is_place` tinyint(1) NOT NULL,
  `is_event` tinyint(1) NOT NULL,
  `is_other` tinyint(1) NOT NULL,
  `commerce_category` int(255) NOT NULL,
  `circuit_id` int(255) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `open` varchar(100) NOT NULL,
  `close` varchar(100) NOT NULL,
  `id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `entity`
--

INSERT INTO `entity` (`name`, `address`, `address_extra`, `description`, `info`, `is_commerce`, `is_place`, `is_event`, `is_other`, `commerce_category`, `circuit_id`, `latitude`, `longitude`, `open`, `close`, `id`) VALUES
('Canal Campos-Macaé', 'Rua Comendador José Julião', '', 'Construído por escravos durante 17 anos, o Canal foi inaugurado em 1861 e possui cerca de 109 km de extensão, sendo o segundo canal artificial mais longo do mundo.', 'O Canal passa pelas cidades de Campos dos Goytacazes, Quissamã, Carapebus e Macaé.', 0, 1, 0, 0, 0, 1, '-22.10451385', '-41.47272817', '00:00', '23:59', 1),
('Museu Casa Quissamã', 'RJ-178', '', 'Criado pela Prefeitura Municipal em 2006, o museu foi residência do primeiro Visconde de Araruama e em seguida, de seu filho, o Visconde de Quissamã.</p><p>O imóvel estava em ruínas, mas foi totalmente restaurado e ambientado com decoração e móveis dos séculos XVIII e XIX. O museu conta com duas salas com memoriais descritivo e ilustrado e catálogo impresso.</p><p><br></p><p>Ao lado do museu, é possível ver um dos poucos exemplares de Baobás no estado do Rio de Janeiro.</p><p>O baobá é um objeto de culto de religiões africanas, a \'árvore da palavra e da sabedoria\' é nativa da ilha de Madagascar, mas está presente, mesmo que de forma discreta, no estado do Rio de Janeiro. Há apenas três delas em território fluminense: no Jardim Botânico da capital, na Ilha de Paquetá e em Quissamã.', '<p>Aberto a visitação de quarta a domingo</p><p>Telefone: 2768-1332</p><p>E-mail: fcultura.quissama@gmail.com</p>', 0, 1, 0, 0, 0, 3, '-22.100872', '-41.476394', '10:00', '17:00', 2),
('Fazenda Machadinha', 'Fazenda Machadinha', '', 'Tombada pelo Instituto Estadual do Patrimônio Cultural (Inepac) em 1979, a Fazenda Machadinha possui valor histórico no que restou de sua casa grande, erguida entre 1853 e 1867, senzalas, armazéns e a capela em homenagem a Nossa Senhora do Patrocínio, construídas em 1833.</p><p>A casa grande não pôde ser conservada, mas as senzalas foram restauradas e ganharam anexos que ainda respeitam a arquitetura original, onde descendentes de quilombolas ainda as fazem de lar.', '<p>No local, funciona o Complexo Cultural Fazenda Machadinha</p><p>Telefone: 2768-9300</p>', 0, 1, 0, 0, 0, 1, '-22.033643', '-41.452752', '10:00', '17:00', 3),
('Fazenda São Miguel', 'Rodovia QSM 007, Km 1,7', '', 'Fundada em 1858, foi a primeira moradia do Barão e Visconde de Quissamã. Vendida no fim do século XIX, a fazenda acabou nas mãos do engenheiro francês M. Bodaine, que construiu em 1908 o solar que hoje é visitado. A casa é rodeada de palmeiras e eucaliptos e abriga móveis e objetos do início do século.', '<p>As visitas devem ser agendadas com até 24 horas de antecedência em agências de turismo da cidade</p><p>Telefone: 2768-1250</p>', 0, 1, 0, 0, 0, 3, '-22.0993778', '-41.5079971', '10:00', '17:00', 4),
('Estação Ferroviária Conde de Araruama', 'Rodovia QSM 007, Km 1,7', '', 'Inaugurada em 1875, teve grande importância para o município por ter sido o centro comercial da cidade entre os séculos XIX e XX. Foi construida para que o transporte de cargas e passageiros entre as propriedades açucareiras fosse mais rápido.</p></br><p>Suas ramificações possibilitavam o acesso às fazendas de Mandiquera, Machadinha, São Miguel, Santa Francisca e outras.</p></br><p>Foi o primeiro local da cidade a ter telefone.', 'Telefone: 2768-9300', 0, 1, 0, 0, 0, 3, '-22.0712509', '-41.6053964', '10:00', '17:00', 5),
('Fazenda Trindade', 'RJ 196, km 13, Quissamã', '', 'Concluída em 1909, a sede da Fazenda Trindade tem o estilo dos chalés românticos do fim do século XIX. Além da sede, encontram-se preservadas algumas moradias de colonos e uma antiga casa de farinha. Trabalhado em pedra mármore colorida, com um desenho que forma um relógio de sol, o terraço fronteiro foi trazido da Casa de Capivari. Hoje, a fazenda, além de servir como residência, produz coco e abacaxi e possui criação de gado.', '<p><strong>Telefone:</strong> (22) 2768-1306<br><br><strong>Endereço:</strong> RJ 196, km 13<br><br><b>Visitas:</b><br>As visitas devem ser agendadas com antecedência nas agências de turismo de Quissamã.</p>', 0, 1, 0, 0, 0, 3, '-22.1071124', '-41.473509', '10:00', '17:00', 6),
('São Manoel', 'RJ-196', '', 'A fazenda encontra-se em ótimo estado de conservação. Construída no fim do século XIX, a casa mostra aspectos do fim da era neoclássica e do início da era eclética. Podemos observar isso nos arcos góticos da fachada a transição.</p><p>Na fazenda ainda estão móveis e objetos da época, além de várias construções também antigas ao seu redor.', 'As visitas devem ser agendadas com antecedência em agências de turismo de Quissamã', 0, 1, 0, 0, 0, 3, '-22.0924758', '-41.5756654', '10:00', '17:00', 7),
('Fazenda Mandiquera', 'Rodovia QSM 006, Km 1', '', '<p>O projeto original é do arquiteto e empreiteiro alemão Antônio Becker. A sede da fazenda é um importante solar em estilo neoclássico</p><p>Inaugurado em 1875, a construção é considerada uma obra monumental para os padrões da oligarquia canavieira da época.</p><p>Além de ter recebido a visita do Imperador Dom Pedro II, a sede da fazenda também foi locação para os filmes O Coronel e o Lobisomem (2005) e Deu no New York Times (1987).</p><p>A Fazenda Mandiquera foi tombada pelo Instituto Estadual do Patrimônio Cultural (Inepac) em 2007.</p>', 'Telefone: 2768-9300', 0, 1, 0, 0, 0, 3, '-22.1191788', '-41.516186', '10:00', '17:00', 8),
('Orla II', 'Rua banana com chocolate e maçã', '', 'Mercado lero lero lero lero lero lero', 'Lorem Ipsum dolor asium apmert', 1, 0, 0, 0, 7, 0, '-22', '22', '08:00', '20:00', 9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `images`
--

CREATE TABLE `images` (
  `image_id` int(255) NOT NULL,
  `entity_id` int(255) NOT NULL,
  `image_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `images`
--

INSERT INTO `images` (`image_id`, `entity_id`, `image_url`) VALUES
(1, 1, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/canal/1.jpg'),
(2, 1, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/canal/2.jpg'),
(3, 1, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/canal/3.jpg'),
(4, 1, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/canal/4.jpg'),
(5, 2, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/museu/1.jpg'),
(6, 2, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/museu/2.jpg'),
(7, 2, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/museu/3.jpg'),
(8, 2, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/museu/4.jpg'),
(9, 2, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/museu/5.jpg'),
(10, 3, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/machadinha/1.jpg'),
(11, 3, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/machadinha/2.jpg'),
(12, 3, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/machadinha/3.jpg'),
(13, 3, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/machadinha/4.jpg'),
(14, 4, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/miguel/1.jpg'),
(15, 4, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/miguel/2.jpg'),
(16, 5, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/conde/1.jpg'),
(17, 5, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/conde/2.jpg'),
(18, 5, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/conde/3.jpg'),
(19, 5, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/conde/4.jpg'),
(20, 6, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/32-721a0.jpg'),
(21, 7, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/manoel/1.jpg'),
(22, 7, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/manoel/2.jpg'),
(23, 8, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/mandiquera/1.jpg'),
(24, 8, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/mandiquera/2.jpg'),
(25, 8, 'https://turismo-quissama.000webhostapp.com/uploads/lugares/mandiquera/3.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `rolezinho`
--

CREATE TABLE `rolezinho` (
  `id` int(255) UNSIGNED NOT NULL,
  `media` varchar(500) NOT NULL,
  `user_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rolezinho_views`
--

CREATE TABLE `rolezinho_views` (
  `id` int(255) NOT NULL,
  `rolezinho_id` int(255) NOT NULL,
  `user_view_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `email` varchar(300) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `avatar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`id`, `nome`, `email`, `cpf`, `avatar`) VALUES
(1, 'Lucas Craveiro Paes', 'lucascraveiropaes123@gmail.com', '15933133736', 'https://pbs.twimg.com/profile_images/869292124986126338/keoLQCJh_400x400.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `circuit`
--
ALTER TABLE `circuit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commerce_category`
--
ALTER TABLE `commerce_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `entity`
--
ALTER TABLE `entity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `rolezinho`
--
ALTER TABLE `rolezinho`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rolezinho_views`
--
ALTER TABLE `rolezinho_views`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `circuit`
--
ALTER TABLE `circuit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `commerce_category`
--
ALTER TABLE `commerce_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `entity`
--
ALTER TABLE `entity`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rolezinho`
--
ALTER TABLE `rolezinho`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rolezinho_views`
--
ALTER TABLE `rolezinho_views`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
