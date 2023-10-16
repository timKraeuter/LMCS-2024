# Prerequisites
1. Install the command-line benchmark tool [hyperfine](https://github.com/sharkdp/hyperfine#installation).
   - The experiment was run with hyperfine version **1.15.0** on Windows 10.
   - The hyperfine windows release **1.15.0** is contained in `artifacts/dependencies`.
2. Install Java version 11 (Groove might also work with later versions).

The experiment was run with Groove version **6.1.0**, which is contained in `groove-6_1_0` and does not have to be installed.
All experiments were run using a Windows 11 machine with an AMD Ryzen 7700X processor with 32 GB DDR5-5600 RAM on NVMe SSD storage.

# HOT transformation experiment
1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Experiment**:
```bash
hyperfine -L bpmnModel models/e001.bpmn,models/e002.bpmn,models/e007.bpmn,models/e008.bpmn,models/e009.bpmn,models/e010.bpmn,models/e011.bpmn,models/e015.bpmn,models/e016.bpmn,models/e020.bpmn "java -jar ruleGenerator-1.jar {bpmnModel} ./grammars" --output ./HOToutput.txt --export-json HOTstats.json
```

The HOT takes less than half a second and thus is adequately fast.
We estimate most of the time is spent doing I/O, i.e., reading the input BPMN file and writing the graph transformation rules for Groove.
To summarize, the HOT runtime could be further optimized if one avoids writing the generated GT system to stable storage.
Instead, the GT system could remain in the main memory and be accessed from there.

## HOT scalability

**Experiment**:
```bash
hyperfine -L bpmnModel models/scalability/1.bpmn,models/scalability/10.bpmn,models/scalability/100.bpmn,models/scalability/300.bpmn,models/scalability/500.bpmn,models/scalability/800.bpmn,models/scalability/1000.bpmn "java -jar ruleGenerator-1.jar {bpmnModel} ./grammars" --output ./HOTScalabilityoutput.txt --export-json HOTScalabilitystats.json
```

# State space generation experiment

1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Experiment**:
```bash
hyperfine -L grammar grammars/e001.gps,grammars/e002.gps,grammars/e007.gps,grammars/e008.gps,grammars/e009.gps,grammars/e010.gps,grammars/e011.gps,grammars/e015.gps,grammars/e016.gps,grammars/e020.gps "java -jar dependencies/groove-6_1_0/bin/Generator.jar {grammar}" --output ./SGenoutput.txt --export-json Sgenstats.json
```

## State space generation scalability

**Experiment**:
```bash
hyperfine -L grammar grammars/1.gps,grammars/10.gps,grammars/100.gps,grammars/300.gps,grammars/500.gps,grammars/800.gps,grammars/1000.gps "java -Xmx256M -jar dependencies/groove-6_1_0/bin/Generator.jar {grammar}" --output ./SGenScalabilityoutput.txt --export-json SgenScalabilitystats.json
```