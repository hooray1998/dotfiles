begin{
	digits=0
	line=0
}
/\~/{
	print $0
}
/^\s*-/{
	print $0
	}
{
if(digits==1)
{
	printf("\t%s\n",$1)
	digits=0
}
}
/[1-9]/{
	printf("%s",$0)
	digits=1
}
