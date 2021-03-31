-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 31, 2021 at 08:44 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `backend-tickitz`
--

-- --------------------------------------------------------

--
-- Table structure for table `casts`
--

CREATE TABLE `casts` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casts`
--

INSERT INTO `casts` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Natalie Portman', '2021-03-01 04:34:32', '2021-03-06 18:23:41'),
(2, 'Christian Bale', '2021-03-01 04:34:32', '2021-03-06 18:23:50'),
(3, 'Lucille La Verne', '2021-03-01 05:07:48', '2021-03-06 18:22:55'),
(4, 'Adriana Caselotti', '2021-03-01 05:08:18', NULL),
(5, 'Raven Reliford', '2021-03-06 18:19:16', NULL),
(6, 'Carlos Leos', '2021-03-06 18:19:16', NULL),
(7, 'Tyrongela Ross', '2021-03-06 18:19:41', NULL),
(8, 'Kim A. Williams', '2021-03-06 18:19:41', NULL),
(9, 'Harrison Kiernan', '2021-03-06 18:25:07', NULL),
(10, 'Melvin Ward', '2021-03-06 18:25:07', NULL),
(11, 'Xiaotong Guan', '2021-03-06 18:26:05', NULL),
(12, 'Ming Fan', '2021-03-06 18:26:05', NULL),
(13, 'Yingjun Zhao', '2021-03-06 18:26:47', NULL),
(14, 'Katrina Bowden', '2021-03-06 18:27:44', NULL),
(15, 'Tim Kano', '2021-03-06 18:27:44', NULL),
(16, 'Steve Maresca', '2021-03-06 18:33:04', NULL),
(17, 'Kerestyn Walsh', '2021-03-06 18:33:04', NULL),
(18, 'Amelia Conway', '2021-03-06 18:33:16', NULL),
(19, 'Bob Odenkirk', '2021-03-06 18:44:20', NULL),
(20, 'Christopher Lloyd', '2021-03-06 18:44:20', NULL),
(21, 'William Hanna', '2021-03-06 18:45:10', NULL),
(22, 'Mel Blanc', '2021-03-06 18:45:10', NULL),
(23, 'Bruce Willis', '2021-03-06 18:53:27', NULL),
(24, 'Adelaide Kane', '2021-03-06 18:53:27', NULL),
(25, 'Millie Bobby Brown', '2021-03-06 18:53:55', NULL),
(26, 'Kyle Chandler', '2021-03-06 18:53:55', NULL),
(27, 'Rebecca Hall', '2021-03-06 18:54:07', NULL),
(28, 'Kelly Marie Tran', '2021-03-06 19:26:51', NULL),
(29, 'Awkwafina', '2021-03-06 19:26:51', NULL),
(30, 'Izaac Wang', '2021-03-06 19:26:58', NULL),
(31, 'Taylor Takahashi', '2021-03-06 19:27:24', NULL),
(32, 'Taylour Paige', '2021-03-06 19:27:24', NULL),
(33, 'Pamelyn Chee', '2021-03-06 19:27:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `image` varchar(80) NOT NULL,
  `address` text NOT NULL,
  `priceWeekend` int(11) NOT NULL,
  `priceWeekdays` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `name`, `image`, `address`, `priceWeekend`, `priceWeekdays`, `createdAt`, `updatedAt`) VALUES
(1, 'hiflix mataram', 'https://i.imgur.com/Xq4Tf4t.png', 'Jl Pejanggik 65,Mataram Timur', 40000, 35000, '2021-03-03 13:32:23', '2021-03-06 19:36:42'),
(4, 'ebv mataram', 'https://i.imgur.com/Xq4Tf4t.png', 'Jl Magelang 14,Mataram Barat', 25000, 50000, '2021-03-04 13:30:16', '2021-03-06 19:36:53'),
(5, 'cineone mataram', 'https://i.imgur.com/XuTSuxa.png', 'Jl RA Kartini 105,Monjok', 30000, 25000, '2021-03-06 19:34:28', '2021-03-06 19:37:06'),
(6, 'hiflix jakarta', 'https://i.imgur.com/uQ3Pz0R.png', 'Jl Salemba Tgh 13,Paseban', 30000, 40000, '2021-03-06 19:34:28', NULL),
(7, 'ebv jakarta', 'https://i.imgur.com/Xq4Tf4t.png', 'JL. Buncit Persada, No.1', 40000, 25000, '2021-03-06 19:36:01', NULL),
(8, 'cineone jakarta', 'https://i.imgur.com/XuTSuxa.png', 'Jl Mangga Dua Raya Grand Boutique Centre Bl E/19,Ancol', 40000, 35000, '2021-03-06 19:36:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cinemas_movies`
--

