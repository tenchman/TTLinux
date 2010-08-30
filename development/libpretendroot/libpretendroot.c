/*
    libpretendroot -- pretend that you are root
    Copyright (C) 2002, 2003, 2007  Egmont Koblinger <egmont@uhulinux.hu>

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
*/

#define _GNU_SOURCE
#include <unistd.h>
#include <stdlib.h>
#include <dlfcn.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <dirent.h>
#include <string.h>
#include <limits.h>

static uid_t (*next_getuid)(void);
static uid_t (*next_geteuid)(void);
static gid_t (*next_getgid)(void);
static gid_t (*next_getegid)(void);
static int (*next_getgroups)(int, gid_t []);
static int (*next_setuid)(uid_t);
static int (*next_seteuid)(uid_t);
static int (*next_setreuid)(uid_t, uid_t);
static int (*next_setgid)(gid_t);
static int (*next_setegid)(gid_t);
static int (*next_setregid)(gid_t, gid_t);
static int (*next_setgroups)(size_t, const gid_t *);
static int (*next___xstat)(int, const char *, struct stat *);
static int (*next___lxstat)(int, const char *, struct stat *);
static int (*next___fxstat)(int, int, struct stat *);
static int (*next___fxstatat)(int, int, const char *, struct stat *, int);
static int (*next___xstat64)(int, const char *, struct stat64 *);
static int (*next___lxstat64)(int, const char *, struct stat64 *);
static int (*next___fxstat64)(int, int, struct stat64 *);
static int (*next___fxstatat64)(int, int, const char *, struct stat64 *, int);
static int (*next_chown)(const char *, uid_t, gid_t);
static int (*next_lchown)(const char *, uid_t, gid_t);
static int (*next_fchown)(int, uid_t, gid_t);
static int (*next_fchownat)(int, const char *, uid_t, gid_t, int);
static int (*next_unlink)(const char *);
static int (*next_unlinkat)(int, const char *, int);
static int (*next_remove)(const char *);
static int (*next_rmdir)(const char *);
static int (*next_rename)(const char *, const char *);
static int (*next_renameat)(int, const char *, int, const char *);

static mode_t um;
static char *dir;

static void print_filename (const struct stat *st, char *res)
{
	sprintf(res, "%s/%04llx-%llu", dir, (unsigned long long)st->st_dev, (unsigned long long)st->st_ino);
}

static void print_filename64 (const struct stat64 *st, char *res)
{
	sprintf(res, "%s/%04llx-%llu", dir, (unsigned long long)st->st_dev, (unsigned long long)st->st_ino);
}

static void get_pretended_uid_gid (struct stat *st)
{
	char path[PATH_MAX];
	char buf[32];
	int fd, i;
	int uid, gid;

	uid = gid = 0;
	print_filename(st, path);
	fd = open(path, O_RDONLY);
	if (fd >= 0) {
		i = read(fd, buf, 32);
		if (i > 0 && i < 32) {
			buf[i] = 0;
			if (sscanf(buf, "%d %d", &uid, &gid) != 2) {
				uid = gid = 0;
			}
		}
		close(fd);
	}
	st->st_uid = uid;
	st->st_gid = gid;
}

static void get_pretended_uid_gid64 (struct stat64 *st)
{
	char path[PATH_MAX];
	char buf[32];
	int fd, i;
	int uid, gid;

	uid = gid = 0;
	print_filename64(st, path);
	fd = open(path, O_RDONLY);
	if (fd >= 0) {
		i = read(fd, buf, 32);
		if (i > 0 && i < 32) {
			buf[i] = 0;
			if (sscanf(buf, "%d %d", &uid, &gid) != 2) {
				uid = gid = 0;
			}
		}
		close(fd);
	}
	st->st_uid = uid;
	st->st_gid = gid;
}

static void remove_pretended_uid_gid (const struct stat *st)
{
	char path[PATH_MAX];
	print_filename(st, path);
	next_unlink(path);
}

