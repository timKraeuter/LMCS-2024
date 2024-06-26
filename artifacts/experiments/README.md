# Prerequisites
1. Install the command-line benchmark tool [hyperfine](https://github.com/sharkdp/hyperfine#installation).
   - The experiment was run with hyperfine version **1.18.0**.
   - The hyperfine windows release **1.18.0** is contained in `artifacts/dependencies`.
2. Install Java version 20 (We used 20.0.2.1 Amazon Corretto).

The experiments were run with Groove version **6.1.0**, which is contained in `groove-6_1_0` and does not have to be installed.
All experiments were run using a Windows 11 machine with an AMD Ryzen 7700X processor with 32 GB DDR5-5600 RAM on NVMe SSD storage.

# Performance

## Realistic models

### HOT transformation
1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Command**:
```bash
hyperfine -L bpmnModel models/e001.bpmn,models/e002.bpmn,models/e007.bpmn,models/e008.bpmn,models/e009.bpmn,models/e010.bpmn,models/e011.bpmn,models/e015.bpmn,models/e016.bpmn,models/e020.bpmn "java -jar ruleGenerator-1.jar {bpmnModel} ./grammars" --output ./results/HOToutput.txt --export-json ./results/HOTstats.json
```

The HOT takes less than half a second and thus is adequately fast.
We estimate most of the time is spent doing I/O, i.e., reading the input BPMN file and writing the graph transformation rules for Groove.
To summarize, the HOT runtime could be further optimized if one avoids writing the generated GT system to stable storage.
Instead, the GT system could remain in the main memory and be accessed from there.

### State space generation

1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Command**:
```bash
hyperfine -L grammar grammars/e001.gps,grammars/e002.gps,grammars/e007.gps,grammars/e008.gps,grammars/e009.gps,grammars/e010.gps,grammars/e011.gps,grammars/e015.gps,grammars/e016.gps,grammars/e020.gps "java -jar dependencies/groove-6_1_0/bin/Generator.jar {grammar}" --output ./results/SGenoutput.txt --export-json ./results/Sgenstats.json
```

## Increasing Parallel Branches


The models for the test were generated using our [CLI tool](./cli-tools/BPMNParallelBranchesModelGenerator.jar).
One can also generate models with more than 10 parallel branches and even increase the number of activities per branch (see [documentation](https://github.com/timKraeuter/BPMN-Model-Generators/tree/master?tab=readme-ov-file#bpmnparallelbranchmodelgenerator)).
The resulting models are contained in the subdirectory `models/parallel/`.

### HOT transformation

1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Command**:
```bash
hyperfine -L bpmnModel models/parallel/p01x01.bpmn,models/parallel/p02x01.bpmn,models/parallel/p03x01.bpmn,models/parallel/p04x01.bpmn,models/parallel/p05x01.bpmn,models/parallel/p06x01.bpmn,models/parallel/p07x01.bpmn,models/parallel/p08x01.bpmn,models/parallel/p09x01.bpmn,models/parallel/p10x01.bpmn "java -jar ruleGenerator-1.jar {bpmnModel} ./grammars" --output ./results/HOTParallel_output.txt --export-json ./results/HOTParallel_stats.json  --runs 5
```

The benchmark results are found in `/results/HOTParallel_stats.json`.

### State space generation

1. Clone this repository.
2. Open a terminal in **this folder**.
3. Run the following command:

**Command**:
```bash
hyperfine -L grammar grammars/p01x01.gps,grammars/p02x01.gps,grammars/p03x01.gps,grammars/p04x01.gps,grammars/p05x01.gps,grammars/p06x01.gps,grammars/p07x01.gps,grammars/p08x01.gps,grammars/p09x01.gps,grammars/p10x01.gps "java -Xmx1024M -jar dependencies/groove-6_1_0/bin/Generator.jar {grammar}" --output ./results/SGenParallel_output.txt --export-json ./results/SGenParallel_stats.json --runs 5
```

The benchmark results are found in `/results/SGenParallel_stats.json`.

# Scalability

The models for the scalability test were generated using our [CLI tool](./cli-tools/BPMNBlockModelGenerator.jar), see [documentation](https://github.com/timKraeuter/BPMN-Model-Generators/tree/master?tab=readme-ov-file#bpmnblockmodelgenerator).
One can also generate bigger models or change the contents of the generated models.
The results were zipped and are contained in **scalability.zip** in the subdirectory `models`.

## HOT transformation

1. Clone this repository.
2. Unzip **scalability.zip** in the subdirectory `models` to a directory called `scalability`.
3. Open a terminal in **this folder**.
4. Run the following command:

**Command**:
```bash
hyperfine -L bpmnModel models/scalability/001.bpmn,models/scalability/002.bpmn,models/scalability/003.bpmn,models/scalability/004.bpmn,models/scalability/005.bpmn,models/scalability/006.bpmn,models/scalability/007.bpmn,models/scalability/008.bpmn,models/scalability/009.bpmn,models/scalability/010.bpmn,models/scalability/011.bpmn,models/scalability/012.bpmn,models/scalability/013.bpmn,models/scalability/014.bpmn,models/scalability/015.bpmn,models/scalability/016.bpmn,models/scalability/017.bpmn,models/scalability/018.bpmn,models/scalability/019.bpmn,models/scalability/020.bpmn,models/scalability/021.bpmn,models/scalability/022.bpmn,models/scalability/023.bpmn,models/scalability/024.bpmn,models/scalability/025.bpmn,models/scalability/026.bpmn,models/scalability/027.bpmn,models/scalability/028.bpmn,models/scalability/029.bpmn,models/scalability/030.bpmn,models/scalability/031.bpmn,models/scalability/032.bpmn,models/scalability/033.bpmn,models/scalability/034.bpmn,models/scalability/035.bpmn,models/scalability/036.bpmn,models/scalability/037.bpmn,models/scalability/038.bpmn,models/scalability/039.bpmn,models/scalability/040.bpmn,models/scalability/041.bpmn,models/scalability/042.bpmn,models/scalability/043.bpmn,models/scalability/044.bpmn,models/scalability/045.bpmn,models/scalability/046.bpmn,models/scalability/047.bpmn,models/scalability/048.bpmn,models/scalability/049.bpmn,models/scalability/050.bpmn,models/scalability/051.bpmn,models/scalability/052.bpmn,models/scalability/053.bpmn,models/scalability/054.bpmn,models/scalability/055.bpmn,models/scalability/056.bpmn,models/scalability/057.bpmn,models/scalability/058.bpmn,models/scalability/059.bpmn,models/scalability/060.bpmn,models/scalability/061.bpmn,models/scalability/062.bpmn,models/scalability/063.bpmn,models/scalability/064.bpmn,models/scalability/065.bpmn,models/scalability/066.bpmn,models/scalability/067.bpmn,models/scalability/068.bpmn,models/scalability/069.bpmn,models/scalability/070.bpmn,models/scalability/071.bpmn,models/scalability/072.bpmn,models/scalability/073.bpmn,models/scalability/074.bpmn,models/scalability/075.bpmn,models/scalability/076.bpmn,models/scalability/077.bpmn,models/scalability/078.bpmn,models/scalability/079.bpmn,models/scalability/080.bpmn,models/scalability/081.bpmn,models/scalability/082.bpmn,models/scalability/083.bpmn,models/scalability/084.bpmn,models/scalability/085.bpmn,models/scalability/086.bpmn,models/scalability/087.bpmn,models/scalability/088.bpmn,models/scalability/089.bpmn,models/scalability/090.bpmn,models/scalability/091.bpmn,models/scalability/092.bpmn,models/scalability/093.bpmn,models/scalability/094.bpmn,models/scalability/095.bpmn,models/scalability/096.bpmn,models/scalability/097.bpmn,models/scalability/098.bpmn,models/scalability/099.bpmn,models/scalability/100.bpmn,models/scalability/101.bpmn,models/scalability/102.bpmn,models/scalability/103.bpmn,models/scalability/104.bpmn,models/scalability/105.bpmn,models/scalability/106.bpmn,models/scalability/107.bpmn,models/scalability/108.bpmn,models/scalability/109.bpmn,models/scalability/110.bpmn,models/scalability/111.bpmn,models/scalability/112.bpmn,models/scalability/113.bpmn,models/scalability/114.bpmn,models/scalability/115.bpmn,models/scalability/116.bpmn,models/scalability/117.bpmn,models/scalability/118.bpmn,models/scalability/119.bpmn,models/scalability/120.bpmn,models/scalability/121.bpmn,models/scalability/122.bpmn,models/scalability/123.bpmn,models/scalability/124.bpmn,models/scalability/125.bpmn,models/scalability/126.bpmn,models/scalability/127.bpmn,models/scalability/128.bpmn,models/scalability/129.bpmn,models/scalability/130.bpmn,models/scalability/131.bpmn,models/scalability/132.bpmn,models/scalability/133.bpmn,models/scalability/134.bpmn,models/scalability/135.bpmn,models/scalability/136.bpmn,models/scalability/137.bpmn,models/scalability/138.bpmn,models/scalability/139.bpmn,models/scalability/140.bpmn,models/scalability/141.bpmn,models/scalability/142.bpmn,models/scalability/143.bpmn,models/scalability/144.bpmn,models/scalability/145.bpmn,models/scalability/146.bpmn,models/scalability/147.bpmn,models/scalability/148.bpmn,models/scalability/149.bpmn,models/scalability/150.bpmn,models/scalability/151.bpmn,models/scalability/152.bpmn,models/scalability/153.bpmn,models/scalability/154.bpmn,models/scalability/155.bpmn,models/scalability/156.bpmn,models/scalability/157.bpmn,models/scalability/158.bpmn,models/scalability/159.bpmn,models/scalability/160.bpmn,models/scalability/161.bpmn,models/scalability/162.bpmn,models/scalability/163.bpmn,models/scalability/164.bpmn,models/scalability/165.bpmn,models/scalability/166.bpmn,models/scalability/167.bpmn,models/scalability/168.bpmn,models/scalability/169.bpmn,models/scalability/170.bpmn,models/scalability/171.bpmn,models/scalability/172.bpmn,models/scalability/173.bpmn,models/scalability/174.bpmn,models/scalability/175.bpmn,models/scalability/176.bpmn,models/scalability/177.bpmn,models/scalability/178.bpmn,models/scalability/179.bpmn,models/scalability/180.bpmn,models/scalability/181.bpmn,models/scalability/182.bpmn,models/scalability/183.bpmn,models/scalability/184.bpmn,models/scalability/185.bpmn,models/scalability/186.bpmn,models/scalability/187.bpmn,models/scalability/188.bpmn,models/scalability/189.bpmn,models/scalability/190.bpmn,models/scalability/191.bpmn,models/scalability/192.bpmn,models/scalability/193.bpmn,models/scalability/194.bpmn,models/scalability/195.bpmn,models/scalability/196.bpmn,models/scalability/197.bpmn,models/scalability/198.bpmn,models/scalability/199.bpmn,models/scalability/200.bpmn,models/scalability/201.bpmn,models/scalability/202.bpmn,models/scalability/203.bpmn,models/scalability/204.bpmn,models/scalability/205.bpmn,models/scalability/206.bpmn,models/scalability/207.bpmn,models/scalability/208.bpmn,models/scalability/209.bpmn,models/scalability/210.bpmn,models/scalability/211.bpmn,models/scalability/212.bpmn,models/scalability/213.bpmn,models/scalability/214.bpmn,models/scalability/215.bpmn,models/scalability/216.bpmn,models/scalability/217.bpmn,models/scalability/218.bpmn,models/scalability/219.bpmn,models/scalability/220.bpmn,models/scalability/221.bpmn,models/scalability/222.bpmn,models/scalability/223.bpmn,models/scalability/224.bpmn,models/scalability/225.bpmn,models/scalability/226.bpmn,models/scalability/227.bpmn,models/scalability/228.bpmn,models/scalability/229.bpmn,models/scalability/230.bpmn,models/scalability/231.bpmn,models/scalability/232.bpmn,models/scalability/233.bpmn,models/scalability/234.bpmn,models/scalability/235.bpmn,models/scalability/236.bpmn,models/scalability/237.bpmn,models/scalability/238.bpmn,models/scalability/239.bpmn,models/scalability/240.bpmn,models/scalability/241.bpmn,models/scalability/242.bpmn,models/scalability/243.bpmn,models/scalability/244.bpmn,models/scalability/245.bpmn,models/scalability/246.bpmn,models/scalability/247.bpmn,models/scalability/248.bpmn,models/scalability/249.bpmn,models/scalability/250.bpmn,models/scalability/251.bpmn,models/scalability/252.bpmn,models/scalability/253.bpmn,models/scalability/254.bpmn,models/scalability/255.bpmn,models/scalability/256.bpmn,models/scalability/257.bpmn,models/scalability/258.bpmn,models/scalability/259.bpmn,models/scalability/260.bpmn,models/scalability/261.bpmn,models/scalability/262.bpmn,models/scalability/263.bpmn,models/scalability/264.bpmn,models/scalability/265.bpmn,models/scalability/266.bpmn,models/scalability/267.bpmn,models/scalability/268.bpmn,models/scalability/269.bpmn,models/scalability/270.bpmn,models/scalability/271.bpmn,models/scalability/272.bpmn,models/scalability/273.bpmn,models/scalability/274.bpmn,models/scalability/275.bpmn,models/scalability/276.bpmn,models/scalability/277.bpmn,models/scalability/278.bpmn,models/scalability/279.bpmn,models/scalability/280.bpmn,models/scalability/281.bpmn,models/scalability/282.bpmn,models/scalability/283.bpmn,models/scalability/284.bpmn,models/scalability/285.bpmn,models/scalability/286.bpmn,models/scalability/287.bpmn,models/scalability/288.bpmn,models/scalability/289.bpmn,models/scalability/290.bpmn,models/scalability/291.bpmn,models/scalability/292.bpmn,models/scalability/293.bpmn,models/scalability/294.bpmn,models/scalability/295.bpmn,models/scalability/296.bpmn,models/scalability/297.bpmn,models/scalability/298.bpmn,models/scalability/299.bpmn,models/scalability/300.bpmn "java -jar ruleGenerator-1.jar {bpmnModel} ./grammars" --output ./results/HOTScalability_output.txt --export-json ./results/HOTScalability_stats.json --runs 5
```

The benchmark results are found in `/results/HOTScalability_stats.json`.
The Python scripts we used to analyze the benchmark results can be found in [`/results/scripts/`](https://github.com/timKraeuter/LMCS-2024/tree/main/artifacts/experiment/results/scripts).

## State space generation

1. Clone this repository.
2. Generate the GT-systems by following the steps in **HOT transformation**. You can use the command `--runs 1` instead of `--runs 5` to only run each HOT once.
3. Open a terminal in **this folder**.
4. Run the following command:

**Command**:
```bash
hyperfine -L grammar grammars/001.gps,grammars/002.gps,grammars/003.gps,grammars/004.gps,grammars/005.gps,grammars/006.gps,grammars/007.gps,grammars/008.gps,grammars/009.gps,grammars/010.gps,grammars/011.gps,grammars/012.gps,grammars/013.gps,grammars/014.gps,grammars/015.gps,grammars/016.gps,grammars/017.gps,grammars/018.gps,grammars/019.gps,grammars/020.gps,grammars/021.gps,grammars/022.gps,grammars/023.gps,grammars/024.gps,grammars/025.gps,grammars/026.gps,grammars/027.gps,grammars/028.gps,grammars/029.gps,grammars/030.gps,grammars/031.gps,grammars/032.gps,grammars/033.gps,grammars/034.gps,grammars/035.gps,grammars/036.gps,grammars/037.gps,grammars/038.gps,grammars/039.gps,grammars/040.gps,grammars/041.gps,grammars/042.gps,grammars/043.gps,grammars/044.gps,grammars/045.gps,grammars/046.gps,grammars/047.gps,grammars/048.gps,grammars/049.gps,grammars/050.gps,grammars/051.gps,grammars/052.gps,grammars/053.gps,grammars/054.gps,grammars/055.gps,grammars/056.gps,grammars/057.gps,grammars/058.gps,grammars/059.gps,grammars/060.gps,grammars/061.gps,grammars/062.gps,grammars/063.gps,grammars/064.gps,grammars/065.gps,grammars/066.gps,grammars/067.gps,grammars/068.gps,grammars/069.gps,grammars/070.gps,grammars/071.gps,grammars/072.gps,grammars/073.gps,grammars/074.gps,grammars/075.gps,grammars/076.gps,grammars/077.gps,grammars/078.gps,grammars/079.gps,grammars/080.gps,grammars/081.gps,grammars/082.gps,grammars/083.gps,grammars/084.gps,grammars/085.gps,grammars/086.gps,grammars/087.gps,grammars/088.gps,grammars/089.gps,grammars/090.gps,grammars/091.gps,grammars/092.gps,grammars/093.gps,grammars/094.gps,grammars/095.gps,grammars/096.gps,grammars/097.gps,grammars/098.gps,grammars/099.gps,grammars/100.gps,grammars/101.gps,grammars/102.gps,grammars/103.gps,grammars/104.gps,grammars/105.gps,grammars/106.gps,grammars/107.gps,grammars/108.gps,grammars/109.gps,grammars/110.gps,grammars/111.gps,grammars/112.gps,grammars/113.gps,grammars/114.gps,grammars/115.gps,grammars/116.gps,grammars/117.gps,grammars/118.gps,grammars/119.gps,grammars/120.gps,grammars/121.gps,grammars/122.gps,grammars/123.gps,grammars/124.gps,grammars/125.gps,grammars/126.gps,grammars/127.gps,grammars/128.gps,grammars/129.gps,grammars/130.gps,grammars/131.gps,grammars/132.gps,grammars/133.gps,grammars/134.gps,grammars/135.gps,grammars/136.gps,grammars/137.gps,grammars/138.gps,grammars/139.gps,grammars/140.gps,grammars/141.gps,grammars/142.gps,grammars/143.gps,grammars/144.gps,grammars/145.gps,grammars/146.gps,grammars/147.gps,grammars/148.gps,grammars/149.gps,grammars/150.gps,grammars/151.gps,grammars/152.gps,grammars/153.gps,grammars/154.gps,grammars/155.gps,grammars/156.gps,grammars/157.gps,grammars/158.gps,grammars/159.gps,grammars/160.gps,grammars/161.gps,grammars/162.gps,grammars/163.gps,grammars/164.gps,grammars/165.gps,grammars/166.gps,grammars/167.gps,grammars/168.gps,grammars/169.gps,grammars/170.gps,grammars/171.gps,grammars/172.gps,grammars/173.gps,grammars/174.gps,grammars/175.gps,grammars/176.gps,grammars/177.gps,grammars/178.gps,grammars/179.gps,grammars/180.gps,grammars/181.gps,grammars/182.gps,grammars/183.gps,grammars/184.gps,grammars/185.gps,grammars/186.gps,grammars/187.gps,grammars/188.gps,grammars/189.gps,grammars/190.gps,grammars/191.gps,grammars/192.gps,grammars/193.gps,grammars/194.gps,grammars/195.gps,grammars/196.gps,grammars/197.gps,grammars/198.gps,grammars/199.gps,grammars/200.gps,grammars/201.gps,grammars/202.gps,grammars/203.gps,grammars/204.gps,grammars/205.gps,grammars/206.gps,grammars/207.gps,grammars/208.gps,grammars/209.gps,grammars/210.gps,grammars/211.gps,grammars/212.gps,grammars/213.gps,grammars/214.gps,grammars/215.gps,grammars/216.gps,grammars/217.gps,grammars/218.gps,grammars/219.gps,grammars/220.gps,grammars/221.gps,grammars/222.gps,grammars/223.gps,grammars/224.gps,grammars/225.gps,grammars/226.gps,grammars/227.gps,grammars/228.gps,grammars/229.gps,grammars/230.gps,grammars/231.gps,grammars/232.gps,grammars/233.gps,grammars/234.gps,grammars/235.gps,grammars/236.gps,grammars/237.gps,grammars/238.gps,grammars/239.gps,grammars/240.gps,grammars/241.gps,grammars/242.gps,grammars/243.gps,grammars/244.gps,grammars/245.gps,grammars/246.gps,grammars/247.gps,grammars/248.gps,grammars/249.gps,grammars/250.gps,grammars/251.gps,grammars/252.gps,grammars/253.gps,grammars/254.gps,grammars/255.gps,grammars/256.gps,grammars/257.gps,grammars/258.gps,grammars/259.gps,grammars/260.gps,grammars/261.gps,grammars/262.gps,grammars/263.gps,grammars/264.gps,grammars/265.gps,grammars/266.gps,grammars/267.gps,grammars/268.gps,grammars/269.gps,grammars/270.gps,grammars/271.gps,grammars/272.gps,grammars/273.gps,grammars/274.gps,grammars/275.gps,grammars/276.gps,grammars/277.gps,grammars/278.gps,grammars/279.gps,grammars/280.gps,grammars/281.gps,grammars/282.gps,grammars/283.gps,grammars/284.gps,grammars/285.gps,grammars/286.gps,grammars/287.gps,grammars/288.gps,grammars/289.gps,grammars/290.gps,grammars/291.gps,grammars/292.gps,grammars/293.gps,grammars/294.gps,grammars/295.gps,grammars/296.gps,grammars/297.gps,grammars/298.gps,grammars/299.gps,grammars/300.gps "java -Xmx1024M -jar dependencies/groove-6_1_0/bin/Generator.jar {grammar}" --output ./results/SGenScalability_output.txt --export-json ./results/SGenScalability_stats.json --runs 5
```

The benchmark results are found in `/results/SGenScalability_stats.json`.
The Python scripts we used to analyze the benchmark results can be found in [`/results/scripts/`](https://github.com/timKraeuter/LMCS-2024/tree/main/artifacts/experiment/results/scripts).