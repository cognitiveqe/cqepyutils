import setuptools
from cqepyutils.version import VERSION
from os.path import abspath, dirname, join

with open("README.md", "r") as fh:
    long_description = fh.read()

DESCRIPTION = """
Python Reusable Functions. Reusable functions are categorized as csv_utils, PandasUtils etc.
"""[1:-1]

CLASSIFIERS = """
Programming Language :: Python :: 3
License :: OSI Approved :: MIT License
Operating System :: OS Independent
Topic :: Software Development :: Testing
Development Status :: 5 - Production/Stable
"""[1:-1]

setuptools.setup(
    name="cqepyutils",
    version=VERSION,
    author="Sridhar VP",
    author_email="sridharvpmca@gmail.com",
    description="Cognitive Quality Engineer - Python Reusable Function Library",
    long_description=DESCRIPTION,
    long_description_content_type="text/markdown",
    url='https://github.com/cognitiveqe/cqepyutils/',
    keywords='Python Reusable Function Library',
    license='MIT',
    # package_dir={''},
    packages=setuptools.find_packages(),
    # packages=['PandasUtils'],
    platforms='any',
    classifiers=CLASSIFIERS.splitlines(),
    python_requires='>=3.6',
    install_requires=[
        'pandas',
        'numpy',
        'requests',
        'robotframework',
        'robotframework-requests',
    ],
)


# from os.path import abspath, dirname, join
#
# from cqepyutils.version import VERSION
#
# try:
#     from setuptools import setup
# except ImportError as error:
#     from distutils.core import setup
#
# version_file = join(dirname(abspath(__file__)), 'cqepyutils', 'version.py')
#
# with open(version_file) as file:
#     code = compile(file.read(), version_file, 'exec')
#     exec(code)
#
# DESCRIPTION = """
# Robot Framework keyword library wrapper around the HTTP client library requests.
# """[1:-1]
#
# CLASSIFIERS = """
# Development Status :: 5 - Production/Stable
# License :: OSI Approved :: MIT License
# Operating System :: OS Independent
# Programming Language :: Python
# Topic :: Software Development :: Testing
# """[1:-1]
#
# setup(name='cqepyutils',
#       version=VERSION,
#       description='Cognitive Quality Engineer - Python Reusable Functions',
#       long_description=DESCRIPTION,
#       author='Sridhar VP',
#       author_email='sridharvpmca@gmail.com',
#       url='https://github.com/cognitiveqe/cqepyutils/',
#       license='MIT',
#       keywords='Remote repository for reusable functions',
#       platforms='any',
#       classifiers=CLASSIFIERS.splitlines(),
#       # package_dir={'': 'src'},
#       # packages=['PandasUtils'],
#       # package_data={'PandasUtils': ['tests/*.txt']},
#       install_requires=[
#           'pandas',
#           'numpy',
#           'requests',
#           'robotframework',
#           'robotframework-requests',
#       ],
#       python_requires='>=3.6',
#       )
#
# """ From now on use this approach
#
# python setup.py sdist upload
# git tag -a 1.2.3 -m 'version 1.2.3'
# git push --tags"""