static void set_pretended_uid_gid (struct stat *st, uid_t uid, gid_t gid)
{
	char path[PATH_MAX];
	char path_tmp[PATH_MAX];
	char buf[32];
	int fd;

	get_pretended_uid_gid(st);
	if (uid != -1) st->st_uid = uid;
	if (gid != -1) st->st_gid = gid;
	if (st->st_uid != 0 || st->st_gid != 0) {
		print_filename(st, path);
		sprintf(path_tmp, "%s.tmp", path);
		fd = open(path_tmp, O_WRONLY|O_CREAT|O_EXCL, 0666 & ~um);
		if (fd >= 0) {
			sprintf(buf, "%d %d\n", st->st_uid, st->st_gid);
			write(fd, buf, strlen(buf));
			close(fd);
			next_rename(path_tmp, path);
		}
	} else {
		remove_pretended_uid_gid(st);
	}
}

void pretendroot_init (void) __attribute((constructor));
void pretendroot_init (void)
{
	next_getuid       = dlsym(RTLD_NEXT, "getuid");
	next_geteuid      = dlsym(RTLD_NEXT, "geteuid");
	next_getgid       = dlsym(RTLD_NEXT, "getgid");
	next_getegid      = dlsym(RTLD_NEXT, "getegid");
	next_getgroups    = dlsym(RTLD_NEXT, "getgroups");
	next_setuid       = dlsym(RTLD_NEXT, "setuid");
	next_seteuid      = dlsym(RTLD_NEXT, "seteuid");
	next_setreuid     = dlsym(RTLD_NEXT, "setreuid");
	next_setgid       = dlsym(RTLD_NEXT, "setgid");
	next_setegid      = dlsym(RTLD_NEXT, "setegid");
	next_setregid     = dlsym(RTLD_NEXT, "setregid");
	next_setgroups    = dlsym(RTLD_NEXT, "setgroups");
	next___xstat      = dlsym(RTLD_NEXT, "__xstat");
	next___lxstat     = dlsym(RTLD_NEXT, "__lxstat");
	next___fxstat     = dlsym(RTLD_NEXT, "__fxstat");
	next___fxstatat   = dlsym(RTLD_NEXT, "__fxstatat");
	next___xstat64    = dlsym(RTLD_NEXT, "__xstat64");
	next___lxstat64   = dlsym(RTLD_NEXT, "__lxstat64");
	next___fxstat64   = dlsym(RTLD_NEXT, "__fxstat64");
	next___fxstatat64 = dlsym(RTLD_NEXT, "__fxstatat64");
	next_chown        = dlsym(RTLD_NEXT, "chown");
	next_lchown       = dlsym(RTLD_NEXT, "lchown");
	next_fchown       = dlsym(RTLD_NEXT, "fchown");
	next_fchownat     = dlsym(RTLD_NEXT, "fchownat");
	next_unlink       = dlsym(RTLD_NEXT, "unlink");
	next_unlinkat     = dlsym(RTLD_NEXT, "unlinkat");
	next_remove       = dlsym(RTLD_NEXT, "remove");
	next_rmdir        = dlsym(RTLD_NEXT, "rmdir");
	next_rename       = dlsym(RTLD_NEXT, "rename");
	next_renameat     = dlsym(RTLD_NEXT, "renameat");

	if ((dir = getenv("PRETENDROOTDIR")) != NULL) {
		um = umask(0777);
		umask(um);
	}
}

uid_t getuid (void)
{
	if (dir == NULL) return next_getuid();
	return 0;
}

uid_t geteuid (void)
{
	if (dir == NULL) return next_geteuid();
	return 0;
}

gid_t getgid (void)
{
	if (dir == NULL) return next_getgid();
	return 0;
}

gid_t getegid (void)
{
	if (dir == NULL) return next_getegid();
	return 0;
}

int getgroups (int size, gid_t list[])
{
	if (dir == NULL) return next_getgroups(size, list);
	if (size > 0) list[0] = 0;
	return 1;
}

