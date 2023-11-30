-- CreateTable
CREATE TABLE "admin" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "endress" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "user" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "whats" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL,
    "status" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "workRequest" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "description" TEXT NOT NULL,
    "info" TEXT NOT NULL,
    "other_info" TEXT NOT NULL,
    "parties" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "user_Id" TEXT NOT NULL,
    CONSTRAINT "workRequest_user_Id_fkey" FOREIGN KEY ("user_Id") REFERENCES "user" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "interview" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "workRequestId" TEXT NOT NULL,
    "hour" DATETIME NOT NULL,
    "clientId" TEXT,
    CONSTRAINT "interview_workRequestId_fkey" FOREIGN KEY ("workRequestId") REFERENCES "workRequest" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "interview_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "document" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "workRequestId" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "clientId" TEXT,
    CONSTRAINT "document_workRequestId_fkey" FOREIGN KEY ("workRequestId") REFERENCES "workRequest" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "document_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "client" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "whats" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "endress" TEXT NOT NULL,
    "payValue" TEXT NOT NULL,
    "describe" TEXT NOT NULL,
    "info" TEXT NOT NULL,
    "other_info" TEXT NOT NULL,
    "parties" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL,
    "cretedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "payment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "client_id" TEXT NOT NULL,
    "payment" TEXT NOT NULL,
    CONSTRAINT "payment_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "client" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "statusCase" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "id_client" TEXT NOT NULL,
    "processNumber" TEXT NOT NULL,
    "court" TEXT NOT NULL,
    "processType" TEXT NOT NULL,
    "statusProcess" BOOLEAN NOT NULL,
    "statusPayment" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "caseMoviment" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "moviments" TEXT NOT NULL,
    "statusCaseId" TEXT NOT NULL,
    CONSTRAINT "caseMoviment_statusCaseId_fkey" FOREIGN KEY ("statusCaseId") REFERENCES "statusCase" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "petition" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "petition" TEXT NOT NULL,
    "statusCaseId" TEXT NOT NULL,
    CONSTRAINT "petition_statusCaseId_fkey" FOREIGN KEY ("statusCaseId") REFERENCES "statusCase" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "hearing" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "pastHearings" DATETIME NOT NULL,
    "futureHearings" DATETIME NOT NULL,
    "statusCaseId" TEXT NOT NULL,
    CONSTRAINT "hearing_statusCaseId_fkey" FOREIGN KEY ("statusCaseId") REFERENCES "statusCase" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "prices" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "job" TEXT NOT NULL,
    "jobValue" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "advs" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "numRegister" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "cases" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "case" TEXT NOT NULL,
    "advsId" TEXT NOT NULL,
    CONSTRAINT "cases_advsId_fkey" FOREIGN KEY ("advsId") REFERENCES "advs" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
