# 2023_Linux_Setup


<p>This is a normal paragraph:</p>

Reference: https://github.com/christitustech/mybash

### For Ubuntu/Debian
<pre><code># mkdir github && cd github
# git clone https://github.com/yes72002/2023_Linux_Setup
# cd jimbash
# chmod 777 *
# ./setup.sh
</code></pre>

### For BMC
Download the files in the BMC folder

`ifconfig` in the BMC console

In the `BMC` console or ssh console
<pre><code># mkdir github/jimbash && cd github/jimbash
</code></pre>

In the `local` (where the BMC/ download)
<pre><code># scp -r ./BMC root@<BMC_IP>:~/github/jimbash/
</code></pre>

In the `BMC` console or ssh console
<pre><code># ls
# cd BMC
# chmod 777 *
# ./jim_bmc_setup.sh
# sed -i 's/\r//g' *
# source ~/.bashrc
</code></pre>