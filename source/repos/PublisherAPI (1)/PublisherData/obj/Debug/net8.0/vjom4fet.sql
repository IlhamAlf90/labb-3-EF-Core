BEGIN TRANSACTION;
GO

ALTER TABLE [Covers] ADD [BookId] int NOT NULL DEFAULT 0;
GO

UPDATE [Covers] SET [BookId] = 0
WHERE [CoverId] = 1;
SELECT @@ROWCOUNT;

GO

UPDATE [Covers] SET [BookId] = 0
WHERE [CoverId] = 2;
SELECT @@ROWCOUNT;

GO

UPDATE [Covers] SET [BookId] = 0
WHERE [CoverId] = 3;
SELECT @@ROWCOUNT;

GO

CREATE UNIQUE INDEX [IX_Covers_BookId] ON [Covers] ([BookId]);
GO

ALTER TABLE [Covers] ADD CONSTRAINT [FK_Covers_Books_BookId] FOREIGN KEY ([BookId]) REFERENCES [Books] ([BookId]) ON DELETE CASCADE;
GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20231202194001_bookcoverrelationship', N'8.0.0');
GO

COMMIT;
GO

