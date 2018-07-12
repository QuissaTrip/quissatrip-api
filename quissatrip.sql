-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12/07/2018 às 20:23
-- Versão do servidor: 10.2.16-MariaDB
-- Versão do PHP: 7.1.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `u410486708_app`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apps`
--

CREATE TABLE `apps` (
  `id` int(11) NOT NULL,
  `playstore_url` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `apps`
--

INSERT INTO `apps` (`id`, `playstore_url`, `city_name`, `image`) VALUES
(1, NULL, 'Macaé', NULL),
(2, NULL, 'Campos dos Goytacazes', NULL),
(3, NULL, 'Conceição de Macabu', NULL),
(4, NULL, 'Carapebus', NULL),
(5, NULL, 'São João da Barra', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`) VALUES
(1, 'Praias e Lagoas', 'Lero lero lero lero', 'http://lucascraveiropaes.com/app/files/categories/praias.jpg'),
(2, 'Pontos Históricos', 'Locais de fauna e flora do municipio', 'http://lucascraveiropaes.com/app/files/categories/historico.jpg'),
(3, 'Pontos Ecológicos', 'lero lero lero lero', 'http://lucascraveiropaes.com/app/files/categories/ecologico.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `commerce_category`
--

CREATE TABLE `commerce_category` (
  `id` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `commerce_category`
--

INSERT INTO `commerce_category` (`id`, `name`, `description`, `image`) VALUES
(1, 'Restaurantes', '', 'http://lucascraveiropaes.com/app/files/commerce_categories/restaurante.jpg'),
(2, 'Hotéis', '', 'http://lucascraveiropaes.com/app/files/commerce_categories/hotel.jpg'),
(3, 'Serviços Gerais', '', 'http://lucascraveiropaes.com/app/files/commerce_categories/servicos.jpg'),
(4, 'Guias e Agências de Turismo', '', 'http://lucascraveiropaes.com/app/files/guia.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `entity`
--

CREATE TABLE `entity` (
  `name` varchar(300) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `address_extra` varchar(300) DEFAULT NULL,
  `description` varchar(2000) NOT NULL DEFAULT '',
  `info` varchar(1000) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `is_commerce` tinyint(1) NOT NULL DEFAULT 0,
  `is_place` tinyint(1) NOT NULL DEFAULT 0,
  `is_event` tinyint(1) NOT NULL DEFAULT 0,
  `is_other` tinyint(1) NOT NULL DEFAULT 0,
  `commerce_category` int(255) NOT NULL DEFAULT 0,
  `category_id` int(255) NOT NULL DEFAULT 0,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `open` varchar(100) NOT NULL DEFAULT '',
  `close` varchar(100) NOT NULL DEFAULT '',
  `id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `entity`
--

INSERT INTO `entity` (`name`, `address`, `address_extra`, `description`, `info`, `phone`, `is_commerce`, `is_place`, `is_event`, `is_other`, `commerce_category`, `category_id`, `latitude`, `longitude`, `open`, `close`, `id`) VALUES
('Canal Campos-Macaé', 'Rua Comendador José Julião', '', '<p>Construído por escravos durante 17 anos, o Canal foi inaugurado em 1861 e possui cerca de 109 km de extensão, sendo o segundo canal artificial mais longo do mundo.</p>', '<p>O Canal passa pelas cidades de Campos dos Goytacazes, Quissamã, Carapebus e Macaé.</p>', '', 0, 1, 0, 0, 0, 1, '-22.104533', '-41.472708', '00:00', '23:59', 1),
('Museu Casa Quissamã', 'RJ-178', '', '<p>Criado pela Prefeitura Municipal em 2006, o museu foi residência do primeiro Visconde de Araruama e em seguida, de seu filho, o Visconde de Quissamã.</p>\r\n<p>O imóvel estava em ruínas, mas foi totalmente restaurado e ambientado com decoração e móveis dos séculos XVIII e XIX. O museu conta com duas salas com memoriais descritivo e ilustrado e catálogo impresso.</p>\r\n<p>Ao lado do museu, é possível ver um dos poucos exemplares de Baobás no estado do Rio de Janeiro.</p>\r\n<p>O baobá é um objeto de culto de religiões africanas, a \'árvore da palavra e da sabedoria\' é nativa da ilha de Madagascar, mas está presente, mesmo que de forma discreta, no estado do Rio de Janeiro. Há apenas três delas em território fluminense: no Jardim Botânico da capital, na Ilha de Paquetá e em Quissamã.</p>', '<p>Aberto a visitação de quarta a domingo</br>\r\nE-mail: fcultura.quissama@gmail.com</p>', '2768-1332', 0, 1, 0, 0, 0, 2, '-22.100859', '-41.476412', '10:00', '17:00', 2),
('Complexo Cultural Fazenda Machadinha', 'Fazenda Machadinha', '', '<p>Tombada pelo Instituto Estadual do Patrimônio Cultural (Inepac) em 1979, a Fazenda Machadinha possui valor histórico no que restou de sua casa grande, erguida entre 1853 e 1867, senzalas, armazéns e a capela em homenagem a Nossa Senhora do Patrocínio, construídas em 1833.</p>\r\n<p>A casa grande não pôde ser conservada, mas as senzalas foram restauradas e ganharam anexos que ainda respeitam a arquitetura original, onde descendentes de quilombolas ainda as fazem de lar.</p>', '<p>No local, funciona o Complexo Cultural Fazenda Machadinha, onde é possível saber mais sobre a cultura do local</p>', '2768-9300', 0, 1, 0, 0, 0, 2, '-22.033872', '-41.452669', '10:00', '17:00', 3),
('Fazenda São Miguel', 'Rodovia QSM 007, Km 1,7', '', '<p>Fundada em 1858, foi a primeira moradia do Barão e Visconde de Quissamã. Vendida no fim do século XIX, a fazenda acabou nas mãos do engenheiro francês M. Bodaine, que construiu em 1908 o solar que hoje é visitado.</p>\r\n<p>A casa é rodeada de palmeiras e eucaliptos e abriga móveis e objetos do início do século.</p>', '<p>As visitas devem ser agendadas com até 24 horas de antecedência em agências de turismo da cidade.</p>', '2768-1250', 0, 1, 0, 0, 0, 2, '-22.099378', '-41.507997', '10:00', '17:00', 4),
('Estação Ferroviária Conde de Araruama', 'Rodovia QSM 007, Km 1,7', '', '<p>Inaugurada em 1875, teve grande importância para o município por ter sido o centro comercial da cidade entre os séculos XIX e XX. Foi construída para que o transporte de cargas e passageiros entre as propriedades açucareiras fosse mais rápido.</p>\r\n<p>Suas ramificações possibilitavam o acesso às fazendas de Mandiquera, Machadinha, São Miguel, Santa Francisca e outras.</p>', '<p>Foi o primeiro local da cidade a ter telefone.</p>', '2768-9300', 0, 1, 0, 0, 0, 2, '-22.071229', '-41.605327', '10:00', '17:00', 5),
('Praia de João Francisco', 'João Francisco', '', '<p>Mais bela praia Quissamã, com postos salva vidas e quiosques espalhados por toda a orla.</p>', '<p>Lembre-se de não jogar lixo na praia</p>', '2768-9300', 0, 1, 0, 0, 0, 1, '-22.208436', '-41.473508', '00:00', '23:59', 6),
('São Manoel', 'RJ-196', '', '<p>A fazenda encontra-se em ótimo estado de conservação. Construída no fim do século XIX, a casa mostra aspectos do fim da era neoclássica e do início da era eclética. Podemos observar isso nos arcos góticos da fachada a transição.</p>\r\n<p>Na fazenda ainda estão móveis e objetos da época, além de várias construções também antigas ao seu redor.</p>', '<p>As visitas devem ser agendadas com antecedência em agências de turismo de Quissamã</p>', '', 0, 1, 0, 0, 0, 2, '-22.0924758', '-41.5756654', '10:00', '17:00', 7),
('Fazenda Mandiquera', 'Rodovia QSM 006, Km 1', '', '<p>O projeto original é do arquiteto e empreiteiro alemão Antônio Becker. A sede da fazenda é um importante solar em estilo neoclássico</p>\r\n<p>Inaugurado em 1875, a construção é considerada uma obra monumental para os padrões da oligarquia canavieira da época.</p>\r\n<p>Além de ter recebido a visita do Imperador Dom Pedro II, a sede da fazenda também foi locação para os filmes O Coronel e o Lobisomem (2005) e Deu no New York Times (1987).</p>\r\n<p>A Fazenda Mandiquera foi tombada pelo Instituto Estadual do Patrimônio Cultural (Inepac) em 2007.</p>', '', '2768-9300', 0, 1, 0, 0, 0, 2, '-22.1191788', '-41.516186', '10:00', '17:00', 8),
('Orla II', 'Estrada do Correio Imperial, 1262-1302 - Piteiras', '', '', '', '', 1, 0, 0, 0, 3, 0, '-22.113389', '-41.478153', '08:00', '20:00', 9),
('Praia do Visgueiro', 'Praia do Visgueiro', '', '<p>Localizada no Parque Nacional da Restinga de Jurubatiba, a Visgueiro é uma praia de restinga com areias brancas em seus dois quilômetros de extensão. Nela, a fauna diversificada é composta por lagartos, mariscos e caranguejos. Os moradores do local são, em sua maioria, pescadores que tiram seu sustento da pesca feita com rede e linha.</p>', '<p>Extensã0: 2km<br>Lembre-se de não jogar lixo na praia</p>', '', 0, 1, 0, 0, 0, 1, '-22.192390', '-41.425608', '00:00', '23:59', 11),
('Parque Nacional da Restinga de Jurubatiba', 'Jurubatiba, Quissamã', '', '</p>Única área de preservação dedicada à vegetação de restinga, o Parque Nacional de Jurubatiba é um dos maiores tesouros ambientais do país. Criado por Decreto Federal em 24 de abril de 1998, Jurubatiba é uma Unidade de Conservação Federal que tem como objetivo preservar o patrimônio natural. O parque possui 44 km de praias, 14.860 hectares de restinga, com 18 lagoas costeiras de rara beleza e de grande interesse ecológico. Ele abrange os municípios de Carapebus, Macaé e Quissamã.</p>', '<b>Criação:</b>24 de abril de 1998</br>\r\n<b>Praias:</b><44 Km</br>\r\n<b>Restinga:</b>14.860 Hectares</br>\r\n<b>Lagoas:</b>18 lagoas no total</br>\r\n<b>Email:<b> parnajurubatiba@icmbio.gov.br', '2765-6024', 0, 1, 0, 0, 0, 3, '-22.204495', '-41.500341', '00:00', '23:59', 12),
('Praia de Barra do Furado', 'Barra do Furado, Quissamã - RJ', '', '<p>Barra do Furado é uma pequena vila de pescadores que divide Campos dos Goytacazes e Quissamã e sedia anualmente uma das etapas do Campeonato Brasileiro de Surf Profissional, além de outras competições do esporte. A pesca é a principal atividade econômica local, e a Praia de Barra do Furado dispõe de quiosques e restaurantes especializados em frutos do mar e suas iguarias. São oferecidos passeios de bugres pelas areias escaldantes do Furado.</p>', '<p>Lembre-se de não jogar lixo na praia</p>', '', 0, 1, 0, 0, 0, 1, '-22.096348', '-41.138336', '00:00', '23:59', 13),
('Betos Bar', 'Avenida Fernando Caldas Carneiro da Silva', '', '<p>Restaurante e Lanchonete</p>', '', '', 1, 0, 0, 0, 1, 0, '-22.107547', '-41.466428', '10:00', '21:00', 15),
('Deguste', 'Rua Comendador José Julião', '', '<p>Pizzaria</p>', '<p>Aberto de terça a domingo de 18h às 0h</p>', '', 1, 0, 0, 0, 1, 0, '-22.105776', '-41.471686', '18:00', '23:59', 16),
('Pousada do Mano', 'Rua Eusébio Queiroz, 337 Quissamã', '', '', '', '2768-1064', 1, 0, 0, 0, 2, 0, '-22.105258', '-41.469494', '00:00', '23:59', 17),
('Posto Quissamã', 'Rua Comendador José Julião, 315 - Alto Alegre', '', '<p>Posto de gasolina da Petrobras</p>', '', '', 1, 0, 0, 0, 3, 0, '-22.107646', '-41.465557', '5:30', '22:00', 18),
('Terminal Rodoviário', 'Jerônimo Alves Paula, 393 - Caxias', '', '<p>Terminal Rodoviário de Quissamã. 1001 e Quissatur</p>', '', '', 1, 0, 0, 0, 3, 0, '-22.103596', '-41.469650', '04:00', '23:00', 19),
('Arena Snake', 'Euzébio de Queirós, 42 - Centro', '', '<p>Casa de festas em Quissamã</p>', '<p>Proibida a entrada de menores de 18 anos</p>', '', 1, 0, 0, 0, 3, 0, '-22.105152', '-41.472587', '21:00', '05:00', 20),
('Banco do Brasil', 'Barão de Vila Franca, 292 - Centro', '', '<p>Agência 3845-8</p>', '', '2768-1404', 1, 0, 0, 0, 3, 0, '-22.107161', '-41.471159', '10:00', '16:00', 21),
('Engenho Central de Quissamã', 'RJ- 196', '', '<p>Inaugurado em 1877, este foi o primeiro engenho da América do Sul e possuía máquinas a vapor da época de sua inauguração funcionando até o fim dos anos 80.</p><p>As locomotivas usadas para transportar os Barões e Viscondes até a vila e a cana de açúcar das fazendas para a Usina ainda se encontram no pátio da indústria desativada.</p>\r\n', '<p>A entrada é proibida, pois a usina está em ruínas</p>', '', 0, 1, 0, 0, 0, 2, '-22.103609', '-41.469653', '00:00', '23:59', 22),
('Espaço Cultural José Carlos de Barcellos', 'Estrada do Correio Imperial, 1834 - Piteiras', '', '<p>Cercado por uma vegetação original da restinga, o Espaço possui um grande acervo de originais e réplicas de peças antigas, como documentos, fotografias, plantas, postais, moedas, pinturas e mapas de Quissamã.</p>', '<p>Espaço aberto à visitações agendadas.</p>\r\n<p><b>Celular:</b> (22)99977-8828</p>', '2768-1365', 0, 1, 0, 0, 0, 2, '-22.115569', '-41.481849', '08:00', '18:00', 23),
('Igreja Matriz Nossa Senhora do Desterro', 'Avenida Fernando Caldas da Silva', '', '<p>A primeira Igreja Matriz foi inaugurada em 1815. Em 1924 foi inaugurada a atual Igreja Matriz de Quissamã.</p>\r\n<p>A Igreja possui um estilo eclético europeu com elementos dos templos religiosos da Alemanha do início do século XX.</p>', '<p>Há no interior da Igreja, altares e imagens sacras da antiga matriz.</p>', '2768-1123', 0, 1, 0, 0, 0, 2, '-22.106786', '-41.472667', '06:00', '22:00', 24),
('Coreto da Igreja Matriz', 'Pátio da Igreja Matriz', '', '<p>Tombado pelo Instituto Estadual do Patrimônio Cultural (Inepac) em 1985, o coreto foi inaugurado durante as comemorações pelos 100 anos da antiga Igreja Matriz de Quissamã, em 1915.</p>\r\n<p>Construído no formato de cruz, o coreto tem dois pequenos telhados de duas águas em placas de ardósia.</p>', '', '2768-1123', 0, 1, 0, 0, 0, 2, '-22.106786', '-41.472667', '00:00', '23:59', 25),
('Centro Administrativo Municipal de Quissamã', 'Rua Conde de Araruama, 425', '', '<p>Construído para ser uma escola na qual estudariam os descendentes do Visconde de Araruama, o prédio foi inaugurado em 1870. Pouco tempo depois, foi transformado em escola pública e em 1903, passou a sediar o Convento Nossa Senhora dos Anjos.</p>\r\n<p>Em 1991, quando virou o Centro Administrativo Municipal de Quissamã, as características do Convento foram preservadas.</p>', 'O afresco na entrada, ornado com ramagens de flores com as letras \'AM\' em cima, são referência a Ave Maria, a Nossa Senhora dos Anjos, padroeira do antigo convento.\r\n', '2768-9300', 0, 1, 0, 0, 0, 3, '-22.106975', '-41.471280', '08:00', '18:00', 26),
('Chácara São João', 'Rua Visconde de Ururay', '', '<p>Erguida em 1882, a chácara era a moradia da família do nobre João José Carneiro da Silva. Após sua morte, seu irmão, o Barão José Caetano se mudou para a chácara com a família, onde viveu até 1931.</p>\r\n<p>Depois de nove anos fechada, Ana Francisca, filha da Baronesa e seu filho Bento Cavour, chegaram à chácara e atualmente sua família é a proprietária do imóvel.</p>', 'Visitas devem ser agendadas com antecedência.', '', 0, 1, 0, 0, 0, 3, '-22.106081', '-41.472319', '09:00', '17:00', 27),
('Centro Cultural Sobradinho', 'Rua Comendador José Julião, 206', '', '<p>O Sobradinho é um casarão da década de 1870 que ganhou um segundo pavimento em 1885.</p>\r\n<p>Em 2005, a antiga casa de Francisca Romana do Patrocínio, dama de companhia da baronesa de Villa Franca, e de seu sobrinho José David Paula foi comprada pela prefeitura de Quissamã, que começou o processo de restauração no ano seguinte.</p>\r\n<p>No final do século XIX, a família Paula permitiu a construção da Estação da Freguesia, que viraria o centro de um total de 40 Km de linha férrea, ao entorno da propriedade.</p>\r\n<p>Ainda com as características originais preservadas, o prédio ganhou um elevador e um anexo na parte de trás do terreno.</p>\r\n<p>Com o objetivo de agregar iniciativas educacionais e culturais, o Sobradinho possui telão de exposições, sala de música, multimídia, leitura e dança, biblioteca infantil, um mini palco para atividades teatrais e cantina.</p>\r\n<p>No local também funcionam a Biblioteca Municipal de Quissamã, o Cine Quissamã, o Café da Romana e uma réplica da antiga Estação Ferroviária.</p>\",\r\n', 'Diversas oficinas podem ser encontradas no Sobradinho, tais como desenho, dança, música, xadrez e teatro', '2768-1306', 0, 1, 0, 0, 0, 3, '-22.106339', '-41.473308', '08:00', '18:00', 28),
('Estação Ferroviária do Centro', 'Rua Comendador José Julião, 206', '', 'Inaugurada em 2009, a réplica reproduz em detalhes a antiga Estação da Freguesia, construída no final do século XIX.</p>\r\n<p>Localizada no Centro Cultural Sobradinho, podemos encontrar objetos da época e uma maquete animada que reproduz o antigo percurso do trem entre as principais fazendas de Quissamã.</p>', '<p><b>Email:</b> <a href=\'mailto: sobradinho.quissama@gmail.com\'>sobradinho.quissama@gmail.com</a></p>\r\n<p><b>Celular:</b> (22)99283-5709</p>', '2768-1306', 0, 1, 0, 0, 0, 3, '-22.071229', '-41.605327', '08:00', '18:00', 29),
('Casa Mato de Pipa', 'Avenida A, Vivendas do Canal', '', '<p>Erguida entre 1777 e 1782 por Manuel Carneiro da Silva, capitão das aldeias dos índios em Quissamã. Assim que a obra foi concluída, Manuel passou a residir na casa com sua esposa Ana Francisca de Velasco Távora Barcellos Coutinho.</p>\r\n<p>Nesta casa, em 1788, o 1º Visconde de Araruama, filho do casal, nasceu.</p>', 'Primeira casa de telhas construida na região.</p><p>Casa mais antiga de Quissamã.', '2768-1150', 0, 1, 0, 0, 0, 2, '-22.106063', '-41.477858', '10:00', '17:00', 30),
('Casa de Artes Machadinha', 'Estrada da Machadinha, Rodovia QSM-010, s/n', '', '<p>Em 2010, a Casa de Artes Machadinha recebeu o Prêmio Cultura do Estado do Rio de Janeiro, na categoria gastronomia.</p>\r\n<p>O local resgata e leva às mesas do restaurante, receitas passadas das mães para as filhas dos escravos.</p>', '<p>Os principais pratos da casa são o Mulato Velho (feijoada com peixe salgado), Capitão de Feijão (bolinho de feijão temperado) e a Sanema (doce feito com mandioca, ovos, coco e manteiga batida).</p><p>Aberto aos sábados e domingos.</p>', '2768-9300', 1, 1, 0, 0, 1, 2, '-22.033201', '-41.453137', '10:00', '17:00', 31),
('Ginásio Poliesportivo Walth Mille Pessanha', 'Estrada do Correio Imperial', '', '<p>Principal quadra da cidade, onde acontecem diversos eventos esportivos.</p>', '', '2768-9300', 0, 1, 0, 0, 0, 0, '-22.103609', '-41.469653', '07:00', '21:00', 32),
('Parque Aquatico', 'Rua Jerônimo Alves Paula', '', '<p>Local onde acontecem aulas de natação e nado livre para a população.</p>', '<p>O local conta com 3 piscinas e salva vidas treinados.</p>', '2768-9300', 0, 1, 0, 0, 0, 0, '-22.112357', '-41.471474', '08:00', '18:00', 33),
('Parque de Exposição Dr. Renato Queirós Carneiro da Silva', 'Rua Comendador José Julião', '', '<p>Local onde acontecem exposições agropecuárias, festas, jogos de futebol e esportes equestres.</p>', '<p>Espaço amplo para a realização de eventos expositivos.</p>', '2768-9300', 0, 1, 0, 0, 0, 0, '-22.113134', '-41.474712', '08:00', '21:00', 34),
('Supermercado Macabu', 'Avenida Fernando Caldas Carneira da Silva, 739 - Sítio Quissamã', '', '', '', ' 2768-1333', 1, 0, 0, 0, 3, 0, '-22.107606', '-41.466230', '08:00', '20:00', 35),
('Orla I', 'R. Frei João Batista, 172 - Centro', '', '', '', '2768-1165', 1, 0, 0, 0, 3, 0, '-22.108473', '-41.469394', '08:00', '20:00', 36),
('Auto Posto N. Sra do Desterro', 'Av. Fernando Caldas Carneiro da Silva, 115 - Sítio Quissamã', '', '', '', '', 1, 0, 0, 0, 3, 0, '-22.107600', ' -41.465501', '06:00', '22:00', 37),
('Pousada Quissamã', 'Estrada do Correio Imperial, 1660 - Piteiras', '', '', '<p>Estacionamento\r\nWifi\r\nCafé da Manhã\r\nPiscina Coberta\r\nAr Condicionado\r\nServiço de Lavanderia</p>', '2768-6714', 1, 0, 0, 0, 2, 0, '-22.115198', '-41.481328', '00:00', '23:59', 38),
('Hotel Maravilha', 'R. Conde de Araruama, 538 - Centro', '', '', '', '2768-1103', 1, 0, 0, 0, 2, 0, '-22.107706', '-41.471801', '00:00', '23:59', 39),
('Hotel Salles', 'R. Comendador José Julião, 125 - Centro', '', '', '', '2768-1200', 1, 0, 0, 0, 2, 0, '-22.105746', '-41.472992', '00:00', '23:59', 40),
('Restaurante da Liete', 'Avenida Atlântica - Barra do Furado', '', '', '', '2768-2574', 1, 0, 0, 0, 1, 0, '-22.095363', '-41.137255', '10:00', '16:00', 41),
('Restaurante Bom Sabor', 'Avenida Francisco de Assis Carneiro da Silva, 714 - Alto Alegre', '', '', '', '', 1, 0, 0, 0, 1, 0, '-22.111061', '-41.473313', '10:00', '16:00', 42),
('Tatá Supermercado', 'Visconde de Quissamã, 97 - Centro', '', '', '', '2768-2980', 1, 0, 0, 0, 3, 0, '-22.109292', '-41.469706', '08:00', '20:00', 43),
('Guia Turístico - Dalva Nascimento Maia', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Inglês e Português<br>Telefone: (22) 9863-8261<br>Número de Cadastro: 19.022196.96-9</p>', '(022) 99863-8261', 1, 0, 0, 0, 4, 0, NULL, NULL, '00:00', '23:59', 44),
('Guia Turístico - Elizane Lucas da Silva', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (22) 99911-8203<br>Número de Cadastro: 19.027225.96-5</p>', '(022) 99911-8203', 1, 0, 0, 0, 4, 0, NULL, NULL, '00:00', '23:59', 45),
('Guia Turístico - Jorge Eduardo Dos Santos', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (22) 99813-1103<br>Número de Cadastro: 19.117939.36-0</p>', '', 1, 0, 0, 0, 4, 0, NULL, NULL, '', '', 46),
('Guia Turístico - Milena Eustaquia Vilas Boas', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (022) 98155-2740<br>Número de Cadastro: 19.022434.96-2</p>', '(022) 98155-2740', 1, 0, 0, 0, 4, 0, NULL, NULL, '', '', 47),
('Guia Turístico - Ralph Mendonça Da Silva Carvalho', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (022) 9811-1769<br>Número de Cadastro: 19.023888.96-0</p>', '(022) 9811-1769', 1, 0, 0, 0, 4, 0, NULL, NULL, '', '', 48),
('Guia Turístico - Valdirene De Brito Pereira', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (022) 99751-5750<br>Número de Cadastro: 19.022435.96-0</p>', '', 1, 0, 0, 0, 4, 0, NULL, NULL, '', '', 49),
('Guia Turístico - Vivian Caldas Pessanha', NULL, NULL, '<p>Fornece serviços de Guia Turístico na Cidade de Quissamã</p>', '<p>Idiomas: Português<br>Telefone: (022) 97836-1038<br>Número de Cadastro: 19.024120.96-0</p>', '', 1, 0, 0, 0, 4, 0, NULL, NULL, '', '', 50),
('Itaú', 'R. Bento Francisco Ramos, 90 - Centro', NULL, '', '', '', 1, 0, 0, 0, 3, 0, '-22.107296', '-41.474170', '10:00', '15:00', 51),
('Caixa Econômica Federal', 'Rua Barão de Vila Franca, 362 - Centro', NULL, '', '', '2768-9350', 1, 0, 0, 0, 3, 0, '-22.107486', '-41.470171', '10:00', '15:00', 52),
('Bradesco', 'Av. Fernando Caldas Carneira da Silva, 848 - Sítio Quissamã', NULL, '', '', '2768-7018', 1, 0, 0, 0, 3, 0, '-22.107920', '-41.466189', '10:00', '15:00', 53),
('Dois Amigos Turismo', NULL, NULL, '<p>Fretamento e Turismo</p>', '', '(22)99865-7703', 1, 0, 0, 0, 3, 0, '-22.115895', '-41.497227', '08:00', '17:00', 54),
('Departamento de Polícia Operacional', 'Rua Barão Vila Franca, 504 - Centro', NULL, '<p>Aberto a qualquer horário</p>', '', '(22) 3399-9702', 1, 1, 0, 0, 3, 0, '-22.107578', '-41.469002', '00:00', '23:59', 55),
('Hospital Municipal Mariana Maria de Jesus', 'RJ-178, 411 - Piteiras', NULL, 'Aberto 24h para atendimento', '', '(22) 2768-1110', 1, 0, 0, 0, 3, 0, '-22.108913', '-41.476857', '00:00', '23:59', 56),
('Drogaria Zille', 'Rua Visconde de Quissamã', NULL, '', '', '', 1, 0, 0, 0, 3, 0, '-22.109139', '-41.469560', '06:00', '22:00', 57),
('Cantina e Pousada da Zê', 'Rua Frei Fabiano, 164', NULL, '', '', '2768-2041', 1, 0, 0, 0, 1, 0, '-22.105963', '-41.468228', '08:00', '15:00', 58),
('Feirinha de Artesanato', 'Rua Barão de Vila Franca', 'Praça Mario Moreira da Silva', 'Venha conhecer os produtos artesanais confeccionados pelo grupo Arte Nossa e produtos da agricultura familiar.\r\nProdutos artesanais em taboa, coco, tricô, bordado e outras artes manuais. Saboreie doces, pães, bolos, hortaliças, frutas e verduras saudáveis.', 'Quartas e sextas-feiras', '', 1, 0, 0, 0, 3, 0, '-22.107358', '-41.470640', '08:00', '16:00', 59);

-- --------------------------------------------------------

--
-- Estrutura para tabela `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `date` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `month` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Fazendo dump de dados para tabela `events`
--

INSERT INTO `events` (`id`, `date`, `month`, `text`) VALUES
(1, '04', 'Janeiro', 'Aniversário de Emancipação Política Administrativa'),
(2, '04', 'Janeiro', 'Passeio Ciclístico (Guarda)'),
(3, '17', 'Fevereiro', 'Nossa Senhora do Desterro (Igreja Matriz)'),
(4, '08 - 13', 'Fevereiro', 'Carnaval'),
(5, '08', 'Março', 'Dia Internacional da Mulher (Passeio Ciclístico)'),
(6, '08', 'Março', 'Encontro de Mulheres'),
(7, '19', 'Março', 'Missa de São José (funcionários)'),
(15, '21', 'Abril', 'Encontro Regional de Zumba (Bairro Penha)'),
(16, '28', 'Abril', 'Aniversário do Parque Nacional de Jurubatiba'),
(17, '01', 'Maio', 'Dia do Trabalhador'),
(18, '13', 'Maio', 'Festa de Senhora de Fátima'),
(19, '13', 'Maio', 'Dia das Mães'),
(20, '19', 'Maio', 'Feijoada da Liberdade'),
(21, '26', 'Maio', 'Casamento Comunitário'),
(22, '31', 'Maio', 'Corpus Christi'),
(23, '01 - 02', 'Junho', 'Copa Open de Futsal Feminino'),
(24, '09 - 10', 'Junho', 'Volta Ciclística'),
(25, '09', 'Junho', 'Cowfest Flexeiras'),
(26, '10', 'Junho', 'Aniversário do Centro Cultural Sobradinho'),
(27, '12', 'Junho', 'Aniversário da Cidade (Missa, Desfile Cívico, show…)'),
(28, '30', 'Junho', 'IX Encontro Diocesano do Apostolado de Oração'),
(29, '21 - 22', 'Julho', 'Copa LIVERJ Vôlei Masculino'),
(30, '28 - 29', 'Julho', 'Copa LIVERJ Vôlei Feminino'),
(31, '02 - 05', 'Agosto', 'Exposição Agopecuária'),
(32, '07', 'Agosto', 'Feira da Saúde'),
(33, '24 - 25', 'Agosto', 'Festa Folclórica Municipal'),
(34, '07', 'Setembro', 'Desfile Civico'),
(35, '07', 'Setembro', 'Abertura do Campeonato Municipal de Futsal'),
(36, '07', 'Setembro', 'Festival de Música Estudantil'),
(37, '30', 'Setembro', 'FLIQ - Feira Literária de Quissamã'),
(38, '12', 'Outubro', 'Comemoração Dia das Crianças'),
(39, '28', 'Outubro', 'Dia do Servidor Público'),
(40, '20', 'Novembro', 'Comemoração do Dia Nacional da Consciência Negra'),
(41, '17 - 18', 'Novembro', 'Campeonato de Pesca'),
(42, '08 - 09', 'Dezembro', 'Festival de Talentos Gospel'),
(43, '01-31', 'Dezembro', 'Mostra das Oficinas do Centro Cultural Sobradinho'),
(44, '01-31', 'Dezembro', 'Auto de Natal'),
(45, '31', 'Dezembro', 'Reveillon');

-- --------------------------------------------------------

--
-- Estrutura para tabela `images`
--

CREATE TABLE `images` (
  `image_id` int(255) NOT NULL,
  `entity_id` int(255) NOT NULL,
  `image_url` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `images`
--

INSERT INTO `images` (`image_id`, `entity_id`, `image_url`) VALUES
(1, 1, 'http://lucascraveiropaes.com/app/files/entities/1-1.jpg'),
(2, 1, 'http://lucascraveiropaes.com/app/files/entities/1-2.jpg'),
(3, 1, 'http://lucascraveiropaes.com/app/files/entities/1-3.jpg'),
(4, 1, 'http://lucascraveiropaes.com/app/files/entities/1-4.jpg'),
(5, 2, 'http://lucascraveiropaes.com/app/files/entities/2-1.jpg'),
(6, 2, 'http://lucascraveiropaes.com/app/files/entities/2-2.jpg'),
(7, 2, 'http://lucascraveiropaes.com/app/files/entities/2-3.jpg'),
(8, 2, 'http://lucascraveiropaes.com/app/files/entities/2-4.jpg'),
(9, 2, 'http://lucascraveiropaes.com/app/files/entities/2-5.jpg'),
(10, 3, 'http://lucascraveiropaes.com/app/files/entities/3-1.jpg'),
(11, 3, 'http://lucascraveiropaes.com/app/files/entities/3-2.jpg'),
(12, 3, 'http://lucascraveiropaes.com/app/files/entities/3-3.jpg'),
(13, 3, 'http://lucascraveiropaes.com/app/files/entities/3-4.jpg'),
(14, 4, 'http://lucascraveiropaes.com/app/files/entities/4-1.jpg'),
(15, 4, 'http://lucascraveiropaes.com/app/files/entities/4-2.jpg'),
(16, 5, 'http://lucascraveiropaes.com/app/files/entities/5-1.jpg'),
(17, 5, 'http://lucascraveiropaes.com/app/files/entities/5-2.jpg'),
(18, 5, 'http://lucascraveiropaes.com/app/files/entities/5-3.jpg'),
(19, 5, 'http://lucascraveiropaes.com/app/files/entities/5-4.jpg'),
(20, 6, 'http://lucascraveiropaes.com/app/files/entities/6-2.jpg'),
(21, 7, 'http://lucascraveiropaes.com/app/files/entities/7-1.jpg'),
(22, 7, 'http://lucascraveiropaes.com/app/files/entities/7-2.jpg'),
(23, 8, 'http://lucascraveiropaes.com/app/files/entities/8-1.jpg'),
(24, 8, 'http://lucascraveiropaes.com/app/files/entities/8-2.jpg'),
(25, 8, 'http://lucascraveiropaes.com/app/files/entities/8-3.jpg'),
(26, 44, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(27, 45, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(28, 46, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(29, 47, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(30, 48, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(31, 49, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(32, 50, 'http://lucascraveiropaes.com/app/files/guia.jpg'),
(33, 11, 'http://lucascraveiropaes.com/app/files/entities/11-1.jpg'),
(34, 11, 'http://lucascraveiropaes.com/app/files/entities/11-2.jpg'),
(35, 11, 'http://lucascraveiropaes.com/app/files/entities/11-3.jpg'),
(36, 11, 'http://lucascraveiropaes.com/app/files/entities/11-4.jpg'),
(37, 12, 'http://lucascraveiropaes.com/app/files/entities/12-1.jpg'),
(38, 12, 'http://lucascraveiropaes.com/app/files/entities/12-2.jpg'),
(39, 12, 'http://lucascraveiropaes.com/app/files/entities/12-3.jpg'),
(40, 12, 'http://lucascraveiropaes.com/app/files/entities/12-4.jpg'),
(41, 13, 'http://lucascraveiropaes.com/app/files/entities/13-1.jpg'),
(42, 13, 'http://lucascraveiropaes.com/app/files/entities/13-2.jpg'),
(43, 13, 'http://lucascraveiropaes.com/app/files/entities/13-3.jpg'),
(44, 13, 'http://lucascraveiropaes.com/app/files/entities/13-4.jpg'),
(45, 22, 'http://lucascraveiropaes.com/app/files/entities/22-1.jpg'),
(46, 22, 'http://lucascraveiropaes.com/app/files/entities/22-2.jpg'),
(47, 22, 'http://lucascraveiropaes.com/app/files/entities/22-3.jpg'),
(48, 17, 'http://lucascraveiropaes.com/app/files/entities/17-1.jpg'),
(49, 17, 'http://lucascraveiropaes.com/app/files/entities/17-2.jpg'),
(50, 17, 'http://lucascraveiropaes.com/app/files/entities/17-3.jpg'),
(51, 17, 'http://lucascraveiropaes.com/app/files/entities/17-4.jpg'),
(52, 38, 'http://lucascraveiropaes.com/app/files/entities/38-1.jpg'),
(53, 38, 'http://lucascraveiropaes.com/app/files/entities/38-2.jpg'),
(54, 38, 'http://lucascraveiropaes.com/app/files/entities/38-3.jpg'),
(55, 38, 'http://lucascraveiropaes.com/app/files/entities/38-4.jpg'),
(56, 38, 'http://lucascraveiropaes.com/app/files/entities/38-5.jpg'),
(57, 39, 'http://lucascraveiropaes.com/app/files/entities/39-1.jpg'),
(58, 39, 'http://lucascraveiropaes.com/app/files/entities/39-2.jpg'),
(59, 39, 'http://lucascraveiropaes.com/app/files/entities/39-3.jpg'),
(60, 40, 'http://lucascraveiropaes.com/app/files/entities/40-1.jpg'),
(61, 40, 'http://lucascraveiropaes.com/app/files/entities/40-2.jpg'),
(62, 40, 'http://lucascraveiropaes.com/app/files/entities/40-3.jpg'),
(63, 15, 'http://lucascraveiropaes.com/app/files/entities/15-1.jpg'),
(64, 15, 'http://lucascraveiropaes.com/app/files/entities/15-2.jpg'),
(65, 15, 'http://lucascraveiropaes.com/app/files/entities/15-3.jpg'),
(66, 16, 'http://lucascraveiropaes.com/app/files/entities/16-1.jpg'),
(67, 16, 'http://lucascraveiropaes.com/app/files/entities/16-2.jpg'),
(68, 31, 'http://lucascraveiropaes.com/app/files/entities/31-1.jpg'),
(69, 31, 'http://lucascraveiropaes.com/app/files/entities/31-2.jpg'),
(70, 31, 'http://lucascraveiropaes.com/app/files/entities/31-3.jpg'),
(71, 31, 'http://lucascraveiropaes.com/app/files/entities/31-4.jpg'),
(72, 41, 'http://lucascraveiropaes.com/app/files/entities/41-1.jpg'),
(73, 41, 'http://lucascraveiropaes.com/app/files/entities/41-2.jpg'),
(74, 41, 'http://lucascraveiropaes.com/app/files/entities/41-3.jpg'),
(75, 41, 'http://lucascraveiropaes.com/app/files/entities/41-4.jpg'),
(76, 9, 'http://lucascraveiropaes.com/app/files/entities/9-1.jpg'),
(77, 9, 'http://lucascraveiropaes.com/app/files/entities/9-2.jpg'),
(78, 9, 'http://lucascraveiropaes.com/app/files/entities/9-3.jpg'),
(80, 18, 'http://lucascraveiropaes.com/app/files/entities/18-1.jpg'),
(81, 19, 'http://lucascraveiropaes.com/app/files/entities/19-1.jpg'),
(82, 20, 'http://lucascraveiropaes.com/app/files/entities/20-1.jpg'),
(83, 20, 'http://lucascraveiropaes.com/app/files/entities/20-2.jpg'),
(84, 20, 'http://lucascraveiropaes.com/app/files/entities/20-3.jpg'),
(85, 20, 'http://lucascraveiropaes.com/app/files/entities/20-4.jpg'),
(86, 21, 'http://lucascraveiropaes.com/app/files/entities/21-1.jpg'),
(87, 23, 'http://lucascraveiropaes.com/app/files/entities/23-1.jpg'),
(88, 23, 'http://lucascraveiropaes.com/app/files/entities/23-2.jpg'),
(89, 24, 'http://lucascraveiropaes.com/app/files/entities/24-1.jpg'),
(90, 24, 'http://lucascraveiropaes.com/app/files/entities/24-2.jpg'),
(91, 24, 'http://lucascraveiropaes.com/app/files/entities/24-3.jpg'),
(92, 24, 'http://lucascraveiropaes.com/app/files/entities/24-4.jpg'),
(93, 25, 'http://lucascraveiropaes.com/app/files/entities/25-1.jpg'),
(94, 25, 'http://lucascraveiropaes.com/app/files/entities/25-2.jpg'),
(95, 25, 'http://lucascraveiropaes.com/app/files/entities/25-3.jpg'),
(96, 26, 'http://lucascraveiropaes.com/app/files/entities/26-1.jpg'),
(97, 26, 'http://lucascraveiropaes.com/app/files/entities/26-2.jpg'),
(98, 26, 'http://lucascraveiropaes.com/app/files/entities/26-3.jpg'),
(99, 27, 'http://lucascraveiropaes.com/app/files/entities/27-1.jpg'),
(100, 27, 'http://lucascraveiropaes.com/app/files/entities/27-2.jpg'),
(101, 28, 'http://lucascraveiropaes.com/app/files/entities/28-1.jpg'),
(102, 28, 'http://lucascraveiropaes.com/app/files/entities/28-2.jpg'),
(103, 28, 'http://lucascraveiropaes.com/app/files/entities/28-3.jpg'),
(104, 29, 'http://lucascraveiropaes.com/app/files/entities/29-1.jpg'),
(105, 29, 'http://lucascraveiropaes.com/app/files/entities/29-2.jpg'),
(106, 30, 'http://lucascraveiropaes.com/app/files/entities/30-1.jpg'),
(107, 30, 'http://lucascraveiropaes.com/app/files/entities/30-2.jpg'),
(108, 30, 'http://lucascraveiropaes.com/app/files/entities/30-3.jpg'),
(109, 32, 'http://lucascraveiropaes.com/app/files/entities/32-1.jpg'),
(110, 32, 'http://lucascraveiropaes.com/app/files/entities/32-2.jpg'),
(111, 32, 'http://lucascraveiropaes.com/app/files/entities/32-3.jpg'),
(112, 33, 'http://lucascraveiropaes.com/app/files/entities/33-1.jpg'),
(113, 33, 'http://lucascraveiropaes.com/app/files/entities/33-2.jpg'),
(114, 33, 'http://lucascraveiropaes.com/app/files/entities/33-3.jpg'),
(115, 34, 'http://lucascraveiropaes.com/app/files/entities/34-1.jpg'),
(116, 6, 'http://lucascraveiropaes.com/app/files/entities/6-3.jpg'),
(117, 6, 'http://lucascraveiropaes.com/app/files/entities/6-4.jpg'),
(118, 6, 'http://lucascraveiropaes.com/app/files/entities/6-5.jpg'),
(119, 54, 'http://lucascraveiropaes.com/app/files/entities/54-1.jpg'),
(120, 54, 'http://lucascraveiropaes.com/app/files/entities/54-2.jpg'),
(121, 54, 'http://lucascraveiropaes.com/app/files/entities/54-3.jpg'),
(122, 40, 'http://lucascraveiropaes.com/app/files/entities/40-4.jpg'),
(123, 40, 'http://lucascraveiropaes.com/app/files/entities/40-5.jpg'),
(124, 40, 'http://lucascraveiropaes.com/app/files/entities/40-6.jpg'),
(125, 58, 'http://lucascraveiropaes.com/app/files/entities/58-1.jpg'),
(126, 58, 'http://lucascraveiropaes.com/app/files/entities/58-2.jpg'),
(127, 58, 'http://lucascraveiropaes.com/app/files/entities/58-3.jpg'),
(128, 57, 'http://lucascraveiropaes.com/app/files/entities/57-1.jpg'),
(129, 57, 'http://lucascraveiropaes.com/app/files/entities/57-2.jpg'),
(130, 57, 'http://lucascraveiropaes.com/app/files/entities/57-3.jpg'),
(131, 57, 'http://lucascraveiropaes.com/app/files/entities/57-4.jpg'),
(132, 37, 'http://lucascraveiropaes.com/app/files/entities/37-1.jpg'),
(133, 54, 'http://lucascraveiropaes.com/app/files/entities/54-4.jpg'),
(134, 54, 'http://lucascraveiropaes.com/app/files/entities/54-5.jpg'),
(135, 59, 'http://lucascraveiropaes.com/app/files/entities/59-1.jpg'),
(136, 59, 'http://lucascraveiropaes.com/app/files/entities/59-2.jpg'),
(137, 59, 'http://lucascraveiropaes.com/app/files/entities/59-3.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rolezinho`
--

CREATE TABLE `rolezinho` (
  `id` int(255) UNSIGNED NOT NULL,
  `media` varchar(500) NOT NULL,
  `text` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` varchar(200) NOT NULL,
  `report` int(11) NOT NULL DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `rolezinho`
--

INSERT INTO `rolezinho` (`id`, `media`, `text`, `user_id`, `report`, `date`) VALUES
(16, 'http://lucascraveiropaes.com/app/files/rolezinhos/512f89164113b8a8.jpg', 'Vende-se', '1', 0, '2018-05-29 01:00:26'),
(17, 'http://lucascraveiropaes.com/app/files/rolezinhos/4b630f061a00bc10.jpg', 'Gdfh', '1', 0, '2018-05-29 02:00:26'),
(18, 'http://lucascraveiropaes.com/app/files/rolezinhos/bd2a18d3dc16ccb3.jpg', '', '8', 1, '2018-05-29 03:00:00'),
(21, 'http://lucascraveiropaes.com/app/files/rolezinhos/7a52a7019cb308c2.jpg', 'Fbhrhdbrh', '1', 0, '2018-05-29 15:26:52'),
(22, 'http://lucascraveiropaes.com/app/files/rolezinhos/2646405177eb8bd1.jpg', 'Boladão', '9', 0, '2018-05-29 19:43:22'),
(23, 'http://lucascraveiropaes.com/app/files/rolezinhos/bcfd4efd7aece672.jpg', 'Em Mato de Pipa com Dona Tetê', '10', 0, '2018-05-31 21:50:10'),
(24, 'http://lucascraveiropaes.com/app/files/rolezinhos/97b1887d7cbb1a6e.jpg', '', '10', 0, '2018-05-31 21:54:26'),
(26, 'http://lucascraveiropaes.com/app/files/rolezinhos/da83648c8c4a514f.jpg', 'Ivigu', '1', 0, '2018-06-01 04:07:57'),
(27, 'http://lucascraveiropaes.com/app/files/rolezinhos/0525b514a2e05c72.jpg', '', '19', 0, '2018-06-01 08:26:47'),
(28, 'http://lucascraveiropaes.com/app/files/rolezinhos/10958fa1f1542881.jpg', 'Cidade linda demais!', '1', 0, '2018-06-02 18:50:15'),
(29, 'http://lucascraveiropaes.com/app/files/rolezinhos/fedb12032f521215.jpg', 'Galerão', '1', 0, '2018-06-07 18:08:27');

-- --------------------------------------------------------

--
-- Estrutura para tabela `rolezinho_views`
--

CREATE TABLE `rolezinho_views` (
  `id` int(255) NOT NULL,
  `rolezinho_id` int(255) NOT NULL,
  `user_view_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

CREATE TABLE `user` (
  `id` int(255) NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(150) NOT NULL,
  `cpf` varchar(12) NOT NULL,
  `avatar` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Fazendo dump de dados para tabela `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `cpf`, `avatar`) VALUES
(1, 'Lucas Craveiro Paes', 'lucascraveiropaes123@gmail.com', 'a02e6f9f4b63c9f00232d1d478d5fb1ec7431a444f91fad58f3c7678a0113eac0dd10d8830be48c34a27f654319e026e47542dc1d5a603177aa641b882dac1f9', '15933133736', 'http://lucascraveiropaes.com/app/files/users/549edb31934dcbf5.jpg'),
(8, 'Letícia Ribeiro', 'leticiaribeirosanto@gmail.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '15811488793', 'http://lucascraveiropaes.com/app/files/user.png'),
(9, 'Jhonny Braga', 'srjbraga@gmail.com', '37b10c483214415de7566fbe272e2351e94c30dfefe5b25e4b5771c57554ecd0aba453364bdf0ad0f5a57178616843f0f94cc30971cc95091d6568fb348f75b0', '13767159708', 'http://lucascraveiropaes.com/app/files/user.png'),
(10, 'Alessandra China Leal Martins', 'karmicale@gmail.com', '96e7c602fe03c4fa1bd96212fa3d674eda1869a9d41e476d9549dd8d9f594f8364f339f96d39d4e43fbc0e7aa894e7dd98767d6dfa626e6b6af76f545ab234ae', '01272321762', 'http://lucascraveiropaes.com/app/files/user.png'),
(19, 'Cesa', 'Cesa@cesa.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '09048069793', 'http://lucascraveiropaes.com/app/files/user.png'),
(20, 'Thayná Rosário Lima da Silva', 'thayna.rosariob@gmail.com', '80f0fc186f78a684a490e7a3795ed5894e8f32031b1b13dbaece51041fa7c53a8a1ffc3f6c302e5b373a2f731392a1935810eddc5125853a74adc298a1cb9b1c', '15343652735', 'http://lucascraveiropaes.com/app/files/user.png'),
(21, 'Arnaldo Mattoso', 'arnaldomattoso@hotmail.com', '1104c6d94591e3679e75ee8ded03fdaf98de9d8226cc69f353cd6c0f300d77fe8d5f1194c82ba6bbf2db55e043611ad7e4276e29b8b84c77898ee5a4009ca6f1', '19155204791', 'http://lucascraveiropaes.com/app/files/user.png');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `commerce_category`
--
ALTER TABLE `commerce_category`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `entity`
--
ALTER TABLE `entity`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Índices de tabela `rolezinho`
--
ALTER TABLE `rolezinho`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rolezinho_views`
--
ALTER TABLE `rolezinho_views`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `commerce_category`
--
ALTER TABLE `commerce_category`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `entity`
--
ALTER TABLE `entity`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de tabela `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de tabela `rolezinho`
--
ALTER TABLE `rolezinho`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de tabela `rolezinho_views`
--
ALTER TABLE `rolezinho_views`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
