
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server Compact Edition
-- --------------------------------------------------
-- Date Created: 03/15/2019 10:50:09
-- Generated from EDMX file: C:\Users\Dan\OneDrive\GitHub\KBR Wyle\StatusBoard\StausBoardDatabase\StatusBoardDB.edmx
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

-- Creating table 'Equipment'
CREATE TABLE [Equipment] (
    [EquipmentId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [EquipmentStatus] tinyint  NOT NULL,
    [OperationalStatus] nvarchar(4000)  NOT NULL,
    [SerialNumber] nvarchar(4000)  NOT NULL,
    [EquipmentChildren_Equipment1_EquipmentId] int  NOT NULL,
    [Part_PartId] int  NOT NULL,
    [StatusPageEquipment_Equipment_StatusPageId] int  NOT NULL,
    [StatusPageGroupingEquipment_Equipment_StatusPageGroupingsId] int  NOT NULL
);
GO

-- Creating table 'Parts'
CREATE TABLE [Parts] (
    [PartId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [NSN] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'Components'
CREATE TABLE [Components] (
    [ComponentId] int IDENTITY(1,1) NOT NULL,
    [SerialNumber] nvarchar(4000)  NOT NULL,
    [Part_PartId] int  NOT NULL,
    [EquipmentComponent_Component_EquipmentId] int  NOT NULL
);
GO

-- Creating table 'StatusPages'
CREATE TABLE [StatusPages] (
    [StatusPageId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [BackgroundImage] nvarchar(4000)  NOT NULL
);
GO

-- Creating table 'StatusPageGroupings'
CREATE TABLE [StatusPageGroupings] (
    [StatusPageGroupingsId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [BackgroundImage] nvarchar(4000)  NOT NULL,
    [StatusPageStatusPageGrouping_StatusPageGrouping_StatusPageId] int  NOT NULL
);
GO

-- Creating table 'Outages'
CREATE TABLE [Outages] (
    [OutageId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(4000)  NOT NULL,
    [Description] nvarchar(4000)  NOT NULL,
    [Tech] nvarchar(4000)  NOT NULL,
    [Start] datetime  NOT NULL,
    [End] datetime  NOT NULL,
    [OutageType] tinyint  NOT NULL
);
GO

-- Creating table 'OutageStatusNotes'
CREATE TABLE [OutageStatusNotes] (
    [OutageStatusId] int IDENTITY(1,1) NOT NULL,
    [Status] nvarchar(4000)  NOT NULL,
    [Timestamp] nvarchar(4000)  NOT NULL,
    [Tech] nvarchar(4000)  NOT NULL,
    [OutageOutageStatus_OutageStatus_OutageId] int  NOT NULL
);
GO

-- Creating table 'OutageEquipment'
CREATE TABLE [OutageEquipment] (
    [OutageEquipment_Equipment_OutageId] int  NOT NULL,
    [Equipment_EquipmentId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EquipmentId] in table 'Equipment'
ALTER TABLE [Equipment]
ADD CONSTRAINT [PK_Equipment]
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

-- Creating primary key on [StatusPageId] in table 'StatusPages'
ALTER TABLE [StatusPages]
ADD CONSTRAINT [PK_StatusPages]
    PRIMARY KEY ([StatusPageId] );
GO

-- Creating primary key on [StatusPageGroupingsId] in table 'StatusPageGroupings'
ALTER TABLE [StatusPageGroupings]
ADD CONSTRAINT [PK_StatusPageGroupings]
    PRIMARY KEY ([StatusPageGroupingsId] );
GO

-- Creating primary key on [OutageId] in table 'Outages'
ALTER TABLE [Outages]
ADD CONSTRAINT [PK_Outages]
    PRIMARY KEY ([OutageId] );
GO

-- Creating primary key on [OutageStatusId] in table 'OutageStatusNotes'
ALTER TABLE [OutageStatusNotes]
ADD CONSTRAINT [PK_OutageStatusNotes]
    PRIMARY KEY ([OutageStatusId] );
GO

-- Creating primary key on [OutageEquipment_Equipment_OutageId], [Equipment_EquipmentId] in table 'OutageEquipment'
ALTER TABLE [OutageEquipment]
ADD CONSTRAINT [PK_OutageEquipment]
    PRIMARY KEY ([OutageEquipment_Equipment_OutageId], [Equipment_EquipmentId] );
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [EquipmentChildren_Equipment1_EquipmentId] in table 'Equipment'
ALTER TABLE [Equipment]
ADD CONSTRAINT [FK_EquipmentChildren]
    FOREIGN KEY ([EquipmentChildren_Equipment1_EquipmentId])
    REFERENCES [Equipment]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentChildren'
CREATE INDEX [IX_FK_EquipmentChildren]
ON [Equipment]
    ([EquipmentChildren_Equipment1_EquipmentId]);
GO

-- Creating foreign key on [Part_PartId] in table 'Equipment'
ALTER TABLE [Equipment]
ADD CONSTRAINT [FK_EquipmentPart]
    FOREIGN KEY ([Part_PartId])
    REFERENCES [Parts]
        ([PartId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentPart'
CREATE INDEX [IX_FK_EquipmentPart]
ON [Equipment]
    ([Part_PartId]);
GO

-- Creating foreign key on [Part_PartId] in table 'Components'
ALTER TABLE [Components]
ADD CONSTRAINT [FK_ComponentPart]
    FOREIGN KEY ([Part_PartId])
    REFERENCES [Parts]
        ([PartId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ComponentPart'
CREATE INDEX [IX_FK_ComponentPart]
ON [Components]
    ([Part_PartId]);
GO

-- Creating foreign key on [EquipmentComponent_Component_EquipmentId] in table 'Components'
ALTER TABLE [Components]
ADD CONSTRAINT [FK_EquipmentComponent]
    FOREIGN KEY ([EquipmentComponent_Component_EquipmentId])
    REFERENCES [Equipment]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EquipmentComponent'
CREATE INDEX [IX_FK_EquipmentComponent]
ON [Components]
    ([EquipmentComponent_Component_EquipmentId]);
GO

-- Creating foreign key on [StatusPageEquipment_Equipment_StatusPageId] in table 'Equipment'
ALTER TABLE [Equipment]
ADD CONSTRAINT [FK_StatusPageEquipment]
    FOREIGN KEY ([StatusPageEquipment_Equipment_StatusPageId])
    REFERENCES [StatusPages]
        ([StatusPageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPageEquipment'
CREATE INDEX [IX_FK_StatusPageEquipment]
ON [Equipment]
    ([StatusPageEquipment_Equipment_StatusPageId]);
GO

-- Creating foreign key on [StatusPageStatusPageGrouping_StatusPageGrouping_StatusPageId] in table 'StatusPageGroupings'
ALTER TABLE [StatusPageGroupings]
ADD CONSTRAINT [FK_StatusPageStatusPageGrouping]
    FOREIGN KEY ([StatusPageStatusPageGrouping_StatusPageGrouping_StatusPageId])
    REFERENCES [StatusPages]
        ([StatusPageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPageStatusPageGrouping'
CREATE INDEX [IX_FK_StatusPageStatusPageGrouping]
ON [StatusPageGroupings]
    ([StatusPageStatusPageGrouping_StatusPageGrouping_StatusPageId]);
GO

-- Creating foreign key on [StatusPageGroupingEquipment_Equipment_StatusPageGroupingsId] in table 'Equipment'
ALTER TABLE [Equipment]
ADD CONSTRAINT [FK_StatusPageGroupingEquipment]
    FOREIGN KEY ([StatusPageGroupingEquipment_Equipment_StatusPageGroupingsId])
    REFERENCES [StatusPageGroupings]
        ([StatusPageGroupingsId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatusPageGroupingEquipment'
CREATE INDEX [IX_FK_StatusPageGroupingEquipment]
ON [Equipment]
    ([StatusPageGroupingEquipment_Equipment_StatusPageGroupingsId]);
GO

-- Creating foreign key on [OutageEquipment_Equipment_OutageId] in table 'OutageEquipment'
ALTER TABLE [OutageEquipment]
ADD CONSTRAINT [FK_OutageEquipment_Outage]
    FOREIGN KEY ([OutageEquipment_Equipment_OutageId])
    REFERENCES [Outages]
        ([OutageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Equipment_EquipmentId] in table 'OutageEquipment'
ALTER TABLE [OutageEquipment]
ADD CONSTRAINT [FK_OutageEquipment_Equipment]
    FOREIGN KEY ([Equipment_EquipmentId])
    REFERENCES [Equipment]
        ([EquipmentId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OutageEquipment_Equipment'
CREATE INDEX [IX_FK_OutageEquipment_Equipment]
ON [OutageEquipment]
    ([Equipment_EquipmentId]);
GO

-- Creating foreign key on [OutageOutageStatus_OutageStatus_OutageId] in table 'OutageStatusNotes'
ALTER TABLE [OutageStatusNotes]
ADD CONSTRAINT [FK_OutageOutageStatus]
    FOREIGN KEY ([OutageOutageStatus_OutageStatus_OutageId])
    REFERENCES [Outages]
        ([OutageId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OutageOutageStatus'
CREATE INDEX [IX_FK_OutageOutageStatus]
ON [OutageStatusNotes]
    ([OutageOutageStatus_OutageStatus_OutageId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------