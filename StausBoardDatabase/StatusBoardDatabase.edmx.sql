
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server Compact Edition
-- --------------------------------------------------
-- Date Created: 03/14/2019 18:58:49
-- Generated from EDMX file: C:\Users\Dan\OneDrive\GitHub\KBR Wyle\StatusBoard\StausBoardDatabase\StatusBoardDatabase.edmx
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- NOTE: if the table does not exist, an ignorable error will be reported.
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'EquipmentCollection'
CREATE TABLE [EquipmentCollection] (
    [EquipmentId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [EquipmentStatus] tinyint  NOT NULL,
    [OperationalStatus] tinyint  NOT NULL,
    [EquipmentEquipmentId] int  NOT NULL,
    [PageGroupPageGroupId] int  NOT NULL,
    [StatusPageStausPageId] int  NOT NULL,
    [OutageOutageId] int  NOT NULL
);
GO

-- Creating table 'Parts'
CREATE TABLE [Parts] (
    [PartId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [NSN] nvarchar(4000)  NOT NULL,
    [EquipmentPart_Part_EquipmentId] int  NULL
);
GO

-- Creating table 'Components'
CREATE TABLE [Components] (
    [ComponentId] int IDENTITY(1,1) NOT NULL,
    [PartPartId] int  NOT NULL,
    [SerialNumber] nvarchar(4000)  NOT NULL,
    [EquipmentEquipmentId] int  NOT NULL
);
GO

-- Creating table 'Outages'
CREATE TABLE [Outages] (
    [OutageId] int IDENTITY(1,1) NOT NULL,
    [OutageType] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'OutageNotes'
CREATE TABLE [OutageNotes] (
    [OutageNoteId] int IDENTITY(1,1) NOT NULL,
    [OutageOutageId] int  NOT NULL,
    [OutageOutageId1] int  NOT NULL
);
GO

-- Creating table 'StatusPages'
CREATE TABLE [StatusPages] (
    [StausPageId] int IDENTITY(1,1) NOT NULL,
    [BackgroundImage] nvarchar(4000)  NOT NULL,
    [Name] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'PageGroups'
CREATE TABLE [PageGroups] (
    [PageGroupId] int IDENTITY(1,1) NOT NULL,
    [StatusPageStausPageId] int  NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [EquipmentStatus] tinyint  NOT NULL,
    [OperationalStatus] tinyint  NOT NULL,
    [StatusPageStausPageId1] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EquipmentId] in table 'EquipmentCollection'
ALTER TABLE [EquipmentCollection]
ADD CONSTRAINT [PK_EquipmentCollection]
    PRIMARY KEY ([EquipmentId] );
GO

-- Creating primary key on [PartId] in table 'Parts'
ALTER TABLE [Parts]
ADD CONSTRAINT [PK_Parts]
    PRIMARY KEY ([PartId] );
GO

-- Creating primary key on [ComponentId] in table 'Components'
ALTER TABLE [Components]
ADD CONSTRAINT [PK_Components]
    PRIMARY KEY ([ComponentId] );
GO

-- Creating primary key on [OutageId] in table 'Outages'
ALTER TABLE [Outages]
ADD CONSTRAINT [PK_Outages]
    PRIMARY KEY ([OutageId] );
GO

-- Creating primary key on [OutageNoteId] in table 'OutageNotes'
ALTER TABLE [OutageNotes]
ADD CONSTRAINT [PK_OutageNotes]
    PRIMARY KEY ([OutageNoteId] );
GO

-- Creating primary key on [StausPageId] in table 'StatusPages'
ALTER TABLE [StatusPages]
ADD CONSTRAINT [PK_StatusPages]
    PRIMARY KEY ([StausPageId] );
GO

-- Creating primary key on [PageGroupId] in table 'PageGroups'
ALTER TABLE [PageGroups]
ADD CONSTRAINT [PK_PageGroups]
    PRIMARY KEY ([PageGroupId] );
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EquipmentEquipmentId] in table 'EquipmentCollection'
ALTER TABLE [EquipmentCollection]
ADD CONSTRAINT [FK_EquipmentEquipment]
    FOREIGN KEY ([EquipmentEquipmentId])
    REFERENCES [EquipmentCollection]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentEquipment'
CREATE INDEX [IX_FK_EquipmentEquipment]
ON [EquipmentCollection]
    ([EquipmentEquipmentId]);
GO

-- Creating foreign key on [EquipmentEquipmentId] in table 'Components'
ALTER TABLE [Components]
ADD CONSTRAINT [FK_EquipmentComponent]
    FOREIGN KEY ([EquipmentEquipmentId])
    REFERENCES [EquipmentCollection]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentComponent'
CREATE INDEX [IX_FK_EquipmentComponent]
ON [Components]
    ([EquipmentEquipmentId]);
GO

-- Creating foreign key on [EquipmentPart_Part_EquipmentId] in table 'Parts'
ALTER TABLE [Parts]
ADD CONSTRAINT [FK_EquipmentPart]
    FOREIGN KEY ([EquipmentPart_Part_EquipmentId])
    REFERENCES [EquipmentCollection]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentPart'
CREATE INDEX [IX_FK_EquipmentPart]
ON [Parts]
    ([EquipmentPart_Part_EquipmentId]);
GO

-- Creating foreign key on [StatusPageStausPageId1] in table 'PageGroups'
ALTER TABLE [PageGroups]
ADD CONSTRAINT [FK_StatusPagePageGroup]
    FOREIGN KEY ([StatusPageStausPageId1])
    REFERENCES [StatusPages]
        ([StausPageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPagePageGroup'
CREATE INDEX [IX_FK_StatusPagePageGroup]
ON [PageGroups]
    ([StatusPageStausPageId1]);
GO

-- Creating foreign key on [PageGroupPageGroupId] in table 'EquipmentCollection'
ALTER TABLE [EquipmentCollection]
ADD CONSTRAINT [FK_PageGroupEquipment]
    FOREIGN KEY ([PageGroupPageGroupId])
    REFERENCES [PageGroups]
        ([PageGroupId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PageGroupEquipment'
CREATE INDEX [IX_FK_PageGroupEquipment]
ON [EquipmentCollection]
    ([PageGroupPageGroupId]);
GO

-- Creating foreign key on [StatusPageStausPageId] in table 'EquipmentCollection'
ALTER TABLE [EquipmentCollection]
ADD CONSTRAINT [FK_StatusPageEquipment]
    FOREIGN KEY ([StatusPageStausPageId])
    REFERENCES [StatusPages]
        ([StausPageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPageEquipment'
CREATE INDEX [IX_FK_StatusPageEquipment]
ON [EquipmentCollection]
    ([StatusPageStausPageId]);
GO

-- Creating foreign key on [OutageOutageId] in table 'EquipmentCollection'
ALTER TABLE [EquipmentCollection]
ADD CONSTRAINT [FK_OutageEquipment]
    FOREIGN KEY ([OutageOutageId])
    REFERENCES [Outages]
        ([OutageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OutageEquipment'
CREATE INDEX [IX_FK_OutageEquipment]
ON [EquipmentCollection]
    ([OutageOutageId]);
GO

-- Creating foreign key on [OutageOutageId1] in table 'OutageNotes'
ALTER TABLE [OutageNotes]
ADD CONSTRAINT [FK_OutageOutageNote]
    FOREIGN KEY ([OutageOutageId1])
    REFERENCES [Outages]
        ([OutageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OutageOutageNote'
CREATE INDEX [IX_FK_OutageOutageNote]
ON [OutageNotes]
    ([OutageOutageId1]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------