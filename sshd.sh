#!/bin/bash

set -e

sudo chmod 777 /tmp

mkdir -p ~/.ssh
cd ~/.ssh

if [ ! -f ssh_host_rsa_key ]; then
    ssh-keygen -t rsa -b 4096 -f ssh_host_rsa_key -N ""
fi

mkdir -p /run/sshd
/usr/sbin/sshd -h ~/.ssh/ssh_host_rsa_key -p 10010

echo "ssh server started at port 10010"

# 把自己电脑的id_rsa.pub，完整地填进去
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDF4IMtcEiOlzpLHkdD9zcVaPD7Jv9UQsK//TetsU/UtqpUfqTBOTl+fxLK3DNN2y7zQUNCvScg9assucrxSnemdkqVQMVjE952Kcl3c+fuElENsFa4ruJgOyG8chQUNGTyCRmTxuLvwRcm+MnEQb7r3WwWj7FW96o1I61SM7YGvC4WJ6Hh6c9WrglgmK6oeOTeVDdWZDdoBl6F4jcg3NVRPc8lSLyAzTVOXVDyo31Huwukyg2bM3FxUpzziQtUrR020Tzml1hYRPGs+hkVAiSja7F4/cvssxY6j6Sw/JDvdwA0HgFnDrT2bBfjiXVKNq81WvI5/HD+z8Mls1pZcinfNl65TJYQY5cGyAe/SLm5Gg3cHpGcKlYXbg/7tI7YJiRWtEbWsL8fdEZxNGRDnM8Cjm6LcnjmX2kPx5Zq64Ia5pU085/RiSHOp+exZ3keirRl9ltxFwHpZXeUjXJc7DwAW7uVYGuuszu+DcOyE52Pp4fbLdPgYJJuvzrWYRThNGmLKUvWT4/lG+GqtdIFfUMCkb+ZFgTrX/qi5OQGtlKbXKBJt5FQltaSfnEOogqJUJOeosdLhYZYllcZSf4/f2u4r/RLtWAWHHZ2DyrbL8ETE25m9cnYxL1zMh/jK/fetKZvIv8uCdgRRYbxMKwBIXxDejx4+DfUov/SYgmLZChQYw== bytedance@G26QDF4MG7" >> authorized_keys

echo "public key add to authorized_keys"