int setuid (uid_t uid)
{
	if (dir == NULL) return next_setuid(uid);
	next_setuid(uid);
	errno = 0;
	return 0;
}

int seteuid (uid_t euid)
{
	if (dir == NULL) return next_seteuid(euid);
	next_seteuid(euid);
	errno = 0;
	return 0;
}

int setreuid (uid_t ruid, uid_t euid)
{
	if (dir == NULL) return next_setreuid(ruid, euid);
	next_setreuid(ruid, euid);
	errno = 0;
	return 0;
}

int setgid (gid_t gid)
{
	if (dir == NULL) return next_setgid(gid);
	next_setgid(gid);
	errno = 0;
	return 0;
}

int setegid (gid_t egid)
{
	if (dir == NULL) return next_setegid(egid);
	next_setegid(egid);
	errno = 0;
	return 0;
}

int setregid (gid_t rgid, gid_t egid)
{
	if (dir == NULL) return next_setregid(rgid, egid);
	next_setregid(rgid, egid);
	errno = 0;
	return 0;
}

int setgroups (size_t size, const gid_t *list)
{
	if (dir == NULL) return next_setgroups(size, list);
	next_setgroups(size, list);
	errno = 0;
	return 0;
}

int __xstat (int ver, const char *file, struct stat *st)
{
	if (dir == NULL) return next___xstat(ver, file, st);
	if (next___xstat(ver, file, st) < 0) return -1;
	get_pretended_uid_gid(st);
	errno = 0;
	return 0;
}

int __lxstat (int ver, const char *file, struct stat *st)
{
	if (dir == NULL) return next___lxstat(ver, file, st);
	if (next___lxstat(ver, file, st) < 0) return -1;
	get_pretended_uid_gid(st);
	errno = 0;
	return 0;
}

int __fxstat (int ver, int fd, struct stat *st)
{
	if (dir == NULL) return next___fxstat(ver, fd, st);
	if (next___fxstat(ver, fd, st) < 0) return -1;
	get_pretended_uid_gid(st);
	errno = 0;
	return 0;
}

int __fxstatat (int ver, int fd, const char *file, struct stat *st, int flags)
{
	if (dir == NULL) return next___fxstatat(ver, fd, file, st, flags);
	if (next___fxstatat(ver, fd, file, st, flags) < 0) return -1;
	get_pretended_uid_gid(st);
	errno = 0;
	return 0;
}

int __xstat64 (int ver, const char *file, struct stat64 *st)
{
	if (dir == NULL) return next___xstat64(ver, file, st);
	if (next___xstat64(ver, file, st) < 0) return -1;
	get_pretended_uid_gid64(st);
	errno = 0;
	return 0;
}

int __lxstat64 (int ver, const char *file, struct stat64 *st)
{
	if (dir == NULL) return next___lxstat64(ver, file, st);
	if (next___lxstat64(ver, file, st) < 0) return -1;
	get_pretended_uid_gid64(st);
	errno = 0;
	return 0;
}

int __fxstat64 (int ver, int fd, struct stat64 *st)
{
	if (dir == NULL) return next___fxstat64(ver, fd, st);
	if (next___fxstat64(ver, fd, st) < 0) return -1;
	get_pretended_uid_gid64(st);
	errno = 0;
	return 0;
}

int __fxstatat64 (int ver, int fd, const char *file, struct stat64 *st, int flags)
{
	if (dir == NULL) return next___fxstatat64(ver, fd, file, st, flags);
	if (next___fxstatat64(ver, fd, file, st, flags) < 0) return -1;
	get_pretended_uid_gid64(st);
	errno = 0;
	return 0;
}

int chown (const char *file, uid_t uid, gid_t gid)
{
	struct stat st;
	if (dir == NULL) return next_chown(file, uid, gid);
	if (next___xstat(_STAT_VER, file, &st) < 0) return -1;
	set_pretended_uid_gid(&st, uid, gid);
	errno = 0;
	return 0;
}

