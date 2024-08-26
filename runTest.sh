#!/bin/bash
PARENT_DIR=$(pwd)
cd "$PARENT_DIR"
python3 -m robot --outputdir Results Test/ProductPurchaseTest.robot
exit 0
