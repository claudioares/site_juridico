-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_user" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "whats" TEXT,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL,
    "status" TEXT
);
INSERT INTO "new_user" ("createdAt", "email", "id", "name", "password", "status", "updateAt", "whats") SELECT "createdAt", "email", "id", "name", "password", "status", "updateAt", "whats" FROM "user";
DROP TABLE "user";
ALTER TABLE "new_user" RENAME TO "user";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
