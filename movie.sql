USE [master]
GO
/****** Object:  Database [Movies]    Script Date: 8/8/2023 8:16:46 PM ******/
CREATE DATABASE [Movies]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Movies', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Movies.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Movies_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Movies_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Movies] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Movies].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Movies] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Movies] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Movies] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Movies] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Movies] SET ARITHABORT OFF 
GO
ALTER DATABASE [Movies] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Movies] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Movies] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Movies] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Movies] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Movies] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Movies] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Movies] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Movies] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Movies] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Movies] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Movies] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Movies] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Movies] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Movies] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Movies] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Movies] SET RECOVERY FULL 
GO
ALTER DATABASE [Movies] SET  MULTI_USER 
GO
ALTER DATABASE [Movies] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Movies] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Movies] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Movies] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Movies] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Movies] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Movies', N'ON'
GO
ALTER DATABASE [Movies] SET QUERY_STORE = OFF
GO
USE [Movies]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/8/2023 8:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[gmail] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[gender] [bit] NOT NULL,
	[role] [nvarchar](10) NOT NULL,
	[accStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 8/8/2023 8:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[caID] [int] IDENTITY(1,1) NOT NULL,
	[caName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[caID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmt]    Script Date: 8/8/2023 8:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmt](
	[cid] [int] NOT NULL,
	[comment] [nvarchar](100) NOT NULL,
	[date] [date] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 8/8/2023 8:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](100) NOT NULL,
	[date] [date] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 8/8/2023 8:16:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[img] [varchar](255) NOT NULL,
	[caID] [int] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[view] [int] NULL,
	[year] [int] NULL,
	[director] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [role], [accStatus]) VALUES (N'a@gmail.com', N'123456789a', N'Nguyen Van A', 0, N'user', 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [role], [accStatus]) VALUES (N'admin@gmail.com', N'123456789a', N'admin', 1, N'admin', 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [role], [accStatus]) VALUES (N'b@gmail.com', N'123456789a', N'Nguyễn Văn b', 1, N'user', 1)
