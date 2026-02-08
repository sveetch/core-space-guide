#!/usr/bin/env python
"""
A script to launch a livereload server to watch and rebuild documentation
on some sources changes.

You need to have project with development requirements to use it.

Once launched, server will be available on port 8002, like: ::

    http://localhost:8002/

Borrowed from: ::

    https://livereload.readthedocs.io/en/latest/#script-example-sphinx

"""
from pathlib import Path

from livereload import Server, shell

# Documentation should be at the same level than this script
DOC_PATH = Path(__file__).parents[0].resolve()
# If not given, project is assumed to be parent of documentation
PROJECT_PATH = DOC_PATH.parent

server = Server()

# Watch documents
server.watch(str(DOC_PATH / "*.rst"), shell("make html", cwd=str(DOC_PATH)))
server.watch(str(DOC_PATH / "*/**.rst"), shell("make html", cwd=str(DOC_PATH)))

# Serve built documentation
server.serve(root=str(DOC_PATH / "_build/html"), port=8002, host="0.0.0.0", debug=True)
