#include "photolist.h"

PhotoList::PhotoList(QObject *parent) : QObject(parent)
{

}

void PhotoList::processDirectory(const QString &directory)
{
    mBaseUrl = QUrl(directory);

    QDir fileDirectory(mBaseUrl.toLocalFile());

    QStringList nameFilters;

    nameFilters.append(QStringLiteral("*.jpg"));
    nameFilters.append(QStringLiteral("*.png"));
    nameFilters.append(QStringLiteral("*.bmp"));

    mImages = QVector<QString>::fromList(fileDirectory.entryList(nameFilters, QDir::Files));
}

QUrl PhotoList::nextImage()
{
    int count = mImages.count();

    if (count == 0)
        return QUrl();

    if (mIndex >= count)
        mIndex = 0;

    QUrl image(mBaseUrl.toString() + "/" + mImages.at(mIndex));

    mIndex++;

    return image;
}
