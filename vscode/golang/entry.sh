#!/bin/bash
/etc/init.d/ssh start
mkdir -p /root/.ssh
echo -n "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA0nBz3xZIl27ip4VXE1WJHSn/ekxcQjp1eh6D3iGWXhgtjJoDb9gWrXmnjr2fmUQ4dWCCjmM1D5onc3LsgL5RW5c+JaQNdRJE/KJ03yquk8+mvXxlhAYoX9RlsBeWG1oiyrpX3djJaSH3EVbdXKOoKKl/lTPYMlYK61c3nnMLRh5NmtJ1vJJM4NAVcJnpq5uMILJ4WhPtYCZmW1Gv2nl/qAPwHImiNJqGJkzR66qTuyGTo/7ad3Es0KNLfEnphAAMCoSZG+xE4+VsIE+vmqD1tRyvCHEL1HYEQIEwHYJC6uVADkF89eU0Jpmvtdd7wjC/L7kkPUpk8cq96FPKHuR24Q== root" >> /root/.ssh/authorized_keys
sleep infinity
