cd /opt/Python-2.7.15
./configure --prefix=$HOME/opt/python-2.7.15
make
make install
pip install virtualenv==20.21.1
cd $HOME/opt/python-2.7.15/bin
virtualenv -p $HOME/opt/python-2.7.15/bin/python venv
