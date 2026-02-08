# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import datetime
import os
import sys

current_date = datetime.datetime.now()

# -- Project information -----------------------------------------------------

project = "Core Space"
copyright = "{}, David Thenon".format(current_date.year)
author = "David Thenon"

# The short X.Y version
version = "0.1.0"
# The full version, including alpha/beta/rc tags
release = version


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    # "sphinx.ext.autodoc",
    # "sphinx.ext.viewcode",
    # "sphinx.ext.napoleon",
    "sphinx.ext.todo",
    "sphinx_copybutton",
    "sphinx_design",
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = "sphinx"

# Use index.rst as root content doc file
master_doc = "index"

# -- Options for HTML output -------------------------------------------------

# The name of an image file (relative to this directory) to place at the top
# of the sidebar.
# html_logo = "_static/logo.dark.svg"

# The name of an image file (relative to this directory) to use as a favicon of
# the docs.  This file should be a Windows icon file (.ico) being 16x16 or 32x32
# pixels large.
html_favicon = "_static/favicon.ico"

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ["_static"]

# For Furo theme
html_theme = "furo"
html_title = "{name}<br><small>v{version}</small>".format(
    name=project,
    version=version,
)

html_theme_options = {
    "light_logo": "logo.dark.svg",
    "dark_logo": "logo.white.svg",
}

# Apply some CSS patch to Furo
html_css_files = [
    "css/furo-adjustments.css",
    "css/design-adjustments.css",
]

# -- Autodoc config---------- -------------------------------------------------

# Do not order autodoc contents by alphabetical, keep to the source order
autodoc_member_order = "bysource"

# -- Rinohtype config---------- -----------------------------------------------
rinoh_documents = [
    dict(
        # top-level file (index.rst)
        doc="index",
        # output file (doc.pdf)
        target="doc"
    ),
]
