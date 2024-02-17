cd /opt/Python-2.7.15
./configure --prefix=$HOME/opt/python-2.7.15
make
make install
cd $HOME/opt/python-2.7.15/bin
virtualenv -p $HOME/opt/python-2.7.15/bin/python venv
