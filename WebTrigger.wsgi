#!/usr/bin/python
# Target: apache swgi mapping
# Version: 0.1
# Date: 2017/01/04
# Author: Guillain (guillain@gmail.com)
# Copyright 2017 GPL - Guillain

import os
import sys
import logging

sys.path.insert(0, '/var/www/WebTrigger')
os.environ['FLASK_SETTING'] = '/var/www/WebTrigger/conf/settings.cfg'

logging.basicConfig(stream=sys.stderr)

from WebTrigger import app as application
