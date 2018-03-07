#ifndef PHOTOLIST_H
#define PHOTOLIST_H

#include <QVector>
#include <QVariant>
#include <QUrl>
#include <QDir>
#include <QObject>

class PhotoList : public QObject
{
    Q_OBJECT
public:
    explicit PhotoList(QObject *parent = nullptr);

    Q_INVOKABLE void processDirectory(const QString &directory);

    Q_INVOKABLE QVariant nextImage();

signals:

public slots:

private:
    QVector<QString> mImages;
    int mIndex = 0;
};

#endif // PHOTOLIST_H
