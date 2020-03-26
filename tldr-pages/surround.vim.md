# surround.vim
> Plugin for deleting, changing, and adding "surroundings"
- **特殊意义**
b = () B = {} 增加时左括号加空格,右括号不加空格
- **文本对象**
w word W:WORD s:sentence p:paragraph
- **删除环绕**
删引号ds" ds' 删标签dst 删括号dsb dsB ds[
- **修改环绕**
cs"' csb' cs'b cs"<q>
- **增加环绕**
ysWb WORD增加小括号  ysiwB word增加大括号 ysw[ 增加中括号并加空格
- **可视模式按S然后跟符号代表添加**
my $str = whee!;         vllllS'     my $str = 'whee!';
- **s代表当前行**
Hello world!         yssB            {Hello world!}
- **加函数**
"hello"  ysWfprint<cr>  print("hello")
