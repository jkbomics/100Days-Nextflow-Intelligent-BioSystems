# Day 41 — Pipeline Versioning & Reproducible Releases

## Overview

This pipeline introduces version control and reproducible execution using semantic versioning and Git integration.

## Features

- Version tracking via VERSION file
- Reproducible runs using Git tags
- Profile-based execution (local, Docker, SLURM)
- Modular Nextflow DSL2 architecture

## Run

nextflow run main.nf -profile local

## Run Specific Version

nextflow run <100Days-Nextflow-Intelligent-BioSystems> -r v1.0.0

## Structure

- main.nf → workflow logic
- modules/ → processing steps
- conf/ → execution configs
- VERSION → pipeline version
- CHANGELOG → history of updates