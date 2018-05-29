USE playermansystem;
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/5/25 12:18:24                           */
/*==============================================================*/

drop table if exists Developer;

drop table if exists Games;

drop table if exists Human;

drop table if exists LabelUp;

drop table if exists Platform;

drop table if exists Play;

drop table if exists ProvidedGames;

drop table if exists TypeTable;

drop table if exists Users;

drop table if exists isFriend;

/*==============================================================*/
/* Table: Developer                                             */
/*==============================================================*/
create table Developer
(
   HumanID              int not null,
   HName                varchar(64),
   gender               bool,
   birthday             date,
   useLanguage          varchar(32),
   primary key (HumanID)
);

/*==============================================================*/
/* Table: Games                                                 */
/*==============================================================*/
create table Games
(
   GameID               int not null,
   PName                varchar(32),
   HumanID              int,
   GName                varchar(64) not null,
   primary key (GameID)
);

/*==============================================================*/
/* Table: Human                                                 */
/*==============================================================*/
create table Human
(
   HumanID              int not null AUTO_INCREMENT,
   HName                varchar(64),
   gender               bool,
   birthday             date,
   primary key (HumanID)
);

/*==============================================================*/
/* Table: LabelUp                                               */
/*==============================================================*/
create table LabelUp
(
   TName                varchar(32) not null,
   GameID               int not null,
   primary key (TName, GameID)
);

/*==============================================================*/
/* Table: Platform                                              */
/*==============================================================*/
create table Platform
(
   PName                varchar(32) not null,
   primary key (PName)
);

/*==============================================================*/
/* Table: Play                                                  */
/*==============================================================*/
create table Play
(
   HumanID              int not null,
   GameID               int not null,
   Rank                 int,
   BestScore            int not null,
   primary key (HumanID, GameID)
);

/*==============================================================*/
/* Table: ProvidedGames                                         */
/*==============================================================*/
create table ProvidedGames
(
   GameID               int not null,
   PName                varchar(32),
   GName                varchar(64) not null,
   AvgRank              int,
   primary key (GameID)
);

/*==============================================================*/
/* Table: TypeTable                                             */
/*==============================================================*/
create table TypeTable
(
   TName                varchar(32) not null,
   primary key (TName)
);

/*==============================================================*/
/* Table: Users                                                 */
/*==============================================================*/
create table Users
(
   HumanID              int not null AUTO_INCREMENT,
   Email                varchar(256) not null,
   Alias                varchar(64) not null,
   GameID               int,
   HName                varchar(64),
   gender               bool,
   birthday             date,
   password             varchar(256) not null,
   primary key (HumanID)
);

/*==============================================================*/
/* Table: isFriend                                              */
/*==============================================================*/
create table isFriend
(
   HumanID              int not null,
   Use_HumanID          int not null,
   primary key (HumanID, Use_HumanID)
);

alter table Developer add constraint FK_Inheritance_3 foreign key (HumanID)
      references Human (HumanID) on delete restrict on update restrict;

alter table Games add constraint FK_BuiltIn foreign key (PName)
      references Platform (PName) on delete restrict on update restrict;

alter table Games add constraint FK_develop foreign key (HumanID)
      references Developer (HumanID) on delete restrict on update restrict;

alter table LabelUp add constraint FK_LabelUp foreign key (TName)
      references TypeTable (TName) on delete restrict on update restrict;

alter table LabelUp add constraint FK_LabelUp2 foreign key (GameID)
      references Games (GameID) on delete restrict on update restrict;

alter table Play add constraint FK_Play foreign key (HumanID)
      references Users (HumanID) on delete restrict on update restrict;

alter table Play add constraint FK_Play2 foreign key (GameID)
      references ProvidedGames (GameID) on delete restrict on update restrict;

alter table ProvidedGames add constraint FK_isIn foreign key (GameID)
      references Games (GameID) on delete restrict on update restrict;

alter table Users add constraint FK_Favorate foreign key (GameID)
      references Games (GameID) on delete restrict on update restrict;

alter table Users add constraint FK_inDB foreign key (HumanID)
      references Human (HumanID) on delete restrict on update restrict;

alter table isFriend add constraint FK_isFriend foreign key (HumanID)
      references Users (HumanID) on delete restrict on update restrict;

alter table isFriend add constraint FK_isFriend2 foreign key (Use_HumanID)
      references Users (HumanID) on delete restrict on update restrict;

