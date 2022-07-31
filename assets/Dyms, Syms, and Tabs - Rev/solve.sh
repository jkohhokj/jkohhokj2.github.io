#!/bin/bash

readelf --sym chall | grep ABS | grep "\.c"