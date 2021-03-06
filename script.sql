USE [BgdEcho]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExceptionLogs]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExceptionLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ExceptionMessage] [nvarchar](max) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ExceptionLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PictureSource] [nvarchar](max) NOT NULL,
	[PictureAlt] [nvarchar](max) NOT NULL,
	[PostId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Header] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[CoverImageSource] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
	[Rate] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUseCase]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUseCase](
	[RoleId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_RoleUseCase] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 16-Jun-21 7:30:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CanGrantModeratorRole] [bit] NOT NULL,
	[IsModerator] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609105257_initial', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210609161853_updated-role-configuration', N'5.0.6')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210615175356_updated-user-model', N'5.0.6')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (3, N'Football', 1, CAST(N'2021-06-13T10:08:56.4146945' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (4, N'MMA', 1, CAST(N'2021-06-13T10:09:01.8267116' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (5, N'Tennis', 1, CAST(N'2021-06-13T10:09:07.1303518' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (6, N'Basketball', 1, CAST(N'2021-06-13T10:09:13.2767848' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (7, N'EURO 2020', 1, CAST(N'2021-06-13T10:12:34.3841039' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (8, N'ESPORTS', 1, CAST(N'2021-06-13T10:12:56.8832198' AS DateTime2), NULL, NULL)