int lchown (const char *file, uid_t uid, gid_t gid)
{
	struct stat st;
	if (dir == NULL) return next_lchown(file, uid, gid);
	if (next___lxstat(_STAT_VER, file, &st) < 0) return -1;
	set_pretended_uid_gid(&st, uid, gid);
	errno = 0;
	return 0;
}

int fchown (int fd, uid_t uid, gid_t gid)
{
	struct stat st;
	if (dir == NULL) return next_fchown(fd, uid, gid);
	if (next___fxstat(_STAT_VER, fd, &st) < 0) return -1;
	set_pretended_uid_gid(&st, uid, gid);
	errno = 0;
	return 0;
}

int fchownat (int fd, const char *file, uid_t uid, gid_t gid, int flags)
{
	struct stat st;
	if (dir == NULL) return next_fchownat(fd, file, uid, gid, flags);
	if (next___fxstatat(_STAT_VER, fd, file, &st, (flags & AT_SYMLINK_NOFOLLOW)) < 0) return -1;
	set_pretended_uid_gid(&st, uid, gid);
	errno = 0;
	return 0;
}

int unlink (const char *file)
{
	struct stat st;
	if (dir == NULL) return next_unlink(file);
	if (next___lxstat(_STAT_VER, file, &st) < 0) return -1;
	if (next_unlink(file) < 0) return -1;
	if (st.st_nlink == 1) remove_pretended_uid_gid(&st);
	errno = 0;
	return 0;
}

int unlinkat (int fd, const char *file, int flags)
{
	struct stat st;
	if (dir == NULL) return next_unlinkat(fd, file, flags);
	if (next___fxstatat(_STAT_VER, fd, file, &st, AT_SYMLINK_NOFOLLOW) < 0) return -1;
	if (next_unlinkat(fd, file, flags) < 0) return -1;
	if (st.st_nlink == 1 || (flags & AT_REMOVEDIR)) remove_pretended_uid_gid(&st);
	errno = 0;
	return 0;
}

int remove (const char *file)
{
	struct stat st;
	if (dir == NULL) return next_remove(file);
	if (next___lxstat(_STAT_VER, file, &st) < 0) return -1;
	if (next_remove(file) < 0) return -1;
	if (st.st_nlink == 1) remove_pretended_uid_gid(&st);
	errno = 0;
	return 0;
}

int rmdir (const char *file)
{
	struct stat st;
	if (dir == NULL) return next_rmdir(file);
	if (next___lxstat(_STAT_VER, file, &st) < 0) return -1;
	if (next_rmdir(file) < 0) return -1;
	remove_pretended_uid_gid(&st);
	errno = 0;
	return 0;
}

int rename (const char *oldfile, const char *newfile)
{
	struct stat st1, st2;
	if (dir == NULL
	 || next___lxstat(_STAT_VER, newfile, &st1) < 0
	 || (st1.st_nlink > 1 && !S_ISDIR(st1.st_mode))) return next_rename(oldfile, newfile);
	if (next_rename(oldfile, newfile) < 0) return -1;
	if (next___lxstat(_STAT_VER, newfile, &st2) < 0
	 || st1.st_ino != st2.st_ino) remove_pretended_uid_gid(&st1);
	errno = 0;
	return 0;
}

int renameat (int oldfd, const char *oldfile, int newfd, const char *newfile)
{
	struct stat st1, st2;
	if (dir == NULL
	 || next___fxstatat(_STAT_VER, newfd, newfile, &st1, AT_SYMLINK_NOFOLLOW) < 0
	 || (st1.st_nlink > 1 && !S_ISDIR(st1.st_mode))) return next_renameat(oldfd, oldfile, newfd, newfile);
	if (next_renameat(oldfd, oldfile, newfd, newfile) < 0) return -1;
	if (next___fxstatat(_STAT_VER, newfd, newfile, &st2, AT_SYMLINK_NOFOLLOW) < 0
	 || st1.st_ino != st2.st_ino) remove_pretended_uid_gid(&st1);
	errno = 0;
	return 0;
}

