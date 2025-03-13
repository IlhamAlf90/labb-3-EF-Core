BEGIN TRANSACTION;
GO

DROP TABLE [ArtistCover];
GO

CREATE TABLE [CoverAssignment] (
    [ArtistId] int NOT NULL,
    [CoverId] int NOT NULL,
    [DateCreated] datetime2 NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    CONSTRAINT [PK_CoverAssignment] PRIMARY KEY ([ArtistId], [CoverId]),
    CONSTRAINT [FK_CoverAssignment_Artists_ArtistId] FOREIGN KEY ([ArtistId]) REFERENCES [Artists] ([ArtistId]) ON DELETE CASCADE,
    CONSTRAINT [FK_CoverAssignment_Covers_CoverId] FOREIGN KEY ([CoverId]) REFERENCES [Covers] ([CoverId]) ON DELETE CASCADE
);
GO

CREATE INDEX [IX_CoverAssignment_CoverId] ON [CoverAssignment] ([CoverId]);
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20231202161452_testpayload', N'8.0.0');
GO

COMMIT;
GO

