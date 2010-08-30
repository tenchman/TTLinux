#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>

unsigned int fmt_ulong(char *dest,unsigned long i) {
  register unsigned long len,tmp,len2;
  for (len=1, tmp=i; tmp>9; ++len) tmp/=10;
  if (dest)
    for (tmp=i, dest+=len, len2=len+1; --len2; tmp/=10)
      *--dest = (tmp%10)+'0';
  return len;
}

void __attribute__((noreturn)) usage(char *msg, char *fname)
{
  if (msg) {
    write(2, msg, strlen(msg));
    write(2, fname, strlen(fname));
    write(2, "\n", 1);
  }
  write(2, "Usage: fstat [a|c|m|r|s] <filename>\n", 24);
  _exit(1);
}

void write1(char *a)
{
  write(1, a, strlen(a));
  write(1, "\n", 1);
}

void write2(char *a, char *b)
{
  write(1, a, strlen(a));
  write(1, b, strlen(b));
  write(1, "\n", 1);
}

int main(int argc, char **argv) {
  struct stat st;
  char * fname;
  int retval;
  char fmt[256];

  if (argc < 2) usage(NULL, NULL);
 
  if (argc == 3)
    fname = argv[2];
  else
    fname = argv[1];
  
  if ((retval = lstat(fname,&st)) != 0) usage("can't lstat ", fname);
    
  if (argc == 3) {
    while(*argv[1] == '-') ++argv[1];
    switch (*argv[1]) {
      case 'a':
	fmt_ulong(fmt, (long)st.st_atime);
	break;
      case 'c':
	fmt_ulong(fmt, (long)st.st_ctime);
	break;
      case 'm':
	fmt_ulong(fmt, (long)st.st_mtime);
	break;
      case 'r':
	fmt_ulong(fmt, (long)(st.st_blksize * st.st_blocks));
	break;
      case 's':
	fmt_ulong(fmt, (long)st.st_size);
	break;
      default:
	usage(NULL, NULL);
    }
    write1(fmt);
    _exit(0);
  }

  fmt_ulong(fmt, (long)st.st_size);
  write2("size:     ", fmt);
  fmt_ulong(fmt, (long)(st.st_blksize * st.st_blocks));
  write2("realsize: ", fmt);
  fmt_ulong(fmt, (long)st.st_atime);
  write2("access:   ", fmt);
  fmt_ulong(fmt, (long)st.st_mtime);
  write2("modify:   ", fmt);
  fmt_ulong(fmt, (long)st.st_ctime);
  write2("change:   ", fmt);
  _exit(0);
}
