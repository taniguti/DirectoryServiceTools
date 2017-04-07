# DirectoryServiceTools
OpenDirectoryとActiveDirectoryのためのスクリプト集。
## csv2od_import_file
Open Directory 用のユーザ一括登録ファイル生成ツール。`--help` でヘルプを表示します。
csvフォーマットのファイルを読み込み、OpenDirectoryに読み込ませるためのフォーマットに変換する。このスクリプトのためのcsvのサンプルを`mkcsvsample` で作ることができます。

    ./csv2od_import_file /path/to/file.csv > /path/to/od_import.txt
    dsimport /path/to/od_import.txt /LDAPv3/127.0.0.1 I --username diradmin

というようにする。

## csv2ad_import_file
Active Directory用の読み込みファイル変換ツール。`--help` でヘルプを表示します。
出来上がったファイルを、

    ./csvde.exe -i -f importfile.csv

で読み込む。パスワードは空で、アカウントは無効になる。