INSERT [dbo].[Categories] ([Id], [CategoryName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (9, N'Formula 1', 1, CAST(N'2021-06-13T11:12:24.3466880' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [PostId], [Content], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (2, 1, 2, N'comment', 1, CAST(N'2021-06-13T17:01:13.6233196' AS DateTime2), NULL, NULL)
INSERT [dbo].[Comments] ([Id], [UserId], [PostId], [Content], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (3, 2, 2, N'comment 2', 1, CAST(N'2021-06-13T17:03:18.0013489' AS DateTime2), NULL, NULL)
INSERT [dbo].[Comments] ([Id], [UserId], [PostId], [Content], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (4, 4, 3, N'comment 3', 1, CAST(N'2021-06-13T17:05:37.2219276' AS DateTime2), CAST(N'2021-06-15T19:01:33.6728807' AS DateTime2), NULL)
INSERT [dbo].[Comments] ([Id], [UserId], [PostId], [Content], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (5, 5, 4, N'comment 4', 1, CAST(N'2021-06-13T17:06:14.5384247' AS DateTime2), NULL, NULL)
INSERT [dbo].[Comments] ([Id], [UserId], [PostId], [Content], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (6, 6, 4, N'comment 5', 1, CAST(N'2021-06-13T17:07:16.5690137' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[ExceptionLogs] ON 

INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (1, N'Exception of type ''BgdEcho.Application.Exceptions.UnauthorizedActionException'' was thrown.', CAST(N'2021-06-09T19:44:34.5263612' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (2, N'Error mapping types.

Mapping types:
Role -> RoleDto
BgdEcho.Domain.Role -> BgdEcho.Application.DataTransfer.RoleDto

Type Map configuration:
Role -> RoleDto
BgdEcho.Domain.Role -> BgdEcho.Application.DataTransfer.RoleDto

Destination Member:
UseCases
', CAST(N'2021-06-10T14:55:20.2478001' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (3, N'Error mapping types.

Mapping types:
RoleDto -> Role
BgdEcho.Application.DataTransfer.RoleDto -> BgdEcho.Domain.Role

Type Map configuration:
RoleDto -> Role
BgdEcho.Application.DataTransfer.RoleDto -> BgdEcho.Domain.Role

Destination Member:
UseCases
', CAST(N'2021-06-10T14:59:35.9886512' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (4, N'A possible object cycle was detected. This can either be due to a cycle or if the object depth is larger than the maximum allowed depth of 32. Consider using ReferenceHandler.Preserve on JsonSerializerOptions to support cycles.', CAST(N'2021-06-10T16:00:28.9899759' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (5, N'Nullable object must have a value.', CAST(N'2021-06-10T16:07:16.6599402' AS DateTime2))
INSERT [dbo].[ExceptionLogs] ([Id], [ExceptionMessage], [Date]) VALUES (6, N'No parameterless constructor defined for type ''BgdEcho.Implementation.Profiles.UserProfile''.', CAST(N'2021-06-15T21:11:56.5793377' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ExceptionLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [PictureSource], [PictureAlt], [PostId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (3, N'e3f37ddb-101e-2040-c4e7-d01e899ba0d3.jpg', N'post1 alt', 2, 1, CAST(N'2021-06-13T10:22:22.4430205' AS DateTime2), NULL, NULL)
INSERT [dbo].[Pictures] ([Id], [PictureSource], [PictureAlt], [PostId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (4, N'a9e6af2a-31d8-f219-1143-6a15a79c38ef.jpg', N'post1 alt2', 2, 1, CAST(N'2021-06-13T10:22:22.4430206' AS DateTime2), NULL, NULL)
INSERT [dbo].[Pictures] ([Id], [PictureSource], [PictureAlt], [PostId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (5, N'4e86617b-f09f-9541-f740-6c1d21fefd14.jpg', N'alt', 6, 1, CAST(N'2021-06-13T11:03:26.8778730' AS DateTime2), NULL, NULL)
INSERT [dbo].[Pictures] ([Id], [PictureSource], [PictureAlt], [PostId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (6, N'58c7454e-595d-9963-73dd-88a7beb8255d.jpg', N'alt', 6, 1, CAST(N'2021-06-13T11:03:26.8778731' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (2, N'Riot restricts TSM from displaying their new sponsor FTX''s name on Valorant and League of Legends broadcasts', N'According to a report by Dot Esports, Riot Games won''t permit LCS heavyweights, TSM, to use the name of their cryptocurrency exchange sponsor, FTX, in League of Legends and Valorant broadcasts However, the USA-based team can continue using the ''TSM FTX'' tag on their social media handles and for other games like Fortnite, Overwatch, Hearthstone, and Clash Royale. According to Riot, displaying the FTX brand name on TSM''s jerseys would violate their event guidelines. The organization has strict regulations over cryptocurrency sponsorships. TSM will, therefore, play League of Legends LCS Summer without having their sponsor''s name printed on their shirts. Players who will be a part of TSM''s Valorant and League of Legends team won''t be allowed into Riot''s competitive scene wearing jerseys that bear FTX''s Logo.', N'7ea0fa46-5ffa-97a3-aca8-0fd29d2b5e43.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 8, 1, CAST(N'2021-06-13T10:22:22.4430188' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (3, N'Erling Haaland to Chelsea? How Borussia Dortmund striker could transform Thomas Tuchel''s side', N'Erling Haaland will not get the opportunity to showcase his talent at this summer''s European Championship due to Norway''s failure to qualify. But even as the tournament gets under way, his name is sure to continue dominating headlines. The Borussia Dortmund striker''s future is the subject of intense speculation. His agent, Mino Raiola, met with Barcelona and Real Madrid for talks in April, while Haaland has also attracted interest from Manchester City and Manchester United. It is European champions Chelsea, however, who have emerged as the most serious suitors for the £150m-rated goal machine, with Thomas Tuchel reportedly identifying the Haaland as the man to resolve the side''s long-standing issues at the top of the pitch. The deal will not be easy to pull off, but here, we look at the scoring issues which have prompted Chelsea''s interest and examine the ways in which Haaland could take them to another level.', N'851cb915-e5ed-515b-eebd-7633d42855bc.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 3, 1, CAST(N'2021-06-13T10:50:54.1459675' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (4, N'UFC 263 Results: Israel Adesanya Decisions Marvin Vettori', N'UFC 263 went down tonight from Glendale, Arizona from Gila River Arena and we have the results. The world’s premiere MMA promotion compiled an excellent card for fight fans to enjoy. It was headlined by a meeting between Israel Adesanya and Marvin Vettori in a bout. Their first fight took place at UFC 256 this past December where they went to a majority draw. The co-headliner saw a bout between Deiveson Figueiredo and Brandon Moreno for the flyweight title.  Leon Edwards vs. Nate Diaz in a welterweight bout, Demian Maia vs. Belal Muhammad in a welterweight showdown, and Paul Craig vs. Jamahal Hill in a light heavyweight fight rounds finished out the main card. It was certain to have a great night of fights. Check out MMA News’ UFC 263 results below. Israel Adesanya vs. Marvin Vettori Marvin caught a leg kick and got a takedown into full guard. Adesanya got back to his feet  Marvin cracked him, but Izzy did not sell it. Izzy was in a good striking flow to end the first round.  Vettori worked for a takedown in the second round and Adesanya landed some nasty elbows that caused Vettori to separate. Adesanya continued to land at will, but Vettori was blitzing him and Adesanya was using head movements to avoid it. In the third round, Vettori took him down and got half guard. Vettori took his back and went for a rear-naked choke, but Adesanya scrambled on top. Vettori got back to his feet. Adesanya briefly dropped him with a leg kick, but Vettior got right back up. The fourth round saw Vettori get a takedown after a clinch up against the fence. Adesanya got right back to his feet. Adesanya opened the fifth round with a head kick. Vettori clinched with him up against the fence. Adesanya got the decision win to retain his title. Deiveson Figueiredo vs. Brandon Moreno Moreno was using leg kicks early on and looking sharp. Figueiredo was reserved and looking for his shots. Moreno dropped him with a strike and got on top in half guard. Figueiredo got back to his feet. Moreno tagged him with a jab in the second round before Figueiredo took him down and got on top in half guard. Moreno got back to his feet a few minutes later and clinched with him up against the fence. Moreno took him down and got his back briefly, but Figueiredo moved to full guard.  Moreno took him down and got his back in the third round. Moreno went for a rear-naked choke for the win to become the new champion! Leon Edwards vs. Nate Diaz Edwards was coming forward early with a lot of leg kicks being thrown. Diaz tagged him in round one before Edwards clinched with him up against the fence and dragged him to the ground. Edwards took his back. In the second round, Edwards took him down and Diaz went for a heel hook, but Edwards got out of it. They got back to their feet. Diaz played some mind games. Diaz’s left leg was getting more red as the fight went on. As the third round went on, Diaz started to bleed more from multiple areas on his head and face. Edwards continued to land some good elbows in the clinch. Edwards got him down and landed a big elbow shot. Diaz doing a nice job of constant movement while Edwards tried to stay locked on him. Diaz got back to his feet and Edwards caught him with a spinning back fist. Edwards with a trip takedown, but let Diaz got right back to his feet. Diaz tagged him a few times before Edwards clinched with him at the fence. In the fifth round, Diaz played some mind games while bleeding and Edwards continued to land. Diaz tagged him with a big punch and tried to finish him, but Edwards survived and got the decision win. ', N'155eebc5-718a-c0c3-1dd3-40848437119d.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 4, 1, CAST(N'2021-06-13T10:53:59.9063073' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (5, N'Fighters React To Deiveson Figueiredo vs. Brandon Moreno At UFC 263', N'Deiveson Figueiredo vs. Brandon Moreno in a flyweight title bout was great. The showdown served as the co-main event of the UFC 263 pay-per-view event on Saturday night (, 2021) from Glendale, Arizona from Gila River Arena. As seen in the fight, Moreno looked sharp in the first round and was outlanding Figueiredo, who was reserved and went to clinching with him. Near the end of the first round, Moreno caught him with a jab as Figueiredo was walking in. Figueiredo eventually got back to his feet. In the second round, it opened with Moreno catching him with a jab before Figueiredo took him down. Moreno was able to score a takedown and got his back before Figueiredo moved into full guard. It all ended in the third round when Moreno got a rear-naked choke for the win to become the new champion. Their first fight took place at UFC 256 this past December where they went to a majority draw. Figueiredo was looking to make his latest title defense. On the flip side, Moreno was looking to make a name for himself after rising up the ranks to earn this title fight. ', N'8352b4a0-12bd-9a2b-f5ea-78ddd0e00994.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 4, 1, CAST(N'2021-06-13T10:57:48.7679653' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (6, N'ROLAND GARROS PREVIEW: A 19TH MAJOR FOR DJOKOVIC OR DOES TSITSIPAS GRAB HIS FIRST?', N'If Novak Djokovic defeats Stefanos Tsitsipas Sunday in Paris, the Serb would become the first man in the Open Era to win all four majors twice. The generational clash is becoming a thing in men’s major finals. At this year’s first Slam, the Australian Open, 33-year-old Novak Djokovic defeated 25-year-old Daniil Medvedev. On Sunday at Roland Garros, Djokovic, now 34, will take on 22-year-old Stefanos Tsitsipas. The Big 3 are still at the top of the mountain, but the Next Gen is just a match away from joining them on that summit. Can Tsitsipas do what Medvedev couldn’t in Melbourne, and push Djokovic off that peak in Paris? To stay with the same metaphor, it will be an uphill effort. On Friday Djokovic scaled his own self-described Everest when he beat Rafael Nadal for the second time in nine tries at Roland Garros. Rather than having a letdown on Sunday, I would guess that he’ll be doubly determined not to waste a precious opportunity to win his second title in Paris. The last time he beat Rafa there, in 2015, he lost the final to Stan Wawrinka. Fortunately for Djokovic, Tsitsipas is not Wawrinka. The Greek is a formidable opponent and a potential future No. 1 who is gaining confidence by the day. He pushed Djokovic to five sets in the semis in Paris last year, and he pushed him to the limit a couple weeks ago in Rome before falling 4-6, 7-5, 7-5. But he won’t scare Djokovic in the same way that Wawrinka did, because he doesn’t have the same unpredictable ability to take the racquet out of an opponent’s hand on a given day, the way Stan did when he was at his best.', N'5ba1d043-a1c9-7d4f-2009-a3cee0556383.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 5, 1, CAST(N'2021-06-13T11:03:26.8778718' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (7, N'Nuggets face daunting deficit; Nikola Jokic faces ignominious exit', N'Four NHL teams have overcome 3-0 deficits in a best-of-seven playoff series, including the 1942 Stanley Cup champion Toronto Maple Leafs. The Boston Red Sox pulled off MLB''s only such comeback against the New York Yankees in 2004. The Denver Nuggets are the 143rd NBA team to go down 3-0 in a best-of-seven playoff series and nobody''s ever overcome such a daunting deficit to win four straight. The Nuggets say their only aim is to send the series back to Phoenix with a win in Game 4 Sunday night in Denver. ''The last thing I want to see is the Phoenix Suns pushing a broom across our home court,'' Nuggets coach Michael Malone said Friday night after Denver''s 116-102 loss to the Suns. Malone has said all along the Nuggets could show growth this season after losing a year ago to the Los Angeles Lakers in the Western Conference Finals. ''We have had a tremendous season, tremendous. I said going into this year you can''t judge a season by the end result. ... But the one thing I don''t want is for us just to go out quietly into that good night,'' Malone said. ''I hope we show some real fight and resolve and force this series to go back to Phoenix for Game 5.'' If not, Nikola Jokic will become the first MVP to get swept in a playoff series since the league adopted the best-of-seven format for all rounds beginning in 2003. ''We just need to go out there and fight and give everything we’ve got'', Jokic said. Only three MVPs (Steph Curry in 2015, LeBron James in 2012 and ‘13 and Tim Duncan in 2003) have won it all since 2003 when it’s taken 16 playoff victories to raise the Larry O''Brien NBA Championship Trophy. Curry came up just short again in 2016 when James led the Cavaliers to a Game 7 win in the NBA Finals. Since then, MVPs are just 31-24 in the playoffs with none of them even reaching the Finals. That includes two MVPs who exited in the first round: Russell Westbrook in 2017 and Dirk Nowitzki in 2007.', N'9f852fd3-1985-c965-c15d-d53071d9ab57.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 6, 1, CAST(N'2021-06-13T11:08:56.5263401' AS DateTime2), NULL, NULL)
INSERT [dbo].[Posts] ([Id], [Header], [Text], [CoverImageSource], [Date], [CategoryId], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (8, N'Formula 1 team McLaren to race in Extreme E in 2022', N'McLaren will race in the climate-aware off-road series Extreme E next year. The illustrious Formula 1 team, who have eight constructors'' titles, join seven-time F1 champion Lewis Hamilton, whose own X44 team is currently competing in the inaugural season. Extreme is streamed live across the BBC iPlayer and BBC Sport website. Brown added: ''It gives us the ability to accelerate and boost our own overarching sustainability agenda, which shares the same priorities of decarbonisation, waste reduction, diversity and equality.'' Extreme E is two races into its five-race season, in which cars travel on a ''floating paddock'' - the St Helena ship - to remote locations around the world to race electric SUVs as well as raise awareness on areas affected by climate change. It is not yet clear who McLaren want to drive the car next year - in which a male and female driver share the role across race weekends - but Brown said: ''We are looking to replicate our F1 and Indycar programmes. We want to find the two fastest and most exciting drivers out there.''', N'3f491d83-bc60-fa10-8a54-91095b3d145d.jpg', CAST(N'2021-06-13T00:00:00.0000000' AS DateTime2), 9, 1, CAST(N'2021-06-13T11:14:51.9794104' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (6, 6, 2, 1, 1, CAST(N'2021-06-13T17:08:09.5215680' AS DateTime2), CAST(N'2021-06-15T18:59:24.3532766' AS DateTime2), NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (7, 6, 3, 2, 1, CAST(N'2021-06-13T17:08:26.9603228' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (8, 6, 4, 2, 1, CAST(N'2021-06-13T17:08:30.4261450' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (9, 6, 5, 5, 1, CAST(N'2021-06-13T17:08:37.4264794' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (10, 1, 2, 5, 1, CAST(N'2021-06-13T17:09:58.0695682' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (11, 1, 3, 5, 1, CAST(N'2021-06-13T17:10:03.2605925' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (12, 1, 4, 5, 1, CAST(N'2021-06-13T17:10:07.6163624' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (13, 1, 5, 5, 1, CAST(N'2021-06-13T17:10:11.6690293' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (14, 1, 6, 5, 1, CAST(N'2021-06-13T17:10:16.3456809' AS DateTime2), NULL, NULL)
INSERT [dbo].[Reviews] ([Id], [UserId], [PostId], [Rate], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (15, 1, 7, 5, 1, CAST(N'2021-06-13T17:10:21.7708630' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (1, N'User', 1, CAST(N'2021-06-10T00:00:00.0000000' AS DateTime2), CAST(N'2021-06-13T15:51:36.9407874' AS DateTime2), NULL)
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (2, N'SuperAdmin', 1, CAST(N'2021-06-10T00:00:00.0000000' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (3, N'New Role', 1, CAST(N'2021-06-10T13:06:18.4480690' AS DateTime2), NULL, NULL)
INSERT [dbo].[Roles] ([Id], [RoleName], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt]) VALUES (4, N'Moderator', 1, CAST(N'2021-06-15T18:26:09.4220396' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 3)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 8)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 10)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 14)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 16)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 17)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 18)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 19)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 20)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 21)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 22)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 23)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (1, 25)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (2, 1000)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (3, 1)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (3, 2)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (3, 3)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (3, 4)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (3, 5)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (4, 18)
INSERT [dbo].[RoleUseCase] ([RoleId], [UseCaseId]) VALUES (4, 24)
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2021-06-09T11:04:00.0713754' AS DateTime2), N'Add Post', N'{"Header":"test insert","Text":"random text","CoverImageSource":"1ea3edd5-0801-3a00-165e-c8fcd23336c9.jpg","CategoryId":1,"Category":null,"Comments":null,"Pictures":[{"PostId":null,"PictureSource":"2bfb2b44-cd4c-479b-a48c-d0836c5464f8.jpg","PictureAlt":"alt attr","Id":0}],"Date":"2021-06-10T00:00:00","Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2021-06-09T11:04:06.1106434' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2021-06-09T11:12:25.5192241' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2021-06-09T15:28:05.2780216' AS DateTime2), N'Add Picture', N'{"PostId":1,"PictureSource":"2bfb2b44-cd4c-479b-a48c-d0836c5464f8.jpg","PictureAlt":"alt 2","Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2021-06-09T15:30:05.1455660' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":1,"UserId":1,"Content":"test comment","Date":"0001-01-01T00:00:00","Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2021-06-09T15:30:30.9298432' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":1,"UserId":0,"Content":"test comment","Date":"0001-01-01T00:00:00","Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2021-06-09T15:31:05.8843797' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":1,"UserId":1,"Content":"test comment","Date":"0001-01-01T00:00:00","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2021-06-09T15:31:11.9756858' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":1,"UserId":2,"Content":"test comment","Date":"0001-01-01T00:00:00","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2021-06-09T15:32:49.0431932' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2021-06-09T15:33:02.5340090' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2021-06-09T15:33:05.9380269' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2021-06-09T15:34:03.7192901' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":1,"OrderByDirection":0,"Paged":false,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2021-06-09T15:39:43.0955636' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2021-06-09T15:39:49.3165057' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2021-06-09T15:49:13.6920010' AS DateTime2), N'Update Review', N'{"UserId":1,"PostId":1,"Rate":3,"Id":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2021-06-09T15:49:22.4063895' AS DateTime2), N'Update Review', N'{"UserId":1,"PostId":1,"Rate":3,"Id":2}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2021-06-09T15:49:31.7730745' AS DateTime2), N'Update Review', N'{"UserId":1,"PostId":3,"Rate":3,"Id":2}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2021-06-09T15:50:01.3349968' AS DateTime2), N'Update Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":2}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2021-06-09T15:50:08.1382405' AS DateTime2), N'Update Review', N'{"UserId":2,"PostId":1,"Rate":5,"Id":2}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2021-06-09T15:51:23.0471379' AS DateTime2), N'Update Review', N'{"UserId":2,"PostId":1,"Rate":5,"Id":2}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2021-06-09T15:51:40.2277767' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2021-06-09T16:19:36.9624830' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2021-06-09T16:20:24.8249977' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2021-06-09T16:26:56.8788467' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2021-06-09T16:28:57.9816104' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2021-06-09T16:29:15.4052878' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2021-06-09T16:29:50.8238679' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2021-06-09T16:34:30.5461461' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2021-06-09T16:35:28.1814345' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2021-06-09T16:37:26.4543552' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2021-06-09T17:32:20.4931105' AS DateTime2), N'Delete Review', N'4', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2021-06-09T17:32:24.7061357' AS DateTime2), N'Delete Review', N'4', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2021-06-09T17:38:47.2395804' AS DateTime2), N'Delete Comment', N'4', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2021-06-09T17:40:10.1085606' AS DateTime2), N'Delete Comment', N'4', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2021-06-09T17:40:37.6789066' AS DateTime2), N'Delete Review', N'4', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2021-06-09T17:41:07.5551078' AS DateTime2), N'Delete Review', N'4', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2021-06-09T17:42:15.4588802' AS DateTime2), N'Delete Review', N'4', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2021-06-09T17:43:51.8645293' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":1,"Rate":5,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2021-06-09T17:44:21.5338240' AS DateTime2), N'Delete Review', N'4', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2021-06-09T17:44:29.9228690' AS DateTime2), N'Delete Review', N'5', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2021-06-09T17:44:54.3426575' AS DateTime2), N'Delete Review', N'5', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2021-06-10T12:58:02.1096616' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[1,1],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2021-06-10T12:58:21.2710022' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[0],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2021-06-10T12:58:46.1596138' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2021-06-10T12:59:28.3647269' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2021-06-10T13:01:46.0939773' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2021-06-10T13:06:16.7642123' AS DateTime2), N'Add Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":0}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2021-06-10T13:08:37.6356261' AS DateTime2), N'Update Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":2}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2021-06-10T13:08:50.1294733' AS DateTime2), N'Update Role', N'{"RoleName":"New Role","UseCases":[1,2,3,4,5],"Id":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2021-06-10T14:06:50.6908279' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2021-06-10T14:08:19.2728211' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2021-06-10T14:14:42.4670733' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2021-06-10T14:15:00.1508523' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2021-06-10T14:46:28.6804635' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2021-06-10T14:48:18.5590020' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2021-06-10T14:50:10.6104188' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2021-06-10T15:17:19.2423711' AS DateTime2), N'Search Categories', N'{"Paged":false,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2021-06-13T09:18:12.8596272' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2021-06-13T09:18:17.0519708' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2021-06-13T09:23:59.9282214' AS DateTime2), N'Delete Category', N'2', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2021-06-13T09:24:02.8620121' AS DateTime2), N'Delete Category', N'2', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2021-06-13T09:24:14.6354967' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2021-06-13T09:24:19.7935264' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'2021-06-13T09:25:15.3399993' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'2021-06-13T09:25:28.0947999' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'2021-06-13T10:08:56.2022265' AS DateTime2), N'Add Category', N'{"CategoryName":"Football","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'2021-06-13T10:09:01.8157493' AS DateTime2), N'Add Category', N'{"CategoryName":"MMA","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'2021-06-13T10:09:07.1237378' AS DateTime2), N'Add Category', N'{"CategoryName":"Tenis","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'2021-06-13T10:09:13.2708383' AS DateTime2), N'Add Category', N'{"CategoryName":"Basketball","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'2021-06-13T10:10:24.6050673' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'2021-06-13T10:12:34.3673509' AS DateTime2), N'Add Category', N'{"CategoryName":"EURO 2020","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'2021-06-13T10:12:56.8754036' AS DateTime2), N'Add Category', N'{"CategoryName":"ESPORTS","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'2021-06-13T10:13:48.6625356' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'2021-06-13T10:22:22.3610843' AS DateTime2), N'Add Post', N'{"Header":"Riot restricts TSM from displaying their new sponsor FTX''s name on Valorant and League of Legends broadcasts","Text":"According to a report by Dot Esports, Riot Games won''t permit LCS heavyweights, TSM, to use the name of their cryptocurrency exchange sponsor, FTX, in League of Legends and Valorant broadcasts However, the USA-based team can continue using the ''TSM FTX'' tag on their social media handles and for other games like Fortnite, Overwatch, Hearthstone, and Clash Royale. According to Riot, displaying the FTX brand name on TSM''s jerseys would violate their event guidelines. The organization has strict regulations over cryptocurrency sponsorships. TSM will, therefore, play League of Legends LCS Summer without having their sponsor''s name printed on their shirts. Players who will be a part of TSM''s Valorant and League of Legends team won''t be allowed into Riot''s competitive scene wearing jerseys that bear FTX''s Logo.","CoverImageSource":"7ea0fa46-5ffa-97a3-aca8-0fd29d2b5e43.jpg","CategoryId":8,"Category":null,"Comments":null,"Pictures":[{"PostId":null,"PictureSource":"e3f37ddb-101e-2040-c4e7-d01e899ba0d3.jpg","PictureAlt":"post1 alt","Id":0},{"PostId":null,"PictureSource":"a9e6af2a-31d8-f219-1143-6a15a79c38ef.jpg","PictureAlt":"post1 alt2","Id":0}],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'2021-06-13T10:23:09.2796228' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'2021-06-13T10:23:17.3135732' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'2021-06-13T10:50:52.4178478' AS DateTime2), N'Add Post', N'{"Header":"Erling Haaland to Chelsea? How Borussia Dortmund striker could transform Thomas Tuchel''s side","Text":"Erling Haaland will not get the opportunity to showcase his talent at this summer''s European Championship due to Norway''s failure to qualify. But even as the tournament gets under way, his name is sure to continue dominating headlines. The Borussia Dortmund striker''s future is the subject of intense speculation. His agent, Mino Raiola, met with Barcelona and Real Madrid for talks in April, while Haaland has also attracted interest from Manchester City and Manchester United. It is European champions Chelsea, however, who have emerged as the most serious suitors for the £150m-rated goal machine, with Thomas Tuchel reportedly identifying the Haaland as the man to resolve the side''s long-standing issues at the top of the pitch. The deal will not be easy to pull off, but here, we look at the scoring issues which have prompted Chelsea''s interest and examine the ways in which Haaland could take them to another level.","CoverImageSource":"851cb915-e5ed-515b-eebd-7633d42855bc.jpg","CategoryId":3,"Category":null,"Comments":null,"Pictures":[],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'2021-06-13T10:53:59.8916555' AS DateTime2), N'Add Post', N'{"Header":"UFC 263 Results: Israel Adesanya Decisions Marvin Vettori","Text":"UFC 263 went down tonight from Glendale, Arizona from Gila River Arena and we have the results. The world’s premiere MMA promotion compiled an excellent card for fight fans to enjoy. It was headlined by a meeting between Israel Adesanya and Marvin Vettori in a bout. Their first fight took place at UFC 256 this past December where they went to a majority draw. The co-headliner saw a bout between Deiveson Figueiredo and Brandon Moreno for the flyweight title.  Leon Edwards vs. Nate Diaz in a welterweight bout, Demian Maia vs. Belal Muhammad in a welterweight showdown, and Paul Craig vs. Jamahal Hill in a light heavyweight fight rounds finished out the main card. It was certain to have a great night of fights. Check out MMA News’ UFC 263 results below. Israel Adesanya vs. Marvin Vettori Marvin caught a leg kick and got a takedown into full guard. Adesanya got back to his feet  Marvin cracked him, but Izzy did not sell it. Izzy was in a good striking flow to end the first round.  Vettori worked for a takedown in the second round and Adesanya landed some nasty elbows that caused Vettori to separate. Adesanya continued to land at will, but Vettori was blitzing him and Adesanya was using head movements to avoid it. In the third round, Vettori took him down and got half guard. Vettori took his back and went for a rear-naked choke, but Adesanya scrambled on top. Vettori got back to his feet. Adesanya briefly dropped him with a leg kick, but Vettior got right back up. The fourth round saw Vettori get a takedown after a clinch up against the fence. Adesanya got right back to his feet. Adesanya opened the fifth round with a head kick. Vettori clinched with him up against the fence. Adesanya got the decision win to retain his title. Deiveson Figueiredo vs. Brandon Moreno Moreno was using leg kicks early on and looking sharp. Figueiredo was reserved and looking for his shots. Moreno dropped him with a strike and got on top in half guard. Figueiredo got back to his feet. Moreno tagged him with a jab in the second round before Figueiredo took him down and got on top in half guard. Moreno got back to his feet a few minutes later and clinched with him up against the fence. Moreno took him down and got his back briefly, but Figueiredo moved to full guard.  Moreno took him down and got his back in the third round. Moreno went for a rear-naked choke for the win to become the new champion! Leon Edwards vs. Nate Diaz Edwards was coming forward early with a lot of leg kicks being thrown. Diaz tagged him in round one before Edwards clinched with him up against the fence and dragged him to the ground. Edwards took his back. In the second round, Edwards took him down and Diaz went for a heel hook, but Edwards got out of it. They got back to their feet. Diaz played some mind games. Diaz’s left leg was getting more red as the fight went on. As the third round went on, Diaz started to bleed more from multiple areas on his head and face. Edwards continued to land some good elbows in the clinch. Edwards got him down and landed a big elbow shot. Diaz doing a nice job of constant movement while Edwards tried to stay locked on him. Diaz got back to his feet and Edwards caught him with a spinning back fist. Edwards with a trip takedown, but let Diaz got right back to his feet. Diaz tagged him a few times before Edwards clinched with him at the fence. In the fifth round, Diaz played some mind games while bleeding and Edwards continued to land. Diaz tagged him with a big punch and tried to finish him, but Edwards survived and got the decision win. ","CoverImageSource":"155eebc5-718a-c0c3-1dd3-40848437119d.jpg","CategoryId":4,"Category":null,"Comments":null,"Pictures":[],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'2021-06-13T10:57:48.7583327' AS DateTime2), N'Add Post', N'{"Header":"Fighters React To Deiveson Figueiredo vs. Brandon Moreno At UFC 263","Text":"Deiveson Figueiredo vs. Brandon Moreno in a flyweight title bout was great. The showdown served as the co-main event of the UFC 263 pay-per-view event on Saturday night (, 2021) from Glendale, Arizona from Gila River Arena. As seen in the fight, Moreno looked sharp in the first round and was outlanding Figueiredo, who was reserved and went to clinching with him. Near the end of the first round, Moreno caught him with a jab as Figueiredo was walking in. Figueiredo eventually got back to his feet. In the second round, it opened with Moreno catching him with a jab before Figueiredo took him down. Moreno was able to score a takedown and got his back before Figueiredo moved into full guard. It all ended in the third round when Moreno got a rear-naked choke for the win to become the new champion. Their first fight took place at UFC 256 this past December where they went to a majority draw. Figueiredo was looking to make his latest title defense. On the flip side, Moreno was looking to make a name for himself after rising up the ranks to earn this title fight. ","CoverImageSource":"8352b4a0-12bd-9a2b-f5ea-78ddd0e00994.jpg","CategoryId":4,"Category":null,"Comments":null,"Pictures":[],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'2021-06-13T11:03:26.8325129' AS DateTime2), N'Add Post', N'{"Header":"ROLAND GARROS PREVIEW: A 19TH MAJOR FOR DJOKOVIC OR DOES TSITSIPAS GRAB HIS FIRST?","Text":"If Novak Djokovic defeats Stefanos Tsitsipas Sunday in Paris, the Serb would become the first man in the Open Era to win all four majors twice. The generational clash is becoming a thing in men’s major finals. At this year’s first Slam, the Australian Open, 33-year-old Novak Djokovic defeated 25-year-old Daniil Medvedev. On Sunday at Roland Garros, Djokovic, now 34, will take on 22-year-old Stefanos Tsitsipas. The Big 3 are still at the top of the mountain, but the Next Gen is just a match away from joining them on that summit. Can Tsitsipas do what Medvedev couldn’t in Melbourne, and push Djokovic off that peak in Paris? To stay with the same metaphor, it will be an uphill effort. On Friday Djokovic scaled his own self-described Everest when he beat Rafael Nadal for the second time in nine tries at Roland Garros. Rather than having a letdown on Sunday, I would guess that he’ll be doubly determined not to waste a precious opportunity to win his second title in Paris. The last time he beat Rafa there, in 2015, he lost the final to Stan Wawrinka. Fortunately for Djokovic, Tsitsipas is not Wawrinka. The Greek is a formidable opponent and a potential future No. 1 who is gaining confidence by the day. He pushed Djokovic to five sets in the semis in Paris last year, and he pushed him to the limit a couple weeks ago in Rome before falling 4-6, 7-5, 7-5. But he won’t scare Djokovic in the same way that Wawrinka did, because he doesn’t have the same unpredictable ability to take the racquet out of an opponent’s hand on a given day, the way Stan did when he was at his best.","CoverImageSource":"5ba1d043-a1c9-7d4f-2009-a3cee0556383.jpg","CategoryId":5,"Category":null,"Comments":null,"Pictures":[{"PostId":null,"PictureSource":"4e86617b-f09f-9541-f740-6c1d21fefd14.jpg","PictureAlt":"alt","Id":0},{"PostId":null,"PictureSource":"58c7454e-595d-9963-73dd-88a7beb8255d.jpg","PictureAlt":"alt","Id":0}],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'2021-06-13T11:03:32.3473028' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'2021-06-13T11:08:56.5069326' AS DateTime2), N'Add Post', N'{"Header":"Nuggets face daunting deficit; Nikola Jokic faces ignominious exit","Text":"Four NHL teams have overcome 3-0 deficits in a best-of-seven playoff series, including the 1942 Stanley Cup champion Toronto Maple Leafs. The Boston Red Sox pulled off MLB''s only such comeback against the New York Yankees in 2004. The Denver Nuggets are the 143rd NBA team to go down 3-0 in a best-of-seven playoff series and nobody''s ever overcome such a daunting deficit to win four straight. The Nuggets say their only aim is to send the series back to Phoenix with a win in Game 4 Sunday night in Denver. ''The last thing I want to see is the Phoenix Suns pushing a broom across our home court,'' Nuggets coach Michael Malone said Friday night after Denver''s 116-102 loss to the Suns. Malone has said all along the Nuggets could show growth this season after losing a year ago to the Los Angeles Lakers in the Western Conference Finals. ''We have had a tremendous season, tremendous. I said going into this year you can''t judge a season by the end result. ... But the one thing I don''t want is for us just to go out quietly into that good night,'' Malone said. ''I hope we show some real fight and resolve and force this series to go back to Phoenix for Game 5.'' If not, Nikola Jokic will become the first MVP to get swept in a playoff series since the league adopted the best-of-seven format for all rounds beginning in 2003. ''We just need to go out there and fight and give everything we’ve got'', Jokic said. Only three MVPs (Steph Curry in 2015, LeBron James in 2012 and ‘13 and Tim Duncan in 2003) have won it all since 2003 when it’s taken 16 playoff victories to raise the Larry O''Brien NBA Championship Trophy. Curry came up just short again in 2016 when James led the Cavaliers to a Game 7 win in the NBA Finals. Since then, MVPs are just 31-24 in the playoffs with none of them even reaching the Finals. That includes two MVPs who exited in the first round: Russell Westbrook in 2017 and Dirk Nowitzki in 2007.","CoverImageSource":"9f852fd3-1985-c965-c15d-d53071d9ab57.jpg","CategoryId":6,"Category":null,"Comments":null,"Pictures":[],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'2021-06-13T11:12:24.3260286' AS DateTime2), N'Add Category', N'{"CategoryName":"Formula 1","Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'2021-06-13T11:14:51.9709525' AS DateTime2), N'Add Post', N'{"Header":"Formula 1 team McLaren to race in Extreme E in 2022","Text":"McLaren will race in the climate-aware off-road series Extreme E next year. The illustrious Formula 1 team, who have eight constructors'' titles, join seven-time F1 champion Lewis Hamilton, whose own X44 team is currently competing in the inaugural season. Extreme is streamed live across the BBC iPlayer and BBC Sport website. Brown added: ''It gives us the ability to accelerate and boost our own overarching sustainability agenda, which shares the same priorities of decarbonisation, waste reduction, diversity and equality.'' Extreme E is two races into its five-race season, in which cars travel on a ''floating paddock'' - the St Helena ship - to remote locations around the world to race electric SUVs as well as raise awareness on areas affected by climate change. It is not yet clear who McLaren want to drive the car next year - in which a male and female driver share the role across race weekends - but Brown said: ''We are looking to replicate our F1 and Indycar programmes. We want to find the two fastest and most exciting drivers out there.''","CoverImageSource":"3f491d83-bc60-fa10-8a54-91095b3d145d.jpg","CategoryId":9,"Category":null,"Comments":null,"Pictures":[],"Date":"2021-06-13T00:00:00","Rating":null,"Id":0}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'2021-06-13T11:30:04.2590553' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'2021-06-13T11:30:19.3371902' AS DateTime2), N'Search Categories', N'{"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'2021-06-13T11:31:24.4789302' AS DateTime2), N'Update Category', N'{"CategoryName":"Formula 1","Id":9,"IsActive":false}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'2021-06-13T11:31:49.5035972' AS DateTime2), N'Update Category', N'{"CategoryName":"Formula 1","Id":9,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'2021-06-13T15:51:35.1142280' AS DateTime2), N'Update Role', N'{"RoleName":"User","UseCases":[3,8,10,14,16,17,18,19,20,21,22,23,25],"Id":1,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'2021-06-13T15:59:01.0081158' AS DateTime2), N'Register New User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'2021-06-13T15:59:04.9772025' AS DateTime2), N'Register New User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'2021-06-13T15:59:20.1967272' AS DateTime2), N'Register New User', N'{"Username":"newUser2","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user2@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'2021-06-13T15:59:26.2649050' AS DateTime2), N'Register New User', N'{"Username":"newUser3","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user3@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'2021-06-13T15:59:32.1666820' AS DateTime2), N'Register New User', N'{"Username":"newUser4","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user4@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'2021-06-13T15:59:38.0105268' AS DateTime2), N'Register New User', N'{"Username":"newUser5","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user5@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'2021-06-13T15:59:44.4988745' AS DateTime2), N'Register New User', N'{"Username":"newUser6","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user6@gmail.com","Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'2021-06-13T16:03:36.5948577' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":1,"OrderByDirection":0,"Paged":false,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'2021-06-13T16:03:41.1693698' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":false,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'2021-06-13T16:55:19.5132822' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'2021-06-13T17:01:13.5525689' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":2,"UserId":1,"Content":"comment","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'2021-06-13T17:01:27.4096192' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":2,"UserId":12,"Content":"comment","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'2021-06-13T17:03:00.1367525' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":2,"UserId":1,"Content":"comment 2","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'2021-06-13T17:03:17.9893104' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":2,"UserId":2,"Content":"comment 2","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 2 [test]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'2021-06-13T17:05:26.6301921' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":3,"UserId":3,"Content":"comment 3","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 4 [newUser2]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'2021-06-13T17:05:37.2115449' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":3,"UserId":4,"Content":"comment 3","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 4 [newUser2]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'2021-06-13T17:06:14.5307684' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":4,"UserId":5,"Content":"comment 4","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 5 [newUser3]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'2021-06-13T17:07:16.5636240' AS DateTime2), N'Add Comment', N'{"Username":null,"PostId":4,"UserId":6,"Content":"comment 5","Date":"0001-01-01T00:00:00","Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'2021-06-13T17:08:00.9005676' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":2,"Rate":1,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'2021-06-13T17:08:09.4896384' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":2,"Rate":1,"Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'2021-06-13T17:08:15.6180203' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":2,"Rate":2,"Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'2021-06-13T17:08:26.9554384' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":3,"Rate":2,"Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'2021-06-13T17:08:30.4215253' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":4,"Rate":2,"Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'2021-06-13T17:08:37.4227860' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":5,"Rate":5,"Id":0,"IsActive":true}', N'ID: 6 [newUser4]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'2021-06-13T17:09:50.2728463' AS DateTime2), N'Add Review', N'{"UserId":6,"PostId":2,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'2021-06-13T17:09:58.0536226' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":2,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'2021-06-13T17:10:03.2491405' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":3,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'2021-06-13T17:10:07.6094981' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":4,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'2021-06-13T17:10:11.6639487' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":5,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'2021-06-13T17:10:16.3415073' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":6,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'2021-06-13T17:10:21.7672800' AS DateTime2), N'Add Review', N'{"UserId":1,"PostId":7,"Rate":5,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'2021-06-13T17:10:28.8026102' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":true,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'2021-06-13T17:29:12.9647810' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":null,"Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'2021-06-13T17:29:35.8237152' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'2021-06-13T17:29:43.1612138' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":3,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'2021-06-13T17:29:49.1326633' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":5,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'2021-06-13T17:30:58.2686709' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":2,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'2021-06-13T17:38:22.2414646' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":8,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'2021-06-13T17:40:02.3503657' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":2,"Id":3,"IsActive":true}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'2021-06-13T17:40:14.7140659' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":false}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'2021-06-13T17:40:29.1911267' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":3,"Id":3,"IsActive":false}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'2021-06-13T17:40:56.8029574' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":false}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'2021-06-13T17:41:08.7523144' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":true}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'2021-06-13T17:41:48.3268743' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":3,"Id":3,"IsActive":true}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'2021-06-13T17:41:59.9561813' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":true}', N'ID: 3 [newUser1]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (135, CAST(N'2021-06-13T17:43:09.7828207' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":2,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (136, CAST(N'2021-06-13T17:43:51.7921801' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":false}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (137, CAST(N'2021-06-13T17:44:00.4509505' AS DateTime2), N'Update User', N'{"Username":"newUser1","FirstName":"First Name","LastName":"Last Name","Password":"Sifra123.","Email":"user1@gmail.com","RoleId":1,"Id":3,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (138, CAST(N'2021-06-15T18:25:48.5954629' AS DateTime2), N'Add Role', N'{"RoleName":"Moderator","UseCases":[],"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (139, CAST(N'2021-06-15T18:26:09.3756744' AS DateTime2), N'Add Role', N'{"RoleName":"Moderator","UseCases":[18,24],"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (140, CAST(N'2021-06-15T18:29:41.5787695' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (141, CAST(N'2021-06-15T18:29:44.5186728' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (142, CAST(N'2021-06-15T18:29:55.9293547' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (143, CAST(N'2021-06-15T18:31:18.4958518' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (144, CAST(N'2021-06-15T18:32:14.0348427' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (145, CAST(N'2021-06-15T18:33:16.1790459' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":false,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (146, CAST(N'2021-06-15T18:33:46.6573346' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":true,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (147, CAST(N'2021-06-15T18:34:22.3252841' AS DateTime2), N'Register New User', N'{"Username":"test moderator","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":0,"IsModerator":true,"CanGrantModeratorRole":true,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (148, CAST(N'2021-06-15T18:36:11.7825203' AS DateTime2), N'Search Posts', N'{"Date":null,"Category":null,"OrderByDirection":0,"Paged":false,"Keyword":null,"PerPage":15,"CurrentPage":1}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (149, CAST(N'2021-06-15T18:38:06.1874745' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [test moderator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (150, CAST(N'2021-06-15T18:52:24.5638394' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (151, CAST(N'2021-06-15T18:56:43.8045284' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (152, CAST(N'2021-06-15T18:58:26.7835104' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (153, CAST(N'2021-06-15T18:59:22.2952753' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (154, CAST(N'2021-06-15T18:59:28.0666343' AS DateTime2), N'Delete Review', N'6', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (155, CAST(N'2021-06-15T19:01:33.3595986' AS DateTime2), N'Delete Comment', N'4', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (156, CAST(N'2021-06-15T19:01:34.9676210' AS DateTime2), N'Delete Comment', N'4', N'ID: 9 [testModerator]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (157, CAST(N'2021-06-15T19:18:02.0474552' AS DateTime2), N'Register New User', N'{"Username":"testModerator2","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":4,"IsModerator":true,"CanGrantModeratorRole":true,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (158, CAST(N'2021-06-15T19:18:19.0977595' AS DateTime2), N'Register New User', N'{"Username":"testModerator2","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":1,"IsModerator":true,"CanGrantModeratorRole":true,"Id":0,"IsActive":true}', N'ID: 0 [Anonymous Actor]')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (159, CAST(N'2021-06-15T19:18:29.9424759' AS DateTime2), N'Register New User', N'{"Username":"testModerator2","FirstName":"Fname","LastName":"lastName","Password":"Sifra123.","Email":"moderator@gmail.com","RoleId":4,"IsModerator":true,"CanGrantModeratorRole":true,"Id":0,"IsActive":true}', N'ID: 1 [vesicd8]')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (1, N'vesicd8', N'Dusan', N'Vesic', N'dusan.vesic10@gmail.com', 2, N'password', 1, CAST(N'2021-06-10T00:00:00.0000000' AS DateTime2), NULL, NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (2, N'test', N'test', N'test', N'test@gmail.com', 1, N'test', 1, CAST(N'2021-06-10T00:00:00.0000000' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (3, N'newUser1', N'First Name', N'Last Name', N'user1@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:02.7121275' AS DateTime2), CAST(N'2021-06-13T17:44:00.4578322' AS DateTime2), NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (4, N'newUser2', N'First Name', N'Last Name', N'user2@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:20.2009133' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (5, N'newUser3', N'First Name', N'Last Name', N'user3@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:26.2692257' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (6, N'newUser4', N'First Name', N'Last Name', N'user4@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:32.1755526' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (7, N'newUser5', N'First Name', N'Last Name', N'user5@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:38.0248991' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (8, N'newUser6', N'First Name', N'Last Name', N'user6@gmail.com', 1, N'Sifra123.', 1, CAST(N'2021-06-13T15:59:44.5013526' AS DateTime2), NULL, NULL, 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [FirstName], [LastName], [Email], [RoleId], [Password], [IsActive], [CreatedAt], [ModifiedAt], [DeletedAt], [CanGrantModeratorRole], [IsModerator]) VALUES (9, N'testModerator', N'Fname', N'lastName', N'moderator@gmail.com', 4, N'Sifra123.', 1, CAST(N'2021-06-15T18:29:41.6102215' AS DateTime2), NULL, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [AK_Reviews_UserId_PostId]    Script Date: 16-Jun-21 7:30:41 PM ******/
ALTER TABLE [dbo].[Reviews] ADD  CONSTRAINT [AK_Reviews_UserId_PostId] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (N'') FOR [CategoryName]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (N'') FOR [Content]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (N'') FOR [PictureSource]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (N'') FOR [PictureAlt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (N'') FOR [Header]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (N'') FOR [Text]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (N'') FOR [CoverImageSource]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (N'') FOR [RoleName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Username]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [CanGrantModeratorRole]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsModerator]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[Pictures]  WITH CHECK ADD  CONSTRAINT [FK_Pictures_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Pictures] CHECK CONSTRAINT [FK_Pictures_Posts_PostId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Posts_PostId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users_UserId]
GO
ALTER TABLE [dbo].[RoleUseCase]  WITH CHECK ADD  CONSTRAINT [FK_RoleUseCase_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUseCase] CHECK CONSTRAINT [FK_RoleUseCase_Roles_RoleId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
