#ifndef PHOTOLIST_H
#define PHOTOLIST_H

#include <QVector>
#include <QVariant>
#include <QUrl>
#include <QDir>
#include <QObject>
#include <QDebug>

class PhotoList : public QObject
{
    Q_OBJECT
public:
    explicit PhotoList(QObject *parent = nullptr);

    Q_INVOKABLE void processDirectory(const QString &directory);

    Q_INVOKABLE QUrl nextImage();

signals:

public slots:

private:
    QUrl mBaseUrl;
    QVector<QString> mImages;
    int mIndex = 0;
};

#endif // PHOTOLIST_H
