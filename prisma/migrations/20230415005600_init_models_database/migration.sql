-- CreateTable
CREATE TABLE "Artist" (
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "biografy" TEXT NOT NULL,
    "styleOfArt" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "id" SERIAL NOT NULL,

    CONSTRAINT "Artist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Public" (
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "preferences" TEXT[],
    "id" SERIAL NOT NULL,
    "about" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Public_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Gallery" (
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "id" SERIAL NOT NULL,
    "aboutArtist" TEXT NOT NULL,
    "typeOfArt" CHAR(1) NOT NULL,
    "artistId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Gallery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Art" (
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "typeOfArt" CHAR(1) NOT NULL,
    "artistId" INTEGER NOT NULL,
    "id" SERIAL NOT NULL,
    "galleryId" INTEGER NOT NULL,
    "exposureId" INTEGER,

    CONSTRAINT "Art_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Exposure" (
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "galleryId" INTEGER NOT NULL,
    "id" SERIAL NOT NULL,
    "artId" INTEGER NOT NULL,
    "exhibitionStyles" TEXT[],

    CONSTRAINT "Exposure_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Artist_email_key" ON "Artist"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Public_email_key" ON "Public"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Gallery_name_key" ON "Gallery"("name");

-- AddForeignKey
ALTER TABLE "Gallery" ADD CONSTRAINT "Gallery_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Art" ADD CONSTRAINT "Art_artistId_fkey" FOREIGN KEY ("artistId") REFERENCES "Artist"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Art" ADD CONSTRAINT "Art_galleryId_fkey" FOREIGN KEY ("galleryId") REFERENCES "Gallery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Art" ADD CONSTRAINT "Art_exposureId_fkey" FOREIGN KEY ("exposureId") REFERENCES "Exposure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Exposure" ADD CONSTRAINT "Exposure_galleryId_fkey" FOREIGN KEY ("galleryId") REFERENCES "Gallery"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
