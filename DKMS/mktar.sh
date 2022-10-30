#!/bin/bash

ARCHIVE=usbpc121.tar.gz
rm ${ARCHIVE}
tar czvf ${ARCHIVE} dkms_source_tree
