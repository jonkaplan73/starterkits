from setuptools import setup
from switapi.__version__ import __version__

with open("README.md", "r") as fh:
    long_description = fh.read()
with open("LICENSE", "r") as lc:
    license = lc.read()

setup(
    name="switapi",
    version=__version__,
    description="A simple package for hitting the open Swiss Public Transit API.",
    url="https://github.com/tedbakanas/starterkits",
    long_description=long_description,
    long_description_content_type="text/markdown",
    author="Theodore Bakanas",
    author_email="tedbakanas@gmail.com",
    license=license,
    packages=["switapi"],
    install_requires=[],
    include_package_data=True,
    zip_safe=False,
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
        "Development Status :: 2 - Pre-Alpha",
    ],
    python_requires='>=3.6'
)