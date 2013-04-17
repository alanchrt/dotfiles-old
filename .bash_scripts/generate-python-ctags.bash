# generate-python-ctags.bash - Alan Christopher Thomas
# http://alanct.com/

if [ -d .git ]; then
    find . `python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"` -name "*.py" -exec ctags -R {} +
fi
