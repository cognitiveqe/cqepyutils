cd .
python setup.py sdist bdist_wheel
pip uninstall cqepyutils -y
cd dist
for %%f in (cqepyutils*.whl) do pip install %%f
