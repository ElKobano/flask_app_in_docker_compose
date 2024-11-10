#!/bin/sh
export PATH=$PATH:/home/app/.local/bin && python3 setup.py && flask run --host=0.0.0.0 --port 8000
