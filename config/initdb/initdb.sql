-- CreateTable
CREATE TABLE "Todo" (
    "id" SERIAL NOT NULL,
    "value" TEXT,
    "done" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Todo_pkey" PRIMARY KEY ("id")
);

