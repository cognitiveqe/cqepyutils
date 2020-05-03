cd .
python3 setup.py sdist bdist_wheel
pip uninstall cqepyutils
cd dist
pip install cqepyutils*.whl
