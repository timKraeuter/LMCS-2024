#!/usr/bin/env python

"""Generate the scalability plot for the article."""

import argparse
import json
import numpy as np
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("file", help="JSON file with benchmark results")

args = parser.parse_args()

with open(args.file) as f:
    results = json.load(f)["results"]

all_means = [b["mean"] for b in results]
plt.plot(list(range(1,301)), all_means)

# plt.title("State space generation scalability")
plt.xlabel("Blocks per BPMN model")
plt.ylabel("Average runtime in s")

plt.show()
