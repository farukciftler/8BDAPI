USE [filmciso_api]
GO
/****** Object:  Table [dbo].[announcement]    Script Date: 7/3/2020 4:36:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[announcement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[announcement] [text] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_announcement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entry]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NULL,
	[subjectId] [int] NULL,
	[entry] [nvarchar](max) NULL,
	[createDate] [datetime] NULL,
	[lastUpdateDate] [datetime] NULL,
 CONSTRAINT [PK_entry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entrynotice]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entrynotice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entryId] [int] NULL,
	[noticedById] [int] NULL,
	[notice] [text] NULL,
	[createdOnUtc] [datetime] NULL,
 CONSTRAINT [PK_entrynotice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[garbageentry]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[garbageentry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entryId] [int] NULL,
	[authorId] [int] NULL,
	[subjectId] [int] NULL,
	[entry] [text] NULL,
	[createDate] [datetime] NULL,
	[lastUpdateDate] [datetime] NULL,
	[deletedDate] [datetime] NULL,
	[deletedFor] [text] NULL,
 CONSTRAINT [PK_garbageentry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NULL,
	[subject] [nvarchar](55) NULL,
	[isActive] [int] NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[BSHIU] [varchar](5) NULL,
	[totalCount] [int] NULL,
 CONSTRAINT [PK_subjecgt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[activationToken] [varchar](8) NULL,
	[activationTokenValidTime] [datetime] NULL,
	[userLevel] [int] NULL,
	[isApproved] [int] NULL,
	[isActive] [int] NULL,
	[registerIp] [varchar](50) NULL,
	[registerDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userlevel]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userlevel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userLevel] [int] NULL,
	[userLevelInfo] [varchar](55) NULL,
 CONSTRAINT [PK_userlevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vote]    Script Date: 7/3/2020 4:36:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[authorId] [int] NULL,
	[entryId] [int] NULL,
	[userId] [int] NULL,
	[date] [datetime] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_vote] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[announcement] ON 

INSERT [dbo].[announcement] ([id], [userId], [announcement], [createDate]) VALUES (1, 30, N'test', CAST(N'2020-07-03T05:16:08.447' AS DateTime))
INSERT [dbo].[announcement] ([id], [userId], [announcement], [createDate]) VALUES (2, 30, N'test', CAST(N'2020-07-03T05:17:29.970' AS DateTime))
INSERT [dbo].[announcement] ([id], [userId], [announcement], [createDate]) VALUES (3, 30, N'test', CAST(N'2020-07-03T05:20:01.173' AS DateTime))
INSERT [dbo].[announcement] ([id], [userId], [announcement], [createDate]) VALUES (4, 30, N'ah be kardeşim', CAST(N'2020-07-03T07:00:00.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[announcement] OFF
GO
SET IDENTITY_INSERT [dbo].[entry] ON 

INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (30, 26, 10, N'Başlıklar sözlük formatı kapsamında herhangi bir konuyu yahut tartışmayı gündeme getirmeye yarayan öncüllerdir. Bu kapsamda başlık, altında yer alacak tanımların kapsamını belirler.<br /><br />    1. Başlık …. karakterden uzun olamaz:<br />Başlık açarken işlenmek istenen konuyu en kısa ve net bir biçimde anlatacak kelimeler tercih edilmelidir.<br /><br />    2. Başlıklarda yalnızca kesme işareti, nokta ve iki nokta kullanılabilir filmin orijinal isminde yer alan diğer noktalama işaretleri başlık açılırken kullanılamaz:<br /><br />(b: Örn:) İyi, Kötü ve Çirkin (b: (hatalı başlık virgül kullanılamaz))<br />         İyi Kötü Çirkin   (doğru başlık)<br /><br />        Yedi Samuray – Kanlı Pirinç (b: (hatalı başlık))<br />        Yedi Samuray Kanlı Pirinç   (doğru başlık)<br /><br />    3. Başlık belirleyici ve net olmalı haber bülteni başlıkları gibi olmamalıdır.<br /><br />Örn: Locarno Uluslararası Film Festivalinin kazananı (b: (hatalı başlık))<br />         Locarno Uluslararası Film Festivalini kim kazandı (b: (hatalı başlık))<br />         Locarno Uluslararası Film Festivalinde ödüller sahibini buldu (b: (hatalı başlık))<br />         Vitalina Varela Altın Leopar’ı Kaptı (b: (hatalı başlık))<br />         2020 Locarno Uluslararası Film Festivali (doğru başlık)<br /><br />    4. Film başlıklarında filmin orijinal ismi kullanılmalıdır. (buraya orijinal isimden tam  olarak ne anlamak gerekiyor onu belirtmek gerekli)', CAST(N'2020-04-09T20:47:38.567' AS DateTime), CAST(N'2020-04-09T20:47:38.567' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (31, 26, 11, N'    • Tanım başlıkta yer alan hususa ilişkin bilgi verme, açıklama yahut örneklendirme suretiyle yapılır. Bu nedenle başlıkla ilgisi olmayan okuyanda hiçbir anlam ifade etmeyen sübjektif içerikler bilgi kümesi için bir anlam ifade etmediği gibi tanım özelliği de taşımaz.<br /><br />Örn: (b: Başlık): Bir Zamanlar Anadolu’da<br />(b: Tanım): harika bir filmdi. (beğeni temellendirilmediğinden (b: hatalı tanım). niçin harikaydı?)<br />(b: Tanım): çevremdeki herkes o kadar övdü ki izlemek farz oldu. (film hakkında bilgi edinmek isteyenler için bir anlam ifade etmiyor bu nedenle (b: hatalı tanım); siz kimsiniz, çevrenizdekiler kim?)<br />(b: Tanım): bol figüran, bol diyalog ve kara mizahıyla en iyi nbc filmi. (beğenisine ilişkin açıklama sunmuş (b: doğru bir tanım))<br />(b: Tanım): Nuri Bilge Ceylan’ın 2011 yapımı filmi. (filme ilişkin bilgi verilmiş (b: doğru bir tanım))<br /><br />    • Tanımda ek bir açıklama olmaksızın sadece filmde yer alan diyaloglara yer vermek tanım olarak kabul edilmez. Diyaloglarla birlikte  yukarıda yer alan uyarılar gözetilerek tanım kriterleri sağlanmalıdır.<br /><br />    • Başlığın ilk tanımı yalnızca boş bakınız, resim, video veya linkten oluşamaz. Film başlığı açıldıktan sonra ilk tanıma herhangi bir açıklama yapmaksızın fragman linki veya afiş fotoğrafı koymak tanım olarak kabul edilmez.<br /><br /><br />    • Tanımlarda hakaret, küfür, ağır argo kullanılamaz. Bir kimsenin onur, şeref ve saygınlığını rencide edebilecek nitelikte somut bir fiil veya olgu tanımlar vasıtasıyla isnat edilemez. <br /><br />    • Tanımda alıntı kullanılmışsa belirtilmeli ve kaynak gösterilmelidir. Kaynak gösterilmemesinden kaynaklı her türlü yasal sorumluluk kullanıcılara aittir.<br />', CAST(N'2020-04-09T20:49:25.490' AS DateTime), CAST(N'2020-04-09T20:49:25.490' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (32, 26, 12, N'(b: Filmcisözlük), sinemaya dair her şeyin paylaşılıp tartışılabildiği bir interaktif sözlük platformudur.<br />Her kullanıcı sözlüğe kayıt olurken yalnızca bir hesap kullanabilir.<br />Kayıt olurken kullanılan kullanıcı ismi küfür, hakaret, ağır argo içeremez.<br />Tanım ve başlık kuralları için aşağıdaki linklerde yer alan uyarılara göz atabilirsiniz.', CAST(N'2020-04-09T21:22:41.963' AS DateTime), CAST(N'2020-04-09T21:22:41.963' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (73, 26, 25, N'bu başlığa sistemde bulunan acil düzeltilmesi gerektiğini düşündüğünüz (b: yazılımsal hatalar) ve eklenmesi gereken (b: yazılımsal eksiklikler)i yazabilirsiniz. içinde bulunduğumuz platform okurlarının istekleri doğrultusunda gelişecektir. en kısa zamanda (b: yazar profil sayfaları), (b: mesajlaşma )ve (b: duyurular )da açılacaktır. görüş ve önerilerinizi daha detaylı anlatmak isterseniz (b: filmcisozluk@gmail.com) mail adresine mail yollayabilirsiniz.', CAST(N'2020-04-11T14:35:26.193' AS DateTime), CAST(N'2020-04-11T14:35:26.193' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (74, 30, 12, N'umarım güzel bir platform halini kısa zaman içinde alır dediğim sözlüktür. biz de yazmaya geldik umarım güzel olur.', CAST(N'2020-04-11T15:48:41.217' AS DateTime), CAST(N'2020-04-11T15:48:41.217' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (75, 29, 26, N'İlk filmlerinde annesini, babasını ve tanıdıklarını oynamaya ikna ederek filmlerini çeken Türk yönetmen.', CAST(N'2020-04-11T15:56:02.187' AS DateTime), CAST(N'2020-04-11T15:56:02.187' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (76, 31, 27, N'Yıllanmış şarap misali değeri gün geçtikçe artan yönetmen. Türk sinemasının köşe taşlarından. ', CAST(N'2020-04-11T16:00:48.910' AS DateTime), CAST(N'2020-04-11T16:00:48.910' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (77, 29, 28, N'Aslı ''çocuğa göre, çocuklar için yapılan sinema'' fakat ''başrolü çocuk olan sinema'' ve ''çocuksu sinema'' ile sık sık karıştırılır.', CAST(N'2020-04-11T16:01:36.673' AS DateTime), CAST(N'2020-04-11T16:01:36.673' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (78, 31, 29, N'Açılımı Türk Sineması Araştırmaları (TSA). Türk sineması üzerine hazırlanmış en geniş kapsamlı veri tabanı. www.tsa.org.tr', CAST(N'2020-04-11T16:04:26.113' AS DateTime), CAST(N'2020-04-11T16:04:26.113' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (79, 30, 27, N'röportajlarında çoğu kez film yapmanın en büyük tutkusu olduğunu söylemiş ve çekeceği filmleriyle çocuk gözüyle dünyaya bakabilmenin nasıl bir şey olduğunu insanlara anlatmanın en büyük isteği olduğunu belirtmiştir.', CAST(N'2020-04-11T16:05:17.290' AS DateTime), CAST(N'2020-04-11T16:05:17.290' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (81, 29, 31, N'WASP (white anglo saxon protestan) propagandası yapan film. filmdeki kötü karakterler diğer milletlerden. ', CAST(N'2020-04-11T16:15:16.983' AS DateTime), CAST(N'2020-04-11T16:15:16.983' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (83, 29, 33, N'Diyecektim ki hani böyle çocuk hikayesi gibi gözüküp aslında büyükler için olanlar var ya, işte öyle olan filmler de var. Onlardan biri olan Sihirli Dadı''dan söz edeceğim. Bence Sihirli Dadı "değişim" i çok güzel ele almış.<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />Film, annesini kaybetmiş, yedi tane inanılmaz yaramaz çocuğu anlatır. Çocuklar eve gelen tüm dadıları kaçırır fakat bir gün diğerlerinden farklı, sihirli güçleri olan bir dadı gelir. Artık çocukların uslanmaktan başka çaresi yoktur.<br /><br /> Böyle söyleyince biraz klişe gelebilir ama şöyle ilginç detaylar var; dadının yüzünde kocaman et benleri, fazlaca büyük bir burun, dudağından sarkan bir diş var. Yani dışarıdan bakınca korkutuyor. Dadı diyor ki ben bu çocuklara beş ders öğreteceğim; söylenildiği saatte yatmak, söylenildiği saatte kalkmak, lütfen demek, teşekkür etmek(galiba:), bir de söz dinlemek. çocuklar bu derslerden birini öğrendiklerinde dadının yüzünden bir ben ya da dişi yok oluyor. Git gide yüzü güzelleşiyor.<br /><br /><br /><br /><br /><br /><br /><br /><br /><br />Bu film Rad suresi 11. ayeti aklıma getirdi. "Onlar özlerindeki (kötü halleri)ni (iyiye) değiştirmedikçe, Allah da onların durumunu değiştirmez."* Herkes, hepimiz değişim istiyoruz. Sıkılıyoruz aynı durumlardan, hallerden. Biliyoruz önce kendimizi değiştirmemiz lazım ama illa mucize bekliyoruz. Mucize gelecek, illa büyülü sopasıyla çirkin dadı gelip bizi dürtecek. Yok işte filmlerde geliyorlarmış değişim istiyorsak önce kendimizden başlayacakmışız. Hedef olarak önce 5 ders mi koyarız, 32 mi koyarız ben bilmem ama bir yerden başlamak lazım.<br /><br /><br /><br />Durduğumuz yerde bir şey yapmadan değişim istiyoruz, hiçbir şey yapmamak için de bahanemiz bol. Şikayet ediyoruz, ondan bundan ama o durduğumuz yer sıkıntılı. Oradan bakınca her şey üstüne üstüne geliyor, hep engel. Tekrar dadıya dönersek belki de dadı hep çok güzeldi, hep güler yüzlü, hep anlayışlıydı. Fakat çocuklar fenalıklarından onu korkunç bir cadı gibi görüyorlardı. Ne zaman ki durdukları yeri değiştiriyorlar, artık korkunç cadı, sevimli dadı oluyor.<br /><br /><br /><br />Dadının bir de mottosu var. "Bana ihtiyacınız varsa ve beni istemiyorsanız, kalırım fakat bana ihtiyacınız yoksa ama kalmamı istiyorsanız, giderim."<br /><br />Beklenmedik anda gelen felaket mübarek! Bazen de değişim zorunlu olur. En beklemediğin anda bir olay yaşarsın, biriyle tanışırsın ve değişirsin. Başka çaren yoktur değişmekten başka. Senin isteyip istememeni önemsemez gelip buluverir ansızın.<br /><br /><br /><br />Zorunlu değişimler beni korkutuyor. Inşallah zorunlulara gerek kalmadan kendi kendimizi iyiye, güzele, hayra değiştiririz. Çok değişim dedim, devam edemeyeceğim, aklıma nehir geliyor, her girdiğimizde farklı olan.. tövbest.. :D  neyse demek istediğim anlaşılmıştır inşallah.<br /><br />', CAST(N'2020-04-11T16:17:49.123' AS DateTime), CAST(N'2020-04-11T16:17:49.123' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (84, 31, 34, N'kısaca tsa. türk sineması üzerine hazırlanmış en geniş kapsamlı veri tabanı.<br />(bkz: www.tsa.org.tr)', CAST(N'2020-04-11T16:18:23.457' AS DateTime), CAST(N'2020-04-11T16:18:23.457' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (85, 29, 35, N'bana üniversitedeki ilk yılımı hatırlatan animasyon filmi.', CAST(N'2020-04-11T16:23:38.677' AS DateTime), CAST(N'2020-04-11T16:23:38.677' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (86, 29, 36, N'özellikle son yıllarda popili olan okulsuz eğitim ve evden eğitim tartışmalarını tekrar düşündüren film. Karı koca doğaya taşınırlar, çocuklarını modern toplumdan uzakta ''filozof krallar'' olarak yetiştirmeye karar verirler. Harika düşünsel beceriye sahip bu çocuklar gerçekten iyi eğitimli midirler?', CAST(N'2020-04-11T16:41:48.797' AS DateTime), CAST(N'2020-04-11T16:41:48.797' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (87, 30, 37, N'(gbkz: jake gyllenhaal)''in başrolünde yer aldığı (gbkz: homer hickam)''ın hayatını anlatan amerikan yapımı film.<br /><br />efendim klasik bir holywood filmiyle karşı karşıyayız. homer isimli bir çocuk ve yaramaz arkadaşlarının 1957 yılında sputnik’in uzaya ruslar tarafından fırlatılmasıyla beraber başlayan bilim mücadelesine müdahil olmalarını konu edinen bir film. coalwood adlı neredeyse herkesin madenci olduğu bu köyde yetişen bu çocuklar madencilik ve hayalleri arasında çatışmalar yaşamaktadırlar. gerçekten uyarlanan bu film `(gbkz: nasa)`’da eğitmen olan `(gbkz: homer hickam)`’ın hayatını hikayesini konu olarak ele alıyor. burada homer’ı canlandıran `jake gyllenhaal`‘ı daha birkaç sene sonra (2001) `(gbkz: donnie darko)`‘yu oynarken görüyor olacağız. gerçekten çok iyi bir oyunculuk çıkardığını söyleyebilirim. <br /><br /><br />--- `(gbkz: spoiler)` ---<br /><br />(b: "roket yapacağım")<br /><br />film aslında tam olarak bu cümleyle başlıyor. önceki kısımlar tam olarak prolog yani giriş mahiyetinde diyebiliriz. filmdeki çatışma noktası homer’ın `sputnik`’i uzayda görüp haylazlıktan vazgeçmesi ve kendisine roket yapma idealini edinmesiyle başlıyor diyebiliriz. çünkü homer’ın babası john hickam filmde yaşadıkları `(b: coalwood)` köyündeki kömür madeninin baş madencisi ve kendi oğlunun bir madenci olmayı seçmek yerine roket yapmakla uğraşması onun için utanç verici bir olay. bu dediklerim size garip gelebilir fakat 1950’li yıllarda insanlar uzay uğraşlarının boş bir çaba olduğunu düşünmektelerdi. hatta o zaman yaşayan bir kısım insan için rusya sputnik uydusunu tamamen gösteriş amaçlı yollamıştı uzaya. <br /><br />homer bu ideali edindikten sonra okulunda hiç kimsenin aynı masaya bile oturmadığı oldukça çalışkan olduğundan dolayı dışlanan ve bilime oldukça meraklı olan quentin ile aynı masaya oturur ve ona bir roketin nasıl yapılacağını sorar. ikisinin de artık ortak bir ideali vardır. diğer iki arkadaşı roy lee ve o’dell de bu işe gönül verdikten sonra hepsi bir araya gelerek roket yapma çabalarına başlarlar. kütüphanede araştırma yaparlar, roketlerini test etmek için kasabadan uzakta bir düzlük keşfederler. roket yapma fikri kendilerini giderek heyecanlandırmıştır.<br />--- `(gbkz: spoiler)` --- <br /><br />filmin ilk 10 dakikasından bahsetmem yeterli sanırım. daha sonrasından bahsetmek istemiyorum fakat filmle ilgili birkaç çarpıcı noktadan bahsetmek istemiyorum. normalde holywood filmlerinde birden fazla katman görmek oldukça zordur. bu filmde bir çocuğun babasına kendisini zaman içerisinde kanıtlamasını, bir ideal uğruna yeterince çabalayınca o idealin birçok zorluğa ve imkansızlıklara rağmen gerçekleştğini görmekteyiz. filmdeki senaryonun oldukça doyurucu olduğunu söyleyebilirim. amerika’daki klasik bazı senaryo metotlarından kurtulamamış olsa da, kendisine özgün bir yapısı var. ayrıca senaryo ve oyuncu uyumları da oldukça şahane. bu rolü jake gyllenhaal’dan daha iyi kim oynayabilirdi bilemiyorum. <br /><br /><br />--- (gbkz: spoiler) ---<br /><br />ayrıca senaryoda dikkatimi çeken birkaç yön daha var. bu filmin olağan holywood seyrinden birkaç noktada ayrıldığını görüyoruz. bunda da büyük ihtimalle hikayenin gerçek bir hayat hikayesinden alıntılanmış olmasının büyük payı var. mesela normal bir holywood filminde çatışma bu kadar ince bir noktaya getirilmezdi diye düşünüyorum fakat burada seyircinin canı diğer holywood filminde olmadığı kadar sıkılmış. tahminimce izlendiği zamanlar yüksek puan almamasının sebebi de holywood seyirci kitlesinin beklentilerini bu noktada karşılayamamış olması. senaryoda ana eksende homer’ın roket yapma ideali olsa da, arkaplanda bir yandan homer’ın çocukluktan adamlığa geçişini, babasıyla olan ilişkisinin değişimini ve hayata daha azimle sarılmasını görüyoruz. çift katmanlı senaryonun ne kadar albenili olduğunu bir kez daha kanıtlıyor bu film bizlere. <br /><br />filmdeki ironi unsurları da oldukça gelişmiş. altyazıyı sadece burada replik paylaşma amacıyla koydum fakat bazı repliklerin orijinalinde de ne için söylendiği pek anlaşılmıyor. homer’ın öğretmeni (ki filmde büyük bir unsur) bazı noktalarda homer’a gerçekleri ifade etmek için mi yoksa onu gaza getirmek için mi çok kırıcı ifadeler kullanıyor hiçbir zaman bilemiyoruz. bunun dışında görüntü yönetmeni de oldukça sade ve güzel bir iş çıkartmış diyebilirim. bazı filmlerde heyecan aramamak gerekiyor görüntü kısmında, yeni açılar deneyeyim derken film berbat olabiliyor. buradaki görüntü yönetmeni oldukça standart metotlarla kaliteden ödün vermeden oldukça güzel açılarla bize aktarmış görüntüyü. zaten holywood’un en büyük başarılarından birisi de bu sanırım. görünen kısmı yani ilk katmanı çok iyi aktarması. fakat bu film bunun da ötesinde diğer katmanları da yani zahirden öte batını da çok güzel aktarabilmiş. <br /><br /><br />klasik bir holywood filminin sonunda nasıl baş karakter başarıya ulaşıyorsa tabi ki bu filmde de öyle oldu ve homer yaptığı roketle amerikan ulusal bilim yarışmasında birinci oldu ve köyüne gururla döndü. açıkçası senaryoda bu kısımdan sonrası beni pek alakadar etmedi. filmin teknik açıdan en beğenmediğim yeri de sonu diyebilirim fakat her zaman da teknik açıdan yaklaşmak insanı bir süre sonra oldukça karamsar bir yapıya sokabilir. bundan dolayı buraya biraz romantik yaklaşarak insanın çalışmalarının sonucunda her daim başarıyı elde ettiğini söyleyebilirim.<br />---  (gbkz: spoiler)  --- <br /><br />filmin politik yönüne gelecek olursak amerika’nın zaman zaman ihtiyaç duyduğu amerika ideali sunan bir film olduğunu söyleyebilirim. burada ilginç olan düşmanı olan rusya’nın sputnik uydusunu senaryosuna temel alması ve bunun üzerinden bir başarı hikayesi yazması. amerikanlardan korkulur abi demeye getiriyor insanı. açıkçası bu da oldukça başarılı bir metot. metot dediğime bakmayın aslında gerçekten olay böyle de yaşanmış olabilir fakat biliyoruz ki her filmde ister istemez bir şey abartılmıştır. her neyse, umarım sizin de severek ve “süzerek” izleyeceğiniz bir film olur.<br /><br />', CAST(N'2020-04-11T16:43:29.323' AS DateTime), CAST(N'2020-04-11T16:43:29.323' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (88, 30, 38, N'19 aralık 1980 doğumlu amerikan oyuncu. (gbkz: donnie darko), (gbkz: october sky) ve (gbkz: nightcrawler) gibi filmlerden kendisini tanıyoruz.', CAST(N'2020-04-11T16:45:11.317' AS DateTime), CAST(N'2020-04-11T16:45:11.317' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (89, 29, 39, N'Bir Alfred Hitchcock filmi. <br />spoiler içerir-<br />Ortasında hikayenin gidişatının değiştiği, seyirciyi şaşırtan bir film. Adamın biri karısını öldürmek istiyor fakat yakalanmak istemiyor. Bu nedenle emekli dedektif arkadaşını tutuyor. Karısının psikolojik bir hastalığı olduğunu, kendini kaybedip bir yerlere gittiğini ve onu takip etmesi gerektiğini söylüyor. Adamın intihara meyilli olan karısı dedektifin gözleri önünde deniz fenerinden atlayıp ölüyor. Fakat aslında dedektifin takip ettiği kadın adamın karısı değilmiş, ona çok benzeyen biriymiş. Sonrasında dedektif ölenin kılığına giren kadını buluyor, onu aynı ölen kadın gibi giydirip, değiştirip tekrar deniz fenerine getiriyor, her şeyi itiraf ettiriyor. Filmi izledikten bir süre sonra aklıma birden Bitirimler Sınıfı geldi. Hatırlarsınız, Sezercik''in yaramaz sınıfı vardı, öğretmenleri kaçırmak için bin türlü numara kullanıyorlardı. En sonunda Selma öğretmeni kaçıramıyorlardı. Bunlar filmin sonuna doğru tatile gidiyorlardı, deniz kampına. Orada bir adam karısını öldürüyordu ama millet anlamasın diye karısın ölüsüyle denize falan açılıyordu. Bizim bitirimler de fark ediyorlardı durumu, Selma öğretmenin ölen kadına benzerliğini kullanıyorlardı. Selma öğretmen ölen kadının saçları gibi bir peruk takıyordu (sarı kısa kıvırcık saçlar) ve adamın karşısına çıkıyordu, beni öldüremedin diye. Sonra da adama karısı öldürttüğünü itiraf ettiriyordu. Şimdi ne alaka bunları anlattın diyebilirsiniz ama bence bir esinlenilme durumu var:D', CAST(N'2020-04-11T16:59:51.217' AS DateTime), CAST(N'2020-04-11T16:59:51.217' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (90, 32, 40, N'seyredilmeyi haketmesi güç bir fenomen. ', CAST(N'2020-04-11T17:32:54.087' AS DateTime), CAST(N'2020-04-11T17:32:54.087' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (91, 33, 40, N'Paralel dünya. Farklı bir yaşam simülasyonu. Rüya parodisi. Hem her şey hem hiçbir şey. ', CAST(N'2020-04-11T17:36:08.430' AS DateTime), CAST(N'2020-04-11T17:36:08.430' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (92, 33, 12, N'Fikir güzel belli bir tema etrafında şekil aldığından bu durum onun için hem avantaj hem de dezavantaj. Umarım sinema severlerin uğrak bir mekanı olur kısa sürede.', CAST(N'2020-04-11T17:44:02.560' AS DateTime), CAST(N'2020-04-11T17:44:02.560' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (93, 30, 40, N'Sinemanın özü. Bir takım kimyevi işlemlerden geçirilerek banyo taramasının yapıldığı ve negatifinin elde edildiği, çeşitli optik olayların gerçekleşerek o andaki "bir" perspektifin üzerine kaydolduğu şerit nesne.', CAST(N'2020-04-11T17:44:18.790' AS DateTime), CAST(N'2020-04-11T17:44:18.790' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (94, 29, 41, N'Hindistan’ın art house sineması.', CAST(N'2020-04-11T19:36:26.167' AS DateTime), CAST(N'2020-04-11T19:36:26.167' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (95, 30, 42, N'sinemanın seyircideki izdüşümleridir. Sinemada katman dediğimiz olgu filmdeki soyut izdüşümleri belirtmek amacıyla kullanılır. Kemale ermiş bir film 3 katmandan oluşur. Bu üç katmanı açıklayacak olursak ilk iki katmanın birbiriyle zaman zaman kesişen yatay sorulara sahip olduğunu son katmanın ise diğer ikisinden tamamen bağımsız (dikey-varoluşsal) sorulara sahip olduğunu söylemeliyiz. Daha detaylı açıklamak gerekirse:<br /><br />(b: İlk katman(dış-görünen-zahiri)): Filmin fiziki izdüşümüdür. Filmde görünen şeyler, hareketler, konuşmalar filmin ilk katmanını oluşturur.<br /><br />Mesela “(i: Aypar’ın Yaren’in evine doğru yürümesini görmemiz”) filmin ilk katmanını bizlere sunar.<br /><br />(b: İkinci katman(iç-görünmeyen-batın)): Filmin politik izdüşümüdür. Senaryo içerisindeki zaman ve mekan algısıyla beraber hikaye içerisindeki atmosferi ifade eder.<br /><br />(i: “Aypar’ın Yaren’in evine ihtilal ortamında gittiğinin bize hissettirilmesi”) filmin politik izdüşümü ve ikinci katmanıdır. <br /><br />(b: Üçüncü Katman*): Birçok filmde hakkı verilerek yer almayan, filmdeki varoluşsal(ilahi) sorular ve bunlara aranan cevaplar(zaman zaman) sonucunda ortaya çıkan katmandır.<br /><br />(i: “Aypar’ın ihtilal ortamında Yaren’e olan aşkından dolayı onun evine doğru yürümesi” )bir filmdeki üçüncü katmana örnektir.<br /><br />', CAST(N'2020-04-11T19:55:02.933' AS DateTime), CAST(N'2020-04-11T19:55:02.933' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (98, 33, 26, N'Altın palmiye ödüllü türk yönetmen ve senarist.<br /><br />Filmleri:<br />(gbkz: Koza) (1995)<br />(gbkz: Kasaba) (1997)<br />(gbkz: Mayıs Sıkıntısı) (1999)<br />(gbkz: Uzak) (2002)<br />(gbkz: İklimler) (2006)<br />(gbkz: Üç Maymun) (2008)<br />(gbkz: Bir Zamanlar Anadolu''da) (2011)<br />(gbkz: Kış Uykusu) (2014)<br />(gbkz: Alat Ağacı) (2018)', CAST(N'2020-04-11T20:45:39.423' AS DateTime), CAST(N'2020-04-11T20:45:39.423' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (99, 33, 43, N'Yönetmen asistanlığı yaparak atıldığı sinema dünyasında (gbkz: masumiyet) filmiyle tanınırlığı atmıştır.', CAST(N'2020-04-11T20:49:21.227' AS DateTime), CAST(N'2020-04-11T20:49:21.227' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (100, 30, 44, N'modern hayatta kadın ve erkek ilişkilerini, her insanın kendi iklimlerinin başka iklimlere ne derece uzak olduğunu anlatan, nuri bilge ceylan''ın ve eşinin oynadığı  (gbkz: nuri bilge ceylan) filmi. zannımca bu filmde nuri bilge ceylan gerçek hayattaki halini normal bir şekilde aktarmış. ', CAST(N'2020-04-11T20:51:04.200' AS DateTime), CAST(N'2020-04-11T20:51:04.200' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (101, 30, 45, N'(gbkz: tabutta rövaşata) filmiyle gönüllere taht kurmuş yönetmendir. (gbkz: nuri bilge ceylan)''da bulunan "yukarıdan toplumun karanlık taraflarına ışık tutma" teması yerine "karanlık yerlerden ışığa uzanma" temasını kullanmakta. tersten perspektif bu olsa gerek.', CAST(N'2020-04-11T20:55:05.460' AS DateTime), CAST(N'2020-04-11T20:55:05.460' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (102, 33, 46, N'(gbkz: sevmek zamanı) filmiyle akıllara kazınan yönetmen, senarist. (gbkz: susuz yaz) ile berlin film festivali''nde altın ayı ödülü alan ilk türk yönetmen olarak hepimizi gururlandırmıştır. sinemaya ara verdikten sonra Mimar Sinan Üniversitesi Sinema-Televizyon Bölümü’nde Sinema Kuramı üzerine dersler vermiş 2012 yılında vefat etmiştir.', CAST(N'2020-04-11T20:56:24.897' AS DateTime), CAST(N'2020-04-11T20:56:24.897' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (103, 33, 47, N'(gbkz: )(gbkz: iz) filmi ile art arda en iyi film ödülleri alan 1960 kars doğumlu yönetmen, senarist.<br /><br />filmleri:<br />(gbkz: iz)<br />(gbkz: güneşe yolculuk)<br />(gbkz: bulutları beklerken)<br />(gbkz: pandora''nın kutusu)<br />(gbkz: araf)<br />(gbkz: tereddüt)', CAST(N'2020-04-11T21:05:55.810' AS DateTime), CAST(N'2020-04-11T21:05:55.810' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (105, 29, 48, N'Aile teması sayesinde Türkiye''de trend olmuş dizi.', CAST(N'2020-04-12T00:06:47.173' AS DateTime), CAST(N'2020-04-12T00:06:47.173' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (106, 29, 49, N'atanamayan öğretmenlerin içine öküz oturtan müthüşlü film.', CAST(N'2020-04-12T00:08:51.250' AS DateTime), CAST(N'2020-04-12T00:08:51.250' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (107, 30, 50, N'(gbkz: ahmet uluçay) filmi. birçok yönetmenin ilk filminde kendi sinema macerasını farklı şekillerde anlatmasının bir başka örneği. anadolumuzu ve içindeki köy hayatını masumane yönleriyle aktaran güzel bir film. oyuncu kadrosundaki bir kişi hariç tüm insanlar amatör. film birçok açıdan sinema tarihinin en samimi filmi olmaya aday.', CAST(N'2020-04-12T01:15:41.403' AS DateTime), CAST(N'2020-04-12T01:15:41.403' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (108, 37, 12, N'yolu açık olsun. güzel konuların tartışıldığı bir ortam olsun...', CAST(N'2020-04-13T00:28:56.187' AS DateTime), CAST(N'2020-04-13T00:28:56.187' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (109, 37, 40, N'veya filim: Fotoğrafçılıkta, sinematografçılıkta kullanılan ince ve şeffaf zar gibi bir şey. Sinemada gösterilen manzara, vaka vesaire: Dün güzel bir film seyrettim. (bkz: Yeni Türkçe Lugat)<br />Osmanlıca ifadesiyle hem gösteren, hem gösterilen. İkisi birarada. : )', CAST(N'2020-04-13T00:44:56.983' AS DateTime), CAST(N'2020-04-13T00:44:56.983' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (110, 37, 51, N'Mehmet Bahaeddin''e ait Osmanlıca sözlük.', CAST(N'2020-04-13T00:47:12.693' AS DateTime), CAST(N'2020-04-13T00:47:12.693' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (111, 26, 52, N'youtube.com/watch?v=-OWacJxJslM', CAST(N'2020-04-13T15:10:26.353' AS DateTime), CAST(N'2020-04-13T15:10:26.353' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (112, 32, 53, N'Mucidi Alison Bechdel''dir. Özetle bir tür film okuma tekniğidir. Şu üç şey kritik edilir: filmde en az iki kadın karakter var mı ve adları belirtilmiş mi(görünür kılınmışlar mı)? Bu kadın karakterler birbirleriyle konuşuyorlar mı? ve konuştukları şey erkeklerden bağımsız bir şey mi? ', CAST(N'2020-04-14T20:14:11.950' AS DateTime), CAST(N'2020-04-14T20:14:11.950' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (113, 32, 54, N'Nbc bir zamanlar anadolu''da bir film çekmiş ve ismini de bir zamanlar anadoluda koymuş. devlet çalışanlarının,  konudan bağımsız bir şekilde bürokrotik işler cehenneminde nasıl savrulduğunu ve de kavrulduğunu oldukça nesnel bir şekilde anlatır. ', CAST(N'2020-04-14T20:28:32.807' AS DateTime), CAST(N'2020-04-14T20:28:32.807' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (115, 28, 55, N'(bkz: yaşayan en büyük yönetmenler)', CAST(N'2020-04-14T23:52:45.047' AS DateTime), CAST(N'2020-04-14T23:52:45.047' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (130, 40, 55, N'25''den fazla filmi vardır.', CAST(N'2020-04-21T20:13:45.037' AS DateTime), CAST(N'2020-04-21T20:13:45.037' AS DateTime))
INSERT [dbo].[entry] ([id], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate]) VALUES (1138, 1050, 54, N'Anlatılan, Gösterilen, Hissedilenleriyle Müstesnadır<br /><br />Romanlardan filmler uyarlanır ama filmden roman yazılacaksa bu filmlerin başında Bir Zamanlar Anadolu''da mutlaka olmalıdır.', CAST(N'2020-06-23T11:43:15.157' AS DateTime), CAST(N'2020-06-23T11:43:15.157' AS DateTime))
SET IDENTITY_INSERT [dbo].[entry] OFF
GO
SET IDENTITY_INSERT [dbo].[entrynotice] ON 

INSERT [dbo].[entrynotice] ([id], [entryId], [noticedById], [notice], [createdOnUtc]) VALUES (1, 130, 30, N'test', CAST(N'2020-07-02T19:40:29.467' AS DateTime))
SET IDENTITY_INSERT [dbo].[entrynotice] OFF
GO
SET IDENTITY_INSERT [dbo].[garbageentry] ON 

INSERT [dbo].[garbageentry] ([id], [entryId], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate], [deletedDate], [deletedFor]) VALUES (1, 0, 30, 55, N'test', CAST(N'2020-06-02T11:24:27.337' AS DateTime), CAST(N'2020-06-02T11:24:27.337' AS DateTime), CAST(N'2020-06-02T11:31:42.210' AS DateTime), N'test için')
INSERT [dbo].[garbageentry] ([id], [entryId], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate], [deletedDate], [deletedFor]) VALUES (2, 0, 30, 55, N'rssd', CAST(N'2020-06-06T18:30:09.157' AS DateTime), CAST(N'2020-06-06T18:30:09.157' AS DateTime), CAST(N'2020-06-06T18:42:09.303' AS DateTime), N'standart')
INSERT [dbo].[garbageentry] ([id], [entryId], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate], [deletedDate], [deletedFor]) VALUES (3, 0, 30, 55, N'test', CAST(N'2020-06-06T18:31:25.117' AS DateTime), CAST(N'2020-06-06T18:31:25.117' AS DateTime), CAST(N'2020-06-06T18:44:18.830' AS DateTime), N'standart')
INSERT [dbo].[garbageentry] ([id], [entryId], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate], [deletedDate], [deletedFor]) VALUES (4, 0, 30, 64, N'Test', CAST(N'2020-06-09T05:00:41.257' AS DateTime), CAST(N'2020-06-09T05:00:41.257' AS DateTime), CAST(N'2020-06-09T05:00:47.360' AS DateTime), N'standart')
INSERT [dbo].[garbageentry] ([id], [entryId], [authorId], [subjectId], [entry], [createDate], [lastUpdateDate], [deletedDate], [deletedFor]) VALUES (1004, 0, 30, 51, N'(b: test)', CAST(N'2020-06-24T20:16:55.770' AS DateTime), CAST(N'2020-06-24T20:16:55.770' AS DateTime), CAST(N'2020-06-24T20:16:58.707' AS DateTime), N'standart')
SET IDENTITY_INSERT [dbo].[garbageentry] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (10, 5, N'başlık kuralları', 1, CAST(N'2020-04-09T20:47:37.407' AS DateTime), CAST(N'2020-04-09T20:47:38.567' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (11, 5, N'tanım yazılırken dikkat edilmesi gerekenler', 1, CAST(N'2020-04-09T20:49:24.673' AS DateTime), CAST(N'2020-04-09T20:49:25.490' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (12, 5, N'filmcisözlük', 1, CAST(N'2020-04-09T21:22:41.007' AS DateTime), CAST(N'2020-04-13T00:28:56.187' AS DateTime), N'00000', 4)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (25, 26, N'yazılımcıdan istediklerimiz', 1, CAST(N'2020-04-11T14:35:26.167' AS DateTime), CAST(N'2020-04-11T14:35:26.193' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (26, 29, N'nuri bilge ceylan', 1, CAST(N'2020-04-11T15:56:02.160' AS DateTime), CAST(N'2020-04-11T20:45:39.423' AS DateTime), N'00000', 2)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (27, 31, N'ahmet uluçay', 1, CAST(N'2020-04-11T16:00:48.890' AS DateTime), CAST(N'2020-04-11T16:05:17.290' AS DateTime), N'00000', 2)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (28, 29, N'çocuk sineması', 1, CAST(N'2020-04-11T16:01:36.657' AS DateTime), CAST(N'2020-04-11T16:01:36.673' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (29, 31, N'tsa', 1, CAST(N'2020-04-11T16:04:26.093' AS DateTime), CAST(N'2020-04-11T16:04:26.113' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (31, 29, N'stuart little', 1, CAST(N'2020-04-11T16:15:16.933' AS DateTime), CAST(N'2020-04-11T16:15:16.983' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (33, 29, N'nanny mcphee', 1, CAST(N'2020-04-11T16:17:49.103' AS DateTime), CAST(N'2020-04-11T16:17:49.123' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (34, 31, N'türk sineması araştırmaları', 1, CAST(N'2020-04-11T16:18:23.437' AS DateTime), CAST(N'2020-04-11T16:18:23.457' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (35, 29, N'canavarlar üniversitesi', 1, CAST(N'2020-04-11T16:23:38.643' AS DateTime), CAST(N'2020-04-11T16:23:38.677' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (36, 29, N'kaptan fantastik', 1, CAST(N'2020-04-11T16:41:48.780' AS DateTime), CAST(N'2020-04-11T16:41:48.797' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (37, 30, N'october sky', 1, CAST(N'2020-04-11T16:43:29.290' AS DateTime), CAST(N'2020-04-11T16:43:29.323' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (38, 30, N'jake gyllenhaal', 1, CAST(N'2020-04-11T16:45:11.303' AS DateTime), CAST(N'2020-04-11T16:45:11.317' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (39, 29, N'vertigo', 1, CAST(N'2020-04-11T16:59:50.973' AS DateTime), CAST(N'2020-04-11T16:59:51.217' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (40, 32, N'film', 1, CAST(N'2020-04-11T17:32:54.060' AS DateTime), CAST(N'2020-04-13T00:44:56.980' AS DateTime), N'00000', 4)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (41, 29, N'paralel sinema', 1, CAST(N'2020-04-11T19:36:25.957' AS DateTime), CAST(N'2020-04-11T19:36:26.167' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (42, 30, N'sinemada katmanlar', 1, CAST(N'2020-04-11T19:55:02.780' AS DateTime), CAST(N'2020-04-11T19:55:02.933' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (43, 33, N'zeki demirkubuz', 1, CAST(N'2020-04-11T20:49:21.200' AS DateTime), CAST(N'2020-04-11T20:49:21.227' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (44, 30, N'iklimler', 1, CAST(N'2020-04-11T20:51:04.187' AS DateTime), CAST(N'2020-04-11T20:51:04.200' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (45, 30, N'derviş zaim', 1, CAST(N'2020-04-11T20:55:05.443' AS DateTime), CAST(N'2020-04-11T20:55:05.460' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (46, 33, N'metin erksan', 1, CAST(N'2020-04-11T20:56:24.877' AS DateTime), CAST(N'2020-04-11T20:56:24.897' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (47, 33, N'yeşim ustaoğlu', 1, CAST(N'2020-04-11T21:05:55.787' AS DateTime), CAST(N'2020-04-11T21:05:55.810' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (48, 29, N'la casa de papel', 1, CAST(N'2020-04-12T00:06:47.043' AS DateTime), CAST(N'2020-04-12T00:06:47.173' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (49, 29, N'ahlat ağacı', 1, CAST(N'2020-04-12T00:08:51.230' AS DateTime), CAST(N'2020-04-12T00:08:51.250' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (50, 30, N'karpuz kabuğundan gemiler yapmak', 1, CAST(N'2020-04-12T01:15:41.247' AS DateTime), CAST(N'2020-04-12T01:15:41.403' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (51, 37, N'yeni türkçe lugat', 1, CAST(N'2020-04-13T00:47:12.663' AS DateTime), CAST(N'2020-06-24T20:16:55.770' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (52, 26, N'filmcisözlük kullanım kılavuzu', 1, CAST(N'2020-04-13T15:10:26.170' AS DateTime), CAST(N'2020-04-13T15:10:26.353' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (53, 32, N'bechdel testi', 1, CAST(N'2020-04-14T20:14:11.760' AS DateTime), CAST(N'2020-04-14T20:14:11.950' AS DateTime), N'00000', 1)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (54, 32, N'bir zamanlar anadolu''da', 1, CAST(N'2020-04-14T20:28:32.240' AS DateTime), CAST(N'2020-06-23T11:43:15.157' AS DateTime), N'00000', 2)
INSERT [dbo].[subject] ([id], [authorId], [subject], [isActive], [createDate], [updateDate], [BSHIU], [totalCount]) VALUES (55, 28, N'terrence malick', 1, CAST(N'2020-04-14T23:52:12.690' AS DateTime), CAST(N'2020-06-06T18:31:25.117' AS DateTime), N'00000', 2)
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (17, N'nbcfanclub', N'c2b4b5d100d8b2eb9734906af9e16b47', N'yakupsava@gmail.com', N'NQOffuKg', CAST(N'2020-04-10T22:33:44.593' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-10T20:33:44.597' AS DateTime), CAST(N'2020-04-10T20:33:44.597' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (19, N'test', N'cc03e747a6afbbcbf8be7668acfebee5', N'monsieurnoir00@gmail.com', N'NhgsGhKj', CAST(N'2020-04-11T04:39:00.383' AS DateTime), 9, 0, 0, N'0000', CAST(N'2020-04-11T02:39:00.387' AS DateTime), CAST(N'2020-04-11T02:39:00.387' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (26, N'filmcisözlük', N'189b33db6435844553f56c03d400feee', N'filmcisozluk@gmail.com', N'TEteuFrb', CAST(N'2020-04-11T16:31:08.130' AS DateTime), 9, 0, 0, N'0000', CAST(N'2020-04-11T14:28:22.033' AS DateTime), CAST(N'2020-04-11T14:28:22.033' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (27, N'filmguncesi', N'03734594cffe955a99dc8611a42523b2', N'guncesifilm@gmail.com', N'8azQqXEv', CAST(N'2020-04-11T17:17:22.927' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T15:17:22.930' AS DateTime), CAST(N'2020-04-11T15:17:22.930' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (28, N'seyirci', N'56fdb5b790daf1cb17edb07015314481', N'seyirkeyfisinema@gmail.com', N'9pF9vVuJ', CAST(N'2020-04-15T01:45:14.813' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T15:21:30.687' AS DateTime), CAST(N'2020-04-11T15:21:30.687' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (29, N'kafdağı', N'f0e75b8d20db25445ab583c06d152dbe', N'kubra@afyalman.com', N'6Z0lgXFC', CAST(N'2020-04-11T17:37:06.470' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T15:37:06.470' AS DateTime), CAST(N'2020-04-11T15:37:06.470' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (30, N'clark gable görünümlü maktül', N'189b33db6435844553f56c03d400feee', N'ciftlerabdullah@gmail.com', N'H5R0W4wp', CAST(N'2020-06-06T18:12:19.210' AS DateTime), 9, 0, 0, N'0000', CAST(N'2020-04-11T15:47:53.393' AS DateTime), CAST(N'2020-04-11T15:47:53.393' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (31, N'hayali', N'149c173c7fbff0bbd9f1782c548435f4', N'muratpay@gmail.com', N'ryvRkP2V', CAST(N'2020-04-11T17:54:42.497' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T15:54:42.497' AS DateTime), CAST(N'2020-04-11T15:54:42.497' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (32, N'bidelibiçini', N'3ab0af2ee190ade693ffd77563f030c6', N'ftmdmrhn34@gmail.com', N'76pxqFm0', CAST(N'2020-04-11T19:29:53.250' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T17:29:53.250' AS DateTime), CAST(N'2020-04-11T17:29:53.250' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (33, N'maye menşendirha', N'106f03d1bb97187230f351e2c34db813', N'serapozenx@gmail.com', N'VUfkN35L', CAST(N'2020-04-11T19:33:50.330' AS DateTime), 9, 0, 0, N'0000', CAST(N'2020-04-11T17:33:50.330' AS DateTime), CAST(N'2020-04-11T17:33:50.330' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (34, N'asiye', N'df20198fe57df767fde8a268d799adce', N'zbdemirelllll@gmail.com', N'Up63JxCX', CAST(N'2020-04-12T00:28:29.650' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-11T22:28:29.650' AS DateTime), CAST(N'2020-04-11T22:28:29.650' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (35, N'mühendislik ansiklopedisi', N'a2b25ff1166715409a53e5dcc5c8271e', N'muhendislikansiklopedisi@gmail.com', N'Q4HQwOK4', CAST(N'2020-04-12T02:46:56.227' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-12T00:46:56.230' AS DateTime), CAST(N'2020-04-12T00:46:56.230' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (36, N'postscriptum', N'2920167bb0ffb4fd5e02448f09c4dfb3', N'u.kemikli@hotmail.com', N'anKCLBwX', CAST(N'2020-04-12T13:10:59.987' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-12T11:10:59.987' AS DateTime), CAST(N'2020-04-12T11:10:59.987' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (37, N'kevirtaksimi', N'9c7563d835e5a2555d21050bb2bb1909', N'kevirtaksimi@gmail.com', N'TsOXkEm7', CAST(N'2020-04-13T02:25:06.750' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-13T00:25:06.750' AS DateTime), CAST(N'2020-04-13T00:25:06.750' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (38, N'guşci', N'9788ada778dc0502ac103f0da5fdce27', N'hseyyidkaplan@gmail.com', N'mjk4x8Di', CAST(N'2020-04-14T15:28:57.357' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-14T13:23:57.397' AS DateTime), CAST(N'2020-04-14T13:23:57.397' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (39, N'Sinemaguncesi', N'6f4713890c82458046f7881ece46c660', N'guncesinema@gmail.com', N'dNzG0uYQ', CAST(N'2020-04-15T01:43:49.970' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-14T23:41:48.237' AS DateTime), CAST(N'2020-04-14T23:41:48.237' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (40, N'pupkind', N'4b4a04c6fdb3c2b9a21cb680d648e404', N'sudrijekko@enayu.com', N'B2Si8Ysb', CAST(N'2020-04-16T02:06:59.007' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-04-16T00:06:59.010' AS DateTime), CAST(N'2020-04-16T00:06:59.010' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (41, N'clark gable görünüdsadsamlü maktül', N'189b33db6435844553f56c03d400feee', N'ssda@gmasd.com', N'J1xL6DNe', CAST(N'2020-06-06T17:51:32.017' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T15:51:32.020' AS DateTime), CAST(N'2020-06-06T15:51:32.020' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (42, N'dsdsdsdsa', N'189b33db6435844553f56c03d400feee', N'dsdsdsdsa@andyes.net', N'Q1DECACM', CAST(N'2020-06-06T17:57:28.877' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T15:57:28.877' AS DateTime), CAST(N'2020-06-06T15:57:28.877' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (43, N'denemeyahu', N'13f32a88e03dd3574d169177ff32d0f4', N'denemeyahu@andyes.net', N'JX5Rmn7b', CAST(N'2020-06-06T18:03:44.357' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T16:03:44.357' AS DateTime), CAST(N'2020-06-06T16:03:44.357' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (44, N'sifreyiunut', N'05a671c66aefea124cc08b76ea6d30bb', N'sifreyiunut@andyes.net', N'3yOLzB0K', CAST(N'2020-06-06T18:11:44.153' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T16:09:48.677' AS DateTime), CAST(N'2020-06-06T16:09:48.677' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (45, N'filmsel', N'a9687b42cbf67187639c47ccd50c4c04', N'tb.ozden@gmail.com', N'tnppk8zB', CAST(N'2020-06-06T19:17:09.673' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T17:17:09.677' AS DateTime), CAST(N'2020-06-06T17:17:09.677' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (46, N'testhali', N'9b962cae99995e875a7ca058b7efced6', N'testhali@andyes.net', N'5OnkAtGp', CAST(N'2020-06-06T20:44:55.850' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T18:44:55.850' AS DateTime), CAST(N'2020-06-06T18:44:55.850' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (47, N'Tubarann', N'134f88fa2fd348d11e51a63b55a48543', N'tubarann61@gmail.com', N'w1nUb5d0', CAST(N'2020-06-07T01:32:42.653' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-06T23:32:42.653' AS DateTime), CAST(N'2020-06-06T23:32:42.653' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (48, N'Betül_K', N'2a998df28e8c9d96cb30d7e9ef4ed849', N'betulkockan@gmail.com', N'13wSPxAU', CAST(N'2020-06-08T17:29:44.000' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-08T15:29:44.003' AS DateTime), CAST(N'2020-06-08T15:29:44.003' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1048, N'merveord', N'35a55deb2aebb2b99d61f63eced0bec3', N'merveordu99@gmail.com', N'sqDIWVGC', CAST(N'2020-06-16T15:34:08.543' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-16T13:34:08.543' AS DateTime), CAST(N'2020-06-16T13:34:08.543' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1049, N'murduviste', N'189b33db6435844553f56c03d400feee', N'murduviste@enayu.com', N'gduu7P4j', CAST(N'2020-06-23T12:51:20.220' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-23T10:51:20.227' AS DateTime), CAST(N'2020-06-23T10:51:20.227' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1050, N'FatihPeker', N'cc871601b60f434172de13f8dad4546f', N'fatihpeker@hotmail.com', N'rqwSnwBK', CAST(N'2020-06-23T13:38:04.070' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-23T11:38:04.073' AS DateTime), CAST(N'2020-06-23T11:38:04.073' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1051, N'sifreyiunutma', N'189b33db6435844553f56c03d400feee', N'sifreyiunutma@gmail.com', N'GmDD8VND', CAST(N'2020-06-25T00:58:50.463' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-24T22:58:50.463' AS DateTime), CAST(N'2020-06-24T22:58:50.463' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1052, N'kasifastronot', N'65398a710ede4e0b392984c6854d5dbb', N'htccagil@gmail.com', N'Htus6RUv', CAST(N'2020-06-25T21:11:57.700' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-06-25T19:11:57.700' AS DateTime), CAST(N'2020-06-25T19:11:57.700' AS DateTime))
INSERT [dbo].[user] ([id], [username], [password], [email], [activationToken], [activationTokenValidTime], [userLevel], [isApproved], [isActive], [registerIp], [registerDate], [lastLoginDate]) VALUES (1053, N'FdnAli', N'44c7fec06fa9a7e8ad982ef3e0312b9c', N'ali.a.fdn@gmail.com', N'aromzClS', CAST(N'2020-07-02T12:37:52.553' AS DateTime), 6, 0, 0, N'0000', CAST(N'2020-07-02T10:37:14.680' AS DateTime), CAST(N'2020-07-02T10:37:14.680' AS DateTime))
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[userlevel] ON 

INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (1, 1, N'passive')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (2, 2, N'guilty')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (3, 3, N'abroad')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (4, 4, N'newbie')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (5, 5, N'bot')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (6, 6, N'author')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (7, 7, N'moderator')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (8, 8, N'administrator')
INSERT [dbo].[userlevel] ([id], [userLevel], [userLevelInfo]) VALUES (9, 9, N'developer')
SET IDENTITY_INSERT [dbo].[userlevel] OFF
GO
SET IDENTITY_INSERT [dbo].[vote] ON 

INSERT [dbo].[vote] ([id], [authorId], [entryId], [userId], [date], [type]) VALUES (35, 28, 115, 1052, CAST(N'2020-06-25T16:12:18.163' AS DateTime), 1)
INSERT [dbo].[vote] ([id], [authorId], [entryId], [userId], [date], [type]) VALUES (36, 26, 32, 1052, CAST(N'2020-06-25T16:12:29.697' AS DateTime), 1)
INSERT [dbo].[vote] ([id], [authorId], [entryId], [userId], [date], [type]) VALUES (38, 28, 115, 30, CAST(N'2020-06-25T17:36:39.900' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[vote] OFF
GO
ALTER TABLE [dbo].[announcement] ADD  CONSTRAINT [DF_announcement_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[entry] ADD  CONSTRAINT [DF_entry_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[entry] ADD  CONSTRAINT [DF_entry_lastUpdateDate]  DEFAULT (getdate()) FOR [lastUpdateDate]
GO
ALTER TABLE [dbo].[entrynotice] ADD  CONSTRAINT [DF_entrynotice_createdOnUtc]  DEFAULT (getdate()) FOR [createdOnUtc]
GO
ALTER TABLE [dbo].[garbageentry] ADD  CONSTRAINT [DF_garbageentry_deletedDate]  DEFAULT (getdate()) FOR [deletedDate]
GO
ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subjecgt_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subjecgt_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subjecgt_BSHIU]  DEFAULT ((0)) FOR [BSHIU]
GO
ALTER TABLE [dbo].[subject] ADD  CONSTRAINT [DF_subject_totalCount]  DEFAULT ((0)) FOR [totalCount]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_Table_1_registerDate]  DEFAULT (getdate()) FOR [registerDate]
GO
ALTER TABLE [dbo].[user] ADD  CONSTRAINT [DF_Table_1_lastLoginDate]  DEFAULT (getdate()) FOR [lastLoginDate]
GO
