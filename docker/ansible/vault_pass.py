#!/usr/bin/env python3

import os

if 'ANSIBLE_VAULT_PASSWORD' in os.environ:
    print(os.environ['ANSIBLE_VAULT_PASSWORD'])
else:
    print(" ")