cat <<EOF>./config.yaml
concurrencyLevel: 1
isRatioBasedBenchmark: true
benchmarkRatios: [1.0, 2.0]
outputFileFolder: $OUTDIR
workloads:
- name: "Busy stations"
  projectId: $PROJECT
  queryFiles:
    - queries/busystations.sql
  outputFileName: busystations.json
EOF

concurrencyLevel: 10
isRatioBasedBenchmark: true
benchmarkRatios: [0.1, 0.25, 0.5, 1.0, 1.5, 2.0]

gradle clean :BigQueryWorkloadTester:run