from setuptools import setup, find_packages

REQUIREMENTS = open("requirements.txt").read()

setup(name='site_stephen',
      version='1',
      description='site_stephen',
      packages=find_packages(),
      install_requires=REQUIREMENTS
      )