CREATE TABLE `cinemas_movies` (
  `id` int(11) NOT NULL,
  `idCinemas` int(11) NOT NULL,
  `idMovies` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cinemas_movies`
--

INSERT INTO `cinemas_movies` (`id`, `idCinemas`, `idMovies`, `createdAt`, `updatedAt`) VALUES
(3, 1, 6, '2021-03-06 19:38:59', NULL),
(4, 1, 7, '2021-03-06 19:38:59', NULL),
(5, 1, 8, '2021-03-06 19:39:30', NULL),
(6, 1, 9, '2021-03-06 19:39:30', NULL),
(7, 1, 10, '2021-03-06 19:39:44', NULL),
(8, 1, 11, '2021-03-06 19:39:44', NULL),
(9, 1, 12, '2021-03-06 19:40:04', NULL),
(10, 1, 13, '2021-03-06 19:40:04', NULL),
(11, 1, 14, '2021-03-06 19:40:15', NULL),
(12, 1, 15, '2021-03-06 19:40:15', NULL),
(13, 1, 16, '2021-03-06 19:40:26', NULL),
(14, 1, 17, '2021-03-06 19:40:26', NULL),
(15, 1, 18, '2021-03-06 19:40:37', NULL),
(16, 1, 19, '2021-03-06 19:40:37', NULL),
(17, 1, 20, '2021-03-06 19:40:48', NULL),
(18, 1, 21, '2021-03-06 19:40:48', NULL),
(19, 1, 22, '2021-03-06 19:40:53', NULL),
(20, 6, 6, '2021-03-06 19:41:24', NULL),
(21, 6, 7, '2021-03-06 19:41:24', NULL),
(22, 6, 8, '2021-03-06 19:41:41', NULL),
(23, 6, 9, '2021-03-06 19:41:41', NULL),
(24, 6, 10, '2021-03-06 19:41:54', NULL),
(25, 6, 11, '2021-03-06 19:41:54', NULL),
(26, 6, 12, '2021-03-06 19:42:11', NULL),
(27, 6, 13, '2021-03-06 19:42:11', NULL),
(28, 6, 14, '2021-03-06 19:42:25', NULL),
(29, 6, 15, '2021-03-06 19:42:25', NULL),
(30, 6, 16, '2021-03-06 19:42:36', NULL),
(31, 6, 17, '2021-03-06 19:42:36', NULL),
(32, 6, 18, '2021-03-06 19:42:52', NULL),
(33, 6, 19, '2021-03-06 19:42:52', NULL),
(34, 6, 20, '2021-03-06 19:43:37', NULL),
(35, 6, 21, '2021-03-06 19:43:37', NULL),
(36, 6, 22, '2021-03-06 19:43:44', NULL),
(37, 4, 6, '2021-03-06 19:44:28', NULL),
(38, 4, 7, '2021-03-06 19:44:28', NULL),
(39, 4, 8, '2021-03-06 19:44:38', NULL),
(40, 4, 9, '2021-03-06 19:44:38', NULL),
(41, 4, 10, '2021-03-06 19:44:56', NULL),
(42, 4, 11, '2021-03-06 19:44:56', NULL),
(43, 4, 12, '2021-03-06 19:45:53', NULL),
(44, 4, 13, '2021-03-06 19:45:53', NULL),
(45, 5, 14, '2021-03-06 19:46:07', NULL),
(46, 5, 15, '2021-03-06 19:46:07', NULL),
(47, 5, 16, '2021-03-06 19:46:16', NULL),
(48, 5, 17, '2021-03-06 19:46:16', NULL),
(49, 5, 18, '2021-03-06 19:46:28', NULL),
(50, 5, 19, '2021-03-06 19:46:28', NULL),
(51, 5, 20, '2021-03-06 19:46:40', NULL),
(52, 5, 21, '2021-03-06 19:46:40', NULL),
(53, 5, 22, '2021-03-06 19:46:46', NULL),
(54, 7, 6, '2021-03-06 19:47:01', NULL),
(55, 7, 7, '2021-03-06 19:47:01', NULL),
(56, 7, 8, '2021-03-06 19:47:13', NULL),
(57, 7, 9, '2021-03-06 19:47:13', NULL),
(58, 7, 10, '2021-03-06 19:47:29', NULL),
(59, 7, 11, '2021-03-06 19:47:29', NULL),
(60, 7, 12, '2021-03-06 19:47:45', NULL),
(61, 7, 13, '2021-03-06 19:47:45', NULL),
(62, 8, 14, '2021-03-06 19:47:56', NULL),
(63, 8, 15, '2021-03-06 19:47:56', NULL),
(64, 8, 16, '2021-03-06 19:48:06', NULL),
(65, 8, 17, '2021-03-06 19:48:06', NULL),
(66, 8, 18, '2021-03-06 19:48:15', NULL),
(67, 8, 19, '2021-03-06 19:48:15', NULL),
(68, 8, 20, '2021-03-06 19:48:25', NULL),
(69, 8, 21, '2021-03-06 19:48:25', NULL),
(70, 8, 22, '2021-03-06 19:48:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'mataram', '2021-03-04 12:58:11', NULL),
(2, 'jakarta', '2021-03-04 12:58:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities_cinemas`
--

CREATE TABLE `cities_cinemas` (
  `id` int(11) NOT NULL,
  `idCities` int(11) NOT NULL,
  `idCinemas` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities_cinemas`
--

INSERT INTO `cities_cinemas` (`id`, `idCities`, `idCinemas`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2021-03-04 13:29:44', NULL),
(2, 1, 4, '2021-03-04 13:30:38', '2021-03-06 19:37:31'),
(3, 1, 5, '2021-03-06 19:37:49', NULL),
(4, 2, 6, '2021-03-06 19:37:49', NULL),
(5, 2, 7, '2021-03-06 19:37:58', NULL),
(6, 2, 8, '2021-03-06 19:37:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'Action', '2021-02-26 15:38:02', NULL),
(2, 'Adventure', '2021-02-26 15:38:16', NULL),
(4, 'Sci-Fi', '2021-02-26 15:41:17', NULL),
(5, 'Crime', '2021-02-26 15:44:42', NULL),
(6, 'Drama', '2021-02-26 15:44:47', NULL),
(7, 'Thriller', '2021-02-26 15:44:54', NULL),
(8, 'Horror', '2021-02-26 16:04:56', NULL),
(9, 'Comedy', '2021-03-06 18:17:03', NULL),
(10, 'Biography', '2021-03-06 18:17:03', NULL),
(11, 'Family', '2021-03-06 18:47:38', NULL),
(12, 'Fantasy', '2021-03-06 19:29:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `image` varchar(255) NOT NULL,
  `releaseDate` date NOT NULL,
  `endDate` date NOT NULL,
  `duration` time NOT NULL,
  `directedBy` varchar(80) NOT NULL,
  `synopsis` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `name`, `image`, `releaseDate`, `endDate`, `duration`, `directedBy`, `synopsis`, `createdAt`, `updateAt`) VALUES
(1, 'Avengers: Endgame', 'uploads1.jpg', '2019-04-26', '2019-05-26', '02:00:00', 'Anthony Russo', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos actions and restore balance to the universe.', '2021-02-26 15:38:35', NULL),
(2, 'Dark Phoenix', 'uploads2.jpg', '2019-06-07', '2019-07-07', '02:00:00', 'Simon Kinberg', 'Jean Grey begins to develop incredible powers that corrupt and turn her into a Dark Phoenix. Now the X-Men will have to decide if the life of a team member is worth more than all of humanity.', '2021-02-26 15:41:32', NULL),
(3, 'Joker', 'uploads3.jpg', '2019-10-04', '2019-11-04', '02:00:00', 'Todd Phillips', 'An original standalone origin story of the iconic villain not seen before on the big screen, it\'s a gritty character study of Arthur Fleck, a man disregarded by society, and a broader cautionary tale.', '2021-02-26 15:47:36', NULL),
(6, 'Great White', 'https://xl.movieposterdb.com/20_06/2021/8435002/xl_8435002_320772f9.jpg', '2021-02-26', '2021-03-26', '02:00:00', 'Martin Wilson', 'A fun filled flight to a remote atoll turns into a nightmare for five passengers when their seaplane is destroyed in a freak accident and they are trapped on a raft, 100 miles from shore with man-eating sharks lurking beneath the surface.', '2021-02-26 16:01:43', NULL),
(7, 'Plaguepits', 'https://xl.movieposterdb.com/20_06/2021/11362206/xl_11362206_f18ad779.jpg', '2021-02-24', '2021-03-24', '01:30:00', 'Peter Thorndike', 'Paranormal investigators enter an uncharted forest and encounter a legion of Carriers - living dead plague carriers who perished there centuries before.', '2021-02-26 16:05:19', NULL),
(8, 'Oversize Love', 'https://xl.movieposterdb.com/20_06/2021/11575350/xl_11575350_1469452d.jpg', '2021-02-20', '2021-03-20', '01:40:00', 'Linzi Zhang', 'Because of an unexpected opportunity, Lin Xiao Xi who used to be an overweight girl transforms into a beauty named Alice, thus starting a story full of twists and laughs when she is caught between her childhood friend and her lifelong crush. Lin Xiao Xi is an optimistic and cheerful girl who loves chasing after celebrities.', '2021-02-26 16:07:28', NULL),
(9, 'Snow White', 'https://xl.movieposterdb.com/20_06/2022/6208148/xl_6208148_688b81fa.jpg', '2022-06-06', '2022-07-06', '01:50:00', 'Marc Webb', 'A live-action adaptation of the classic fairy tale about a beautiful young princess who, while being stalked by a jealous Queen, seeks shelter at the home of seven dwarfs in the German countryside.', '2021-03-01 05:07:30', '2021-03-01 05:10:39'),
(10, 'Black Fury', 'https://xl.movieposterdb.com/20_06/2022/8154964/xl_8154964_923be7bb.jpg', '2022-04-08', '2022-05-08', '01:40:00', 'Stanley V. Henson Jr.', 'Marla was a wealthy socialite who discovered that another girl was wearing the same outfit to a party. Her sister Marlene, suggested that (to prevent embarrassment) But, Marla never made it.', '2021-03-01 05:44:46', NULL),
(11, 'Thor', 'https://xl.movieposterdb.com/20_01/2021/10648342/xl_10648342_99ebb7c3.jpg', '2021-11-05', '2021-12-05', '01:35:00', 'Taika Waititi', 'The sequel to Thor: Ragnarok and the fourth movie in the Thor saga.', '2021-03-01 05:50:21', '2021-03-01 05:54:38'),
(12, 'Gone, Gone, Jack!', 'https://xl.movieposterdb.com/20_06/2021/6499514/xl_6499514_b3329258.jpg', '2021-11-03', '2021-12-03', '01:40:00', 'Hank Orion', 'Emotionally unstable writer deals with false expectations of reality.\r\n\r\n', '2021-03-06 18:09:11', NULL),
(13, 'The Little Things', 'https://xl.movieposterdb.com/21_01/2021/10016180/xl_10016180_c395e77a.jpg', '2021-01-03', '2021-02-03', '01:50:00', 'John Lee Hancock', 'Two cops track down a serial killer.', '2021-03-06 18:09:11', '2021-03-07 12:59:40'),
(14, 'The Woman Who Robbed the Stagecoach', 'https://xl.movieposterdb.com/20_06/2021/8452666/xl_8452666_93877e37.jpg', '2021-12-01', '2022-01-01', '01:40:00', 'Travis Mills', 'This film tells the true story of Pearl Hart, a female outlaw who became famous for robbing a stagecoach', '2021-03-06 18:15:47', NULL),
(15, 'Crazy Weapon 5: Back for the First Time', 'https://xl.movieposterdb.com/20_06/2021/8538244/xl_8538244_178b5634.jpg', '2021-02-18', '2021-03-18', '01:50:00', 'Antoine M. Dillard', 'In the year 2297 Las Vegas, the master thief and escape artist, Wanda Whispers Jones has stolen a Crazy Weapon from the distant future (The year 4225/Envision City) and plans on using it', '2021-03-06 18:15:47', NULL),
(16, 'Bad Influence', 'https://xl.movieposterdb.com/20_06/2021/8769372/xl_8769372_9db9232e.jpg', '2021-02-14', '2021-03-14', '01:50:00', 'Andreas Toumbas', 'Introvert Anthony attends his best friend Nick\'s dinner party and things seem to be going fine until brash, loud-mouthed Steve arrives. Things go bad to worse as Anthony struggles to control the troublesome and alcohol-fueled Steve.', '2021-03-06 18:32:15', NULL),
(17, 'Nobody', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/oBgWY00bEFeZ9N25wWVyuQddbAo.jpg', '2021-03-26', '2021-04-26', '01:32:00', 'Ilya Naishuller', 'Hutch Mansell, a suburban dad, overlooked husband, nothing neighbor, a nobody. When two thieves break into his home one night, Hutchs unknown long-simmering rage is ignited and propels him on a brutal path that will uncover dark secrets he fought to leave behind.', '2021-03-06 18:43:52', NULL),
(18, 'Tom & Jerry', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/6KErczPBROQty7QoIsaa6wJYXZi.jpg', '2021-03-10', '2021-04-10', '01:41:00', 'Tim Story', 'Tom the cat and Jerry the mouse get kicked out of their home and relocate to a fancy New York hotel, where a scrappy employee named Kayla will lose her job if she can’t evict Jerry before a high-class wedding at the hotel. Her solution? Hiring Tom to get rid of the pesky mouse', '2021-03-06 18:43:52', NULL),
(19, 'Cosmic Sin', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/rMMvawtaQGvXQq2vqrpg3vtJfwa.jpg', '2021-03-12', '2021-04-12', '01:33:00', 'Edward Drake', 'Seven rogue soldiers launch a preemptive strike against a newly discovered alien civilization in the hopes of ending an interstellar war before it starts.', '2021-03-06 18:52:55', NULL),
(20, 'Godzilla vs. Kong', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/pgqgaUx1cJb5oZQQ5v0tNARCeBp.jpg', '2021-03-31', '2021-04-30', '01:53:00', 'Adam Wingard', 'In a time when monsters walk the Earth, humanity\'s fight for its future sets Godzilla and Kong on a collision course that will see the two most powerful forces of nature on the planet collide in a spectacular battle for the ages.', '2021-03-06 18:52:55', NULL),
(21, 'Raya and the Last Dragon', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lPsD10PP4rgUGiGR4CCXA6iY0QQ.jpg', '2021-03-05', '2021-04-05', '01:47:00', 'Don Hall', 'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and it’s up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', '2021-03-06 19:26:26', NULL),
(22, 'Boogie', 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/nqukNKRw6KsE6X3SqyuzXaW8flQ.jpg', '2021-03-05', '2021-04-05', '01:29:00', 'Eddie Huang', 'Alfred Boogie Chin is a basketball phenom living in Queens, New York, who dreams of one day playing in the NBA. While his parents pressure him to focus on earning a scholarship to an elite college, Boogie must find a way to navigate a new girlfriend, high school, on-court rivals and the burden of expectation.', '2021-03-06 19:26:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_casts`
--

CREATE TABLE `movie_casts` (
  `id` int(11) NOT NULL,
  `idMovie` int(11) NOT NULL,
  `idCast` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_casts`
--

INSERT INTO `movie_casts` (`id`, `idMovie`, `idCast`, `createdAt`, `updatedAt`) VALUES
(1, 6, 14, '2021-03-01 04:35:06', '2021-03-06 18:28:17'),
(2, 8, 13, '2021-03-01 04:35:06', '2021-03-06 18:27:03'),
(3, 8, 11, '2021-03-01 04:52:17', '2021-03-06 18:26:21'),
(4, 8, 12, '2021-03-01 04:52:17', '2021-03-06 18:26:29'),
(5, 9, 4, '2021-03-01 05:08:35', NULL),
(6, 9, 3, '2021-03-01 05:08:35', NULL),
(7, 10, 9, '2021-03-01 05:45:16', '2021-03-06 18:25:21'),
(8, 10, 10, '2021-03-01 05:45:16', '2021-03-06 18:25:25'),
(9, 11, 1, '2021-03-01 05:51:49', NULL),
(10, 11, 2, '2021-03-01 05:51:49', '2021-03-06 18:24:17'),
(11, 14, 8, '2021-03-06 18:20:18', NULL),
(12, 15, 5, '2021-03-06 18:20:18', NULL),
(13, 15, 6, '2021-03-06 18:20:34', NULL),
(14, 15, 7, '2021-03-06 18:20:34', NULL),
(15, 6, 15, '2021-03-06 18:28:32', NULL),
(16, 16, 16, '2021-03-06 18:33:37', NULL),
(17, 16, 17, '2021-03-06 18:33:37', NULL),
(18, 16, 18, '2021-03-06 18:34:13', NULL),
(19, 17, 19, '2021-03-06 18:44:39', NULL),
(20, 17, 20, '2021-03-06 18:44:39', NULL),
(21, 18, 21, '2021-03-06 18:45:29', NULL),
(22, 18, 22, '2021-03-06 18:45:29', NULL),
(23, 19, 23, '2021-03-06 18:54:49', NULL),
(24, 19, 24, '2021-03-06 18:54:49', NULL),
(25, 20, 25, '2021-03-06 18:55:01', '2021-03-06 19:22:00'),
(26, 20, 26, '2021-03-06 18:55:01', '2021-03-06 19:22:09'),
(27, 20, 27, '2021-03-06 18:55:11', '2021-03-06 19:22:14'),
(28, 21, 28, '2021-03-06 19:27:49', NULL),
(29, 21, 29, '2021-03-06 19:27:49', NULL),
(30, 21, 30, '2021-03-06 19:28:08', NULL),
(31, 22, 31, '2021-03-06 19:28:08', NULL),
(32, 22, 32, '2021-03-06 19:28:34', NULL),
(33, 22, 33, '2021-03-06 19:28:34', NULL),
(34, 13, 22, '2021-03-07 13:00:11', NULL),
(35, 12, 23, '2021-03-30 14:48:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `movie_genres`
--

CREATE TABLE `movie_genres` (
  `id` int(11) NOT NULL,
  `idMovie` int(11) NOT NULL,
  `idGenre` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie_genres`
--

INSERT INTO `movie_genres` (`id`, `idMovie`, `idGenre`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2021-02-26 15:38:35', NULL),
(2, 1, 2, '2021-02-26 15:38:35', NULL),
(4, 2, 1, '2021-02-26 15:41:32', NULL),
(5, 2, 2, '2021-02-26 15:41:32', NULL),
(6, 2, 4, '2021-02-26 15:41:32', NULL),
(7, 3, 5, '2021-02-26 15:47:36', NULL),
(8, 3, 6, '2021-02-26 15:47:36', NULL),
(9, 3, 7, '2021-02-26 15:47:36', NULL),
(12, 6, 7, '2021-02-26 16:01:43', NULL),
(13, 7, 8, '2021-02-26 16:05:19', NULL),
(14, 8, 6, '2021-02-26 16:07:28', NULL),
(15, 8, 1, '2021-03-01 04:53:02', NULL),
(16, 9, 6, '2021-03-01 05:08:55', NULL),
(17, 10, 1, '2021-03-01 05:45:48', NULL),
(18, 10, 6, '2021-03-01 05:45:48', NULL),
(19, 11, 1, '2021-03-01 05:51:31', NULL),
(20, 11, 2, '2021-03-01 05:51:31', NULL),
(21, 12, 6, '2021-03-06 18:09:55', NULL),
(22, 13, 5, '2021-03-06 18:09:55', NULL),
(23, 13, 6, '2021-03-06 18:10:17', NULL),
(24, 13, 7, '2021-03-06 18:10:17', NULL),
(25, 14, 5, '2021-03-06 18:18:00', NULL),
(26, 14, 10, '2021-03-06 18:18:00', NULL),
(27, 15, 9, '2021-03-06 18:18:13', NULL),
(28, 15, 1, '2021-03-06 18:18:13', NULL),
(29, 16, 6, '2021-03-06 18:32:34', NULL),
(30, 17, 7, '2021-03-06 18:46:49', NULL),
(31, 17, 5, '2021-03-06 18:46:49', NULL),
(32, 17, 1, '2021-03-06 18:47:44', NULL),
(33, 18, 9, '2021-03-06 18:47:44', NULL),
(34, 18, 11, '2021-03-06 18:47:53', NULL),
(35, 21, 2, '2021-03-06 19:29:42', NULL),
(36, 21, 11, '2021-03-06 19:29:42', NULL),
(37, 21, 12, '2021-03-06 19:30:04', NULL),
(38, 22, 6, '2021-03-06 19:30:04', NULL),
(39, 22, 9, '2021-03-06 19:30:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(80) NOT NULL,
  `paymentMethod` varchar(10) NOT NULL,
  `fullName` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `phoneNumber` varchar(80) NOT NULL,
  `idUser` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id`, `paymentMethod`, `fullName`, `email`, `phoneNumber`, `idUser`, `createdAt`, `updateAt`) VALUES
(1, 'Dana', 'indra budiman', 'temanindra@gmail.com', '0895383636947', 4, '2021-03-03 15:38:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `id` int(11) NOT NULL,
  `position` varchar(10) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`id`, `position`, `createdAt`, `updatedAt`) VALUES
(1, 'A1', '2021-03-04 11:45:05', NULL),
(2, 'A2', '2021-03-04 11:45:06', NULL),
(3, 'A3', '2021-03-04 11:45:06', NULL),
(4, 'A4', '2021-03-04 11:45:06', NULL),
(5, 'A5', '2021-03-04 11:45:06', NULL),
(6, 'A6', '2021-03-04 11:45:06', NULL),
(7, 'A7', '2021-03-04 11:45:06', NULL),
(8, 'A8', '2021-03-04 11:45:06', NULL),
(9, 'A9', '2021-03-04 11:45:06', NULL),
(10, 'A10', '2021-03-04 11:45:06', NULL),
(11, 'A11', '2021-03-04 11:45:06', NULL),
(12, 'A12', '2021-03-04 11:45:06', NULL),
(13, 'A13', '2021-03-04 11:45:06', NULL),
(14, 'A14', '2021-03-04 11:45:06', NULL),
(15, 'B1', '2021-03-04 11:45:06', NULL),
(16, 'B2', '2021-03-04 11:45:06', NULL),
(17, 'B3', '2021-03-04 11:45:06', NULL),
(18, 'B4', '2021-03-04 11:45:06', NULL),
(19, 'B5', '2021-03-04 11:45:06', NULL),
(20, 'B6', '2021-03-04 11:45:06', NULL),
(21, 'B7', '2021-03-04 11:45:06', NULL),
(22, 'B8', '2021-03-04 11:45:06', NULL),
(23, 'B9', '2021-03-04 11:45:06', NULL),
(24, 'B10', '2021-03-04 11:45:06', NULL),
(25, 'B11', '2021-03-04 11:45:06', NULL),
(26, 'B12', '2021-03-04 11:45:06', NULL),
(27, 'B13', '2021-03-04 11:45:06', NULL),
(28, 'B14', '2021-03-04 11:45:07', NULL),
(29, 'C1', '2021-03-04 11:45:07', NULL),
(30, 'C2', '2021-03-04 11:45:07', NULL),
(31, 'C3', '2021-03-04 11:45:07', NULL),
(32, 'C4', '2021-03-04 11:45:07', NULL),
(33, 'C5', '2021-03-04 11:45:07', NULL),
(34, 'C6', '2021-03-04 11:45:07', NULL),
(35, 'C7', '2021-03-04 11:45:07', NULL),
(36, 'C8', '2021-03-04 11:45:07', NULL),
(37, 'C9', '2021-03-04 11:45:07', NULL),
(38, 'C10', '2021-03-04 11:45:07', NULL),
(39, 'C11', '2021-03-04 11:45:07', NULL),
(40, 'C12', '2021-03-04 11:45:07', NULL),
(41, 'C13', '2021-03-04 11:45:07', NULL),
(42, 'C14', '2021-03-04 11:45:07', NULL),
(43, 'D1', '2021-03-04 11:45:07', NULL),
(44, 'D2', '2021-03-04 11:45:07', NULL),
(45, 'D3', '2021-03-04 11:45:07', NULL),
(46, 'D4', '2021-03-04 11:45:07', NULL),
(47, 'D5', '2021-03-04 11:45:07', NULL),
(48, 'D6', '2021-03-04 11:45:07', NULL),
(49, 'D7', '2021-03-04 11:45:07', NULL),
(50, 'D8', '2021-03-04 11:45:07', NULL),
(51, 'D9', '2021-03-04 11:45:07', NULL),
(52, 'D10', '2021-03-04 11:45:07', NULL),
(53, 'D11', '2021-03-04 11:45:07', NULL),
(54, 'D12', '2021-03-04 11:45:07', NULL),
(55, 'D13', '2021-03-04 11:45:08', NULL),
(56, 'D14', '2021-03-04 11:45:08', NULL),
(57, 'E1', '2021-03-04 11:45:08', NULL),
(58, 'E2', '2021-03-04 11:45:08', NULL),
(59, 'E3', '2021-03-04 11:45:08', NULL),
(60, 'E4', '2021-03-04 11:45:08', NULL),
(61, 'E5', '2021-03-04 11:45:08', NULL),
(62, 'E6', '2021-03-04 11:45:08', NULL),
(63, 'E7', '2021-03-04 11:45:08', NULL),
(64, 'E8', '2021-03-04 11:45:08', NULL),
(65, 'E9', '2021-03-04 11:45:08', NULL),
(66, 'E10', '2021-03-04 11:45:08', NULL),
(67, 'E11', '2021-03-04 11:45:08', NULL),
(68, 'E12', '2021-03-04 11:45:08', NULL),
(69, 'E13', '2021-03-04 11:45:08', NULL),
(70, 'E14', '2021-03-04 11:45:08', NULL),
(71, 'F1', '2021-03-04 11:45:08', NULL),
(72, 'F2', '2021-03-04 11:45:08', NULL),
(73, 'F3', '2021-03-04 11:45:08', NULL),
(74, 'F4', '2021-03-04 11:45:08', NULL),
(75, 'F5', '2021-03-04 11:45:08', NULL),
(76, 'F6', '2021-03-04 11:45:08', NULL),
(77, 'F7', '2021-03-04 11:45:08', NULL),
(78, 'F8', '2021-03-04 11:45:08', NULL),
(79, 'F9', '2021-03-04 11:45:08', NULL),
(80, 'F10', '2021-03-04 11:45:08', NULL),
(81, 'F11', '2021-03-04 11:45:08', NULL),
(82, 'F12', '2021-03-04 11:45:08', NULL),
(83, 'F13', '2021-03-04 11:45:09', NULL),
(84, 'F14', '2021-03-04 11:45:09', NULL),
(85, 'G1', '2021-03-04 11:45:09', NULL),
(86, 'G2', '2021-03-04 11:45:09', NULL),
(87, 'G3', '2021-03-04 11:45:09', NULL),
(88, 'G4', '2021-03-04 11:45:09', NULL),
(89, 'G5', '2021-03-04 11:45:09', NULL),
(90, 'G6', '2021-03-04 11:45:09', NULL),
(91, 'G7', '2021-03-04 11:45:09', NULL),
(92, 'G8', '2021-03-04 11:45:09', NULL),
(93, 'G9', '2021-03-04 11:45:09', NULL),
(94, 'G10', '2021-03-04 11:45:09', NULL),
(95, 'G11', '2021-03-04 11:45:09', NULL),
(96, 'G12', '2021-03-04 11:45:09', NULL),
(97, 'G13', '2021-03-04 11:45:09', NULL),
(98, 'G14', '2021-03-04 11:45:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `show_times`
--

CREATE TABLE `show_times` (
  `id` int(11) NOT NULL,
  `showTimes` time NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `show_times`
--

INSERT INTO `show_times` (`id`, `showTimes`, `createdAt`, `updatedAt`) VALUES
(1, '08:30:00', '2021-03-03 12:41:59', NULL),
(2, '10:00:00', '2021-03-03 12:41:59', NULL),
(3, '12:00:00', '2021-03-03 12:42:29', NULL),
(4, '14:00:00', '2021-03-03 12:42:29', NULL),
(5, '16:00:00', '2021-03-03 12:42:56', NULL),
(6, '19:00:00', '2021-03-03 12:42:56', NULL),
(7, '21:00:00', '2021-03-03 12:43:19', NULL),
(8, '23:00:00', '2021-03-03 12:43:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `show_times_cinemas`
--

CREATE TABLE `show_times_cinemas` (
  `id` int(11) NOT NULL,
  `idShowTimes` int(11) NOT NULL,
  `idCinemas` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `show_times_cinemas`
--

INSERT INTO `show_times_cinemas` (`id`, `idShowTimes`, `idCinemas`, `createdAt`, `updatedAt`) VALUES
(2, 2, 1, '2021-03-04 13:39:37', NULL),
(3, 4, 1, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(4, 5, 1, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(6, 6, 1, '2021-03-04 13:39:37', NULL),
(7, 7, 1, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(8, 8, 1, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(9, 3, 1, '2021-03-06 19:50:34', NULL),
(10, 1, 4, '2021-03-04 13:39:37', NULL),
(11, 2, 4, '2021-03-04 13:39:37', NULL),
(12, 4, 4, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(13, 5, 4, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(14, 6, 4, '2021-03-04 13:39:37', NULL),
(15, 7, 4, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(16, 8, 4, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(17, 3, 4, '2021-03-06 19:50:34', NULL),
(18, 1, 5, '2021-03-04 13:39:37', NULL),
(19, 2, 5, '2021-03-04 13:39:37', NULL),
(20, 4, 5, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(21, 5, 5, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(22, 6, 5, '2021-03-04 13:39:37', NULL),
(23, 7, 5, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(24, 8, 5, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(25, 3, 5, '2021-03-06 19:50:34', NULL),
(26, 1, 6, '2021-03-04 13:39:37', NULL),
(27, 2, 6, '2021-03-04 13:39:37', NULL),
(28, 4, 6, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(29, 5, 6, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(30, 6, 6, '2021-03-04 13:39:37', NULL),
(31, 7, 6, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(32, 8, 6, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(33, 3, 6, '2021-03-06 19:50:34', NULL),
(34, 1, 7, '2021-03-04 13:39:37', NULL),
(35, 2, 7, '2021-03-04 13:39:37', NULL),
(36, 4, 7, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(37, 5, 7, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(38, 6, 7, '2021-03-04 13:39:37', NULL),
(39, 7, 7, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(40, 8, 7, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(41, 3, 7, '2021-03-06 19:50:34', NULL),
(42, 1, 8, '2021-03-04 13:39:37', NULL),
(43, 2, 8, '2021-03-04 13:39:37', NULL),
(44, 4, 8, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(45, 5, 8, '2021-03-04 13:39:51', '2021-03-06 19:50:16'),
(46, 6, 8, '2021-03-04 13:39:37', NULL),
(47, 7, 8, '2021-03-04 13:39:51', '2021-03-06 19:49:17'),
(48, 8, 8, '2021-03-04 13:39:51', '2021-03-06 19:50:41'),
(49, 3, 8, '2021-03-06 19:50:34', NULL),
(50, 1, 1, '2021-03-07 12:26:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `idCinema` int(11) NOT NULL,
  `idSeat` int(11) NOT NULL,
  `idShowTimes` int(11) NOT NULL,
  `date` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `idCinema`, `idSeat`, `idShowTimes`, `date`, `createdAt`, `updatedAt`) VALUES
(3, 1, 3, 1, '0000-00-00', '2021-03-03 13:45:19', NULL),
(4, 1, 4, 1, '0000-00-00', '2021-03-03 13:45:56', NULL),
(5, 1, 12, 1, '2021-03-04', '2021-03-04 15:13:55', NULL),
(6, 1, 1, 1, '2021-03-04', '2021-03-04 15:16:50', NULL),
(7, 1, 91, 1, '2021-03-04', '2021-03-04 15:25:06', NULL),
(8, 1, 49, 1, '2021-03-07', '2021-03-04 15:26:59', NULL),
(9, 1, 49, 1, '2021-03-07', '2021-03-04 15:26:59', NULL),
(10, 1, 16, 1, '2021-03-04', '2021-03-04 15:41:33', NULL),
(11, 1, 1, 1, '2021-03-06', '2021-03-04 15:52:02', NULL),
(12, 1, 48, 1, '2021-03-04', '2021-03-04 15:53:58', NULL),
(13, 1, 61, 1, '2021-03-04', '2021-03-04 15:55:27', NULL),
(14, 1, 1, 1, '2021-03-12', '2021-03-04 16:11:20', NULL),
(15, 1, 0, 1, '2021-03-12', '2021-03-04 16:14:02', NULL),
(16, 1, 12, 1, '2021-03-12', '2021-03-04 16:14:57', NULL),
(17, 1, 14, 1, '2021-03-12', '2021-03-04 16:18:03', NULL),
(18, 1, 15, 1, '2021-03-12', '2021-03-04 16:18:03', NULL),
(19, 1, 6, 1, '2021-03-04', '2021-03-04 16:21:17', NULL),
(20, 1, 7, 1, '2021-03-04', '2021-03-04 16:21:17', NULL),
(21, 1, 5, 1, '2021-03-04', '2021-03-04 16:21:58', NULL),
(22, 4, 1, 1, '2021-03-04', '2021-03-04 16:23:29', NULL),
(23, 4, 2, 1, '2021-03-04', '2021-03-04 16:23:29', NULL),
(24, 4, 2, 1, '2021-03-05', '2021-03-04 16:25:01', NULL),
(25, 4, 1, 1, '2021-03-05', '2021-03-04 16:25:01', NULL),
(26, 4, 6, 1, '2021-03-04', '2021-03-04 16:33:14', NULL),
(27, 4, 7, 1, '2021-03-04', '2021-03-04 16:33:14', NULL),
(28, 4, 5, 1, '2021-03-04', '2021-03-04 16:33:14', NULL),
(29, 1, 6, 1, '2021-03-05', '2021-03-04 16:46:08', NULL),
(30, 1, 7, 1, '2021-03-05', '2021-03-04 16:46:08', NULL),
(31, 1, 34, 1, '2021-03-05', '2021-03-04 16:49:04', NULL),
(32, 1, 35, 1, '2021-03-05', '2021-03-04 16:49:04', NULL),
(33, 1, 33, 1, '2021-03-05', '2021-03-04 16:49:04', NULL),
(34, 1, 1, 1, '2021-03-05', '2021-03-04 17:01:26', NULL),
(35, 1, 3, 1, '2021-03-05', '2021-03-04 17:01:26', NULL),
(36, 4, 47, 1, '2021-03-05', '2021-03-04 17:06:01', NULL),
(37, 4, 48, 1, '2021-03-05', '2021-03-04 17:06:02', NULL),
(38, 4, 49, 1, '2021-03-05', '2021-03-04 17:06:02', NULL),
(39, 4, 85, 1, '2021-03-05', '2021-03-04 17:11:23', NULL),
(40, 4, 86, 1, '2021-03-05', '2021-03-04 17:11:23', NULL),
(41, 1, 72, 1, '2021-03-04', '2021-03-04 17:15:23', NULL),
(42, 1, 74, 1, '2021-03-04', '2021-03-04 17:15:23', NULL),
(43, 1, 29, 1, '2021-03-05', '2021-03-05 03:23:41', NULL),
(44, 1, 30, 1, '2021-03-05', '2021-03-05 03:23:41', NULL),
(45, 1, 2, 1, '2021-03-05', '2021-03-05 10:57:22', NULL),
(46, 1, 4, 1, '2021-03-05', '2021-03-05 10:59:38', NULL),
(47, 1, 5, 1, '2021-03-05', '2021-03-05 11:01:00', NULL),
(48, 1, 15, 1, '2021-03-05', '2021-03-05 11:08:46', NULL),
(49, 1, 16, 1, '2021-03-05', '2021-03-05 11:08:46', NULL),
(50, 1, 17, 1, '2021-03-05', '2021-03-05 11:13:21', NULL),
(51, 1, 18, 1, '2021-03-05', '2021-03-05 11:13:21', NULL),
(52, 1, 19, 1, '2021-03-05', '2021-03-05 11:13:21', NULL),
(53, 1, 20, 1, '2021-03-05', '2021-03-05 11:14:56', NULL),
(54, 1, 21, 1, '2021-03-05', '2021-03-05 11:14:56', NULL),
(55, 1, 1, 2, '2021-03-05', '2021-03-05 11:15:35', NULL),
(56, 1, 2, 2, '2021-03-05', '2021-03-05 11:16:02', NULL),
(57, 1, 3, 2, '2021-03-05', '2021-03-05 11:17:02', NULL),
(58, 1, 4, 2, '2021-03-05', '2021-03-05 11:17:02', NULL),
(59, 1, 5, 2, '2021-03-05', '2021-03-05 11:43:06', NULL),
(60, 1, 6, 2, '2021-03-05', '2021-03-05 11:43:06', NULL),
(61, 2, 88, 1, '2021-03-12', '2021-03-05 14:15:32', NULL),
(62, 2, 87, 1, '2021-03-12', '2021-03-05 14:15:32', NULL),
(63, 2, 89, 1, '2021-03-12', '2021-03-05 14:15:32', NULL),
(64, 1, 31, 1, '2021-03-05', '2021-03-05 19:11:51', NULL),
(65, 1, 32, 1, '2021-03-05', '2021-03-05 19:11:51', NULL),
(66, 1, 43, 1, '2021-03-05', '2021-03-05 19:14:18', NULL),
(67, 1, 45, 1, '2021-03-05', '2021-03-05 19:14:18', NULL),
(68, 1, 46, 1, '2021-03-05', '2021-03-05 19:17:23', NULL),
(69, 1, 47, 1, '2021-03-05', '2021-03-05 19:17:23', NULL),
(70, 1, 48, 1, '2021-03-05', '2021-03-05 19:17:23', NULL),
(71, 1, 2, 1, '2021-03-06', '2021-03-06 08:02:12', NULL),
(72, 1, 3, 1, '2021-03-06', '2021-03-06 08:02:12', NULL),
(73, 1, 4, 1, '2021-03-06', '2021-03-06 08:20:19', NULL),
(74, 1, 5, 1, '2021-03-06', '2021-03-06 08:20:19', NULL),
(75, 1, 97, 7, '2021-03-07', '2021-03-07 13:02:05', NULL),
(76, 1, 98, 7, '2021-03-07', '2021-03-07 13:02:05', NULL),
(77, 1, 84, 7, '2021-03-07', '2021-03-07 13:02:05', NULL),
(78, 1, 96, 7, '2021-03-07', '2021-03-07 13:08:06', NULL),
(79, 1, 82, 7, '2021-03-07', '2021-03-07 13:08:06', NULL),
(80, 1, 68, 7, '2021-03-07', '2021-03-07 13:08:06', NULL),
(81, 1, 70, 7, '2021-03-07', '2021-03-07 13:08:06', NULL),
(82, 1, 17, 4, '0000-00-00', '2021-03-07 13:10:31', NULL),
(83, 1, 19, 4, '0000-00-00', '2021-03-07 13:10:32', NULL),
(84, 1, 20, 4, '0000-00-00', '2021-03-07 13:10:32', NULL),
(85, 1, 7, 2, '2021-03-07', '2021-03-07 13:13:39', NULL),
(86, 1, 6, 2, '2021-03-07', '2021-03-07 13:13:39', NULL),
(87, 1, 5, 2, '2021-03-07', '2021-03-07 13:13:39', NULL),
(88, 1, 1, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(89, 1, 16, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(90, 1, 31, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(91, 1, 46, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(92, 1, 61, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(93, 1, 76, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(94, 1, 91, 0, '2021-03-07', '2021-03-07 15:08:16', NULL),
(95, 1, 1, 4, '2021-03-07', '2021-03-07 15:17:56', NULL),
(96, 1, 2, 4, '2021-03-07', '2021-03-07 15:17:56', NULL),
(97, 1, 1, 2, '2021-03-07', '2021-03-07 15:22:26', NULL),
(98, 1, 2, 2, '2021-03-07', '2021-03-07 15:22:26', NULL),
(99, 1, 6, 4, '2021-03-07', '2021-03-07 15:36:33', NULL),
(100, 1, 7, 4, '2021-03-07', '2021-03-07 15:36:33', NULL),
(101, 1, 1, 8, '2021-03-07', '2021-03-07 15:44:02', NULL),
(102, 1, 2, 8, '2021-03-07', '2021-03-07 15:44:02', NULL),
(103, 1, 3, 8, '2021-03-07', '2021-03-07 15:44:02', NULL),
(104, 1, 1, 7, '2021-03-12', '2021-03-12 18:14:41', NULL),
(105, 1, 2, 7, '2021-03-12', '2021-03-12 18:14:42', NULL),
(106, 1, 3, 7, '2021-03-12', '2021-03-12 18:14:42', NULL),
(107, 6, 1, 6, '2021-03-12', '2021-03-12 18:52:01', NULL),
(108, 6, 2, 6, '2021-03-12', '2021-03-12 18:52:01', NULL),
(109, 6, 3, 6, '2021-03-12', '2021-03-12 18:52:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullName` varchar(80) DEFAULT NULL,
  `phoneNumber` varchar(80) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `fullName`, `phoneNumber`, `photo`, `createdAt`, `updatedAt`) VALUES
(9, 'rabudiman@gmail.com', '$2b$10$LkVCb/qtjmHu63jVK5uF6ehC0rrT1uhKFSd1T/Sr76UlvzdHUvWJy', 'Indra', '0895383636947', 'uploads/1615572703368-rn_image_picker_lib_temp_e4314e7a-71bd-4431-b1ad-98ccd021a1fe.jpg', '0000-00-00 00:00:00', '2021-03-12 18:11:43'),
(11, 'budimanindra98@gmail.com', '$2b$10$4Dplrf1Wl9h.nZIwrAt1u.TXNaaSCmrWUrpFfJ/v4XTpgSO3ZomAC', NULL, NULL, 'uploads/1615469278584-rn_image_picker_lib_temp_07b894c0-8a95-4406-8fbb-de256e380dca.jpg', '2021-03-08 18:26:31', '2021-03-11 13:27:58'),
(12, 'Wr10@gmail.com', '$2b$10$zxjqxJyUKXny1fXumysVXOctmX0giV.7YCiPOY7cH67pvPlM3Mb.C', NULL, NULL, NULL, '2021-03-08 19:11:20', '2021-03-11 12:58:00'),
(13, 'ezforgaming@gmail.com', '$2b$10$KHqaLTO6eBhkq5qc7dqD3OjZ0kKHkDA2kQvRURVDQ00eUo4qMoWVC', 'Ezra', 'null', 'uploads/1615382996363-rn_image_picker_lib_temp_812950f0-3f1c-47f1-985d-5b2ed05dbdae.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'namanyajugahidup@gmail.com', '$2b$10$XV1T9IrTV41.zLyJqOgI6ufQw63.saseJwEBbgpMAVQ6SMrbVGhqG', 'Bambang Herlambang', '08123456789', 'uploads/1615569101557-rn_image_picker_lib_temp_25d94f43-9f90-4cea-ac6a-c57b2d5df0c0.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'akuindra@gmail.com', '$2b$10$1HzGTytcrS9.7S9kM4ok7OKMCfnvifP5hmdjwGHZNbTHwCEB96jXu', NULL, NULL, NULL, '2021-03-12 17:13:36', NULL),
(18, 'adaaja@gmail.com', '$2b$10$rruEapcDbM4nutkULtpBuO8SaScbtfWb0r8gr524nqt.8uE.2rI.u', NULL, NULL, NULL, '2021-03-12 17:38:55', NULL),
(19, 'adaaja2@gmail.com', '$2b$10$7dKNxSeu0cDL52kuz3cU0.4Xrbqj5Tu.33C7GWozyVoNV23TELco2', NULL, NULL, NULL, '2021-03-12 17:44:36', NULL),
(20, 'adaaja3@gmail.com', '$2b$10$iXJRRie/5SS/ohx//hqdFemrWINe/sRxCSOQiCtvG/XXhI4y9q4Zq', NULL, NULL, NULL, '2021-03-12 17:44:52', NULL),
(21, 'adaaja4@gmail.com', '$2b$10$IDARj5MEf7C.bGezD4GTv.cG2OuWOCmmUtnM38mds9Mhvrgo2qRSW', NULL, NULL, NULL, '2021-03-12 17:49:09', NULL),
(22, 'adaaja5@gmail.com', '$2b$10$9uPV2jH7GUcfrbsElaYBFe3/NtsmkfT70dgpRm3CzCqg4xk6imFUG', NULL, NULL, NULL, '2021-03-12 17:49:43', NULL),
(23, 'adaaja6@gmail.com', '$2b$10$cdJGIKoz4jeHpSRWR6n/Y.87CMtpJMwVfR9HQIklEePt2FHkp5a0m', NULL, NULL, NULL, '2021-03-12 17:51:44', NULL),
(24, 'adaaja7@gmail.com', '$2b$10$xZEUmNKE1054cc3u9oGEaeQk8VQxLkv2yXKpvIKzXTS8aCsrpr4om', NULL, NULL, NULL, '2021-03-12 17:52:15', NULL),
(25, 'adaaja8@gmail.com', '$2b$10$RTVBdnJmiClctb7uHACUguXkcKNTJkoiLqbE73xqv7hcjfIy4KXSa', NULL, NULL, NULL, '2021-03-12 17:53:08', NULL),
(26, 'adaaja9@gmail.com', '$2b$10$TLth9HtcAlxo9eH4VPTYRev0CUq7o1W0gyESSE9pfmuZbOW6XFAF6', NULL, NULL, NULL, '2021-03-12 17:53:52', NULL),
(27, 'adaaja10@gmail.com', '$2b$10$mQXmMK6m1mwL4565Y/YFqexhySeDEcyosZ/ODTD3Sv3LVxD58Kgfu', NULL, NULL, NULL, '2021-03-12 17:54:11', NULL),
(28, 'adaaja11@gmail.com', '$2b$10$RfioK4fcF4xxcvltkz6/VuWLl7XhfjAlp2K75BolwpzPRgl1323bK', NULL, NULL, NULL, '2021-03-12 17:54:34', NULL),
(29, 'adaaja12@gmail.com', '$2b$10$xcgMrVGf7eut4jOHZ4lhDep8Wlqkkolveusaj0llih1blL6Enx8Di', NULL, NULL, NULL, '2021-03-12 17:56:31', NULL),
(30, 'Tes1@gmail.com', '$2b$10$sO0RabHc/lI0p7isz20Z6Oh/38iQYSuSjrQLcam9RaWhTfu/whwgG', 'Tes tes', '0895383636947', 'uploads/1615572041276-rn_image_picker_lib_temp_49e94bdc-0134-4ed2-98e4-0455f1865256.jpg', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Tes2@gmail.com', '$2b$10$tnQdYB/WIVKHrivNwfFByOFB08wb25jWK/HJKylbtBQaIx3siYGb2', NULL, NULL, NULL, '2021-03-12 18:03:04', NULL),
(32, 'Tes3@gmail.com', '$2b$10$/udDVJMSRfKbt1GtmlirCeSHRnQ41hyXUpkvYXqobWXZBniNc.md.', NULL, NULL, NULL, '2021-03-12 18:03:41', NULL),
(33, 'Fix@gmail.com', '$2b$10$.EVg1KjqyK4suPNGNuug6.ECNqgyQ.4cPINn0UaiKIde3RXZzvv9W', NULL, NULL, 'uploads/1615666234520-rn_image_picker_lib_temp_86c023ae-a307-4385-8c65-f39ccdd9e98c.jpg', '2021-03-12 18:44:27', '2021-03-13 20:10:34'),
(34, 'sapi@gmail.com', '$2b$10$fVVzzz19hMrI54gZ6LLMLue3q91PxsArxA.j3jykEVZxEKPIqMKZu', NULL, NULL, NULL, '2021-03-15 19:03:14', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casts`
--
ALTER TABLE `casts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cinemas_movies`
--
ALTER TABLE `cinemas_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCinemas` (`idCinemas`),
  ADD KEY `idMovies` (`idMovies`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities_cinemas`
--
ALTER TABLE `cities_cinemas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCities` (`idCities`),
  ADD KEY `idCinemas` (`idCinemas`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_casts`
--
ALTER TABLE `movie_casts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMovie` (`idMovie`),
  ADD KEY `idCast` (`idCast`);

--
-- Indexes for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMovie` (`idMovie`),
  ADD KEY `idGenre` (`idGenre`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `show_times`
--
ALTER TABLE `show_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `show_times_cinemas`
--
ALTER TABLE `show_times_cinemas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idShowTimes` (`idShowTimes`),
  ADD KEY `idCinemas` (`idCinemas`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCinema` (`idCinema`),
  ADD KEY `idSeat` (`idSeat`),
  ADD KEY `idShowTimes` (`idShowTimes`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casts`
--
ALTER TABLE `casts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cinemas_movies`
--
ALTER TABLE `cinemas_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cities_cinemas`
--
ALTER TABLE `cities_cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `movie_casts`
--
ALTER TABLE `movie_casts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `movie_genres`
--
ALTER TABLE `movie_genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(80) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `show_times`
--
ALTER TABLE `show_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `show_times_cinemas`
--
ALTER TABLE `show_times_cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cinemas_movies`
--
ALTER TABLE `cinemas_movies`
  ADD CONSTRAINT `cinemas_movies_ibfk_1` FOREIGN KEY (`idCinemas`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cinemas_movies_ibfk_2` FOREIGN KEY (`idMovies`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities_cinemas`
--
ALTER TABLE `cities_cinemas`
  ADD CONSTRAINT `cities_cinemas_ibfk_1` FOREIGN KEY (`idCinemas`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cities_cinemas_ibfk_2` FOREIGN KEY (`idCities`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_casts`
--
ALTER TABLE `movie_casts`
  ADD CONSTRAINT `movie_casts_ibfk_1` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_casts_ibfk_2` FOREIGN KEY (`idCast`) REFERENCES `casts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`idGenre`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`idMovie`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `show_times_cinemas`
--
ALTER TABLE `show_times_cinemas`
  ADD CONSTRAINT `show_times_cinemas_ibfk_1` FOREIGN KEY (`idShowTimes`) REFERENCES `show_times` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `show_times_cinemas_ibfk_2` FOREIGN KEY (`idCinemas`) REFERENCES `cinemas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
