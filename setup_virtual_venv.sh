cd /opt/Python-2.7.15
./configure --prefix=$HOME/opt/python-2.7.15
make
make install
virtualenv -p /home/michael/opt/python-2.7.15/bin/python venv