INSERT [dbo].[Account] ([gmail], [password], [name], [gender], [role], [accStatus]) VALUES (N'quangtan2501@gmail.com', N'123456789a', N'Nguyen Quang Tan', 1, N'user', 1)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([caID], [caName]) VALUES (1, N'Khoa Học Viễn Tưởng')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (2, N'Lãng Mạn')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (3, N'Kinh Dị')
INSERT [dbo].[Categories] ([caID], [caName]) VALUES (4, N'Hành Động')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (1, N'HAY nha', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (2, N'HAY Quá', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (3, N'HAY nha', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 2)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (4, N'Good', CAST(N'2023-07-18' AS Date), N'admin', 3)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (7, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 23)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (8, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 2)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (9, N'Phim Good', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (10, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (11, N'Hay', CAST(N'2023-07-22' AS Date), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (1, N'HAY nha', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (2, N'HAY Quá', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (3, N'HAY nha', CAST(N'2023-07-15' AS Date), N'Nguyen Van A', 2)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (4, N'Good', CAST(N'2023-07-18' AS Date), N'admin', 3)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (7, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 23)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (8, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 2)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (9, N'Phim Good', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (10, N'Đc', CAST(N'2023-07-22' AS Date), N'Nguyen Quang Tan', 1)
INSERT [dbo].[Comment] ([cid], [comment], [date], [name], [id]) VALUES (11, N'Hay', CAST(N'2023-07-22' AS Date), N'admin', 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (1, N'Avatar ', N'Avatar.jpg', 4, N'Avatar là bộ phim bom tấn Hollywood của đạo diễn tài ba James Cameron. Nội dung phim xoay quanh câu chuyện giả tưởng về tương lai tại hành tinh Pandora. Một vùng đất huyền ảo với nhân vật chính là Jake - một cựu quân nhân bị liệt hai chân và đang cần một số tiền lớn để tiến hành chữa trị. Jake được đề nghị mức tiền công rất cao để tham gia vào chương trình cấy gen của tộc người Na''vi với mục đích tạo ra một giống loài mới tại hành tinh Pandora.', 27, 2009, N'James Cameron ')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (2, N'The Avengers', N'Avengers.jpg', 1, N'Biệt Đội Siêu Anh Hùng - The Avengers là series phim có sự tham gia của nhiều nhân vật tên tuổi trong vũ trụ điện ảnh Marvel bao gồm Thor, Iron Man, Captain America, Hulk,... Biệt đội có cùng chung mục tiêu là chiến đấu để bảo vệ hòa bình thế giới chống lại âm mưu hủy diệt trái đất do Loki đứng đầu với tên gọi chung của tổ chức là SHIELD. ', 27, 2012, N'Batgirl')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (3, N'The Terminator', N'KeHuyDiet.jpg', 4, N'“Kẻ Hủy Diệt” là một trong những siêu phẩm Hollywood thuộc thể loại viễn tưởng. Phim bắt đầu với trận chiến giữa Skynet và John Connor. Khi Skynet sắp bị đánh bại đã cử một sát thủ người máy (được gọi là Kẻ hủy diệt) du hành thời gian từ năm 2029 về năm 1984 để tìm và sát hại mẹ John là Sarah Connor. Cấp dưới của John là Kyle Reese cũng đã được cử để quay về quá khứ bảo vệ Sarah!', 3, 1984, N'James Cameron ')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (4, N'The Matrix', N'TheMatrix.jpg', 1, N'AI đã tạo ra một thế giới ảo được gọi là Matrix lập trình như một thế giới thực. Ma trận này giúp bọn AI kiểm soát và giữ chân con người làm cho tất cả mọi người không biết đâu thế giới thực đâu là giấc mơ. Liệu con người có thể chiến thắng được AI và giành lại quyền lực vốn có hay không? Đón xem siêu phẩm Hollywood này để biết kết quả nhé!', 4, 1999, N'Wachowski')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (5, N'Fast & Furious', N'FastFurious.jpg', 4, N'“Fast & Furious” là phần đầu tiên khởi đầu cho siêu phẩm series phim đua xe của nhà Universal. Phần đầu tiên của phim được bắt đầu với hành trình của Brian - một cảnh sát Mỹ đã gia nhập băng nhóm đua xe của Dominic để tiến hành điều tra các việc làm phạm pháp của tổ chức ngầm này. Trong quá trình điều tra, Brian đã phải lòng Mia - em gái của Dominic, điều này đã gây khó khăn cho anh trong quá trình hoàn thành nhiệm vụ.', 2, 2001, N'Paul Walker')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (6, N'La La Land', N'LaLaLand.jpg', 2, N'Những Kẻ Khờ Mộng Mơ xoay quanh nữ chính Mia hoạt động như một diễn viên tự do đồng thời là một bartender có niềm khao khát trở thành ngôi sao trong giới nghệ thuật. Trong mùa đông ở Los Angeles, cô tình cờ gặp Sebastian, một nhạc sĩ nhạc Jazz đang ấp ủ ước mơ thành lập hộp đêm theo phong cách nhạc Jazz của riêng mình. ', 1, 2016, N'Damien Chazelle')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (7, N'A Quiet Place', N'QuietPlace.jpg', 1, N'“Vùng Đất Câm Lặng 2” là câu chuyện kể về gia đình của nữ chính Evelyn, họ cố gắng sinh tồn trong một thế giới hậu tận thế. Một giống loài săn mồi đáng sợ trở thành mối đe dọa lớn nhất đối với cuộc sống của gia đình nhà Evelyn. Khi người đàn ông trụ cột chính của gia đình đã qua đời ở phần 1, Evelyn sẽ phải đấu tranh để tồn tại trong một thế giới đầy hiểm nguy và thử thách để bảo vệ những đứa con.', 2, 2021, N'John Krasinski')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (8, N'Halloween chết chóc', N'halloweenchetchoc.jpg', 3, N'Nội dung bắt đầu vào ngày lễ Halloween với màn đêm tăm tối đang buông xuống, một nhóm bạn đã gặp phải ngôi nhà ma ám hứa hẹn sẽ đem đến những nỗi sợ hãi đen tối nhất của họ.', 5, 2021, N'Cameron Elam')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (9, N'Trước ngày em đến', N'MeBeforeYou.jpg', 2, N'Me Before You là bộ phim điện ảnh được chuyển thể từ tiểu thuyết cùng tên của nữ văn sĩ người Anh Jojo Moyes. Nội dung phim khá đơn giản, bối cảnh là vùng quê nhỏ của nước Anh, nơi đã diễn ra chuyện tình của cặp đôi Will- Lousie trong một tình huống trớ trêu.', 2, NULL, N'Thea Sharrock')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (23, N'Tan', N'MeBeforeYou.jpg', 1, N'Biệt Đội Siêu Anh Hùng - The Avengers là series phim có sự tham gia của nhiều nhân vật tên tuổi trong vũ trụ điện ảnh Marvel bao gồm Thor, Iron Man, Captain America, Hulk,... Biệt đội có cùng chung mục tiêu là chiến đấu để bảo vệ hòa bình thế giới chống lại âm mưu hủy diệt trái đất do Loki đứng đầu với tên gọi chung của tổ chức là SHIELD.     ', 20, NULL, N'Tan')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (26, N'New film', N'KeHuyDiet.jpg', 1, N'Hay Quá á', 18, 2023, N'Tân')
INSERT [dbo].[Movies] ([id], [name], [img], [caID], [description], [view], [year], [director]) VALUES (29, N'Film Good', N'halloweenchetchoc.jpg', 3, N'One Movie Very Good', 1, 2020, N'Tan')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
ALTER TABLE [dbo].[cmt]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Comment] ([cid])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[Movies] ([id])
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD FOREIGN KEY([caID])
REFERENCES [dbo].[Categories] ([caID])
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
