# Intro

This docker image contains PHP latest version and MySQL 5.7.

Choose a version suite for yourself and run Laravel testing.

----

# Tags

This section will tell all you need to know about tags.


## General Tags

- All PHP is fetch from `ppa:ondrej/php`. 
- Composer is the latest version.
- Nodejs 12.13.0 LTS installed with npm.


## MySQL

In some cases (key constrains or others), tests can not run on a sqlite in memory. This tag in build with MySQL 5.7

You can use MySQL 5.7 inside container with user/password : root/root.


### Run MySQL in Ramdisk

MySQL is not as fast as sqlite, but you can boot it up in ramdisk to speed up the testing.

First, create a tmpfs on your computer:

```sh
# 256M tmpfs for MySQL in Docker
mount -t tmpfs -o size=256M \
    tmpfs /mnt/ramdisk
```

Now, run docker container with ramdisk:

```sh
docker run {{NAME}}
    -v /mnt/ramdisk:/var/lib/mysql
```

**Notice**: While you mount randisk to `/var/lib/mysql`, this folder is empty.

DO MySQL start/restart to initilize MySQL data store.
