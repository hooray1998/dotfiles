# wget
> Download files from the Web
> Supports HTTP, HTTPS, and FTP
> More information: <https://www.gnu.org/software/wget>
- **Download the contents of an URL to a file (named "foo" in this case):**
wget `https://example.com/foo`
- **Download the contents of an URL to a file (named "bar" in this case):**
wget -O `bar` `https://example.com/foo`
- **Download a single web page and all its resources with 3-second intervals between requests (scripts, stylesheets, images, etc.):**
wget --page-requisites --convert-links --wait=3 `https://example.com/somepage.html`
- **Download all listed files within a directory and its sub-directories (does not download embedded page elements):**
wget --mirror --no-parent `https://example.com/somepath/`
- **Limit the download speed and the number of connection retries:**
wget --limit-rate=`300k` --tries=`100` `https://example.com/somepath/`
- **Download a file from an HTTP server using Basic Auth (also works for FTP):**
wget --user=`username` --password=`password` `https://example.com`
- **Continue an incomplete download:**
wget -c `https://example.com`
- **Download all URLs stored in a text file to a specific directory:**
wget -P `path/to/directory` -i `URLs.txt`

### 使用 wget 完成批量下载

如果想下载一个网站上目录中的所有文件, 我需要执行一长串wget命令, 但这样做会更好:
wget -nd -r -l1 --no-parent http://www.foo.com/mp3/
这条命令可以执行的很好, 但有时会下载像 index.@xx 这样一些我不想要的文件. 如果你知道想要文件的格式, 可以用下面的命令来避免下载那些多余的文件:
wget -nd -r -l1 --no-parent -A.mp3 -A.wma http://www.foo.com/mp3/
我来简单的介绍一下命令中指定选项的作用.
-nd 不创建目录, wget默认会创建一个目录
-r 递归下载
-l1 (L one) 递归一层,只下载指定文件夹中的内容, 不下载下一级目录中的.
–no-parent 不下载父目录中的文件


### wget 使用技巧

2007-10-14 Toy Posted in TipsRSSTrackback
wget 是一个命令行的下载工具。对于我们这些 Linux 用户来说，几乎每天都在使用它。下面为大家介绍几个有用的 wget 小技巧，可以让你更加高效而灵活的使用 wget。
wget -r -np -nd http://example.com/packages/
这条命令可以下载 http://example.com 网站上 packages 目录中的所有文件。其中，-np 的作用是不遍历父目录，-nd 表示不在本机重新创建目录结构。
wget -r -np -nd --accept=iso http://example.com/centos-5/i386/
与上一条命令相似，但多加了一个 --accept=iso 选项，这指示 wget 仅下载 i386 目录中所有扩展名为 iso 的文件。你也可以指定多个扩展名，只需用逗号分隔即可。
wget -i filename.txt
此命令常用于批量下载的情形，把所有需要下载文件的地址放到 filename.txt 中，然后 wget 就会自动为你下载所有文件了。
wget -c http://example.com/really-big-file.iso
这里所指定的 -c 选项的作用为断点续传。
wget -m -k (-H) http://www.example.com/
该命令可用来镜像一个网站，wget 将对链接进行转换。如果网站中的图像是放在另外的站点，那么可以使用 -H 选项。
