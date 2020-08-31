-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 01 Wrz 2020, 00:22
-- Wersja serwera: 10.3.22-MariaDB-1ubuntu1
-- Wersja PHP: 7.2.31-1+ubuntu20.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ventureapp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `article`
--

INSERT INTO `article` (`id`, `title`, `text`, `created_at`) VALUES
(1, 'nisi pharetra pulvinar', 'asdasdasdasdViverra luctus venenatis elementum lectus neque luctus senectus at curae, et dolor eros ultricies varius adipiscing torquent nisl platea, magna justo neque sollicitudin pretium ut tellus dui. Urna interdum sapien massa nibh dolor conubia vulputate blandit in donec id, eleifend tempus himenaeos at mauris viverra egestas quisque faucibus nullam. Nunc pharetra leo dolor eget iaculis lobortis hendrerit dolor primis tempus pharetra, nec mauris consectetur torquent suspendisse tempus quisque scelerisque ultricies.', '2019-06-14 07:51:00'),
(2, 'aenean porta urna', 'Enim integer sociosqu viverra vitae ornare a tempor eget, feugiat tristique aliquet hac cursus proin neque, libero diam pulvinar amet ipsum sem proin. Neque massa tortor torquent justo porttitor est ullamcorper, mauris suscipit dictumst aliquet ornare magna nec, turpis platea lobortis laoreet netus fermentum. Quisque dictumst eros mattis dui sagittis adipiscing, maecenas tristique class lobortis auctor tellus commodo, habitasse turpis class donec curabitur.', '2020-03-21 10:23:15'),
(3, 'id eleifend euismod', 'Duis laoreet bibendum aliquet posuere amet praesent sem mauris, vulputate aliquam ante senectus magna fermentum at, inceptos torquent mauris ipsum urna aliquam faucibus. Aptent consectetur inceptos tempus lacinia mauris dapibus aliquam massa, luctus molestie amet eu consectetur aenean id auctor, proin sit nisl cras volutpat pretium dapibus. Imperdiet erat pellentesque orci placerat conubia per, habitasse ad ornare nostra nullam, consectetur aenean sociosqu vehicula cubilia.', '2019-03-23 22:02:39'),
(4, 'blandit turpis fusce', 'Hendrerit pulvinar sit fringilla tellus ligula risus tempor nullam porttitor eleifend volutpat ut fringilla, cursus conubia dui varius commodo felis dolor donec class maecenas tincidunt. Cras non turpis orci quam mollis suscipit donec, morbi tempus erat curabitur volutpat phasellus. Libero posuere proin massa lorem justo tellus metus, massa fringilla aliquet elementum ultricies tellus, potenti nunc imperdiet non nibh per.', '2019-02-20 02:58:15'),
(5, 'malesuada est condimentum', 'asdasdAc tortor varius volutpat sodales ut tortor, donec quis nisl gravida donec dictum vivamus, aliquet lorem interdum faucibus hendrerit. Laoreet habitasse scelerisque fusce augue curabitur lorem vivamus fringilla, gravida placerat sapien donec ac metus vestibulum suspendisse, interdum lorem sem convallis augue etiam tincidunt. Lorem egestas aptent in erat tortor lacus, eleifend consectetur commodo metus laoreet, et dapibus cursus primis integer.', '2019-07-17 07:15:00'),
(6, 'neque consequat iaculis', 'Cras bibendum fringilla dictumst hac conubia malesuada sapien quam laoreet, condimentum dapibus eget mattis potenti volutpat tristique imperdiet, nam integer senectus volutpat rutrum potenti erat quisque. Pulvinar nunc condimentum a litora dictumst rutrum habitasse ut quis aenean egestas, habitant tempor lorem eros ac nisl ipsum vitae eros. Eu a aliquam curae faucibus at nulla tincidunt, sem praesent scelerisque duis gravida imperdiet massa, iaculis ante himenaeos ullamcorper erat accumsan.', '2019-10-29 00:43:28'),
(7, 'pulvinar potenti facilisis', 'Tristique massa ultricies nisi odio fusce elit, arcu maecenas fames tempor condimentum vitae, elit convallis ligula laoreet ante. Nulla interdum id nam gravida vehicula augue mi potenti erat vivamus consequat, molestie proin aliquam eleifend curabitur facilisis fames hendrerit nam hac. Scelerisque platea donec enim inceptos pharetra ipsum eleifend ornare laoreet sagittis, scelerisque condimentum interdum nam felis tempus cursus morbi habitasse taciti, est orci eleifend hac sodales sit cras ut aliquet.', '2020-08-28 03:35:39'),
(8, 'lacus potenti ac', 'Facilisis posuere odio sagittis auctor fermentum blandit eget feugiat, cras facilisis commodo euismod class hendrerit sagittis, congue cras metus senectus accumsan metus quisque. Volutpat proin phasellus feugiat posuere bibendum orci lacus odio tortor, proin consectetur volutpat quam id suspendisse amet tincidunt ipsum, quis inceptos bibendum ad vivamus netus scelerisque lacinia. Pulvinar fringilla aliquet et nulla auctor sagittis, quam ac dictumst donec metus rutrum semper, dictum enim est duis mauris.', '2019-11-02 20:27:45'),
(9, 'auctor primis ultrices', 'Est faucibus at maecenas morbi curabitur tellus leo morbi ultrices consectetur suspendisse, ad dictumst aenean conubia lectus tempus ut lacinia semper sociosqu vulputate, ac suscipit duis et morbi donec congue elit tellus a. Ut etiam orci maecenas inceptos mauris cursus molestie aliquet vestibulum cras aenean, donec aenean eu aliquam sodales hendrerit suscipit aenean magna donec sed, phasellus nam dui quisque semper platea dictumst etiam in sed. Vestibulum consectetur sagittis turpis mi platea nulla maecenas ullamcorper imperdiet tempor, donec mattis luctus vehicula neque tincidunt urna consectetur id purus, pellentesque turpis vitae sem risus eu nostra sollicitudin integer.', '2019-04-12 19:17:33'),
(10, 'sem porttitor duis', 'Vestibulum tempor nisl leo elit eros dictumst posuere convallis sagittis suspendisse, adipiscing massa sollicitudin interdum nullam cursus consectetur elementum. Inceptos velit sagittis vulputate porta vel, feugiat mollis etiam. Nisi eu rutrum quisque aliquam turpis congue, dictumst turpis magna quis egestas lobortis aptent, feugiat inceptos cursus vitae purus.', '2020-05-08 17:35:31'),
(11, 'ut purus consequat', 'Habitant ultricies eu aliquam viverra urna curae aliquam, venenatis dolor amet viverra eget praesent nam curae, pharetra nam sollicitudin gravida vehicula sodales. Magna ad nam erat ligula volutpat laoreet netus risus, curabitur molestie ut congue egestas suscipit mi. Porttitor aliquam dui proin ullamcorper bibendum torquent lacinia ornare, primis enim himenaeos nostra taciti bibendum quam.', '2020-04-25 19:52:59'),
(12, 'sagittis conubia euismod', 'Ipsum mollis luctus per malesuada ac primis elementum duis erat, ultricies pharetra aliquet aliquam quisque pretium nisi leo, augue dictum dapibus quisque lobortis neque class quisque. Curae a at primis netus nisl platea dui vehicula, viverra ac himenaeos curabitur enim nullam ullamcorper, vulputate egestas imperdiet turpis nam diam massa. Consectetur praesent sociosqu sapien donec nulla blandit laoreet molestie, id auctor scelerisque habitasse dapibus magna praesent, quis lectus porttitor in suscipit consequat dui.', '2019-03-22 10:12:34'),
(13, 'dictum semper per', 'Praesent placerat fermentum at consectetur malesuada lectus, consectetur sociosqu arcu mattis sapien, vestibulum aliquam quis nullam vel. Venenatis tincidunt taciti fusce quisque molestie ac ligula neque pellentesque tellus in ultricies, mattis curabitur aliquet porta nibh donec massa sodales ultrices posuere pharetra. Ullamcorper quisque tincidunt potenti dui purus quisque suspendisse, nibh platea ante sed condimentum gravida metus, consequat elementum nullam velit at sapien.', '2019-11-26 10:23:35'),
(14, 'praesent ante scelerisque', 'Class maecenas himenaeos facilisis aliquet vivamus litora erat potenti nam, adipiscing tincidunt litora rutrum diam sem vehicula vivamus suspendisse turpis, ad nam pellentesque etiam condimentum sociosqu tristique eget. Cursus maecenas porta tristique curae lectus faucibus ac, netus vestibulum class viverra diam suspendisse conubia, quis nullam aptent ullamcorper bibendum quis, fames porta vehicula rhoncus eros condimentum. Molestie tellus a etiam nulla augue aenean nisi, hac accumsan class amet consequat justo lectus morbi, netus fringilla donec interdum id viverra.', '2020-07-20 04:52:27'),
(15, 'aliquam id gravida', 'Ante nostra mauris cubilia nostra rutrum nostra vestibulum ad augue, donec taciti volutpat tempor ut etiam elementum diam, interdum pulvinar consectetur pellentesque eget aliquam interdum aliquet. Habitant nam feugiat urna litora tortor euismod enim ut posuere, suscipit risus nisl placerat nunc nibh quisque nisl conubia, mollis lobortis at pretium eros malesuada urna habitasse. Vitae hac pretium tristique egestas purus aliquet netus eleifend elementum nisl torquent, maecenas metus etiam mauris quisque torquent malesuada lorem sed cras.', '2019-09-16 23:52:42'),
(16, 'malesuada enim nam', 'Et duis pharetra augue condimentum tincidunt morbi ligula etiam, fermentum class facilisis justo vel tellus iaculis fames, etiam donec quam adipiscing fermentum phasellus consequat. Etiam quam ultrices hendrerit lectus vivamus conubia sociosqu curabitur laoreet phasellus imperdiet praesent, ipsum hendrerit sociosqu rhoncus euismod turpis fusce hac vulputate leo. Ullamcorper torquent conubia quis magna varius taciti neque maecenas, donec tempor dapibus a ac massa eu rhoncus, molestie class felis accumsan et consequat felis.', '2020-01-10 12:34:08'),
(17, 'massa conubia habitant', 'Etiam feugiat nullam per sagittis ullamcorper eros vehicula vel, mauris platea cursus nulla cursus orci fringilla lectus pellentesque, dictumst congue mollis quis netus gravida curabitur. Feugiat aenean tortor sem lectus tellus scelerisque arcu nisi est aliquam nunc, aliquam tempor tincidunt etiam convallis sed et magna pharetra magna lorem, sapien lacus auctor fringilla congue bibendum at interdum in sem. Suspendisse libero cubilia ut et integer vel eu rutrum vehicula aliquet, donec ornare maecenas nullam morbi urna feugiat dui.', '2020-02-14 09:17:27'),
(18, 'fames ut pulvinar', 'Facilisis cras sodales libero ligula venenatis ut donec, inceptos velit imperdiet orci felis id fames, nec sollicitudin primis aptent massa lacus. Non ullamcorper aenean rutrum id eros nullam donec, molestie aenean etiam sollicitudin duis habitasse malesuada aptent, vehicula etiam ad enim ipsum vitae. Massa eros velit convallis risus nisi felis vivamus aliquam, donec tempor neque ipsum auctor donec praesent, auctor in varius sapien volutpat neque purus.', '2019-03-07 04:02:55'),
(19, 'litora quisque ac', 'Himenaeos vel arcu justo velit aptent vestibulum placerat morbi, dictumst himenaeos ipsum molestie quisque integer luctus, commodo quis nunc egestas nam fermentum euismod. Nulla scelerisque etiam pretium conubia dictum vivamus bibendum vestibulum mauris nisi, vel sit mollis venenatis hac tortor neque ullamcorper consequat arcu, class egestas ut nostra orci commodo arcu felis placerat. Viverra turpis habitasse urna eu velit quis conubia sit aliquam praesent id dapibus sit ornare, est ipsum curabitur habitasse dolor eget molestie facilisis sed mollis leo accumsan.', '2020-04-30 08:57:31'),
(20, 'tincidunt mi dapibus', 'Quisque est lobortis diam in donec aliquam metus, primis dolor sodales nibh ut laoreet. Placerat quisque elit enim velit elit cras ultrices nibh consequat arcu viverra ad fermentum, libero non dui non odio magna tellus curabitur taciti justo turpis. Condimentum ligula pretium dolor nostra elit ac tincidunt habitasse porta aenean, senectus curae dapibus augue netus odio faucibus etiam imperdiet.', '2020-03-18 10:14:01'),
(21, 'donec praesent nibh', 'Cursus lorem ligula tellus class lacinia blandit nec condimentum curae aliquam rhoncus massa, felis maecenas enim sodales urna vehicula fringilla dui vehicula sagittis viverra. Nunc etiam praesent fames euismod curae feugiat iaculis volutpat lobortis, suscipit praesent quis euismod tristique rhoncus vehicula bibendum conubia, turpis consequat tempus bibendum non amet egestas tempus. Ultrices aenean netus tristique etiam inceptos sagittis, sapien sollicitudin pellentesque pulvinar curabitur pulvinar, ante cubilia ultrices porttitor congue.', '2020-02-03 14:08:42'),
(22, 'class auctor consectetur', 'Faucibus semper at vel fames condimentum sagittis volutpat aenean condimentum eu posuere venenatis, duis hac litora ullamcorper ipsum sapien volutpat condimentum placerat lectus auctor rutrum, libero ultrices per senectus accumsan eleifend semper tellus nulla ultrices placerat. Dui ut ultricies quisque iaculis mattis curae risus posuere malesuada integer erat conubia feugiat, proin mattis velit sapien mauris eros sem eget sapien dapibus potenti. Morbi quam potenti fusce scelerisque sem arcu class magna vitae blandit sit massa conubia nostra pretium, massa ligula risus interdum eleifend porttitor semper arcu vestibulum ut sapien aenean suscipit.', '2019-01-15 05:32:57'),
(23, 'class blandit velit', 'Pulvinar libero faucibus sagittis taciti magna eget nibh aptent viverra mauris dictum suscipit, ultrices mauris a mauris feugiat quam elementum sodales volutpat torquent nam, nullam pretium per a hendrerit duis ante purus augue lacinia cursus. Odio egestas vitae maecenas lobortis taciti fermentum nec et himenaeos aenean habitasse senectus, vel aliquam velit luctus interdum viverra diam eget proin fringilla aliquam. Urna enim donec mollis morbi laoreet metus ultrices facilisis pellentesque, augue pellentesque class at dictum mattis commodo.', '2019-04-18 10:43:23'),
(24, 'lobortis vel ligula', 'Dolor eleifend eros accumsan donec etiam tristique orci malesuada nam curae interdum ligula id, leo himenaeos turpis cras himenaeos ultricies ipsum viverra erat mattis a lorem. Odio aenean integer semper nostra feugiat aliquet duis potenti amet, sed erat elit nostra turpis himenaeos vestibulum euismod quisque, etiam mauris pellentesque nostra dui primis habitant eleifend. Mollis tristique dapibus cubilia massa semper phasellus interdum, id gravida auctor nulla maecenas per curabitur pharetra, auctor consequat consectetur etiam inceptos magna.', '2019-07-24 23:14:54'),
(25, 'praesent at lectus', 'Duis dictum tempor taciti in hac ut in vestibulum cubilia platea, vivamus scelerisque varius tortor et hendrerit vivamus himenaeos etiam vehicula, primis non nisl amet leo pretium mollis nullam mollis. Mi faucibus condimentum himenaeos non sed vulputate congue consequat viverra, integer cursus cubilia lacus gravida viverra vitae ac. Duis class imperdiet ultrices hac gravida donec ut viverra, vestibulum dolor etiam viverra curabitur fames orci venenatis, commodo faucibus odio curabitur diam himenaeos aliquet.', '2020-05-29 09:25:19'),
(26, 'fermentum inceptos aliquet', 'Sodales pulvinar enim leo porttitor accumsan mauris, gravida euismod ornare sagittis turpis, adipiscing ut pretium nunc feugiat. Interdum rutrum himenaeos urna sollicitudin eget volutpat ante ipsum, etiam habitant aenean porta nulla etiam nullam enim est, blandit proin potenti nam massa scelerisque ligula. Elit odio est rutrum sem lobortis vitae nostra non, donec tristique cras porttitor vehicula imperdiet nunc sodales litora, sagittis fames purus in lorem nisi auctor.', '2019-12-28 16:51:33'),
(27, 'inceptos elementum convallis', 'Metus adipiscing eleifend ullamcorper mattis arcu, erat ligula quis elit ut vestibulum, facilisis feugiat donec quis. Accumsan porttitor torquent per consequat tincidunt quis feugiat eleifend adipiscing, aenean leo luctus vulputate arcu iaculis etiam felis, in mi velit donec maecenas dictumst curabitur nec. Ornare morbi nisl nisi vulputate, ullamcorper tempus magna pharetra viverra, quam habitasse felis.', '2019-04-30 09:25:34'),
(28, 'risus tempus himenaeos', 'Magna accumsan nisl euismod proin luctus lectus, eros placerat aenean sociosqu laoreet consequat commodo, dictum mi hendrerit litora ut. Velit sociosqu habitant tincidunt fusce in convallis, vel nunc dictumst conubia orci duis primis, odio magna neque iaculis leo. Feugiat per non aenean nunc laoreet porta molestie praesent, nisl nullam potenti erat gravida vitae cubilia.', '2019-12-25 02:57:06'),
(29, 'scelerisque tincidunt litora', 'Aliquet donec cras consequat nisl neque praesent est lacus fermentum justo eleifend, risus molestie ultrices habitant at semper curae mollis massa. Per turpis pretium arcu ullamcorper sapien gravida netus praesent venenatis, rhoncus dolor ultricies arcu habitant aliquet dapibus vivamus auctor erat, mi dictum laoreet aptent condimentum sit mollis suspendisse. Lorem curabitur quis a aptent leo ad conubia tincidunt, scelerisque laoreet eros viverra velit sapien.', '2020-04-25 11:00:00'),
(30, 'mattis ut nulla', 'Vivamus curabitur adipiscing metus pellentesque pharetra taciti mi imperdiet potenti at, vestibulum pharetra eget turpis eu nostra nunc venenatis aliquet mi sem, mi torquent quisque cursus fringilla taciti rhoncus potenti vulputate. Viverra nunc maecenas sollicitudin eu interdum diam rhoncus nam aenean nostra, per ac tristique leo donec pellentesque urna ad aenean per, quam mauris morbi mattis amet per commodo fames blandit. Ipsum quisque elementum integer viverra dictumst varius eleifend iaculis adipiscing magna, porta tristique morbi eros eu maecenas mauris tristique enim.', '2020-04-11 14:34:29'),
(31, 'Artrykasd', 'asfasfasfasfasfasf', '2019-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `article_author`
--

CREATE TABLE `article_author` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `article_author`
--

INSERT INTO `article_author` (`article_id`, `author_id`) VALUES
(1, 1),
(1, 3),
(2, 3),
(3, 2),
(3, 3),
(4, 2),
(4, 3),
(5, 2),
(5, 5),
(6, 1),
(6, 3),
(7, 2),
(7, 4),
(8, 1),
(8, 4),
(9, 2),
(9, 3),
(10, 1),
(10, 5),
(11, 1),
(12, 1),
(12, 5),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 3),
(15, 5),
(16, 2),
(16, 3),
(17, 2),
(17, 3),
(18, 3),
(18, 5),
(19, 3),
(19, 5),
(20, 2),
(21, 3),
(21, 5),
(22, 3),
(22, 4),
(23, 2),
(23, 4),
(24, 2),
(24, 5),
(25, 3),
(26, 2),
(26, 3),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 3),
(30, 2),
(30, 3),
(31, 1),
(31, 2),
(31, 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Zrzut danych tabeli `author`
--

INSERT INTO `author` (`id`, `name`) VALUES
(1, 'Nasty Castlevania Saloon'),
(2, 'Barbie\'s Wizard Jr.'),
(3, 'Colonial Vocabulary Agent'),
(4, 'Hitler\'s Bungie Quiz'),
(5, 'Legend of the Sailor Crusade');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Zrzut danych tabeli `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20200828183429', '2020-08-31 22:19:57', 142);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `article_author`
--
ALTER TABLE `article_author`
  ADD PRIMARY KEY (`article_id`,`author_id`),
  ADD KEY `IDX_D7684F487294869C` (`article_id`),
  ADD KEY `IDX_D7684F48F675F31B` (`author_id`);

--
-- Indeksy dla tabeli `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- AUTO_INCREMENT dla tabel zrzutów
--

--
-- AUTO_INCREMENT dla tabeli `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT dla tabeli `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `article_author`
--
ALTER TABLE `article_author`
  ADD CONSTRAINT `FK_D7684F487294869C` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D7684F48F675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
