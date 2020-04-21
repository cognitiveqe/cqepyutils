#!/usr/bin/env python

from os.path import abspath, dirname, join

from src.cqepyutils import VERSION

try:
    from setuptools import setup
except ImportError as error:
    from distutils.core import setup

version_file = join(dirname(abspath(__file__)), 'src', 'PandasUtils', 'version.py')

with open(version_file) as file:
    code = compile(file.read(), version_file, 'exec')
    exec(code)

DESCRIPTION = """
Robot Framework keyword library wrapper around the HTTP client library requests.
"""[1:-1]

CLASSIFIERS = """
Development Status :: 5 - Production/Stable
License :: OSI Approved :: MIT License
Operating System :: OS Independent
Programming Language :: Python
Topic :: Software Development :: Testing
"""[1:-1]

setup(name='cqepyutils',
      version=VERSION,
      description='Cognitive Quality Engineer - Python Reusable Functions',
      long_description=DESCRIPTION,
      author='Sridhar VP',
      author_email='sridharvpmca@gmail.com',
      url='https://github.com/cognitiveqe/cqepyutils/',
      license='MIT',
      keywords='Remote repository for reusable functions',
      platforms='any',
      classifiers=CLASSIFIERS.splitlines(),
      package_dir={'': 'src'},
      packages=['PandasUtils', 'CQEPyUtils'],
      package_data={'PandasUtils': ['tests/*.txt']},
      install_requires=[
          'pandas',
          'numpy',
          'requests',
          'robotframework',
          'robotframework-requests',
      ],
      )

""" From now on use this approach

python setup.py sdist upload
git tag -a 1.2.3 -m 'version 1.2.3'
git push --tags"""
