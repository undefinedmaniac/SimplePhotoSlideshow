#include "photolist.h"

PhotoList::PhotoList(QObject *parent) : QObject(parent)
{

}

void PhotoList::processDirectory(const QString &directory)
{
    QDir fileDirectory(directory);

    QStringList nameFilters;

    nameFilters.append(QStringLiteral(".jpg"));
    nameFilters.append(QStringLiteral(".png"));
    nameFilters.append(QStringLiteral(".bmp"));

    mImages = QVector<QString>::fromList(fileDirectory.entryList(nameFilters, QDir::Files));
}

QVariant PhotoList::nextImage()
{
    int count = mImages.count();

    if (count == 0)
        return QVariant();

    if (mIndex >= count)
        mIndex = 0;

    QVariant image(mImages.at(mIndex));

    mIndex++;

    return image;
}
